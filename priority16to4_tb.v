`timescale 1ns/1ns
`include "priority16to4.v"

module priority16to4_tb;
  reg [15:0] w;          
  wire [3:0] y;          
  wire valid;            

  
  priority16to4 uut(w, y, valid);

  initial 
  begin
    $dumpfile("priority16to4_tb.vcd");
    $dumpvars(0, priority16to4_tb);

    // No input active
    w = 16'b0000_0000_0000_0000; #10;

    // Test single inputs
    w = 16'b0000_0000_0000_0001; #10;  // Position 0
    w = 16'b0000_0000_0000_1000; #10;  // Position 3
    w = 16'b0000_0001_0000_0000; #10;  // Position 8
    w = 16'b1000_0000_0000_0000; #10;  // Position 15 (highest priority)

    // Test multiple inputs to check priority
    w = 16'b0100_0000_0000_0001; #10;  // 14 vs 0 -> Output = 14
    w = 16'b0010_0000_1000_0000; #10;  // 13 vs 7 -> Output = 13
    w = 16'b0001_0000_0000_1111; #10;  // 12 vs lower bits -> Output = 12

    // Reset again
    w = 16'b0000_0000_0000_0000; #10;

    $finish;
  end
endmodule

