module johnson5bit(clk, reset, Q);
input clk, reset;
output [4:0] Q;
reg [4:0] Q;

always @(posedge clk or posedge reset)
begin
  if (reset)
    Q <= 5'b00000;              // Reset to all 0s
  else
    Q <= {~Q[0], Q[4:1]};       // Shift right, feedback inverted LSB
end
endmodule

