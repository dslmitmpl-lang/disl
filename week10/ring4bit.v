module ring4bit(clear, clk, Q);
input clear, clk;
output [3:0] Q;
reg [3:0] temp;

always @ (posedge clk or negedge clear)
begin
  if (!clear)
    temp <= 4'b0001;           // Initial state
  else
    temp <= {temp[2:0], temp[3]}; // Rotate left
end

assign Q = temp;
endmodule


module tff (Q, T, clear, clk);
input T, clear, clk;
output reg Q;
always @ (posedge clk or negedge clear)
begin
  if (clear == 0)
    Q <= 0;
  else if (T == 1)
    Q <= ~Q;
  else
    Q <= Q;
end
endmodule
