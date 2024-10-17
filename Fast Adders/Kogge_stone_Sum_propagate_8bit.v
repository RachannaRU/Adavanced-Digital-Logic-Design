`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:37:51 09/21/2024 
// Design Name: 
// Module Name:    Kogge_stone_8bit 
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
module grey_box(Ai,Bi,Pi,Hi);
input Ai,Bi;
output Pi,Hi;

or a1(Pi,Ai,Bi);
xor a2(Hi,Ai,Bi);
endmodule
  
module white_box(Hi,Pki,Hki,Xi,Hkj);
input Hi,Pki,Hki;
output Xi,Hkj;
assign Hkj=Hki;
xor a3(Xi,Hi,Pki);
endmodule




module grey_circle(Xi,Hki,Xki,X);
input Xi,Hki,Xki;
output X;

wire W1;
and a4(W1,Hki,Xki);
xor a5(X,Xi,W1);
endmodule 



module white_circle(Xi,Hki,Xki,Hkki,X,H);
input Xi,Hki,Xki,Hkki;
output X,H;

and a6(H,Hki,Hkki);
grey_circle a7(Xi,Hki,Xki,X);
endmodule



module Kogge_stone_8bit(A,B,SUM,Cout);
input [7:0]A,B;
output [7:0]SUM;
output Cout;

wire Pin,Hin;

assign Pin=1'b0;
assign Hin=1'b0;

//layer0 wire
wire P0,P1,P2,P3,P4,P5,P6,P7,H0,H1,H2,H3,H4,H5,H6,H7;
 
//layer1 wire
wire X0,X1,X2,X3,X4,X5,X6,X7;

//layer2 wire
wire X8,X9,X10,X11,X12,X13,X14,H8,H9,H10,H11,H12,H13;
 
//layer3 wire
wire X15,X16,X17,X18,X19,X20,H14,H15,H16,H17;

//Layer4 wire
wire X21,X22,X23,X24;

//cout generation
wire v1;

//layer0
grey_box g1(A[0],B[0],P0,H0);
grey_box g2(A[1],B[1],P1,H1);
grey_box g3(A[2],B[2],P2,H2);
grey_box g4(A[3],B[3],P3,H3);

grey_box g5(A[4],B[4],P4,H4);
grey_box g6(A[5],B[5],P5,H5);
grey_box g7(A[6],B[6],P6,H6);
grey_box g8(A[7],B[7],P7,H7);


//LAYER 1
white_box w1(H0,Pin,Hin,X0);
white_box w2(H1,P0,H0,X1);
white_box w3(H2,P1,H1,X2);
white_box w4(H3,P2,H2,X3);

white_box w5(H4,P3,H3,X4);
white_box w6(H5,P4,H4,X5);
white_box w7(H6,P5,H5,X6);
white_box w8(H7,P6,H6,X7);

//Layer 2

grey_circle c1(X1,H0,X0,X8);
white_circle b1(X2,H1,X1,H0,X9,H8);
white_circle b2(X3,H2,X2,H1,X10,H9);
white_circle b3(X4,H3,X3,H2,X11,H10);
white_circle b4(X5,H4,X4,H3,X12,H11);
white_circle b5(X6,H5,X5,H4,X13,H12);
white_circle b6(X7,H6,X6,H5,X14,H13);

//Layer 3
grey_circle c2(X9,H8,X0,X15);
grey_circle c3(X10,H9,X8,X16);
white_circle b7(X11,H10,X9,H8,X17,H14);
white_circle b8(X12,H11,X10,H9,X18,H15);
white_circle b9(X13,H12,X11,H10,X19,H16);
white_circle b10(X14,H13,X12,H11,X20,H17);

//Layer 4
grey_circle c4(X17,H14,X0,X21);
grey_circle c5(X18,H15,X8,X22);
grey_circle c6(X19,H16,X15,X23);
grey_circle c7(X20,H17,X16,X24);


assign SUM[0]=X0;
assign SUM[1]=X8;
assign SUM[2]=X15;
assign SUM[3]=X16;
assign SUM[4]=X21;
assign SUM[5]=X22;
assign SUM[6]=X23;
assign SUM[7]=X24;

and m2(v1,H7,X24);
xor m1(Cout,v1,P7);


endmodule
