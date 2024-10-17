module seq_detector(x,clk,reset,z);
input x,clk,reset;
output reg z;
parameter s0=0,s1=1,s2=2,s3=3;
reg [0:1] PS,NS;
always @(posedge clk or posedge reset)
begin
if(reset)
PS<=s0;
else
PS<=NS;
end
always @(PS,x)
begin
case(PS)
s0:begin
z=x?0:0;
NS=x?s0:s1;
end
s1:begin
z=x?0:0;
NS=x?s2:s1;
end
s2:begin
z=x?0:0;
NS=x?s3:s1;
end
s3:begin
z=x?0:1;
NS=x?s0:s1;
end
endcase
end
endmodule

//Test Bench

module seq_detector_tb();
reg clk,x,reset;
wire z;
seq_detector SEQ(x,clk,reset,z);
initial begin
clk=1'b0;
reset=1'b1;
#15 reset=1'b0;
end
always #5 clk=~clk;
initial begin
#12; x=0; #10; x=0; #10; x=1; #10; x=1;
#10; x=0; #10; x=1; #10; x=1; #10; x=0;
#10; x=0; #10; x=1; #10; x=1; #10; x=0;
#10; $finish;
end
endmodule
