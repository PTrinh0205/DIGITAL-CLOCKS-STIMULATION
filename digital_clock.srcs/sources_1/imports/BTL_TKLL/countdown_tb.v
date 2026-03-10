`timescale 1ns / 1ps

module countdown_tb;
// Inputs
reg clk;            // Clock signal
reg set_time;       // SetTime button signal
reg set;            // Set button signal
reg up;             // Up button signal
reg reset;
// Outputs
wire [6:0] hour_1;  // Tens digit of hours in 7-segment format
wire [6:0] hour_0;  // Units digit of hours in 7-segment format
wire [6:0] min_1;   // Tens digit of minutes in 7-segment format
wire [6:0] min_0;   // Units digit of minutes in 7-segment format
wire [6:0] sec_1;   // Tens digit of seconds in 7-segment format
wire [6:0] sec_0;   // Units digit of seconds in 7-segment format

    // Instantiate the countdown module
    countdown #(.CLK_DIVIDER(4)) uut (
        .clk(clk),
        .set_time(set_time),
        .set(set),
        .up(up),
        .reset(reset),
        .hour_1(hour_1),
        .hour_0(hour_0),
        .min_1(min_1),
        .min_0(min_0),
        .sec_1(sec_1),
        .sec_0(sec_0)
    );

// Clock generation
always #2 clk = ~clk;

initial begin
    // Initialize signals
    clk = 0;
    set_time = 0;
    set = 0;
    up = 0;
    reset = 1;

    #20; // Wait for 20 time units
    reset = 0;
    // Set hours to 1
    set_time = 0; 
    set = 1;
    #10 up = 1; // Press up button to increment hours
    #10 up = 0; // Release up button
    #20; // Wait for 20 time units

    // Set minutes to 3
    set_time = 1;
    set = 0;    
    #10 up = 1; 
    #10 up = 0; 
    #10 up = 1; 
    #10 up = 0; 
    #10 up = 1; 
    #10 up = 0; 
    #20; // Wait for 20 time units

    // Set seconds to 4
    set_time = 1; 
    set = 1;    
    #10 up = 1; 
    #10 up = 0; 
    #10 up = 1; 
    #10 up = 0; 
    #10 up = 1; 
    #10 up = 0; 
    #10 up = 1; 
    #10 up = 0; 
    #20; // Wait for 20 time units

    // Start countdown
    set_time = 0; 
    set = 0;
    #10 up = 1; // Press up button to start countdown
    #10 up = 0; // Release up button
    
    #1_000 up = 1;
    #10 up = 0;
    #500
    up = 1;
    #10 up = 0;
    
    #40_000; // Run simulation for additional time to observe countdown
    
    $stop; // Stop simulation
end


endmodule
