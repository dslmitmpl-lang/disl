`include "seqT.v"
`timescale 1ns/1ns

module seqT_tb();

reg x,clk,reset;
wire A,B;

seqT seqT_ins(x,clk,A,B,reset);

initial begin
    $dumpfile("seqT_tb.vcd");
    $dumpvars(0,seqT_tb);
end

initial begin
    clk= 0;
    forever #2 clk = ~clk;
end

initial begin
    reset = 1; x = 0; #5;      
    reset = 0; #5;            
    x = 0; #10;                
    x = 1; #10;                
    x = 0; #10;
    x = 1; #10;
    $finish;
end

endmodule
