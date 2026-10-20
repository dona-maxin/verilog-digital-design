`timescale 1ns/1ps

module sequence_detector_101_tb;

reg clk;
reg reset;
reg din;
wire detected;

sequence_detector_101 uut (
    .clk(clk),
    .reset(reset),
    .din(din),
    .detected(detected)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Test sequence
initial begin
    reset = 1;
    din = 0;

    #10;
    reset = 0;

    // Input sequence: 1 0 1
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;

    // Additional inputs
    #10 din = 1;
    #10 din = 0;
    #10 din = 1;

    #10 $finish;
end

// Display signals
initial begin
    $monitor("Time=%0t | Reset=%b | Din=%b | Detected=%b",
             $time, reset, din, detected);
end

endmodule
