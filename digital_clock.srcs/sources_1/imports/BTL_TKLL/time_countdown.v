`timescale 1ns / 1ps

module time_countdown(
    input wire clk,            // Clock input
    input wire set_time,       // SetTime button
    input wire set,            // Set button
    input wire up,             // Up button
    output reg [4:0] hours,    // Hours
    output reg [5:0] minutes,  // Minutes
    output reg [5:0] seconds   // Seconds
);

reg counting;            // Counting

initial begin
    hours = 5'd0;   
    minutes = 6'd0; 
    seconds = 6'd0; 
    counting = 0;
end

// Setting time logic
always @(posedge up) begin
    //if (!counting) begin
        if (counting == 1'b0 && set_time == 1'b0 && set == 1'b1) begin
            // Adjust hours when setTime = 0 and set = 1
            if (hours == 5'd23) begin
                hours <= 5'd0;
            end else begin
                hours <= hours + 1;
            end
        end
        else if (counting == 1'b0 && set_time == 1'b1 && set == 1'b0) begin
            // Adjust minutes when setTime = 1 and set = 0
            if (minutes == 6'd59) begin
                minutes <= 6'd0;
            end else begin
                minutes <= minutes + 1;
            end
        end 
        else if (counting == 1'b0 && set_time == 1'b1 && set == 1'b1) begin
            // Adjust seconds when setTime = 1 and set = 1
            if (seconds == 6'd59) begin
                seconds <= 6'd0;
            end else begin
                seconds <= seconds + 1;
            end
        end
        else begin
        //
        end 
        
end

// Countdown logic
always @(posedge clk) begin
    if (counting) begin
        if (seconds == 6'd0) begin
            if (minutes == 6'd0) begin
                if (hours == 5'd0) begin
                    counting <= 0;  // Stop counting
                end else begin
                    hours <= hours - 1;
                    minutes <= 6'd59;
                    seconds <= 6'd59;
                end
            end else begin
                minutes <= minutes - 1;
                seconds <= 6'd59;
            end
        end else begin
            seconds <= seconds - 1;
        end
    end
end

// Start/stop logic for the countdown
always @(posedge set_time or posedge set or posedge up) begin
    if (set_time || set) begin
        counting <= 0;  // Stop counting when setTime or set is active
    end else if (!set_time && !set && up) begin
        counting <= ~counting;  // Toggle counting on up button press
    end
end

endmodule
