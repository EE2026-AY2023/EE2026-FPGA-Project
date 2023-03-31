`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 19:53:58
// Design Name: 
// Module Name: test_maze
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


module test_maze(
    input clock,
    input [15:0] sw,
    input btnC, btnD,btnU,btnL,btnR,
    
    //7-segment display
    output [3:0] an,
    output [6:0] seg,
    output dp,
    
    output [3:0] JB,
    
    //For audio input
    input JXADC3,
    output JXADC1, JXADC4,
    
   //For OLED display
    inout PS2Clk, PS2Data,
    output [15:0] led,
    output [7:0] JC,JA    
    );
    
    
    
    wire clk20k;
    wire clk50M;
    clock_freq clock_20kHz(clock, 2_500, clk20k);
    clock_freq clock_50MHz(clock, 1, clk50M);
    wire [11:0] audio_out;
    Audio_Output speaker(
        .CLK(clk50M), .START(clk20k), .DATA1(audio_out), .RST(0),
        .D1(JB[1]), .D2(JB[2]), .CLK_OUT(JB[3]), .nSYNC(JB[0])
        );
    
    wire clk6p25m;
    clk_div slow_clk6p25(clock,7, clk6p25m);
        
    wire [15:0] oled_data;
    wire frame_begin, sending_pixels, sample_pixel;
    wire [12:0] pixel_index;
    Oled_Display oled(
        .clk(clk6p25m), .reset(0), .frame_begin(frame_begin), .sending_pixels(sending_pixels),
        .sample_pixel(sample_pixel), .pixel_index(pixel_index), .pixel_data(oled_data), 
        .cs(JC[0]), .sdin(JC[1]), .sclk(JC[3]), .d_cn(JC[4]), .resn(JC[5]), .vccen(JC[6]), .pmoden(JC[7])
        );
        
    wire [6:0] oled_x, oled_y;
    oled_x_y_coord xy(pixel_index, oled_x, oled_y);
    maze_logic maze(clock, 4'b0010, oled_x,oled_y,
        btnU, btnR, btnD, btnL, btnC,
        oled_data, audio_out);

endmodule
