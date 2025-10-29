`timescale 1ns/1ns
`include "seqTff.v"

module seqTff_tb;
reg clk, reset;
wire [0:2] Q;

seqTff uut(clk, reset, Q);

initial begin
  $dumpfile("seqTff_tb.vcd");
  $dumpvars(0, seqTff_tb);
  clk = 0; reset = 0;
  #5 reset = 1;               // Release reset
  #200 $finish;
end

always #5 clk = ~clk;         // Clock toggles every 5ns

endmodule

