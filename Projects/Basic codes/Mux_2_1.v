module mux_21(s,I,y);
input s;
input [1:0]I;
output y;
assign y=((~s)&I[0])|(s&I[1]);
endmodule

module mux_21_tb;
	reg s;
	reg [1:0] I;
	wire y;
	mux_21 uut (
		.s(s), 
		.I(I), 
		.y(y)
	);

	initial begin
		s = 0;
		I = 2'b01;
		#100;
                s = 1;
		I = 2'b11; 
		#100;
                s = 1;
		I = 2'b10; 
		#100;
                s = 0;
		I = 2'b10; 
		#100;
	end
initial $monitor("I = %2b s = %0b y = %0b",I,s,y);      
endmodule
