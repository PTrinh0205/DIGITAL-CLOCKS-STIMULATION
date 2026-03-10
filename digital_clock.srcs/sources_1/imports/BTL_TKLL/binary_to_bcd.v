`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2024 05:28:11 PM
// Design Name: 
// Module Name: binary_to_bcd
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

module binary_to_bcd(
    input  [4:0] binary_hours,  // Max value 12
    input [5:0] binary_minutes, // Max value 59
    output reg [3:0] hrs_tens,  // Represent tens place of hours
    output reg [3:0] hrs_ones,  // Represent ones place of hours
    output reg [3:0] min_tens,  // Represent tens place of minutes
    output reg [3:0] min_ones   // Represent ones place of minutes
);

reg [4:0] binary;

initial begin
    binary = 5'd0;

    hrs_ones = 0;
    hrs_tens = 0;
    min_tens = 0;
    min_ones = 0;
end

always @(*) begin
    // Adjust for 12-hour clock format
    if (binary_hours == 5'd0)
        binary = 5'd12; // Convert 0h to 12h
    else if (binary_hours > 5'd12)
        binary = binary_hours - 5'd12; // Adjust hours greater than 12
    else
        binary = binary_hours; // Otherwise, use the binary_hours value directly

    // Convert hours for display
    hrs_tens = binary / 10;
    hrs_ones = binary % 10;

    // Convert minutes for display
    min_tens = binary_minutes / 10;
    min_ones = binary_minutes % 10;
end

endmodule
