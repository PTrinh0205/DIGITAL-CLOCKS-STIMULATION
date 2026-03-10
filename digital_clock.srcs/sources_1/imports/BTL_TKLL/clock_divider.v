`timescale 1ns / 1ps

module clock_divider(
    input wire clk,       // Clock input
    input wire reset,     // Reset input
    output reg clk_out    // Divided clock output
);
// Internal counter for dividing the clock
integer counter; 
// Parameter to set the threshold for clock division
parameter THRESHOLD = 125_000_000; 

always @(posedge clk or posedge reset) begin
    // Check for reset condition
    if (reset == 1'b1) begin   
        // Reset counter and clock output
        counter <= 0;
        clk_out <= 1'b0;
    end
    
    else begin
        // Check if counter has reached half of the threshold
        if (counter == THRESHOLD/2 - 1) begin  
            // Reset counter and toggle clock output
            counter <= 0;
            clk_out <= ~clk_out; 
        end
        else begin
            // Increment counter
            counter <= counter + 1;  
        end
    end
end

endmodule
