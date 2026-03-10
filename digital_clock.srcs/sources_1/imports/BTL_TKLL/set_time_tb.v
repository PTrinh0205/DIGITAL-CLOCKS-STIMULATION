`timescale 1ns / 1ps

module set_time_tb;
// Declare inputs
    reg clk;
    reg set_time;
    reg set;
    reg up;
    
    // Declare outputs
    wire [6:0] hour1;
    wire [6:0] hour0;
    wire [6:0] min1;
    wire [6:0] min0;
    wire [6:0] ampm1;
    wire [6:0] ampm0;
    
   // parameter MINS = 6'd59;
   // parameter HOURS = 5'd12;
    // Instantiate the top module
    set_time_module dut (
        .clk(clk),
        .set_time(set_time),
        .set(set), 
        .up(up),              
        .hour1(hour1),
        .hour0(hour0),
        .min1(min1),
        .min0(min0),
        .ampm1(ampm1),
        .ampm0(ampm0)
    );
    
    // Generate clock with a period of 1 second
    always #500_000_000 clk = ~clk;
    
    // Assign initial values
    initial begin
        clk = 0;
  
        set_time = 1'b0; // Do not activate set_time
        set = 1'b0; // Do not activate set
        up = 0; // Do not activate up
    
        // Control set_time, set, and up
        
        // Adjust hours
        #10 set_time = 1'b0;
        #10 set = 1'b1; up = 1'b0;
        #20 set = 1'b1; up = 1'b1;
        #10 set = 1'b1; up = 1'b0;
        
        // Adjust minutes
        #10 set_time = 1'b1;
        #10 set = 1'b0; up = 1'b0;
        #20 set = 1'b0; up = 1'b1;
        #10 set = 1'b0; up = 1'b0;
        #20 set = 1'b0; up = 1'b1;
        #10 set = 1'b0; up = 1'b0;
        
        // Toggle AM/PM
        #10 set_time = 1'b1;
        #10 set = 1'b1; up = 1'b0;
        #20 set = 1'b1; up = 1'b1;
        #10 set = 1'b1; up = 1'b0;
        #20 set = 1'b1; up = 1'b1;
        #10 set = 1'b1; up = 1'b0;
        // End simulation
        #20 $stop;
    end
endmodule

