`timescale 1ns/1ns
`include "jkffsync.v"

module jkffsync_tb;
  reg clk, rst, j, k;
  wire q;

  jkffsync uut(clk, rst, j, k, q);

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk; // 10ns period

  initial begin
    $dumpfile("jkffsync_tb.vcd");
    $dumpvars(0, jkffsync_tb);

    // Test sequence
    rst = 1; j = 0; k = 0; #10;  // synchronous reset
    rst = 0; j = 1; k = 0; #10;  // set
    j = 0; k = 1; #10;            // reset
    j = 1; k = 1; #10;            // toggle
    j = 0; k = 0; #10;            // no change
    j = 1; k = 1; #10;            // toggle
    $finish;
  end
endmodule

