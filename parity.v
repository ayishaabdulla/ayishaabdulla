module parity(p,d,c,dataout);
input [2:0]p;
input [3:0]d;
output [2:0]c;
output [6:0]dataout;
assign dataout={p[0],p[1],d[0],p[2],d[1],d[2],d[3]};
assign c[0]= p[0]^d[0]^d[1]^d[3];
assign c[1]= p[1]^d[0]^d[2]^d[3];
assign c[2]= p[2]^d[1]^d[2]^d[3];
initial begin
if(c==3'b000)
$monitor("%bdataout haseven parity",dataout);
else
$monitor("output has errors ");
end
endmodule

module parity_tb();
reg [2:0]p;
reg [3:0]d;
wire [2:0]c;
wire [6:0]dataout;
parity dut(p,d,c,dataout);
initial begin
repeat(5) begin
#10 p=$random; d=$random; end
end
endmodule
