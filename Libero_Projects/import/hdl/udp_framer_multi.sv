////////////////////////////////////////////////////////////////////////////////
// Company: KIPAC XOC Group
//
// File: udp_framer_multi.sv
//
// Description:
//
// Reads data out of FIFO and frames into UDP packets for CoreTSE
//
// Targeted device: <Family::PolarFire> <Die::MPF300TS> <Package::FCG484>
// Author: Declan O'Neill
//
////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps

module udp_framer_multi #(
    parameter WORDS_PER_FRAME = 256,
    parameter CYCLES_PER_IFG = 32
)(
    input  logic              clk,
    input  logic              resetn,
    input  logic              enable,
    input  logic [3:0]        empty,
    input  logic [3:0][31:0]  data_in,
    input  logic              mtx_acpt,      // MAC ready
    output logic [3:0]        rd_enable,     // enable FIFO read
    output logic              mtx_rdy,       // data valid
    output logic              mtx_sof,       // start of frame
    output logic              mtx_eof,       // end of frame
    output logic [31:0]       mtx_dat        // data
);

    // -------------------------------------------------------------------------
    // STREAM GENERATOR FSM
    // -------------------------------------------------------------------------
    typedef enum logic [1:0] {
        IDLE = 2'b00,
        SEND = 2'b01,
        IFG  = 2'b10
    } state_t;

    state_t state;
    logic [1:0] adc_cnt;
    logic [8:0] frame_cnt;
    logic [31:0] word_cnt;
    logic [15:0] ifg_cnt;
    logic valid_data;
    logic [31:0] this_data;
    logic [31:0] crc;

    crc32_lut crc32_engine (
        .clk(clk),
        .resetn(resetn && (state == SEND)),
        .crc_en(valid_data && mtx_acpt && (word_cnt < (WORDS_PER_FRAME-1))),
        .data_in(this_data),
        .crc_out(crc)
    );

    // Sequential logic
    always_ff @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            state     <= IDLE;
            adc_cnt   <= 0;
            frame_cnt <= 0;
            word_cnt  <= 0;
            ifg_cnt   <= 0;
        end else begin
            if (state == SEND && mtx_acpt && !empty[adc_cnt] && word_cnt == WORDS_PER_FRAME - 1)
                adc_cnt <= adc_cnt; // adc_cnt + 1;
            else
                adc_cnt <= adc_cnt;
            case (state)
                IDLE: begin
                    word_cnt <= 0;
                    ifg_cnt  <= 0;
                    if (enable && mtx_acpt && !empty[adc_cnt]) begin
                        state    <= SEND;
                    end else begin
                        state    <= IDLE;
                    end
                end

                SEND: begin
                    if (mtx_acpt && !empty[adc_cnt]) begin
                        if (word_cnt == WORDS_PER_FRAME - 1) begin
                            if (CYCLES_PER_IFG == 0)
                                state <= IDLE;
                            else begin
                                state   <= IFG;
                                ifg_cnt <= 0;
                            end
                            frame_cnt <= frame_cnt + 1;
                        end
                        word_cnt <= word_cnt + 1;
                    end else begin
                        // hold counters while waiting for mtx_acpt or empty
                        word_cnt <= word_cnt;
                        ifg_cnt  <= ifg_cnt;
                        state    <= SEND;
                    end
                end

                IFG: begin
                    if (ifg_cnt == CYCLES_PER_IFG - 1) begin
                        state    <= IDLE;
                        word_cnt <= 0;
                    end else begin
                        ifg_cnt  <= ifg_cnt + 1;
                        word_cnt <= word_cnt;
                    end
                end

                default: begin
                    state    <= IDLE;
                    word_cnt <= 0;
                    ifg_cnt  <= 0;
                end
            endcase
        end
    end

    assign valid_data = (state == SEND && !empty[adc_cnt]);

    // -------------------------------------------------------------------------
    // OUTPUT LOGIC
    // -------------------------------------------------------------------------
    always_comb begin
        mtx_rdy = valid_data;
        mtx_sof = (valid_data && word_cnt == 0);
        mtx_eof = (valid_data && word_cnt == WORDS_PER_FRAME - 1);
        rd_enable = (valid_data && mtx_acpt && word_cnt > 10 && word_cnt < WORDS_PER_FRAME - 1) << adc_cnt;

        case (word_cnt)
            0: this_data = 32'hFFFFFFFF;  // mac dest
            1: this_data = 32'hBBAAFFFF;  // mac dest, mac source
            2: this_data = 32'hFFEEDDCC;  // mac source
            3: this_data = 32'h00450008;  // version/type
            4: this_data = 32'h0000F203;  // ID/length
            5: this_data = 32'h11400000;  // protocol/time/fragmentn
            6: this_data = 32'hA8C0A7F3;  // source ip/checksum
            7: this_data = 32'hA8C00101;  // dest ip/source ip
            8: this_data = 32'h02040201;  // source port/dest ip
            9: this_data = 32'hDE0331D4;  // length/dest port
            10: this_data = {frame_cnt, 8'hC0 | adc_cnt, 16'h0};  // frame count/adc number/checksum
            default: this_data = data_in[adc_cnt];
        endcase

        case (word_cnt)
            WORDS_PER_FRAME - 1: mtx_dat = crc;
            default: mtx_dat = this_data;
        endcase
    end

endmodule
