`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:29:43 12/08/2023
// Design Name:   dadda_8
// Module Name:   /home/ise/Dadda/Dadda_tb_8X8.v
// Project Name:  Dadda
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dadda_8
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module tb_dadda_8;

  reg [7:0] A;
  reg [7:0] B;
  wire [15:0] y;

  // Instantiate the dadda multiplier
  dadda_8 uut(
    .A(A),
    .B(B),
    .y(y)
  );

  // Clock generation
  reg clk;
  always #5 clk = ~clk;
 // Testbench stimulus
  initial begin
    $monitor("Time=%0t A=%b B=%b y=%b", $time, A, B, y);

    // Initialize to 00000000
    A = 8'b00000000;
    B = 8'b00000000;
    clk = 0;

    // Apply inputs and clock in a loop
    repeat (256) begin
      #5 A = A + 1; // Increment A
      #5 B = B + 1; // Increment B
    end
  end

endmodule
