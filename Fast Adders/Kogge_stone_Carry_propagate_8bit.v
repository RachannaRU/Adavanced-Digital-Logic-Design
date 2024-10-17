`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:56:33 09/21/2024 
// Design Name: 
// Module Name:    Kogge_stone_carry_8bit 
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
module Black_box(A,B,H,G);
input A,B;
output H,G;

xor x1(H,A,B);  // Propagate (H)
and x2(G,A,B);  // Generate (G)
endmodule

module Black_circle(Hi,Gi,Hki,Gki,P,G);
input Hi,Gi,Hki,Gki;
output P,G;
wire x;

and y1(x,Hi,Gki);
or y2(G,Gi,x);    // Generate output
and y3(P,Hi,Hki); // Propagate output
endmodule

module Grey_circle(Hi,Gi,Gki,G);
input Hi,Gi,Gki;
output G;
wire m;

and z1(m,Hi,Gki);
or z2(G,m,Gi);    // Generate output
endmodule

module Black_diamond(Pi,Cki,S);
input Pi,Cki;
output S;

xor S1(S,Pi,Cki);  // Sum calculation
endmodule

module Kogge_stone_carry_8bit(A,B,Sum,Cout);
input [7:0]A,B;
output [7:0]Sum;
output Cout;

//Layer 0
wire H0,H1,H2,H3,H4,H5,H6,H7;
wire G0,G1,G2,G3,G4,G5,G6,G7;

//Layer 1
wire G8,G9,G10,G11,G12,G13,G14;
wire P0,P1,P2,P3;

//Layer 2
wire G15,G16,G17,G18;

//Layer 3
wire G19,G20;

wire cin;
assign cin = 1'b0;

//Layer 0: Calculate propagate (H) and generate (G) signals
Black_box a1(A[0],B[0],H0,G0);
Black_box a2(A[1],B[1],H1,G1);
Black_box a3(A[2],B[2],H2,G2);
Black_box a4(A[3],B[3],H3,G3);
Black_box a5(A[4],B[4],H4,G4);
Black_box a6(A[5],B[5],H5,G5);
Black_box a7(A[6],B[6],H6,G6);
Black_box a8(A[7],B[7],H7,G7);

//Layer 1: Generate intermediate carries and propagates
Grey_circle b1(H1,G1,G0,G8);            // Generate G8
Black_circle b2(H2,G2,H1,G1,P0,G9);     // Generate P0 and G9
Black_circle b3(H3,G3,H2,G2,P1,G10);    // Generate P1 and G10
Black_circle b4(H4,G4,H3,G3,P2,G11);    // Generate P2 and G11
Black_circle b5(H5,G5,H4,G4,P3,G12);    // Generate P3 and G12
Black_circle b6(H6,G6,H5,G5,P4,G13);    // Generate P4 and G13
Black_circle b7(H7,G7,H6,G6,P5,G14);    // Generate P5 and G14

//Layer 2: Generate next level carries
Grey_circle c1(P0,G9,G0,G15);           // Generate G15
Grey_circle c2(P1,G10,G8,G16);          // Generate G16
Grey_circle c3(P2,G11,G9,G17);          // Generate G17
Grey_circle c4(P3,G12,G10,G18);         // Generate G18

//Layer 3: Generate next level carries
Grey_circle d1(P4,G13,G11,G19);         // Generate G19
Grey_circle d2(P5,G14,G12,G20);         // Generate G20

//Final Sum calculation
Black_diamond e1(H0,cin,Sum[0]);        // Sum bit 0
Black_diamond e2(H1,G0,Sum[1]);         // Sum bit 1
Black_diamond e3(H2,G8,Sum[2]);         // Sum bit 2
Black_diamond e4(H3,G15,Sum[3]);        // Sum bit 3
Black_diamond e5(H4,G16,Sum[4]);        // Sum bit 4
Black_diamond e6(H5,G17,Sum[5]);        // Sum bit 5
Black_diamond e7(H6,G18,Sum[6]);        // Sum bit 6
Black_diamond e8(H7,G19,Sum[7]);        // Sum bit 7

assign Cout = G20;   // Final carry out
endmodule
