module mux(d0,d1,s,y);
input d0,d1,s;
output y;
assign y=(s==0)? d0:d1;
endmodule

module xorgate(a,b,y);
input a,b;
output y;
mux dut(.d0(b), .d1(~b), .s(a), .y(y));
endmodule

module xor_tb();
reg a,b;
wire y;
xorgate dut(a,b,y);
initial begin
#00 repeat(6)
#10 {a,b}= $random;
#100 $stop;
end
endmodule
