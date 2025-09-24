// 4-to-2 Priority Encoder using casex
module priority4to2(w, y, valid);
  input [3:0] w;        
  output reg [1:0] y;   
  output reg valid;     

  always @ (w) 
  begin
    casex(w)
      4'b1xxx: begin   // Highest priority: w[3]
        y = 2'b11;
        valid = 1;
      end
      4'b01xx: begin   // Next priority: w[2]
        y = 2'b10;
        valid = 1;
      end
      4'b001x: begin   // Next priority: w[1]
        y = 2'b01;
        valid = 1;
      end
      4'b0001: begin   // Lowest priority: w[0]
        y = 2'b00;
        valid = 1;
      end
      default: begin   // No inputs active
        y = 2'b00;
        valid = 0;
      end
    endcase
  end
endmodule

