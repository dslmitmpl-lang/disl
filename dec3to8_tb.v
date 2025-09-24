`timescale 1ns/1ns
`include "dec3to8.v"

module dec3to8_tb;
  reg en;
  reg [2:0] a;
  wire [7:0] y;

  dec3to8 uut(en, a, y);

  initial 
  begin
    $dumpfile("dec3to8_tb.vcd");
    $dumpvars(0, dec3to8_tb);

    en = 0; a = 3'b000; #10;
    en = 1; a = 3'b000; #10;
    a = 3'b001; #10;
    a = 3'b010; #10;
    a = 3'b011; #10;
    a = 3'b100; #10;
    a = 3'b101; #10;
    a = 3'b110; #10;
    a = 3'b111; #10;
    en = 0; a = 3'b101; #10;

    $finish;
  end
endmodule

