`include "seqCircuit.v"
`timescale 1ns/1ns

module seqCircuit_TB();

reg E, x, clk, reset;
wire A, B;

seqCircuit seq_ins(E, x, clk, A, B, reset);

initial begin
    $dumpfile("seqCircuit_TB.vcd");
    $dumpvars(0, seqCircuit_TB);
end


initial begin
    clk = 0;
    forever #2 clk = ~clk;
end


initial begin
    E = 0; x = 0; reset = 1; #5;
    reset = 0;
    E = 0; x = 0; #10;
    E = 0; x = 1; #10;
    E = 1; x = 1; #20;
    E = 1; x = 0; #20;
    E = 0; x = 1; #10;
    E = 0; x = 0; #10;
    E = 1; x = 1; #20;
    E = 1; x = 0; #20;

    $display("Simulation complete");
    $finish;
end

// Optional display each clock edge
always @(posedge clk)
    $display("Time=%0t | E=%b x=%b | A=%b B=%b", $time, E, x, A, B);

endmodule

