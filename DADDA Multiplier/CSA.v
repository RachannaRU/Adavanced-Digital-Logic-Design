`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:22:53 12/08/2023 
// Design Name: 
// Module Name:    CSA 
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
//csa for use of half adder and full adder.

module csa_dadda(A,B,Cin,Y,Cout);
input A,B,Cin;
output Y,Cout;
wire w1;

assign w1 = (~((~(A|B))|(A&B)));    
assign Y = (~((~(w1|Cin))|(w1&Cin)));    
assign Cout = ((A&B)|(w1&Cin));
    
endmodule
