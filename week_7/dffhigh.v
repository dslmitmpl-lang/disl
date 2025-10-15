module dffhigh(clk, rst, d, q);
  input clk;
  input rst;   // asynchronous active-high reset
  input d;
  output reg q;

  always @(posedge clk or posedge rst) begin
    if (rst)
      q = 1'b0;
    else
      q = d;
  end
endmodule


