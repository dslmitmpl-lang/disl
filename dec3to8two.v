module dec3to8two(w,en,y);
	input[2:0]w;
	input en;
	output reg [7:0]y;
	integer k;
	always @(en or w)
	begin
		for(k=0;k<=7;k=k+1)
			if((w==k)&&(en==1))
				y[k]=1;
			else
				y[k]=0;
	end
endmodule
