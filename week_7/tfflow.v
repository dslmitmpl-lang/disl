module tfflow(clk, rst, t, q);
  input clk;
  input rst;   // asynchronous active-low reset
  input t;
  output reg q;

  always @(negedge clk or negedge rst) begin
    if (!rst)
      q = 1'b0;        // reset is active low
    else if (t)
      q = ~q;          // toggle on T=1
  end
endmodule

