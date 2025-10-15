module jkffsync(clk, rst, j, k, q);
  input clk;
  input rst;   // synchronous active-high reset
  input j, k;
  output reg q;

  always @(posedge clk) begin
    if (rst)
      q = 1'b0;        // synchronous reset
    else begin
      case ({j, k})
        2'b00: q = q;      // no change
        2'b01: q = 1'b0;   // reset
        2'b10: q = 1'b1;   // set
        2'b11: q = ~q;     // toggle
      endcase
    end
  end
endmodule

