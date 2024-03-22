module ram_mem(
input[3:0]in,
input addr,we,clk,
output reg[3:0]out);
reg [3:0]temp;
reg [3:0]ram[1:0];
always@(posedge clk)
begin
if(we)
ram[addr]<=in;
else begin
temp<=addr;
out <= ram[temp]; end
end
endmodule

module ram_tb();
reg [3:0]in;
reg addr,we,clk;
wire [3:0]out;
ram_mem dut (in,addr,we,clk,out);
initial begin
clk=1'b0;
forever #5 clk=~clk;
end
initial begin
#00 we=1; addr=0; in=4'b0110;
#10 addr=1; in=4'b1111;
#10 we=0; addr=0;
#20 we=1; in=4'b1100;
#10 we=0;
#10 addr=1;
end
endmodule
