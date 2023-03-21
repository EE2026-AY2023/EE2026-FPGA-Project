module audio_input_task (
    input clock_20khz,
    input [11:0] MIC_in,
    output reg [8:0] led = 9'b000000000,
    output reg an0 = 1,
    output reg [3:0] audio_input_number
    );

    reg [31:0] count = 32'b00000000000000000000000000000000;
    reg [11:0] peak_value = 12'b000000000000;
    reg [11:0] current_value = 12'b000000000000;
    wire [3:0] volume_level;
    wire [8:0] LED; 
    wire AN0;
    wire [6:0] SEG;
    Volume_level unit_level(peak_value, volume_level);
    Update_display unit_display(volume_level, LED, AN0, SEG);
    
    always @ (posedge clock_20khz) //every 50ms
       begin
            current_value <= MIC_in;
            count <= count + 1;
            if(current_value > peak_value)
                peak_value <= current_value;
            if(count >= 4000) //every 4000 x 50ms = 0.2s
            begin
                //update LEDs & 7 segment display
                led <= LED;
                audio_input_number <= volume_level;
                an0 <= AN0;
                //reset count to zero
                count <= 32'b00000000000000000000000000000000;
                //reset peak_value back to zero
                peak_value <= 32'b00000000000000000000000000000000;
            end
       end

endmodule
