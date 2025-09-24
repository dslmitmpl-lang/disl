`timescale 1ns/1ns
`include "dec4to16.v"

module dec4to16_tb;
  reg [3:0] w;            // 4-bit input
  reg en;                  // Enable signal
  wire [15:0] y;           // 16-bit output

  // Instantiate the 4-to-16 decoder
  dec4to16 uut(w, en, y);

  initial 
  begin
    $dumpfile("dec4to16_tb.vcd");   // VCD file for waveform
    $dumpvars(0, dec4to16_tb);

    
    en = 0; w = 4'b0000; #10;
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

    en = 0; w = 4'b1010; #10;

    $finish;
  end
endmodule

