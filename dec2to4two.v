// 2-to-4 Decoder with active-high enable and active-low outputs
module dec2to4two(en, a, y);
  input en;
  input [1:0] a;
  output reg [3:0] y;

  always @ (en or a) 
  begin
    if (en) 
    begin
      case(a)
        2'b00: y = 4'b1110;  // Active-low output
        2'b01: y = 4'b1101;
        2'b10: y = 4'b1011;
        2'b11: y = 4'b0111;
      endcase
    end
    else 
      y = 4'b1111;       
  end
endmodule

