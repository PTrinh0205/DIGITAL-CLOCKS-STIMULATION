`timescale 1ns / 1ps

module time_countdown_tb;

reg clk;         // Clock signal
reg set_time;    // SetTime button signal
reg set;         // Set button signal
reg up;          // Up button signal

wire [4:0] hours;    // Output for hours
wire [5:0] minutes;  // Output for minutes
wire [5:0] seconds;  // Output for seconds

// Instantiate the time_countdown module
time_countdown uut (
    .clk(clk), 
    .set_time(set_time), 
    .set(set), 
    .up(up), 
    .hours(hours), 
    .minutes(minutes), 
    .seconds(seconds)
);

// Clock generation
always #4 clk = ~clk;

initial begin
    // Initialize signals
    clk = 0;
    set_time = 0;
    set = 0;
    up = 0;

    #20; // Wait for 20 time units

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
    
    #40_000; // Run simulation for additional time to observe countdown
    
    $stop; // Stop simulation
end

endmodule
