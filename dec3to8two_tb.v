`timescale 1ns/1ns
`include "dec3to8two.v"

module dec3to8two_tb;
  reg [2:0] w;      
  reg en;          
  wire [7:0] y;     

  
  dec3to8two dt(w, en, y);

  initial 
  begin
    $dumpfile("dec3to8two_tb.vcd");   
    $dumpvars(0, dec3to8two_tb);

    en = 0; w = 3'b000; #10;
    en = 0;
    w = 3'b000; #10;
    w = 3'b101; #10;
    w = 3'b111; #10;

    $display("Enable ON Test:");
    en = 1;
    w = 3'b000; #10;
    w = 3'b001; #10;
    w = 3'b010; #10;
    w = 3'b011; #10;
    w = 3'b100; #10;
    w = 3'b101; #10;
    w = 3'b110; #10;
    w = 3'b111; #10;

    en = 0; w = 3'b010; #10;
  end
endmodule

