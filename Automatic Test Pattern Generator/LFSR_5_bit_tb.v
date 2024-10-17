`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:11:55 04/22/2024
// Design Name:   LFSR_5bit
// Module Name:   /home/ise/LFSR/LFSR_5bit/LFSR_5_bit_tb.v
// Project Name:  LFSR_5bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LFSR_5bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LFSR_5bit_tb;

    // Inputs
    reg clk;
    reg rst;
    
    // Outputs
    wire [4:0] lfsr_out;
    
    // Instantiate the LFSR module
    LFSR_5bit uut (
        .clk(clk),
        .rst(rst),
        .lfsr_out(lfsr_out)
    );
    // Clock generation
    always #5 clk = ~clk;

    // Initial reset
    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0; // Release reset after 10 time units
    end
    
    // Stimulus
    initial begin
        // Wait for a few clock cycles
        #20;
        // Perform some clock cycles to observe the LFSR output
        repeat(31) begin
            #10;
        end
        $dumpfile("LFSR_5_bit.vcd");
		  $dumpvars(1,LFSR_5bit_tb.uut);
        // End simulation
        $finish;
    end
    
    // Display LFSR output
    always @(posedge clk) begin
        $display("LFSR Output: %b", lfsr_out);
    end

endmodule
