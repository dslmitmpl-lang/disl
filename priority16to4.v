// 16-to-4 Priority Encoder using for loop
module priority16to4(w, y, valid);
  input [15:0] w;       
  output reg [3:0] y;  
  output reg valid;     

  integer i;

  always @ (w)
  begin
    y = 4'b0000;       // Default output
    valid = 0;          // Default valid signal

    
    for (i = 15; i >= 0; i = i - 1)
    begin
      if (w[i] == 1'b1)
      begin
        y = i[3:0];     // Assign index as output
        valid = 1;      // Set valid high
      end
    end
  end
endmodule

