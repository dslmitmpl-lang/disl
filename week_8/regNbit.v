module regNbit(I, clk, A);
input [7:0] I;   // 8-bit input (change size if needed)
input clk;
output [7:0] A;

dffp s1(I[7], clk, A[7]);
dffp s2(I[6], clk, A[6]);
dffp s3(I[5], clk, A[5]);
dffp s4(I[4], clk, A[4]);
dffp s5(I[3], clk, A[3]);
dffp s6(I[2], clk, A[2]);
dffp s7(I[1], clk, A[1]);
dffp s8(I[0], clk, A[0]);

endmodule

module dffp(D, Clock, Q);
input D, Clock;
output Q;
reg Q;
always @(posedge Clock)
  Q <= D;
endmodule

