///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: lvds_receiver.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description:
//
// <Description here>
//
// Targeted device: <Family::PolarFire> <Die::MPF300TS> <Package::FCG484>
// Author: <Name>
//
///////////////////////////////////////////////////////////////////////////////////////////////////
`timescale 1 ns / 1 ns

module lvds_receiver #(
    parameter D = 16  // decimation factor
)(
    input  wire        pclk,
    input  wire        presetn,

    // APB interface
    input  wire        psel,
    input  wire        penable,
    input  wire        pwrite,
    input  wire [31:0] paddr,
    input  wire [31:0] pwdata,
    output wire [31:0] prdata,
    output wire        pready,
    output wire        pslverr,

    // ADC interface
    input  wire        dck,
    input  wire        d0_r, d0_f,
    input  wire        d1_r, d1_f,
    input  wire        d2_r, d2_f,
    input  wire        d3_r, d3_f,
    input  wire        d4_r, d4_f,
    input  wire        d5_r, d5_f,
    input  wire        d6_r, d6_f,
    input  wire        d7_r, d7_f,

    // GPIO trigger from Mi-V
    input  wire        gpio_fill,

    // Output data
    output wire [15:0] data_out,
    output wire        write_clk,
    output wire        write_en
);

    wire [15:0]  adc_data;

    // assign adc_data = {d7_r, d7_f, d6_r, d6_f, d5_r, d5_f, d4_r, d4_f, d3_r, d3_f, d2_r, d2_f, d1_r, d1_f, d0_r, d0_f};
    // assign adc_data = {d7_r, d6_r, d5_r, d4_r, d3_r, d2_r, d1_r, d0_r, d7_f, d6_f, d5_f, d4_f, d3_f, d2_f, d1_f, d0_f};
    // assign adc_data = {d7_f, d6_f, d5_f, d4_f, d3_f, d2_f, d1_f, d0_f, d7_r, d6_r, d5_r, d4_r, d3_r, d2_r, d1_r, d0_r};

    // 256 x 32-bit words
    reg [31:0] memory [0:255];

    wire [7:0] word_addr = paddr[9:2];

    assign pready  = 1'b1;
    assign pslverr = 1'b0;
    assign prdata = memory[word_addr];

    // ------------------------------------------------------------
    // Synchronize capture enable into DCK domain
    // ------------------------------------------------------------
    reg fill_dck_1, fill_dck_2;

    always @(posedge dck or negedge presetn) begin
        if (!presetn) begin
            fill_dck_1 <= 1'b0;
            fill_dck_2 <= 1'b0;
        end else begin
            fill_dck_1 <= gpio_fill;
            fill_dck_2 <= fill_dck_1;
        end
    end

    wire capture_en = fill_dck_2;

    // ------------------------------------------------------------
    // Capture logic (DCK domain)
    // ------------------------------------------------------------
    reg        capturing;
    reg [7:0]  wr_addr;

    // High byte is ahead one cycle
    // need to store high byte and delay it one cycle to align with low
    reg [7:0]  data_high_new, data_high_old, data_low;

    always @(posedge dck or negedge presetn) begin
        if (!presetn) begin
            data_high_new <= 8'd0;
            data_high_old <= 8'd0;
            data_low      <= 8'd0;
        end else begin
            data_high_new <= {d7_f, d6_f, d5_f, d4_f, d3_f, d2_f, d1_f, d0_f};
            data_high_old <= data_high_new;
            data_low      <= {d7_r, d6_r, d5_r, d4_r, d3_r, d2_r, d1_r, d0_r};
        end
    end

    assign adc_data = {data_high_old, data_low};

    // Populate memory
    always @(posedge dck or negedge presetn) begin
        if (!presetn) begin
            capturing <= 1'b0;
            wr_addr   <= 8'd0;
        end else begin
            if (capture_en && !capturing) begin
                capturing <= 1'b1;
                wr_addr   <= 8'd0;
            end

            if (capturing) begin
                memory[wr_addr] <= {16'b0, adc_data};

                if (wr_addr == 8'hFF) begin
                    capturing <= 1'b0;
                end else begin
                    wr_addr <= wr_addr + 1'b1;
                end
            end
        end
    end

    reg [31:0] sum;
    reg [15:0] result;
    reg [7:0] count;

    always @(posedge dck or negedge presetn) begin
        if (!presetn) begin
            sum <= 32'd0;
            result <= 16'd0;
            count <= 8'd0;
        end else begin
            if (count == D - 1) begin
                result <= (sum + {16'b0, adc_data}) >> $clog2(D);
                sum <= 0;
                count <= 0;
            end else begin
                sum <= (sum + {16'b0, adc_data});
                count <= count + 1;
            end
        end
    end

    // don't average or decimate
    // assign data_out = adc_data;
    // assign write_clk = dck;
    // assign write_en = capturing;

    // use averaged/decimated data
    assign data_out = result;
    assign write_clk = count[$clog2(D)-1];
    assign write_en = capture_en;

endmodule