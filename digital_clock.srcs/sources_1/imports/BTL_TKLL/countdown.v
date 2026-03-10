`timescale 1ns / 1ps

module countdown(
    input wire clk,            // Clock input
    input wire set_time,       // SetTime button
    input wire set,            // Set button
    input wire up,             // Up button
    input wire reset,
    output wire [6:0] hour_1,   // Display hours tens
    output wire [6:0] hour_0,   // Display hours units
    output wire [6:0] min_1,    // Display minutes tens
    output wire [6:0] min_0,    // Display minutes units
    output wire [6:0] sec_1,    // Display seconds tens
    output wire [6:0] sec_0     // Display seconds units
);

// Intermediate signals
wire divided_clk;
wire [4:0] hours;
wire [5:0] minutes;
wire [5:0] seconds;

parameter CLK_DIVIDER = 125_000_000;
// Clock divider instantiation
clock_divider #(CLK_DIVIDER) down_clk_div ( // using parameter = 4 for easy testing with testbench
    .clk(clk),
    .reset(reset),
    .clk_out(divided_clk)
);

// Time countdown module instantiation
time_countdown down_time (
    .clk(divided_clk),
    .set_time(set_time),
    .set(set),
    .up(up),
    .hours(hours),
    .minutes(minutes),
    .seconds(seconds)
);

// Display countdown module instantiation
display_countdown down_display (
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

endmodule
