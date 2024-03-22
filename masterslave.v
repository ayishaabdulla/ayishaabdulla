module jkff(j,k,rst,clk,q,qbar);
input j,k,rst,clk;
output reg q;
output qbar;
always @(posedge clk)
begin
if(rst)
q<=0;
else begin
case({j,k})
2'b00 : q<=q;
2'b01 : q<=0;
2'b10 : q<=1;
2'b11 : q<=~q; 
endcase
end end
assign qbar=~q;
endmodule

module ms(j,k,rst,clk,q,qbar);
input j,k,rst,clk;
output q,qbar;
wire w1,w2,iclk;
assign iclk=~clk;
jkff master (.j(j), .k(k), .rst(rst), .clk(clk), .q(w1),.qbar(w2));
jkff slave (.j(w1), .k(w2), .rst(rst), .clk(iclk), .q(q), .qbar(qbar));
endmodule

module ms_tb();
reg j,k,rst,clk;
wire q,qbar;
ms dut(j,k,rst,clk,q,qbar);
initial begin
clk=1'b0;
forever #5 clk=~clk;
end
initial begin
#00 rst=1;
#10 rst=0;
repeat(6)
#30{j,k}=$random;
end
endmodule



