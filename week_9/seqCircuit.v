module seqCircuit(E, x, clk, A, B, reset);
	input E, x, clk, reset;
	output A, B;

	wire Ja, Ka, Jb, Kb;

// When E=1, x=1 → 00→01→10→11→00
// When E=1, x=0 → 00→11→10→01→00
	assign Ja = (B & E & x) | ((~B) & E & (~x));
	assign Ka = (B & E & x) | ((~B) & E & (~x));
	assign Jb = E;
	assign Kb = E;

	JKFF FF_A(Ja, Ka, clk, A, reset);
	JKFF FF_B(Jb, Kb, clk, B, reset);
endmodule


module JKFF(J, K, clk, Q, reset);
	input J, K, clk, reset;
	output reg Q;

	always @(posedge clk or posedge reset)
	begin
    	  if (reset)
        	Q <= 0;
          else begin
        	case ({J, K})
            	 2'b00: Q <= Q;       // No change
            	 2'b01: Q <= 0;       // Reset
            	 2'b10: Q <= 1;       // Set
           	 2'b11: Q <= ~Q;      // Toggle
        	endcase
    	  end
	end
endmodule

