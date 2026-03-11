////////////////////////////////////////////////////////////////////////////////
// Company: KIPAC XOC Group
//
// File: data_generator.sv
//
// Description:
//
// Generates test data (as from ADC) for input to CoreFIFO
//
// Targeted device: <Family::PolarFire> <Die::MPF300TS> <Package::FCG484>
// Author: Declan O'Neill
//
////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/1ps

module data_generator (
    input  logic        clk,
    input  logic        resetn,
    input  logic        enable,
    input  logic        full,

    output logic        w_en,
    output logic [15:0] data
);

    logic [15:0] data_cnt;

    always_ff @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            data_cnt <= 16'b0;
            w_en     <= 1'b0;
        end
        else if (enable && !full) begin
            data_cnt <= data_cnt + 1;
            w_en     <= 1'b1;
        end
        else begin
            data_cnt <= data_cnt;
            w_en     <= 1'b0;
        end
    end

    assign data = data_cnt;

endmodule
