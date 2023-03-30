module audio_input_improv( 
    input CLOCK,
    input [11:0] MIC_in,
    input SW,
    output reg [8:0] morse_LED = 9'b000000000,
    output reg an = 1,
    output reg [3:0] audio_input_number
    );
    
    reg [11:0] peak_value = 12'b000000000000;
    reg [11:0] current_value = 12'b000000000000;
    wire [3:0] volume_level;
    
    reg [18:0] morse = 19'b0000000000000000000; //value of input
    reg [31:0] morse_count = 32'b00000000000000000000000000000000;
    
    reg [31:0] count = 32'b00000000000000000000000000000000;
    
    Volume_level unit_level2(peak_value, volume_level);
    
    always @ (posedge CLOCK)
    begin
            current_value <= MIC_in;
            if(current_value > peak_value) begin
                peak_value <= current_value;
            end

        if(SW == 1)begin
            count <= count + 1;
            if(count >= 15000) begin
                count <= 32'b00000000000000000000000000000000;
                if(morse_count == 20) begin
                    morse_LED <= 9'b111111111;
                    if(morse == 19'b1110111011101110111)//display '0'     
                    begin
                        an <= 0;
                        //seg <= 7'b1111111;
                        audio_input_number <= 0;
                    end
                    else if(morse == 19'b0011101110111011101) //display '1' 
                    begin
                        an <= 0;  
                        //seg <= 7'b1111001;
                        audio_input_number <= 1;
                    end
                    else if(morse == 19'b0000111011101110101) //display '2'     
                    begin
                         an <= 0;
                         //seg <= 7'b0100100;
                         audio_input_number <= 2;
                    end
                    else if(morse == 19'b0000001110111010101) //display '3'     
                    begin
                         an <= 0;
                         //seg <= 7'b0110000;
                         audio_input_number <= 3;
                    end
                    else if(morse == 19'b0000000011101010101) //display '4' 
                    begin
                         an <= 0;
                         //seg <= 7'b0011001;
                         audio_input_number <= 4;
                    end  
                    else if(morse == 19'b0000000000101010101) //display '5' 
                    begin
                         an <= 0;
                         //seg <= 7'b0010010;
                         audio_input_number <= 5;
                    end  
                    else if(morse == 19'b0000000010101010111) //display '6' 
                    begin
                         an <= 0;
                         //seg <= 7'b0000010;
                         audio_input_number <= 6;
                    end  
                    else if(morse == 19'b0000001010101110111) //display '7' 
                    begin
                        an <= 0;
                        //seg <= 7'b1111000;
                        audio_input_number <= 7;
                    end  
                    else if(morse == 19'b0000101011101110111) //display '8' 
                    begin
                         an <= 0;
                         //seg <= 7'b0000000;
                         audio_input_number <= 8;
                    end  
                    else if(morse == 19'b0010111011101110111) //display '9' 
                    begin
                         an <= 0;
                         //seg <= 7'b0010000;
                         audio_input_number <= 9;
                    end
                    else if(morse == 19'b1111111111111111111) //for constant sound input, display "upper bar"
                    begin
                        an <= 0;
                        //seg <= 7'b1111110;
                        audio_input_number <= 12;
                    end
                    else if(morse == 19'b0000000000000000000) //for no sound input, display "lower bar"
                    begin
                        an <= 0;
                        //seg <= 7'b1110111;
                        audio_input_number <= 10;
                    end
                    else begin //everything else (random inputs), display "middle bar"
                        an <= 0;
                        //seg <= 7'b0111111;
                        audio_input_number <= 11;
                    end
                end    
                else begin
                    if(morse_count == 0) begin
                        morse_LED <= 9'b000000000;
                        morse <= 19'b0000000000000000000;
                        
                    end
                    else if(morse_count == 1) begin
                        morse_LED <= 9'b000000001;
                        if(volume_level >= 2) begin
                            morse[0] <= 1;
                        end
                        else begin
                            morse[0] <= 0;
                        end
                    end
                    else if(morse_count == 2) begin
                        morse_LED <= 9'b000000010;
                        if(volume_level >= 2) begin
                            morse[1] <= 1;
                        end
                        else begin
                            morse[1] <= 0;
                        end
                    end
                    else if(morse_count == 3) begin
                        morse_LED <= 9'b000000011;
                        if(volume_level >= 2) begin
                            morse[2] <= 1;
                        end
                        else begin
                            morse[2] <= 0;
                        end
                    end
                    else if(morse_count == 4) begin
                        morse_LED <= 9'b000000100;
                        if(volume_level >= 2) begin
                            morse[3] <= 1;
                        end
                        else begin
                            morse[3] <= 0;
                        end
                    end
                    else if(morse_count == 5) begin
                        morse_LED <= 9'b000000101;
                        if(volume_level >= 2) begin
                            morse[4] <= 1;
                        end
                        else begin
                            morse[4] <= 0;
                        end
                    end
                    else if(morse_count == 6) begin
                        morse_LED <= 9'b000000110;
                        if(volume_level >= 2) begin
                            morse[5] <= 1;
                        end
                        else begin
                            morse[5] <= 0;
                        end
                    end
                    else if(morse_count == 7) begin
                        morse_LED <= 9'b000000111;
                        if(volume_level >= 2) begin
                            morse[6] <= 1;
                        end
                        else begin
                            morse[6] <= 0;
                        end
                    end
                    else if(morse_count == 8) begin
                        morse_LED <= 9'b000001000;
                        if(volume_level >= 2) begin
                            morse[7] <= 1;
                        end
                        else begin
                            morse[7] <= 0;
                        end
                    end
                    else if(morse_count == 9) begin
                        morse_LED <= 9'b000001001;
                        if(volume_level >= 2) begin
                            morse[8] <= 1;
                        end
                        else begin
                            morse[8] <= 0;
                        end
                    end
                    else if(morse_count == 10) begin
                        morse_LED <= 9'b000001010;
                        if(volume_level >= 2) begin
                            morse[9] <= 1;
                        end                        
                        else begin
                            morse[9] <= 0;
                        end
                    end
                    else if(morse_count == 11) begin
                        morse_LED <= 9'b000001011;
                        if(volume_level >= 2) begin
                            morse[10] <= 1;
                        end
                        else begin
                            morse[10] <= 0;
                        end
                    end
                    else if(morse_count == 12) begin
                        morse_LED <= 9'b000001100;
                        if(volume_level >= 2) begin
                            morse[11] <= 1;
                        end
                        else begin
                            morse[11] <= 0;
                        end
                    end
                    else if(morse_count == 13) begin
                        morse_LED <= 9'b000001101;
                        if(volume_level >= 2) begin
                            morse[12] <= 1;
                        end
                        else begin
                            morse[12] <= 0;
                        end
                    end
                    else if(morse_count == 14) begin
                        morse_LED <= 9'b000001110;
                        if(volume_level >= 2) begin
                            morse[13] <= 1;
                        end
                        else begin
                            morse[13] <= 0;
                        end
                    end
                    else if(morse_count == 15) begin
                        morse_LED <= 9'b000001111;
                        if(volume_level >= 2) begin
                            morse[14] <= 1;
                        end
                        else begin
                            morse[14] <= 0;
                        end
                    end
                    else if(morse_count == 16) begin
                        morse_LED <= 9'b000010000;
                        if(volume_level >= 2) begin
                            morse[15] <= 1;
                        end
                        else begin
                            morse[15] <= 0;
                        end
                    end
                    else if(morse_count == 17) begin
                        morse_LED <= 9'b000010001;
                        if(volume_level >= 2) begin
                            morse[16] <= 1;
                        end
                        else begin
                            morse[16] <= 0;
                        end
                    end
                    else if(morse_count == 18) begin
                        morse_LED <= 9'b000010010;
                        if(volume_level >= 2) begin
                            morse[17] <= 1;
                        end
                        else begin
                            morse[17] <= 0;
                        end
                    end
                    else if(morse_count == 19) begin
                        morse_LED <= 9'b000010011;
                        if(volume_level >= 2) begin
                            morse[18] <= 1;
                        end
                        else begin
                            morse[18] <= 0;
                        end
                    end
                    morse_count <= morse_count + 1;
                    peak_value <= 12'b000000000000;
                end
            end
        end
        else begin //set everything back to zero when the switch is turned off
            morse_count <= 0;
            count <= 0;
            an <= 1;
            morse_LED <= 9'b000000000;
        end
    end
endmodule
