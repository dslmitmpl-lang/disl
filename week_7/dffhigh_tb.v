`timescale 1ns/1ns
`include "dffhigh.v"

module dffhigh_tb;
  reg clk, rst, d;
  wire q;

  dffhigh uut(clk, rst, d, q);

  // Clock generation
  initial clk = 0;
  always #5 clk = ~clk; // 10ns clock period

  initial begin
    $dumpfile("dffhigh_tb.vcd");  // VCD file for GTKWave
    $dumpvars(0, dffhigh_tb);

    // Test sequence
    rst = 1; d = 0; #10;  // Apply reset
    rst = 0; d = 1; #10;
    d = 0; #10;
    d = 1; #10;
    rst = 1; #10;          // Reset again
    rst = 0; d = 0; #20;

    $finish;
  end
endmodule

