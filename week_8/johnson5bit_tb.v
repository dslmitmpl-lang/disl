`timescale 1ns/1ns
`include "johnson5bit.v"

module johnson5bit_tb();
reg clk, reset;
wire [4:0] Q;

johnson5bit uut(clk, reset, Q);

initial
begin
  clk = 0;
  forever #10 clk = ~clk;       // Clock period = 20 ns
end

initial
begin
  $dumpfile("johnson5bit_tb.vcd");
  $dumpvars(0, johnson5bit_tb);

  reset = 1; #20;               // Apply reset
  reset = 0;                    // Release reset

  #200;                         // Run counter for some cycles
  $display("Test complete");
  $finish;
end
endmodule

