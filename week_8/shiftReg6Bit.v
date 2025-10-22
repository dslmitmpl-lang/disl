module shiftReg6Bit(W,clk,Q,clr);

input W,clk,clr;
output [5:0]Q;
DFF DFF_ins1(W,clk,Q[5],clr);
DFF DFF_ins2(Q[5],clk,Q[4],clr);
DFF DFF_ins3(Q[4],clk,Q[3],clr);
DFF DFF_ins4(Q[3],clk,Q[2],clr);
DFF DFF_ins5(Q[2],clk,Q[1],clr);
DFF DFF_ins6(Q[1],clk,Q[0],clr);
endmodule

module DFF(D,clk,Q,reset);

input D,clk,reset;
output reg Q;

always @(posedge clk, posedge reset)begin
    if(reset)
        Q<=0;
    else
        Q<=D;
end
endmodule
