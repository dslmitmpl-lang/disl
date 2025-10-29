module seqTff(clk, reset, Q);
input clk, reset;
output [0:2] Q;          // Q[0]=LSB, Q[2]=MSB

TFF TFF_1(Q[1], clk, Q[0], reset);                    // Tc = Q[1]
TFF TFF_2(Q[2], clk, Q[1], reset);                    // Tb = Q[2]
TFF TFF_3((~Q[2]) | (Q[0] & Q[1]), clk, Q[2], reset); // Ta = (~Q[2]) | (Q[0]&Q[1])

endmodule


module TFF(T, clk, Q, reset);
input T, clk, reset;
output reg Q;

always @(posedge clk or negedge reset)
begin
  if (!reset)
    Q <= 1'b0;          // Asynchronous reset
  else if (T)
    Q <= ~Q;            // Toggle when T=1
  else
    Q <= Q;             // Hold state
end
endmodule

