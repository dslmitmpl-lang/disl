`timescale 1ns/1ns
`include "tfflow.v"

module tfflow_tb;
  reg clk, rst, t;
  wire q;

  tfflow uut(clk, rst, t, q);

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk; // 10ns period

  initial begin
    $dumpfile("tfflow_tb.vcd");
    $dumpvars(0, tfflow_tb);

    // Test sequence
    rst = 0; t = 0; #10;   // Apply reset (active low)
    rst = 1; t = 1; #10;   // Toggle
    t = 0; #10;
    t = 1; #10;
    rst = 0; #10;           // Reset again
    rst = 1; t = 1; #20;    // Toggle
    $finish;
  end
endmodule

