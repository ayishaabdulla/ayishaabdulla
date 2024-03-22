module mealy(in,rst,clk,out); //sequence deteced 101
input in;
input rst,clk;
output reg out;
reg [1:0]ns,ps;
parameter s0=2'b00, s1=2'b01, s2=2'b10;
always@(posedge clk or posedge rst)
begin
if(rst)
ps<=0;
else
ns=ps;
end
always@(ps or in)
begin
case(ps)
s0:begin 
	if(in)
	ns<=s1;
	else 
	ns<=s0; end
s1:begin 
	if(in)
	ns<=s1;
	else 
	ns<=s2;end
s2:begin 
	if(in)
	ns<=s1;
	else
	ns<=s0;end
endcase
end
always@(ps or in) begin
case(ps)
s0 : out=0;
s1 : out=0;
s2 : begin if(in) out=1;
     else out=0; end
endcase
end
endmodule 


