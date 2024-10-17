`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:09:22 04/22/2024 
// Design Name: 
// Module Name:    LFSR_5_bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module LFSR_5bit (
    input wire clk,
    input wire rst,
    output wire [4:0] lfsr_out
);

// Internal signals
reg [4:0] lfsr_reg;
reg feedback;
// Initial value for the LFSR (can be any non-zero value)
initial begin
    lfsr_reg = 5'b11111;
end

// LFSR state update process
always @(posedge clk or posedge rst) begin
    if (rst) begin
        // Reset the LFSR
        lfsr_reg <= 5'b11111;
    end else begin
        // Shift the register to the right
        lfsr_reg[4:1] <= lfsr_reg[3:0];
        // Calculate the feedback value
        feedback = lfsr_reg[4] ^ lfsr_reg[2]; // Primitive polynomial equation x^5 + x^3 + 1
        // Update the LSB of the register with the feedback value
        lfsr_reg[0] <= feedback;
    end
end

// Output assignment
assign lfsr_out = lfsr_reg;

endmodule

