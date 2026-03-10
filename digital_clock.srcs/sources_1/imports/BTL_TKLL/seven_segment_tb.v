`timescale 1ns / 1ps

module seven_segment_tb;
    // Inputs
    reg [3:0] digit;
    
    // Outputs
    wire [6:0] segments;

    // Instantiate the module to be tested
    seven_segment uut (
        .digit(digit),
        .segments(segments)
    );

    // Clock generation
    reg clk = 0;
    always #4 clk = ~clk;

    // Test stimulus
    initial begin
        // Apply test cases
        digit = 4'b0000;     // Input 0
        #10 digit = 4'b0001; // Input 1
        #10 digit = 4'b0010; // Input 2
        #10 digit = 4'b0011; // Input 3
        #10 digit = 4'b0100; // Input 4
        #10 digit = 4'b0101; // Input 5
        #10 digit = 4'b0110; // Input 6
        #10 digit = 4'b0111; // Input 7
        #10 digit = 4'b1000; // Input 8
        #10 digit = 4'b1001; // Input 9
        #10 digit = 4'b1010; // Invalid input

        // End simulation
        #10 $stop;
    end
endmodule
