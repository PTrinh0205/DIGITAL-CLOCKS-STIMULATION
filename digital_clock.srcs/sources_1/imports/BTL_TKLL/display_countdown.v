`timescale 1ns / 1ps

module display_countdown(
    input wire [4:0] hours,          // Input for hours (5 bits)
    input wire [5:0] minutes,        // Input for minutes (6 bits)
    input wire [5:0] seconds,        // Input for seconds (6 bits)
    output wire [6:0] hour_1,        // Output for tens place of hours (7 segments)
    output wire [6:0] hour_0,        // Output for ones place of hours (7 segments)
    output wire [6:0] min_1,         // Output for tens place of minutes (7 segments)
    output wire [6:0] min_0,         // Output for ones place of minutes (7 segments)
    output wire [6:0] sec_1,         // Output for tens place of seconds (7 segments)
    output wire [6:0] sec_0          // Output for ones place of seconds (7 segments)
);

    // Intermediate wires for BCD conversion
    wire [3:0] hour_tens;   // Tens place of hours in BCD
    wire [3:0] hour_units;  // Ones place of hours in BCD
    wire [3:0] min_tens;    // Tens place of minutes in BCD
    wire [3:0] min_units;   // Ones place of minutes in BCD
    wire [3:0] sec_tens;    // Tens place of seconds in BCD
    wire [3:0] sec_units;   // Ones place of seconds in BCD

    // Convert hours, minutes, seconds from binary to BCD
    binary_to_bcd_down down_bcd (
        .binary_hours(hours),
        .binary_minutes(minutes),
        .binary_seconds(seconds),
        .hrs_tens(hour_tens),
        .hrs_ones(hour_units),
        .min_tens(min_tens),
        .min_ones(min_units),
        .sec_tens(sec_tens),
        .sec_ones(sec_units)
    );

    // Connect BCD outputs to seven-segment decoders
    seven_segment down_hour_1 (.digit(hour_tens), .segments(hour_1));
    seven_segment down_hour_0 (.digit(hour_units), .segments(hour_0));
    seven_segment down_min_1 (.digit(min_tens), .segments(min_1));
    seven_segment down_min_0 (.digit(min_units), .segments(min_0));
    seven_segment down_sec_1 (.digit(sec_tens), .segments(sec_1));
    seven_segment down_sec_0 (.digit(sec_units), .segments(sec_0));

endmodule
