module prime(y);
output y;
parameter N
integer i;
integer j;
initial begin
for(i=2;i<N-1;i=i+1)
begin
 for(j=2;i<N-1;j=j+1)
 begin
 if(i%j!=0)
  y<=i;
 end
end
end
endmodule
  