module fibonacci(clk,rst,c);
input clk,rst;
output reg[31:0]c;
reg [31:0]a,b;
parameter N=10;
always@(posedge clk )
if(rst) begin
a=1'd0; 
b=1'd0;
c=0;
end
else begin
c=1'd1; 
c=a+b;
a=b;
b=c;
end
endmodule

module fibonacci_tb();
reg clk,rst;
wire [31:0]c;
parameter N=10;
fibonacci dut(clk,rst,c);
initial begin
clk=1'b0;
forever #5 clk=~clk;
end
initial begin
#00 rst=1;
#10 rst=0;
$monitor("The first %d fibonacci sequence are 0,1 %d",N,c);
end
endmodule

