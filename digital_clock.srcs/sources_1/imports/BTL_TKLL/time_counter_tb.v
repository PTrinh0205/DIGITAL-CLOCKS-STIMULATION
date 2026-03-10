`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2024 05:47:11 PM
// Design Name: 
// Module Name: time_counter_tb
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


module time_counter_tb;
// Declare signals
    reg clk;                    // Input clock
    
    reg set_time;               // Set_Time button
    reg set;                    // Set button
    reg up;                     // Increment button
    wire [4:0] hours;           // Output hours (0-23)
    wire [5:0] minutes;         // Output minutes (0-59)
    wire am_pm;                 // AM/PM indicator

    // Instantiate the module
    time_counter dut (
        .clk(clk),
        
        .set_time(set_time),
        .set(set),
        .up(up),
        .hours(hours),
        .minutes(minutes),
        .am_pm(am_pm)
    );

    // Initialize default value of clk = 0
    reg clk = 0;

    // Generate clock signal with a period of 1 second
    always #500_000_000 clk = ~clk;

    // Assign initial values
    initial begin
        
        set_time = 1'b0; // Do not activate set_time
        set = 1'b0; // Do not activate set
        clk = 0; // Set clk to 0
        up = 0; // Set up to 0
        
        // Test case 1: Increment hours
        #20 set_time = 0; set = 1; up = 1;
        #20 up = 0;
        #20 up = 1;
        #20 up = 0;
    
        // Test case 2: Increment minutes
        #20 set_time = 1; set = 0; up = 1;
        #20 up = 0;
        #20 up = 1;
        #20 up = 0;
    
        // Test case 3: Toggle AM/PM
        #20 set_time = 1; set = 1; up = 1;
        #20 up = 0;
        #20 up = 1;
        #20 up = 0;

        // Check hour wrapping and AM/PM toggle
        // Increment hours to 11 and check AM/PM
        repeat (13) begin
            #20 set_time = 0; set = 1; up = 1;
            #20 up = 0;
        end
    
        // Increment minutes to 59 and check AM/PM
        repeat (60) begin
            #20 set_time = 1; set = 0; up = 1;
            #20 up = 0;
        end
    
        // End simulation
        #1000000 $stop;
    end
endmodule
