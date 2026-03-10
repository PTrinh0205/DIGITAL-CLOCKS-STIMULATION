`timescale 1ns / 1ps

module display(
    input wire [4:0] hours,
    input wire [5:0] minutes,
    input wire am_pm,
    output wire [6:0] hour1,
    output wire [6:0] hour0,
    output wire [6:0] min1,
    output wire [6:0] min0,
    output wire [6:0] ampm1,
    output wire [6:0] ampm0
);

// Intermediate wires for BCD conversion
wire [3:0] hour_tens;
wire [3:0] hour_units;
wire [3:0] min_tens;
wire [3:0] min_units;

// Convert hours and minutes to BCD
binary_to_bcd u_bcd (
    .binary_hours(hours),
    .binary_minutes(minutes),
    .hrs_tens(hour_tens),
    .hrs_ones(hour_units),
    .min_tens(min_tens),
    .min_ones(min_units)
);


// Connect to seven segment display for hours and minutes
seven_segment u_hour1 (.digit(hour_tens), .segments(hour1));
seven_segment u_hour0 (.digit(hour_units), .segments(hour0));
seven_segment u_min1 (.digit(min_tens), .segments(min1));
seven_segment u_min0 (.digit(min_units), .segments(min0));

// Connect to seven segment display for AM/PM 
assign ampm1 = (am_pm) ?  7'b0001100 : 7'b0001000; // P hoac A
assign ampm0 = 7'b1000000; // 0
endmodule
