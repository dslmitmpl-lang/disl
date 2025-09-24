`include "dec3to8two.v"

module dec4to16(w, en, y);
  input [3:0] w;         
  input en;              
  output [15:0] y;       

  wire [7:0] y_low, y_high;

  // Lower block active when MSB (w[3]) = 0
  dec3to8two d0(w[2:0], en & ~w[3], y_low);

  // Upper block active when MSB (w[3]) = 1
  dec3to8two d1(w[2:0], en & w[3], y_high);

  // Combine outputs: y_high is the upper 8 bits, y_low is the lower 8 bits
  assign y = {y_high, y_low};
endmodule

