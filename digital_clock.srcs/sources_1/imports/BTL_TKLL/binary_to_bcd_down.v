`timescale 1ns / 1ps

module binary_to_bcd_down(
    input [4:0] binary_hours,     // Input binary hours (5 bits)
    input [5:0] binary_minutes,   // Input binary minutes (6 bits)
    input [5:0] binary_seconds,   // Input binary seconds (6 bits)
    output reg [3:0] hrs_tens,    // Output BCD tens place for hours (4 bits)
    output reg [3:0] hrs_ones,    // Output BCD ones place for hours (4 bits)
    output reg [3:0] min_tens,    // Output BCD tens place for minutes (4 bits)
    output reg [3:0] min_ones,    // Output BCD ones place for minutes (4 bits)
    output reg [3:0] sec_tens,    // Output BCD tens place for seconds (4 bits)
    output reg [3:0] sec_ones     // Output BCD ones place for seconds (4 bits)
);

    always @(*) begin
        // Convert binary hours to BCD
        hrs_tens = binary_hours / 10;  // Tens place of hours
        hrs_ones = binary_hours % 10;  // Ones place of hours

        // Convert binary minutes to BCD
        min_tens = binary_minutes / 10; // Tens place of minutes
        min_ones = binary_minutes % 10; // Ones place of minutes

        // Convert binary seconds to BCD
        sec_tens = binary_seconds / 10; // Tens place of seconds
        sec_ones = binary_seconds % 10; // Ones place of seconds
    end

endmodule
