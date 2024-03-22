`timescale 1ps/1ps
module dfifo(in,re,we,clk,rst,f,e,out);
input [3:0]in;
input clk,rst,re,we;
output f,e;
output reg[3:0] out;
reg [3:0] wp,rp;
reg [4:0]count;
reg [3:0]fifo[15:0];
always @(negedge clk)
begin
if(rst) begin
 count<=0; 
 rp<=0; 
 wp<=0; 
 out<=4'bxxxx; 
 end
else begin
 if(we && !f)
begin
  fifo[wp]<=in;
  wp=wp+1;
  count= count+1;
end
 else if(re && !e) begin
  out<=fifo[rp];
  fifo[rp]<=0;
  rp=rp+1;
  count=count-1; end
end
end
assign f=(count==5'b10000)? 1:0;
assign e=(count==0)? 1:0;
endmodule

module dfifo_tb();
reg [3:0]in;
reg clk,rst,re,we;
wire f,e;
wire[3:0]out;
dfifo dut(in,re,we,clk,rst,f,e,out);
initial begin
clk=1'b0;
forever #5 clk=~clk;
 end
initial begin
#00 rst=1; re=0; we=0;
#20 rst=0; we=1; re=0; in=4'b0001;
repeat(15)
#10 in=$random;
#10 re=1; we=0;
#300 $stop;
end
endmodule
