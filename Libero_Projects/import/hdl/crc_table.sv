
`timescale 1ns/1ps

module crc32_lut (
    input  logic        clk,
    input  logic        resetn,
    input  logic        crc_en,       // strobe: process data_in on this cycle
    input  logic [31:0] data_in,      // 4 bytes (LSB-first)
    output logic [31:0] crc_out
);

    // -------------------------------------------------------------------------
    // Ethernet CRC parameters
    // -------------------------------------------------------------------------
    localparam POLY = 32'hEDB88320;   // Reflected form of 0x04C11DB7

    // CRC state register
    logic [31:0] crc_reg;

    // -------------------------------------------------------------------------
    // Lookup table (generated for polynomial 0xEDB88320)
    // -------------------------------------------------------------------------
    logic [31:0] crc_table [0:255];

    initial begin
        $readmemh("C:/Users/declan/Desktop/src/PolarFire-FPGA-Splash-Kit/Libero_Projects/MIV_RV32_CFG1_BD/hdl/crc_table.mem", crc_table);
    end

    // Generate table in place, for simulation
    // initial begin
    //     int i, j;
    //     logic [31:0] c;
    //     for (i = 0; i < 256; i++) begin
    //         c = i;
    //         for (j = 0; j < 8; j++) begin
    //             if (c[0])
    //                 c = (c >> 1) ^ POLY;
    //             else
    //                 c = (c >> 1);
    //         end
    //         crc_table[i] = c;
    //     end
    // end

    // -------------------------------------------------------------------------
    // Sequential CRC update
    // -------------------------------------------------------------------------
    always_ff @(posedge clk or negedge resetn) begin
        if (!resetn)
            crc_reg <= 32'hFFFFFFFF;
        else if (crc_en) begin
            logic [31:0] crc_next;
            crc_next = crc_reg;
            // Process 4 bytes (little-endian)
            for (int k = 0; k < 4; k++) begin
                automatic byte data_byte = data_in[8*k +: 8];
                automatic logic [7:0] index = (crc_next[7:0] ^ data_byte);
                crc_next = (crc_next >> 8) ^ crc_table[index];
            end
            crc_reg <= crc_next;
        end
    end

    assign crc_out = ~crc_reg;  // Final XOR for standard CRC-32

endmodule
