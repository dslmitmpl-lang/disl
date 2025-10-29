`timescale 1ns/1ns
`include "asy4up.v"

module asy4up_tb;
reg clk, clear;
wire [3:0] Q;

asy4up uut(clear, clk, Q);

initial begin
  $dumpfile("asy4up_tb.vcd");
  $dumpvars(0, asy4up_tb);
  clk = 0; clear = 0;
  #5 clear = 1;             // Release reset
  #200 $finish;             // Run simulation
end

always #5 clk = ~clk;       // Clock with 10ns period

initial begin
  $monitor("Time=%0t | Q=%b", $time, Q);
end
endmodule

