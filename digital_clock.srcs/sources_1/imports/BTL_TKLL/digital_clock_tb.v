`timescale 1ns / 1ps

module digital_clock_tb;
// Inputs
reg clk;
reg reset;
reg [1:0] clock_mode;
reg set_time;
reg set;
reg up;
reg start;

// Outputs
wire [6:0] hrs_tens;
wire [6:0] hrs_ones;
wire [6:0] min_tens;
wire [6:0] min_ones;
wire [6:0] ampm1;
wire [6:0] ampm0;
wire clock_mode_led;

// Instantiate the Unit Under Test (UUT)
digital_clock #(.CLK_DIVIDER(4)) uut (
    .clk(clk),
    .reset(reset),
    .clock_mode(clock_mode),
    .set_time(set_time),
    .set(set),
    .up(up),
    .start(start),
    .hrs_tens(hrs_tens),
    .hrs_ones(hrs_ones),
    .min_tens(min_tens),
    .min_ones(min_ones),
    .ampm1(ampm1),
    .ampm0(ampm0),
    .clock_mode_led(clock_mode_led)
);

// Clock generation
initial begin
    clk = 0;
    forever #2 clk = ~clk; // 8ns clock period
end

// Test procedure
initial begin
    // Initialize inputs
    reset = 1;
    clock_mode = 2'b00; // Start in DISPLAY_TIME mode
    set_time = 0;
    set = 0;
    up = 0;
    start = 0;

    // Wait for global reset
    #20;
    reset = 0;

    // Test DISPLAY_TIME mode: simulate time increment
    clock_mode = 2'b00;
    #1_000;

    // Test SET_TIME mode
    clock_mode = 2'b01;
    set_time = 1'b0; // Do not activate set_time
    set = 1'b0; // Do not activate set
    up = 0; // Do not activate up

    // Control set_time, set, and up
    
    // Adjust hours
    #10 set_time = 1'b0;
    #10 set = 1'b1; up = 1'b0;
    #20 set = 1'b1; up = 1'b1;
    #10 set = 1'b1; up = 1'b0;
    
    // Adjust minutes
    #10 set_time = 1'b1;
    #10 set = 1'b0; up = 1'b0;
    #20 set = 1'b0; up = 1'b1;
    #10 set = 1'b0; up = 1'b0;
    #20 set = 1'b0; up = 1'b1;
    #10 set = 1'b0; up = 1'b0;
    
    // Toggle AM/PM
    #10 set_time = 1'b1;
    #10 set = 1'b1; up = 1'b0;
    #20 set = 1'b1; up = 1'b1;
    #10 set = 1'b1; up = 1'b0;
    #20 set = 1'b1; up = 1'b1;
    #10 set = 1'b1; up = 1'b0;

    // Test STOPWATCH mode
    clock_mode = 2'b10;
    #4 start = 1; //press button to count
    #10 start = 0; //release button
    #500 start = 1; //press button to stop
    #20 start = 0; //release button
    #200 start = 1; //press button to continue if current time les than 1 hour
    #5 start = 0; //release button
    #100

    // Test COUNTDOWN mode
    clock_mode = 2'b11;
    set_time = 0;
set = 0;
up = 0;
//reset = 1;

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

    // Finish the simulation
    $stop;
end 
endmodule