module srlatch(rst,s,r,q,qbar);
input s,r,rst;
output qbar;
output reg q;
always@(*) begin
if(rst)
q<=0;
else begin
case({s,r})
2'b00: q<=q;
2'b01: q<=0;
2'b10: q<=1;
2'b11: q<=1'bx;
endcase
end
end
assign qbar=~q;
endmodule

module srlatch_tb();
reg s,r,rst;
wire q,qbar;
srlatch dut(rst,s,r,q,qbar);
initial begin
#00 rst=1; s=0; r=0; 
#10 rst=0; 
repeat(6)
#10 {s,r}=$random;
#50 rst=1;
#50 $stop;
end
endmodule
