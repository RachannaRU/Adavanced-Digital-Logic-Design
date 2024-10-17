`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:17:49 06/06/2024 
// Design Name: 
// Module Name:    BS_SIC 
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
module BS_SIC(
	input wire clk,
	input wire rst,
	output [4:0]lfsr_out
    );
reg [4:0]n =5'b1;

always@(posedge clk or posedge rst)
begin
	if (rst)
		begin
		n <= 5'b1;
		end
	else if(n==5'b11111)
		begin
		n <= 5'b1;
		end
	else
		begin
		n <= n + 1;
		end
end
assign lfsr_out[0] = ~(n[0]^n[1]);
assign lfsr_out[1] = ~(n[1]^n[2]);
assign lfsr_out[2] = ~(n[2]^n[3]);
assign lfsr_out[3] = ~(n[3]^n[4]);
assign lfsr_out[4] = ~n[4];
 
endmodule
