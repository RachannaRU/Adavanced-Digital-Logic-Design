`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:57:54 12/10/2023
// Design Name:   dadda_16
// Module Name:   /home/ise/Dadda/Dadda_16X16_tb.v
// Project Name:  Dadda
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dadda_16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Dadda_16X16_tb;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;

	// Outputs
	wire [31:0] Y;

	// Instantiate the Unit Under Test (UUT)
	dadda_16 uut (
		.A(A), 
		.B(B), 
		.Y(Y)
	);
	reg clk;
	always #5 clk = ~clk;
	  // Testbench stimulus
   initial begin
    $monitor("Time=%0t A=%b B=%b y=%b", $time, A, B, Y);

    // Initialize to 00000000
    A = 16'b0000000000000000;
    B = 16'b0000000000000000;
    clk = 0;
     // Apply inputs and clock in a loop
    repeat (65536) begin
      #5 A = (A == 16'b1111111111111111) ? 16'b0000000000000000 : A + 1;
		#5 B = (B == 16'b1111111111111111) ? 16'b0000000000000000 : B + 1;

    end
        
		// Add stimulus here

	end
      
endmodule

