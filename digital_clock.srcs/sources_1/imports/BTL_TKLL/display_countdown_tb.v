`timescale 1ns / 1ps

module display_countdown_tb;
    // Inputs
    reg [4:0] hours;
    reg [5:0] minutes;
    reg [5:0] seconds;

    // Outputs
    wire [6:0] hour_1;
    wire [6:0] hour_0;
    wire [6:0] min_1;
    wire [6:0] min_0;
    wire [6:0] sec_1;
    wire [6:0] sec_0;

    // Instantiate the module under test
    display_countdown uut (
        .hours(hours),
        .minutes(minutes),
        .seconds(seconds),
        .hour_1(hour_1),
        .hour_0(hour_0),
        .min_1(min_1),
        .min_0(min_0),
        .sec_1(sec_1),
        .sec_0(sec_0)
    );

    // Test stimulus
    initial begin
        // Initialize inputs
        hours = 5'd0;
        minutes = 6'd0;
        seconds = 6'd0;

        // Apply test cases
        #10 hours = 5'd12; minutes = 6'd34; seconds = 6'd56;
        #10 hours = 5'd7; minutes = 6'd45; seconds = 6'd23;
        #10 hours = 5'd9; minutes = 6'd59; seconds = 6'd59;
        #10 hours = 5'd3; minutes = 6'd15; seconds = 6'd5;
        #10 hours = 5'd11; minutes = 6'd29; seconds = 6'd48;

        // End simulation
        #10 $stop;
    end
endmodule
