`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2024 08:08:59 PM
// Design Name: 
// Module Name: countup_tb
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


module count_up_tb;
    reg clk, reset, start;
    wire [3:0] hours;
    wire [5:0] mins;
    wire [5:0] secs;
    wire [3:0]milisec;
    //wire [3:0] sec_one, sec_ten, min_one, min_ten, hour_one, hour_ten;
    
    //count_up uut(clk,reset,start,sec_one, sec_ten, min_one, min_ten, hour_one, hour_ten);
    countup uut(clk,reset,start,hours,mins,secs,milisec);
    initial begin
    clk = 0;
    forever #2 clk = ~clk;
    end
    initial begin
        reset <= 1;
        start <= 0;
        #4 reset <=0;
        #2 start <= 1;
        #1 start <= 0;
        #20_000 start <= 1;
        #8 $stop;
    end
endmodule
