`timescale 1ns/1ns
`include "priority4to2.v"

module priority4to2_tb;
  reg [3:0] w;          
  wire [1:0] y;         
  wire valid;           

  
  priority4to2 uut(w, y, valid);

  initial 
  begin
    $dumpfile("priority4to2_tb.vcd");
    $dumpvars(0, priority4to2_tb);

   
    w = 4'b0000; #10;  // No inputs active
    w = 4'b0001; #10;  // Only w[0] active
    w = 4'b0010; #10;  // Only w[1] active
    w = 4'b0100; #10;  // Only w[2] active
    w = 4'b1000; #10;  // Only w[3] active

    // Multiple inputs active (priority check)
    w = 4'b1010; #10;  // w[3] & w[1] active -> priority w[3]
    w = 4'b0111; #10;  // w[2], w[1], w[0] active -> priority w[2]
    w = 4'b0011; #10;  // w[1], w[0] active -> priority w[1]

    $finish;
  end
endmodule

