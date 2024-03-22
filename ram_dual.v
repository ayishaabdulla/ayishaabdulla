module ram_dual(in,addr,we,re,clk,out);
input[7:0]in;
input [9:0]addr;
input we,re,clk;
output reg[7:0]out;
reg [9:0]temp;
reg [7:0]ram[1023:0];
always@(posedge clk)
begin
if(we)
ram[addr]<=in;
if(re)begin
temp<=addr;
out <= ram[temp]; end
end
endmodule

/*module ram_tb();
reg [7:0]in;
reg [9:0]addr;
reg we,re,clk;
wire [7:0]out;
initial begin
clk=1;
forever #5 clk=~clk;
end
initial begin
#00 we=1; re=0;
forever(10)begin
#10 addr=$random; in=$random; end
#10 re=1; we=1;
forever (10)
#10 addr=$random;
end
endmodule*/