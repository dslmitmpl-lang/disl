`timescale 1ns/1ns
`include "dec4to16two.v"

module dec4to16two_tb;
  reg en;
  reg [3:0] w;
  wire [15:0] y;

  dec4to16two uut(en, w, y);

  initial 
  begin
    $dumpfile("dec4to16two_tb.vcd");
    $dumpvars(0, dec4to16two_tb);

    // Test when enable is OFF
    en = 0; w = 4'b0000; #10;

    // Test all combinations with enable ON
    en = 1;
    w = 4'b0000; #10;
    w = 4'b0001; #10;
    w = 4'b0010; #10;
    w = 4'b0011; #10;
    w = 4'b0100; #10;
    w = 4'b0101; #10;
    w = 4'b0110; #10;
    w = 4'b0111; #10;
    w = 4'b1000; #10;
    w = 4'b1001; #10;
    w = 4'b1010; #10;
    w = 4'b1011; #10;
    w = 4'b1100; #10;
    w = 4'b1101; #10;
    w = 4'b1110; #10;
    w = 4'b1111; #10;

    // Disable again to confirm all outputs are inactive
    en = 0; w = 4'b1010; #10;

    $finish;
  end
endmodule

