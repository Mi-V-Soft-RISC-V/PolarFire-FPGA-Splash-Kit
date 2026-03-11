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

module pixel_engine #(
    parameter PIX_DIV = 16,
    parameter LINE_DIV = 32,
    parameter FRAME_DIV = 64,
    parameter ADD_START = 4,
    parameter ADD_END = 7,
    parameter SUB_START = 10,
    parameter SUB_END = 14
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
    input  wire        gpio_fill
);
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

    wire [15:0]  adc_data;
    assign adc_data = {data_high_old, data_low};

    // ------------------------------------------------------------
    // Generate Clocks
    // ------------------------------------------------------------
    reg [$clog2(PIX_DIV)-1:0]   pix_clk_counter;
    wire pix_clk;

    always @(posedge dck or negedge presetn) begin
        if (!presetn) begin
            pix_clk_counter <= 0;
        end else begin
            if (pix_clk_counter == PIX_DIV-1) begin
                pix_clk_counter <= 0;
            end else begin
                pix_clk_counter <= pix_clk_counter + 1;
            end
        end
    end

    assign pix_clk = (pix_clk_counter == 0) && presetn;

    // ------------------------------------------------------------
    // Calculate pixel values
    // ------------------------------------------------------------
    reg [31:0] add_sum;
    reg [31:0] sub_sum;
    reg [15:0] pix_value;

    localparam ADD_SAMPLES = ADD_END - ADD_START;
    localparam SUB_SAMPLES = SUB_END - SUB_START;
    localparam RECIP_BITS = 18;
    localparam [RECIP_BITS-1:0] ADD_RECIP = (1 << RECIP_BITS) / ADD_SAMPLES;
    localparam [RECIP_BITS-1:0] SUB_RECIP = (1 << RECIP_BITS) / SUB_SAMPLES;
    localparam signed signal_coeff = 87;
    localparam signed baseline_coeff = -87;

    always @(posedge dck or negedge presetn) begin
        if (!presetn) begin
            add_sum <= 0;
            sub_sum <= 0;
            pix_value <= 0;
        end else begin
            if (pix_clk_counter >= ADD_START && pix_clk_counter < ADD_END) begin
                // add_sum <= add_sum + {16'b0, adc_data};
                add_sum <= add_sum + adc_data * signal_coeff;
            end else if (pix_clk_counter >= SUB_START && pix_clk_counter < SUB_END) begin
                // sub_sum <= sub_sum + {16'b0, adc_data};
                sub_sum <= sub_sum + adc_data * baseline_coeff;
            end else if (pix_clk_counter == SUB_END) begin
                // pix_value <= ((add_sum * ADD_RECIP) >> RECIP_BITS) - ((sub_sum * SUB_RECIP) >> RECIP_BITS);  // multiply with a signed integer
                // pix_value <= ((add_sum * signal_coeff)) - ((sub_sum * baseline_coeff));  // multiply with a signed integer
                pix_value <= add_sum - sub_sum;
                add_sum <= 0;
                sub_sum <= 0;
            end
        end
    end

    // ------------------------------------------------------------
    // Populate memory
    // ------------------------------------------------------------
    // 256 x 32-bit words
    reg [31:0] memory [0:3];
    reg        capturing;
    reg [7:0]  wr_addr;

    wire [7:0] word_addr = paddr[9:2];

    assign pready  = 1'b1;
    assign pslverr = 1'b0;
    assign prdata = memory[word_addr];

    always @(posedge pix_clk or negedge presetn) begin
        if (!presetn) begin
            capturing <= 1'b0;
            wr_addr   <= 8'd0;
        end else begin
            if (capture_en && !capturing) begin
                capturing <= 1'b1;
                wr_addr   <= 8'd0;
            end

            if (capturing) begin
                memory[wr_addr] <= {16'b0, pix_value};

                if (wr_addr == 8'd3) begin
                    capturing <= 1'b0;
                end else begin
                    wr_addr <= wr_addr + 1'b1;
                end
            end
        end
    end

endmodule
