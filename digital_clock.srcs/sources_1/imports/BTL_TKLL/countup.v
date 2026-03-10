module countup(
    input clk, //clk_10Hz
    input reset, //mode
    input click, // start counting
    output reg[3:0] sec_one, //units of seconds
    output reg[3:0] sec_ten, //ten digits of seconds
    output reg[3:0] min_one, //units of minutes
    output reg[3:0] min_ten, //ten digits of minutes
    output reg[3:0] hour_one, //units of hours
    output reg[3:0] hour_ten //ten degits of hours
    );

    reg stop;
    //reg[3:0] mili_sec;
    
    initial begin
        sec_one = 4'd0;
        sec_ten = 4'd0;
        min_one = 4'd0;
        min_ten = 4'd0;
        hour_one = 4'd0;
        hour_ten = 4'd0;
    end
    //count up to 01:00:00
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            sec_one <= 0;
            sec_ten <= 0;
            min_one <= 0;
            min_ten <= 0;
            hour_one <= 0;
            hour_ten <= 0;
            //mili_sec <= 0;
            stop <= 1;
        end else if (click & stop) begin
            if (sec_one == 9 && sec_ten < 5) begin 
                sec_one <= 0;
                sec_ten <= sec_ten +1;
                min_one <= min_one;
                min_ten <= min_ten;
                hour_one <= hour_one;
                hour_ten <= 0;
                end
            else //min + 1 when milisec = 9 & sec = 59 
            if (sec_one == 9 && min_one < 9) begin 

                sec_one <= 0;
                sec_ten <= 0;
                min_one <= min_one +1;
                min_ten <= min_ten;
                hour_one <= hour_one;
                hour_ten <= 0;
                end
            else          
            if (sec_one == 9 && min_ten < 5) begin
       
                sec_one <= 0;
                sec_ten <= 0;
                min_one <= 0;
                min_ten <= min_ten +1;
                hour_one <= hour_one;
                hour_ten <= 0;
                end
            else //hour + 1 when milisec = 9 & sec = 59 & min = 59 
            if (sec_one == 9 && hour_one < 1) begin 
              
                sec_one <= 0;
                sec_ten <= 0;
                min_one <= 0;
                min_ten <= 0;
                hour_one <= hour_one +1;
                hour_ten <= 0;
                end
            else // stop at 01:00:00
            if (hour_one == 1) begin 
       
                sec_one <= sec_one;
                sec_ten <= sec_ten;
                min_one <= min_one;
                min_ten <= min_ten;
                hour_one <= hour_one;
                hour_ten <= 0;
                stop <= 0;
                end
            else begin
                sec_one <= sec_one + 1;
         
                sec_ten <= sec_ten;
                min_one <= min_one;
                min_ten <= min_ten;
                hour_one <= hour_one;
                hour_ten <= 0;
                end
        end //stop counting when click = 0 or stop = 0
        else begin
    
            sec_one <= sec_one;
            sec_ten <= sec_ten;
            min_one <= min_one;
            min_ten <= min_ten;
            hour_one <= hour_one;
            hour_ten <= 0;
        end
   end
   
endmodule