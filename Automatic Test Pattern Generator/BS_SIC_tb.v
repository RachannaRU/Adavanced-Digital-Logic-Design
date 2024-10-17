`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:22:30 06/06/2024
// Design Name:   BS_SIC
// Module Name:   /home/ise/LFSR/BS_SIC/BS_SIC/BS_SIC_tb.v
// Project Name:  BS_SIC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BS_SIC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BS_SIC_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [4:0] lfsr_out;

	// Instantiate the Unit Under Test (UUT)
	BS_SIC uut (
		.clk(clk),
		.rst(rst),
		.lfsr_out(lfsr_out)
	);

	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		#10 rst = 0; 
	end
	
	initial begin
	#10;
	repeat(31)
	#10;
	$dumpfile("BS_SIC.vcd");
	$dumpvars(1,BS_SIC_tb.uut);
	$finish;
	end
	always@(posedge clk) begin
	$display("BS SIC LFSR output is : %b ",lfsr_out);
	end
      
endmodule

