module asy4up (clear, clk, Q);
input clear, clk;
output [3:0] Q;
reg [3:0] Q;

always @ (negedge clear or posedge clk)
begin
  if (!clear)
    Q <= 4'b0000;          // Resets counter
  else
    Q[0] <= ~Q[0];         // Toggles LSB
end

always @ (posedge Q[0])
  Q[1] <= ~Q[1];

always @ (posedge Q[1])
  Q[2] <= ~Q[2];

always @ (posedge Q[2])
  Q[3] <= ~Q[3];

endmodule

