`timescale 1ns/1ns
`include "ring4bit.v"

module ring4bit_tb;
reg clk, clear;
wire [3:0] Q;

ring4bit uut(clear, clk, Q);

initial begin
  $dumpfile("ring4bit_tb.vcd");
  $dumpvars(0, ring4bit_tb);
  clk = 0; clear = 0;
  #5 clear = 1;
  #100 $finish;
end

always #5 clk = ~clk;

initial begin
  $monitor("Time=%0t | Q=%b", $time, Q);
end
endmodule

