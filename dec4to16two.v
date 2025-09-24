`include "dec2to4two.v"

module dec4to16two(en, w, y);
  input en;
  input [3:0] w;
  output [15:0] y;

  wire [3:0] en_out;  // Enables for the four lower decoders

  // First stage: Generate enables
  dec2to4two stage1(en, w[3:2], en_out);

  // Second stage: Four 2-to-4 decoders
  dec2to4two d0(en_out[0], w[1:0], y[3:0]);
  dec2to4two d1(en_out[1], w[1:0], y[7:4]);
  dec2to4two d2(en_out[2], w[1:0], y[11:8]);
  dec2to4two d3(en_out[3], w[1:0], y[15:12]);

endmodule

