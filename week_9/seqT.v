module seqT(x,clk,A,B,reset);
	input x,clk,reset;
	output A,B;
	wire Ta, Tb;
	
	assign Ta = ((~A)&B)|(B&(~x));
	assign Tb = ((~B)&(~x))|(A&(~x))|((~A)&B&x);

	TFF TFF_A(Ta,clk,A,reset);
	TFF TFF_B(Tb,clk,B,reset);
endmodule

module TFF(T,clk,Q,reset);

input T,clk,reset;
output reg Q;

always @(posedge clk, posedge reset)begin
    if(reset) Q<=0;
    else begin
        if(T==0) 
         Q<=Q;
        else 
         Q<=~Q;
    end
end
endmodule
