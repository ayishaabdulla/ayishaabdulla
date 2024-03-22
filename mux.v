module mux(d0,d1,d2,d3,s,y);
input [3:0]s,d0,d1,d2,d3;
output [3:0]y;
assign y= ((s[1]==0)? (s[0]==0? d0:d1) : (s[0]==0)? d2:d3);
endmodule

module mux_n(d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,s,y);
input [3:0] d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15;
input [3:0]s;
output [3:0]y;
wire [3:0]w1,w2,w3,w4;
mux dut1(.d0(d0), .d1(d1), .d2(d2), .d3(d3), .s(s[1:0]), .y(w1));
mux dut2(.d0(d4), .d1(d5), .d2(d6), .d3(d7), .s(s[1:0]), .y(w2));
mux dut3(.d0(d8), .d1(d9), .d2(d10), .d3(d11), .s(s[1:0]), .y(w3));
mux dut4(.d0(d12), .d1(d13), .d2(d14), .d3(d15), .s(s[1:0]), .y(w4));
mux dut5(.d0(w1), .d1(w2), .d2(w3), .d3(w4), .s(s[3:2]), .y(y));
endmodule

module mux_tb();
reg [3:0]d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15;
reg [3:0]s;
wire [3:0]y;
wire [3:0]w1,w2,w3,w4;
mux_n dut(d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,s,y);
initial begin
#00 d0=4'b1101; d1=2'd4; d2=2'd2; d3=3'd7; d4=4'd8; d5=4'd10; d6=3'd5;
d7=3'd6; d8=4'd11; d9=1'd1; d10=4'd15; d11=4'd13; d12=4'd12; d13=4'd11; d14=4'd9; d15=4'd8;
#00 repeat(16)
#10 s= $random ;
end
endmodule


