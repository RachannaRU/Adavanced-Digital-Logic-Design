module mux41(I,s,y);
input [3:0]I;
input [1:0]s;
output y;
assign y=((~s[0]&~s[1]&I[0])|(s[0]&~s[1]&I[1])|(s[1]&~s[0]&I[2])|(s[1]&s[0]&I[3]));
endmodule

module mux_tb;
	reg [3:0] I;
	reg [1:0] s;
	wire y;
	mux41 uut (
		.I(I), 
		.s(s), 
		.y(y)
	);
	initial begin
		I = 0;
		s = 0; 
		#10;
        
		s=2'b00;
		I=4'b1000;
		#100;
		s=2'b01;
		I=4'b1000;
		#100;
		s=2'b10;
		I=4'b1010;
		#100;
		s=2'b11;
		I=4'b1001;
                #100;
		s=2'b10;
		I=4'b1110;
		#100;
	end
initial $monitor("I = %4b s = %2b y = %0b",I,s,y);
endmodule
