`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2024 05:22:39 PM
// Design Name: 
// Module Name: set_time_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module set_time_module(
    input wire clk,           // Clock input
    input wire set_time,      // Set_time button
    input wire set,           // Set button
    input wire up,            // Up button
    output wire [6:0] hour1,  // Display tens place of hours
    output wire [6:0] hour0,  // Display ones place of hours
    output wire [6:0] min1,   // Display tens place of minutes
    output wire [6:0] min0,   // Display ones place of minutes
    output wire [6:0] ampm1,  // First character of AM/PM
    output wire [6:0] ampm0   // Second character of AM/PM
);

// Declare signals
wire [4:0] hours;
wire [5:0] minutes;
wire am_pm;


// Time counter connection
time_counter u_time_counter (
    .clk(clk),
    .set_time(set_time),
    .set(set),
    .up(up),
    .hours(hours),
    .minutes(minutes),
    .am_pm(am_pm)
);

// Display controller connection
display u_display (
    .hours(hours),
    .minutes(minutes),
    .am_pm(am_pm),
    .hour1(hour1),
    .hour0(hour0),
    .min1(min1),
    .min0(min0),
    .ampm1(ampm1),
    .ampm0(ampm0)
);

endmodule