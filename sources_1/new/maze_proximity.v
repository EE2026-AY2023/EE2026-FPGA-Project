`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 22:05:16
// Design Name: 
// Module Name: maze_proximity
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


module maze_proximity(
    input clk100M,
    input [4:0] position, target,
    output [11:0] audio_out
    //output reg [11:0] audio_out = 0
    );
    
    wire [2:0] x1, x2;
    wire [1:0] y1, y2;
    get_coordinate get_coordinate_position(position, x1, y1);
    get_coordinate get_coordinate_target(target, x2, y2);
    
    wire [2:0] diff_x;
    wire [1:0] diff_y;
    assign diff_x = (x1 > x2) ? (x1 - x2) : (x2 - x1);
    assign diff_y = (y1 > y2) ? (y1 - y2) : (y2 - y1);
    
    wire [2:0] distance = diff_x + diff_y;
    
    wire clk1kHz;
    clock_freq clock_1kHz(clk100M, 50_000, clk1kHz);
    wire [11:0] beep_signal;
    beep_freq beep_1kHz(clk1kHz, beep_signal);
    
//    reg beep_start;
//    reg signal;
//    timer_duration beep(beep_start, clk100M, limit, sound_on);
    
    reg [31:0] limit = 2_000_000_000;
    reg [31:0] count = 0;
    
    always @ (distance) begin
        //change counter freq depending on distance
        case (distance)
            0 : limit <= 5_000_000;
            1 : limit <= 10_000_000;
            2 : limit <= 25_000_000;
            3 : limit <= 50_000_000;
            4 : limit <= 100_000_000;
            5 : limit <= 250_000_000;
            6 : limit <= 500_000_000;
            7 : limit <= 1_000_000_000;
            default : limit <= 2_000_000_000;
        endcase
    end
    
    reg clk_beep = 0;
    
    reg sound_on = 0;
    
    always @ (posedge clk100M) begin
        if(sound_on == 0) begin
        if(count >= limit) begin
            count <= 0;
            clk_beep <= ~clk_beep;
            sound_on = 1;
        end
        else
            count <= count + 1;
        end
        else begin
            if(count == 10_000_000) begin
                count <= 0;
                sound_on = 0;
            end
            else 
                count <= count + 1;
        end
    end
    
    assign audio_out = (sound_on == 1) ? beep_signal : 0;
    
//    always @ (posedge clk_beep) begin
//        audio_out = beep_signal; #100_000_000;
//        audio_out = 0;
//    end
    
endmodule
