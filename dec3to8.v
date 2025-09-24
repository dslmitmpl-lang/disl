`include "dec2to4.v"
module dec3to8(en, a, y);
  input en;
  input [2:0] a;
  output [7:0] y;

  wire [3:0] y_low, y_high;

  dec2to4 d0(en & ~a[2], a[1:0], y_low);  
  dec2to4 d1(en & a[2], a[1:0], y_high);  

  assign y = {y_high, y_low};
endmodule
