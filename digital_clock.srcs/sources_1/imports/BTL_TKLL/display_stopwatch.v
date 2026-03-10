
module display_stopwatch(
    input wire[3:0] sec_one, //units of seconds
    input wire[3:0] sec_ten, //ten digits of seconds
    input wire[3:0] min_one, //units of minutes
    input wire[3:0] min_ten, //ten digits of minutes
    input wire[3:0] hour_one, //units of hours
    input wire[3:0] hour_ten,//ten digits of hours
    output wire [6:0] led_0, led_1, led_2, led_3, led_4, led_5
    );
    
   //connect to led   
   seven_segment sw_led_0(.digit(sec_one),.segments(led_0));
   seven_segment sw_led_1(.digit(sec_ten),.segments(led_1));
   seven_segment sw_led_2(.digit(min_one),.segments(led_2));
   seven_segment sw_led_3(.digit(min_ten),.segments(led_3));
   seven_segment sw_led_4(.digit(hour_one),.segments(led_4));
   seven_segment sw_led_5(.digit(hour_ten),.segments(led_5));
   
endmodule
