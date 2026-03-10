module stopwatch(
    input clk, //125MHz
    input stopwatch_button, //(clock_mode[1] & ~clock_mode[0])
    input start,
    input reset_clk,
    output wire [6:0] led_0,
    output wire [6:0] led_1,
    output wire [6:0] led_2, 
    output wire [6:0] led_3,
    output wire [6:0] led_4,
    output wire [6:0] led_5,
    output wire clkdiv
    );
    
    wire clk_10Hz;
    parameter CLK_DIVIDER = 12_500_000;
    //clock_divider 10Hz
    clock_divider #(CLK_DIVIDER) clk_div(.clk(clk),.reset(reset_clk),.clk_out(clk_10Hz));
    assign clkdiv = clk_10Hz;
    //Intermediate wire for BCD conversion
    wire[3:0] sec_one;
    wire[3:0] sec_ten;
    wire[3:0] min_one;
    wire[3:0] min_ten;
    wire[3:0] hour_one;
    wire[3:0] hour_ten;

    
   //start/stop controller 
    reg store_start;
    reg click;
    reg reset;
    reg store_sw_btn;
    
    always @(posedge clk) begin
        if (stopwatch_button) begin
            store_sw_btn <= stopwatch_button;           
            if (stopwatch_button & ~store_sw_btn) begin
                reset <= 1;
                store_start <= 0;
                click <= 0;
                end
            else begin
                reset <= 0;
                store_start <= start;
                click <= (start & ~store_start)^click;
            end
        end else begin
            store_sw_btn <= 0;
            reset <= 0;
            store_start <= 0;
            click <= 0;
        end
    end
    
     
   //countup
   countup stopwatch_01(.clk(clk_10Hz),
                        .reset(reset),
                        .click(click),
                        .sec_one(sec_one),
                        .sec_ten(sec_ten),
                        .min_one(min_one),
                        .min_ten(min_ten),
                        .hour_one(hour_one),
                        .hour_ten(hour_ten));
   
   //display
   display_stopwatch stopwatch_02(.sec_one(sec_one),
                                  .sec_ten(sec_ten),
                                  .min_one(min_one),
                                  .min_ten(min_ten),
                                  .hour_one(hour_one),
                                  .hour_ten(hour_ten),
                                  .led_0(led_0),
                                  .led_1(led_1),
                                  .led_2(led_2),
                                  .led_3(led_3),
                                  .led_4(led_4),
                                  .led_5(led_5));

endmodule