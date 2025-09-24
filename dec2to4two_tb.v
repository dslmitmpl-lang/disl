`timescale 1ns/1ns
`include "dec2to4two.v"

module dec2to4two_tb;
  reg en;            
  reg [1:0] a;       
  wire [3:0] y;      
  dec2to4two uut(en, a, y);

  initial 
  begin
    $dumpfile("dec2to4two_tb.vcd");  // VCD file for GTKWave
    $dumpvars(0, dec2to4two_tb);

    
    en = 0; a = 2'b00; #10;
    a = 2'b01; #10;
    a = 2'b10; #10;
    a = 2'b11; #10;

    
    en = 1; a = 2'b00; #10;  // y = 1110
    a = 2'b01; #10;          // y = 1101
    a = 2'b10; #10;          // y = 1011
    a = 2'b11; #10;          // y = 0111

    
    en = 0; a = 2'b10; #10;  // y = 1111

    $finish;
  end
endmodule

