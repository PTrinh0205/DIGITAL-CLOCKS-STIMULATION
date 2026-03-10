`timescale 1ns / 1ps

module bin_to_bcd_down_tb;
    // Inputs
    reg [4:0] binary_hours;
    reg [5:0] binary_minutes;
    reg [5:0] binary_seconds;

    // Outputs
    wire [3:0] hrs_tens;
    wire [3:0] hrs_ones;
    wire [3:0] min_tens;
    wire [3:0] min_ones;
    wire [3:0] sec_tens;
    wire [3:0] sec_ones;

    // Instantiate the module to be tested
    binary_to_bcd_down uut (
        .binary_hours(binary_hours),
        .binary_minutes(binary_minutes),
        .binary_seconds(binary_seconds),
        .hrs_tens(hrs_tens),
        .hrs_ones(hrs_ones),
        .min_tens(min_tens),
        .min_ones(min_ones),
        .sec_tens(sec_tens),
        .sec_ones(sec_ones)
    );

    // Test stimulus
    initial begin
        // Initialize inputs
        binary_hours = 5'd0;
        binary_minutes = 6'd0;
        binary_seconds = 6'd0;
        
        // Apply test cases
        #10 binary_hours = 5'd12; binary_minutes = 6'd34; binary_seconds = 6'd56;
        #10 binary_hours = 5'd7; binary_minutes = 6'd45; binary_seconds = 6'd23;
        #10 binary_hours = 5'd9; binary_minutes = 6'd59; binary_seconds = 6'd59;
        #10 binary_hours = 5'd3; binary_minutes = 6'd15; binary_seconds = 6'd5;
        #10 binary_hours = 5'd11; binary_minutes = 6'd29; binary_seconds = 6'd48;
        
        // End simulation
        #10 $stop;
    end
    
endmodule
