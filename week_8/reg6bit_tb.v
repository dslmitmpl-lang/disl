`timescale 1ns/1ns
`include "reg6bit.v"

module reg6bit_tb();
reg [5:0] I;
reg clk;
wire [5:0] A;

reg6bit a1(I, clk, A);

initial begin
  clk = 0;
  forever #20 clk = ~clk;
end

initial begin
  $dumpfile("reg6bit_tb.vcd");
  $dumpvars(0, reg6bit_tb);
  I = 6'b101010; #20;
  I = 6'b111000; #20;
  I = 6'b000111; #20;
  $display("Test complete");
  $finish;
end
endmodule

