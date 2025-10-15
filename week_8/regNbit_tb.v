`timescale 1ns/1ns
`include "regNbit.v"

module regNbit_TB();
reg [7:0] I;
reg clk;
wire [7:0] A;

regNbit a1(I, clk, A);

initial
begin
  clk = 0;
  forever #20 clk = ~clk;
end

initial
begin
  $dumpfile("regNbit_TB.vcd");
  $dumpvars(0, regNbit_TB);
  I = 8'b10101010; #20;
  I = 8'b11110000; #20;
  $display("Test complete");
end
endmodule

