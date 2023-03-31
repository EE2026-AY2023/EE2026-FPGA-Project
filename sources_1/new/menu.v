`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2023 13:17:53
// Design Name: 
// Module Name: menu
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

//digits inspiration credits: https://www.pinterest.ca/pin/16114511158064542/
module menu(
    input clock, btnU, btnD, btnL, btnR,sw,
    input [6:0] x,y,
    output reg [15:0] oled_data = 0,
    output reg [3:0] state = 0
    );
    reg [11:0] alpha [27:0][19:0];
    reg [4:0] disp [8:0]; 
    
    wire clk_rand;
    clk_div slow_clk_rand(clock,10_000_000, clk_rand);
    wire [4:0] rand_disp [7:0]; 
    lfsr lfsr_r0(clk_rand,0,rand_disp[0],1);
    lfsr lfsr_r1(clk_rand,0,rand_disp[1],2);
    lfsr lfsr_r2(clk_rand,0,rand_disp[2],3);
    lfsr lfsr_r3(clk_rand,0,rand_disp[3],4);
    lfsr lfsr_r4(clk_rand,0,rand_disp[4],5);
    lfsr lfsr_r5(clk_rand,0,rand_disp[5],6);
    lfsr lfsr_r6(clk_rand,0,rand_disp[6],7);
    lfsr lfsr_r7(clk_rand,0,rand_disp[7],8);
//    wire [4:0] r0;
//    lfsr lfsr_r0(clk_rand,0,r0,1);
//    assign rand_disp[0] = r0;
//    wire [4:0] r1;
//    lfsr lfsr_r1(clk_rand,0,r1,2);
//    assign rand_disp[1] = r1;
//    wire [4:0] r2;
//    lfsr lfsr_r2(clk_rand,0,r2,3);
//    assign rand_disp[2] = r2;
//    wire [4:0] r3;
//    lfsr lfsr_r3(clk_rand,0,r3,4);
//    assign rand_disp[3] = r3;
//    wire [4:0] r4;
//    lfsr lfsr_r4(clk_rand,0,r4,5);
//    assign rand_disp[4] = r4;
//    wire [4:0] r5;
//    lfsr lfsr_r5(clk_rand,0,r5,6);
//    assign rand_disp[5] = r5;
//    wire [4:0] r6;
//    lfsr lfsr_r6(clk_rand,0,r6,7);
//    assign rand_disp[6] = r6;
//    wire [4:0] r7;
//    lfsr lfsr_r7(clk_rand,0,r7,8);
//    assign rand_disp[7] = r7;
    initial begin
        disp[0] = 1;disp[1] = 1;disp[2] = 1;disp[3] = 17;disp[4] = 22;disp[5] = 16;disp[6] = 19;disp[7] = 8;
        alpha[2][0]  = 12'b000000000000;
        alpha[2][1]  = 12'b000111111000;
        alpha[2][2]  = 12'b000111111000;
        alpha[2][3]  = 12'b011111111110;
        alpha[2][4]  = 12'b011111111110;
        alpha[2][5]  = 12'b011110011110;
        alpha[2][6]  = 12'b011110011110;
        alpha[2][7]  = 12'b011110011110;
        alpha[2][8]  = 12'b011110011110;
        alpha[2][9]  = 12'b011110011110;
        alpha[2][10] = 12'b011110011110;
        alpha[2][11] = 12'b011111111110;
        alpha[2][12] = 12'b011111111110;
        alpha[2][13] = 12'b011110011110;
        alpha[2][14] = 12'b011110011110;
        alpha[2][15] = 12'b011110011110;
        alpha[2][16] = 12'b011110011110;
        alpha[2][17] = 12'b011110011110;
        alpha[2][18] = 12'b011110011110;
        alpha[2][19] = 12'b000000000000;
        alpha[3][0]  = 12'b000000000000;
        alpha[3][1]  = 12'b011111111000;
        alpha[3][2]  = 12'b011111111000;
        alpha[3][3]  = 12'b011110000110;
        alpha[3][4]  = 12'b011110000110;
        alpha[3][5]  = 12'b011110000110;
        alpha[3][6]  = 12'b011110000110;
        alpha[3][7]  = 12'b011110000110;
        alpha[3][8]  = 12'b011110000110;
        alpha[3][9]  = 12'b011111111110;
        alpha[3][10] = 12'b011111111110;
        alpha[3][11] = 12'b011110000110;
        alpha[3][12] = 12'b011110000110;
        alpha[3][13] = 12'b011110000110;
        alpha[3][14] = 12'b011110000110;
        alpha[3][15] = 12'b011110000110;
        alpha[3][16] = 12'b011110000110;
        alpha[3][17] = 12'b011111111000;
        alpha[3][18] = 12'b011111111000;
        alpha[3][19] = 12'b000000000000;
        alpha[4][0]  = 12'b000000000000;
        alpha[4][1]  = 12'b000111111000;
        alpha[4][2]  = 12'b000111111000;
        alpha[4][3]  = 12'b011110011110;
        alpha[4][4]  = 12'b011110011110;
        alpha[4][5]  = 12'b011110000000;
        alpha[4][6]  = 12'b011110000000;
        alpha[4][7]  = 12'b011110000000;
        alpha[4][8]  = 12'b011110000000;
        alpha[4][9]  = 12'b011110000000;
        alpha[4][10] = 12'b011110000000;
        alpha[4][11] = 12'b011110000000;
        alpha[4][12] = 12'b011110000000;
        alpha[4][13] = 12'b011110000000;
        alpha[4][14] = 12'b011110000000;
        alpha[4][15] = 12'b011110011110;
        alpha[4][16] = 12'b011110011110;
        alpha[4][17] = 12'b000111111000;
        alpha[4][18] = 12'b000111111000;
        alpha[4][19] = 12'b000000000000;
        alpha[5][0]  = 12'b000000000000;
        alpha[5][1]  = 12'b011111111000;
        alpha[5][2]  = 12'b011111111000;
        alpha[5][3]  = 12'b011110000110;
        alpha[5][4]  = 12'b011110000110;
        alpha[5][5]  = 12'b011110000110;
        alpha[5][6]  = 12'b011110000110;
        alpha[5][7]  = 12'b011110000110;
        alpha[5][8]  = 12'b011110000110;
        alpha[5][9]  = 12'b011110000110;
        alpha[5][10] = 12'b011110000110;
        alpha[5][11] = 12'b011110000110;
        alpha[5][12] = 12'b011110000110;
        alpha[5][13] = 12'b011110000110;
        alpha[5][14] = 12'b011110000110;
        alpha[5][15] = 12'b011110000110;
        alpha[5][16] = 12'b011110000110;
        alpha[5][17] = 12'b011111111000;
        alpha[5][18] = 12'b011111111000;
        alpha[5][19] = 12'b000000000000;
        alpha[6][0]  = 12'b000000000000;
        alpha[6][1]  = 12'b011111111110;
        alpha[6][2]  = 12'b011111111110;
        alpha[6][3]  = 12'b011110000000;
        alpha[6][4]  = 12'b011110000000;
        alpha[6][5]  = 12'b011110000000;
        alpha[6][6]  = 12'b011110000000;
        alpha[6][7]  = 12'b011110000000;
        alpha[6][8]  = 12'b011110000000;
        alpha[6][9]  = 12'b011111111100;
        alpha[6][10] = 12'b011111111100;
        alpha[6][11] = 12'b011110000000;
        alpha[6][12] = 12'b011110000000;
        alpha[6][13] = 12'b011110000000;
        alpha[6][14] = 12'b011110000000;
        alpha[6][15] = 12'b011110000000;
        alpha[6][16] = 12'b011110000000;
        alpha[6][17] = 12'b011111111110;
        alpha[6][18] = 12'b011111111110;
        alpha[6][19] = 12'b000000000000;
        alpha[7][0]  = 12'b000000000000;
        alpha[7][1]  = 12'b011111111110;
        alpha[7][2]  = 12'b011111111110;
        alpha[7][3]  = 12'b011110000000;
        alpha[7][4]  = 12'b011110000000;
        alpha[7][5]  = 12'b011110000000;
        alpha[7][6]  = 12'b011110000000;
        alpha[7][7]  = 12'b011110000000;
        alpha[7][8]  = 12'b011110000000;
        alpha[7][9]  = 12'b011111111100;
        alpha[7][10] = 12'b011111111100;
        alpha[7][11] = 12'b011110000000;
        alpha[7][12] = 12'b011110000000;
        alpha[7][13] = 12'b011110000000;
        alpha[7][14] = 12'b011110000000;
        alpha[7][15] = 12'b011110000000;
        alpha[7][16] = 12'b011110000000;
        alpha[7][17] = 12'b011110000000;
        alpha[7][18] = 12'b011110000000;
        alpha[7][19] = 12'b000000000000;
        alpha[8][0]  = 12'b000000000000;
        alpha[8][1]  = 12'b000111111110;
        alpha[8][2]  = 12'b000111111110;
        alpha[8][3]  = 12'b011110000000;
        alpha[8][4]  = 12'b011110000000;
        alpha[8][5]  = 12'b011110000000;
        alpha[8][6]  = 12'b011110000000;
        alpha[8][7]  = 12'b011110000000;
        alpha[8][8]  = 12'b011110000000;
        alpha[8][9]  = 12'b011110011110;
        alpha[8][10] = 12'b011110011110;
        alpha[8][11] = 12'b011110000110;
        alpha[8][12] = 12'b011110000110;
        alpha[8][13] = 12'b011110000110;
        alpha[8][14] = 12'b011110000110;
        alpha[8][15] = 12'b011110000110;
        alpha[8][16] = 12'b011110000110;
        alpha[8][17] = 12'b000111111110;
        alpha[8][18] = 12'b000111111110;
        alpha[8][19] = 12'b000000000000;
        alpha[9][0]  = 12'b000000000000;
        alpha[9][1]  = 12'b011110011110;
        alpha[9][2]  = 12'b011110011110;
        alpha[9][3]  = 12'b011110011110;
        alpha[9][4]  = 12'b011110011110;
        alpha[9][5]  = 12'b011110011110;
        alpha[9][6]  = 12'b011110011110;
        alpha[9][7]  = 12'b011110011110;
        alpha[9][8]  = 12'b011110011110;
        alpha[9][9]  = 12'b011111111110;
        alpha[9][10] = 12'b011111111110;
        alpha[9][11] = 12'b011110011110;
        alpha[9][12] = 12'b011110011110;
        alpha[9][13] = 12'b011110011110;
        alpha[9][14] = 12'b011110011110;
        alpha[9][15] = 12'b011110011110;
        alpha[9][16] = 12'b011110011110;
        alpha[9][17] = 12'b011110011110;
        alpha[9][18] = 12'b011110011110;
        alpha[9][19] = 12'b100000001000;
        alpha[10][0]  = 12'b000000000000;
        alpha[10][1]  = 12'b011111111110;
        alpha[10][2]  = 12'b011111111110;
        alpha[10][3]  = 12'b011111111110;
        alpha[10][4]  = 12'b011111111110;
        alpha[10][5]  = 12'b000001100000;
        alpha[10][6]  = 12'b000001100000;
        alpha[10][7]  = 12'b000001100000;
        alpha[10][8]  = 12'b000001100000;
        alpha[10][9]  = 12'b000001100000;
        alpha[10][10] = 12'b000001100000;
        alpha[10][11] = 12'b000001100000;
        alpha[10][12] = 12'b000001100000;
        alpha[10][13] = 12'b000001100000;
        alpha[10][14] = 12'b000001100000;
        alpha[10][15] = 12'b011111111110;
        alpha[10][16] = 12'b011111111110;
        alpha[10][17] = 12'b011111111110;
        alpha[10][18] = 12'b011111111110;
        alpha[10][19] = 12'b000000000000;
        alpha[11][0]  = 12'b000000000000;
        alpha[11][1]  = 12'b000000011110;
        alpha[11][2]  = 12'b000000011110;
        alpha[11][3]  = 12'b000000011110;
        alpha[11][4]  = 12'b000000011110;
        alpha[11][5]  = 12'b000000011110;
        alpha[11][6]  = 12'b000000011110;
        alpha[11][7]  = 12'b000000011110;
        alpha[11][8]  = 12'b000000011110;
        alpha[11][9]  = 12'b000000011110;
        alpha[11][10] = 12'b000000011110;
        alpha[11][11] = 12'b000000011110;
        alpha[11][12] = 12'b000000011110;
        alpha[11][13] = 12'b011110011110;
        alpha[11][14] = 12'b011110011110;
        alpha[11][15] = 12'b011111111110;
        alpha[11][16] = 12'b011111111110;
        alpha[11][17] = 12'b000111111000;
        alpha[11][18] = 12'b000111111000;
        alpha[11][19] = 12'b000000000000;
        alpha[12][0]  = 12'b000000000000;
        alpha[12][1]  = 12'b011000011110;
        alpha[12][2]  = 12'b011000011110;
        alpha[12][3]  = 12'b011000011110;
        alpha[12][4]  = 12'b011001111000;
        alpha[12][5]  = 12'b011001111000;
        alpha[12][6]  = 12'b011001100000;
        alpha[12][7]  = 12'b011001100000;
        alpha[12][8]  = 12'b011111000000;
        alpha[12][9]  = 12'b011111000000;
        alpha[12][10] = 12'b011111000000;
        alpha[12][11] = 12'b011111000000;
        alpha[12][12] = 12'b011111100000;
        alpha[12][13] = 12'b011001100000;
        alpha[12][14] = 12'b011001111000;
        alpha[12][15] = 12'b011001111000;
        alpha[12][16] = 12'b011000011110;
        alpha[12][17] = 12'b011000011110;
        alpha[12][18] = 12'b011000011110;
        alpha[12][19] = 12'b000000000000;
        alpha[13][0]  = 12'b000000000000;
        alpha[13][1]  = 12'b011110000000;
        alpha[13][2]  = 12'b011110000000;
        alpha[13][3]  = 12'b011110000000;
        alpha[13][4]  = 12'b011110000000;
        alpha[13][5]  = 12'b011110000000;
        alpha[13][6]  = 12'b011110000000;
        alpha[13][7]  = 12'b011110000000;
        alpha[13][8]  = 12'b011110000000;
        alpha[13][9]  = 12'b011110000000;
        alpha[13][10] = 12'b011110000000;
        alpha[13][11] = 12'b011110000000;
        alpha[13][12] = 12'b011110000000;
        alpha[13][13] = 12'b011110000000;
        alpha[13][14] = 12'b011110000000;
        alpha[13][15] = 12'b011111111110;
        alpha[13][16] = 12'b011111111110;
        alpha[13][17] = 12'b011111111110;
        alpha[13][18] = 12'b011111111110;
        alpha[13][19] = 12'b000000000000;
        alpha[14][0]  = 12'b000000000000;
        alpha[14][1]  = 12'b011000000110;
        alpha[14][2]  = 12'b011000000110;
        alpha[14][3]  = 12'b011110011110;
        alpha[14][4]  = 12'b011110011110;
        alpha[14][5]  = 12'b011111111110;
        alpha[14][6]  = 12'b011111111110;
        alpha[14][7]  = 12'b011111111110;
        alpha[14][8]  = 12'b011111111110;
        alpha[14][9]  = 12'b011001100110;
        alpha[14][10] = 12'b011001100110;
        alpha[14][11] = 12'b011000000110;
        alpha[14][12] = 12'b011000000110;
        alpha[14][13] = 12'b011000000110;
        alpha[14][14] = 12'b011000000110;
        alpha[14][15] = 12'b011000000110;
        alpha[14][16] = 12'b011000000110;
        alpha[14][17] = 12'b011000000110;
        alpha[14][18] = 12'b011000000110;
        alpha[14][19] = 12'b000000000000;
        alpha[15][0]  = 12'b000000000000;
        alpha[15][1]  = 12'b011000000110;
        alpha[15][2]  = 12'b011000000110;
        alpha[15][3]  = 12'b011110000110;
        alpha[15][4]  = 12'b011110000110;
        alpha[15][5]  = 12'b011110000110;
        alpha[15][6]  = 12'b011110000110;
        alpha[15][7]  = 12'b011001100110;
        alpha[15][8]  = 12'b011001100110;
        alpha[15][9]  = 12'b011001100110;
        alpha[15][10] = 12'b011001100110;
        alpha[15][11] = 12'b011000011110;
        alpha[15][12] = 12'b011000011110;
        alpha[15][13] = 12'b011000011110;
        alpha[15][14] = 12'b011000011110;
        alpha[15][15] = 12'b011000000110;
        alpha[15][16] = 12'b011000000110;
        alpha[15][17] = 12'b011000000110;
        alpha[15][18] = 12'b011000000110;
        alpha[15][19] = 12'b000000000000;
        alpha[16][0]  = 12'b000000000000;
        alpha[16][1]  = 12'b000111111000;
        alpha[16][2]  = 12'b000111111000;
        alpha[16][3]  = 12'b011111111110;
        alpha[16][4]  = 12'b011111111110;
        alpha[16][5]  = 12'b011110011110;
        alpha[16][6]  = 12'b011110011110;
        alpha[16][7]  = 12'b011110011110;
        alpha[16][8]  = 12'b011110011110;
        alpha[16][9]  = 12'b011110011110;
        alpha[16][10] = 12'b011110011110;
        alpha[16][11] = 12'b011110011110;
        alpha[16][12] = 12'b011110011110;
        alpha[16][13] = 12'b011110011110;
        alpha[16][14] = 12'b011110011110;
        alpha[16][15] = 12'b011111111110;
        alpha[16][16] = 12'b011111111110;
        alpha[16][17] = 12'b000111111000;
        alpha[16][18] = 12'b000111111000;
        alpha[16][19] = 12'b000000000000;
        alpha[17][0]  = 12'b000000000000;
        alpha[17][1]  = 12'b011111111000;
        alpha[17][2]  = 12'b011111111000;
        alpha[17][3]  = 12'b011110011110;
        alpha[17][4]  = 12'b011110011110;
        alpha[17][5]  = 12'b011110011110;
        alpha[17][6]  = 12'b011110011110;
        alpha[17][7]  = 12'b011110011110;
        alpha[17][8]  = 12'b011110011110;
        alpha[17][9]  = 12'b011111111000;
        alpha[17][10] = 12'b011111111000;
        alpha[17][11] = 12'b011110000000;
        alpha[17][12] = 12'b011110000000;
        alpha[17][13] = 12'b011110000000;
        alpha[17][14] = 12'b011110000000;
        alpha[17][15] = 12'b011110000000;
        alpha[17][16] = 12'b011110000000;
        alpha[17][17] = 12'b011110000000;
        alpha[17][18] = 12'b011110000000;
        alpha[17][19] = 12'b000000000000;
        alpha[18][0]  = 12'b000000000000;
        alpha[18][1]  = 12'b000111111000;
        alpha[18][2]  = 12'b000111111000;
        alpha[18][3]  = 12'b011110011110;
        alpha[18][4]  = 12'b011110011110;
        alpha[18][5]  = 12'b011110011110;
        alpha[18][6]  = 12'b011110011110;
        alpha[18][7]  = 12'b011110011110;
        alpha[18][8]  = 12'b011110011110;
        alpha[18][9]  = 12'b011110011110;
        alpha[18][10] = 12'b011110011110;
        alpha[18][11] = 12'b011110011110;
        alpha[18][12] = 12'b011110011110;
        alpha[18][13] = 12'b011110011110;
        alpha[18][14] = 12'b011110011110;
        alpha[18][15] = 12'b011110011000;
        alpha[18][16] = 12'b011110011000;
        alpha[18][17] = 12'b000111111110;
        alpha[18][18] = 12'b000111111110;
        alpha[18][19] = 12'b000000000000;
        alpha[19][0]  = 12'b000000000000;
        alpha[19][1]  = 12'b011111111000;
        alpha[19][2]  = 12'b011111111000;
        alpha[19][3]  = 12'b011110011110;
        alpha[19][4]  = 12'b011110011110;
        alpha[19][5]  = 12'b011110011110;
        alpha[19][6]  = 12'b011110011110;
        alpha[19][7]  = 12'b011110011110;
        alpha[19][8]  = 12'b011110011110;
        alpha[19][9]  = 12'b011110011110;
        alpha[19][10] = 12'b011110011110;
        alpha[19][11] = 12'b011111111000;
        alpha[19][12] = 12'b011111111000;
        alpha[19][13] = 12'b011110011000;
        alpha[19][14] = 12'b011110011000;
        alpha[19][15] = 12'b011110001100;
        alpha[19][16] = 12'b011110001100;
        alpha[19][17] = 12'b011110000110;
        alpha[19][18] = 12'b011110000110;
        alpha[19][19] = 12'b000000000000;
        alpha[20][0]  = 12'b000000000000;
        alpha[20][1]  = 12'b011111111110;
        alpha[20][2]  = 12'b011111111110;
        alpha[20][3]  = 12'b011111111110;
        alpha[20][4]  = 12'b011111111110;
        alpha[20][5]  = 12'b011110000000;
        alpha[20][6]  = 12'b011110000000;
        alpha[20][7]  = 12'b011110000000;
        alpha[20][8]  = 12'b011110000000;
        alpha[20][9]  = 12'b011111111110;
        alpha[20][10] = 12'b011111111110;
        alpha[20][11] = 12'b000000011110;
        alpha[20][12] = 12'b000000011110;
        alpha[20][13] = 12'b000000011110;
        alpha[20][14] = 12'b000000011110;
        alpha[20][15] = 12'b011111111110;
        alpha[20][16] = 12'b011111111110;
        alpha[20][17] = 12'b011111111110;
        alpha[20][18] = 12'b011111111110;
        alpha[20][19] = 12'b000000000000;
        alpha[21][0]  = 12'b000000000000;
        alpha[21][1]  = 12'b011111111110;
        alpha[21][2]  = 12'b011111111110;
        alpha[21][3]  = 12'b011111111110;
        alpha[21][4]  = 12'b011111111110;
        alpha[21][5]  = 12'b000001100000;
        alpha[21][6]  = 12'b000001100000;
        alpha[21][7]  = 12'b000001100000;
        alpha[21][8]  = 12'b000001100000;
        alpha[21][9]  = 12'b000001100000;
        alpha[21][10] = 12'b000001100000;
        alpha[21][11] = 12'b000001100000;
        alpha[21][12] = 12'b000001100000;
        alpha[21][13] = 12'b000001100000;
        alpha[21][14] = 12'b000001100000;
        alpha[21][15] = 12'b000001100000;
        alpha[21][16] = 12'b000001100000;
        alpha[21][17] = 12'b000001100000;
        alpha[21][18] = 12'b000001100000;
        alpha[21][19] = 12'b000000000000;
        alpha[22][0]  = 12'b000000000000;
        alpha[22][1]  = 12'b011110011110;
        alpha[22][2]  = 12'b011110011110;
        alpha[22][3]  = 12'b011110011110;
        alpha[22][4]  = 12'b011110011110;
        alpha[22][5]  = 12'b011110011110;
        alpha[22][6]  = 12'b011110011110;
        alpha[22][7]  = 12'b011110011110;
        alpha[22][8]  = 12'b011110011110;
        alpha[22][9]  = 12'b011110011110;
        alpha[22][10] = 12'b011110011110;
        alpha[22][11] = 12'b011110011110;
        alpha[22][12] = 12'b011110011110;
        alpha[22][13] = 12'b011110011110;
        alpha[22][14] = 12'b011110011110;
        alpha[22][15] = 12'b011111111110;
        alpha[22][16] = 12'b011111111110;
        alpha[22][17] = 12'b000111111000;
        alpha[22][18] = 12'b000111111000;
        alpha[22][19] = 12'b000000000000;
        alpha[23][0]  = 12'b000000000000;
        alpha[23][1]  = 12'b011110011110;
        alpha[23][2]  = 12'b011110011110;
        alpha[23][3]  = 12'b011110011110;
        alpha[23][4]  = 12'b011110011110;
        alpha[23][5]  = 12'b011110011110;
        alpha[23][6]  = 12'b011110011110;
        alpha[23][7]  = 12'b011110011110;
        alpha[23][8]  = 12'b011110011110;
        alpha[23][9]  = 12'b011110011110;
        alpha[23][10] = 12'b011110011110;
        alpha[23][11] = 12'b011110011110;
        alpha[23][12] = 12'b011110011110;
        alpha[23][13] = 12'b011111111110;
        alpha[23][14] = 12'b011111111110;
        alpha[23][15] = 12'b000111111000;
        alpha[23][16] = 12'b000111111000;
        alpha[23][17] = 12'b000001100000;
        alpha[23][18] = 12'b000001100000;
        alpha[23][19] = 12'b000000000000;
        alpha[24][0]  = 12'b000000000000;
        alpha[24][1]  = 12'b011001100110;
        alpha[24][2]  = 12'b011001100110;
        alpha[24][3]  = 12'b011001100110;
        alpha[24][4]  = 12'b011001100110;
        alpha[24][5]  = 12'b011001100110;
        alpha[24][6]  = 12'b011001100110;
        alpha[24][7]  = 12'b011001100110;
        alpha[24][8]  = 12'b011001100110;
        alpha[24][9]  = 12'b011001100110;
        alpha[24][10] = 12'b011001100110;
        alpha[24][11] = 12'b011001100110;
        alpha[24][12] = 12'b011001100110;
        alpha[24][13] = 12'b011001100110;
        alpha[24][14] = 12'b011001100110;
        alpha[24][15] = 12'b011111111110;
        alpha[24][16] = 12'b011111111110;
        alpha[24][17] = 12'b000111111000;
        alpha[24][18] = 12'b000111111000;
        alpha[24][19] = 12'b000000000000;
        alpha[25][0]  = 12'b000000000000;
        alpha[25][1]  = 12'b011110011110;
        alpha[25][2]  = 12'b011110011110;
        alpha[25][3]  = 12'b011110011110;
        alpha[25][4]  = 12'b011110011110;
        alpha[25][5]  = 12'b011110011110;
        alpha[25][6]  = 12'b011110011110;
        alpha[25][7]  = 12'b011110011110;
        alpha[25][8]  = 12'b011110011110;
        alpha[25][9]  = 12'b000111111000;
        alpha[25][10] = 12'b000111111000;
        alpha[25][11] = 12'b011110011110;
        alpha[25][12] = 12'b011110011110;
        alpha[25][13] = 12'b011110011110;
        alpha[25][14] = 12'b011110011110;
        alpha[25][15] = 12'b011110011110;
        alpha[25][16] = 12'b011110011110;
        alpha[25][17] = 12'b011110011110;
        alpha[25][18] = 12'b011110011110;
        alpha[25][19] = 12'b000000000000;
        alpha[26][0]  = 12'b000000000000;
        alpha[26][1]  = 12'b011110011110;
        alpha[26][2]  = 12'b011110011110;
        alpha[26][3]  = 12'b011110011110;
        alpha[26][4]  = 12'b011110011110;
        alpha[26][5]  = 12'b011110011110;
        alpha[26][6]  = 12'b011110011110;
        alpha[26][7]  = 12'b011110011110;
        alpha[26][8]  = 12'b011110011110;
        alpha[26][9]  = 12'b000111111000;
        alpha[26][10] = 12'b000111111000;
        alpha[26][11] = 12'b000001100000;
        alpha[26][12] = 12'b000001100000;
        alpha[26][13] = 12'b000001100000;
        alpha[26][14] = 12'b000001100000;
        alpha[26][15] = 12'b000001100000;
        alpha[26][16] = 12'b000001100000;
        alpha[26][17] = 12'b000001100000;
        alpha[26][18] = 12'b000001100000;
        alpha[26][19] = 12'b000000000000;
        alpha[27][0]  = 12'b000000000000;
        alpha[27][1]  = 12'b011111111110;
        alpha[27][2]  = 12'b011111111110;
        alpha[27][3]  = 12'b011111111110;
        alpha[27][4]  = 12'b011111111110;
        alpha[27][5]  = 12'b000000000110;
        alpha[27][6]  = 12'b000000000110;
        alpha[27][7]  = 12'b000000011110;
        alpha[27][8]  = 12'b000000011110;
        alpha[27][9]  = 12'b000001111000;
        alpha[27][10] = 12'b000001111000;
        alpha[27][11] = 12'b000111100000;
        alpha[27][12] = 12'b000111100000;
        alpha[27][13] = 12'b011110000000;
        alpha[27][14] = 12'b011110000000;
        alpha[27][15] = 12'b011111111110;
        alpha[27][16] = 12'b011111111110;
        alpha[27][17] = 12'b011111111110;
        alpha[27][18] = 12'b011111111110;
        alpha[27][19] = 12'b000000000000;

    
    end
    
    parameter [3:0] group = 4'b0000;
    parameter [3:0] studentA = 4'b0011;
    parameter [3:0] studentB = 4'b0110;
    parameter [3:0] studentC = 4'b1001;
    parameter [3:0] studentD = 4'b1100;
    parameter [3:0] grp_task = 4'b0001;
    parameter [3:0] grp_impr = 4'b0010;
    parameter [3:0] a_task = 4'b0100;
    parameter [3:0] a_improv = 4'b0101;
    parameter [3:0] b_task = 4'b0111;
    parameter [3:0] b_improv = 4'b1000;
    parameter [3:0] c_task = 4'b1010;
    parameter [3:0] c_improv = 4'b1011;
    parameter [3:0] d_task = 4'b1101;
    parameter [3:0] d_improv = 4'b1110;
    reg change = 0;
    always @(change) begin 
        case (state)
        group: begin
            disp[0] <= 1;disp[1] <= 1;disp[2] <= 1;disp[3] <= 17;disp[4] <= 22;disp[5] <= 16;disp[6] <= 19;disp[7] <= 8;
        end
        studentA: begin
            disp[0] <= 2;disp[1] <= 21;disp[2] <= 15;disp[3] <= 6;disp[4] <= 5;disp[5] <= 22;disp[6] <= 21;disp[7] <= 20;
        end
        studentB: begin
            disp[0] <= 3;disp[1] <= 21;disp[2] <= 15;disp[3] <= 6;disp[4] <= 5;disp[5] <= 22;disp[6] <= 21;disp[7] <= 20;
        end
        studentC: begin
            disp[0] <= 4;disp[1] <= 21;disp[2] <= 15;disp[3] <= 6;disp[4] <= 5;disp[5] <= 22;disp[6] <= 21;disp[7] <= 20;
        end
        studentD: begin
            disp[0] <= 5;disp[1] <= 21;disp[2] <= 15;disp[3] <= 6;disp[4] <= 5;disp[5] <= 22;disp[6] <= 21;disp[7] <= 20;
        end
        grp_task: begin
            disp[0] <= 12;disp[1] <= 20;disp[2] <= 2;disp[3] <= 21;disp[4] <= 1;disp[5] <= 17;disp[6] <= 19;disp[7] <= 8;
        end
        grp_impr: begin
            disp[0] <= 19;disp[1] <= 17;disp[2] <= 14;disp[3] <= 10;disp[4] <= 1;disp[5] <= 17;disp[6] <= 19;disp[7] <= 8;
        end
        a_task: begin
            disp[0] <= 1;disp[1] <= 1;disp[2] <= 12;disp[3] <= 20;disp[4] <= 2;disp[5] <= 21;disp[6] <= 1;disp[7] <= 2;
        end
        a_improv: begin
            disp[0] <= 23;disp[1] <= 16;disp[2] <= 19;disp[3] <= 17;disp[4] <= 14;disp[5] <= 10;disp[6] <= 1;disp[7] <= 2;
        end
        b_task: begin
            disp[0] <= 1;disp[1] <= 1;disp[2] <= 12;disp[3] <= 20;disp[4] <= 2;disp[5] <= 21;disp[6] <= 1;disp[7] <= 3;
        end
        b_improv: begin
            disp[0] <= 23;disp[1] <= 16;disp[2] <= 19;disp[3] <= 17;disp[4] <= 14;disp[5] <= 10;disp[6] <= 1;disp[7] <= 3;
        end
        c_task: begin
            disp[0] <= 1;disp[1] <= 1;disp[2] <= 12;disp[3] <= 20;disp[4] <= 2;disp[5] <= 21;disp[6] <= 1;disp[7] <= 4;
        end
        c_improv: begin
            disp[0] <= 23;disp[1] <= 16;disp[2] <= 19;disp[3] <= 17;disp[4] <= 14;disp[5] <= 10;disp[6] <= 1;disp[7] <= 4;
        end
        d_task: begin
            disp[0] <= 1;disp[1] <= 1;disp[2] <= 12;disp[3] <= 20;disp[4] <= 2;disp[5] <= 21;disp[6] <= 1;disp[7] <= 5;
        end
        d_improv: begin
            disp[0] <= 23;disp[1] <= 16;disp[2] <= 19;disp[3] <= 17;disp[4] <= 14;disp[5] <= 10;disp[6] <= 1;disp[7] <= 5;
        end
        endcase
    end
    
    wire clk_btn;
    clk_div slow_clk_btn(clock,10_500_000, clk_btn);
    reg [3:0] next_state = 0;
    always @(posedge clk_btn) begin 
        if (sw == 1) begin
            if (btnD == 1) begin
                case (state)
                group: begin next_state <= studentA; end
                studentA: begin next_state <= studentB; end
                studentB: begin next_state <= studentC; end
                studentC: begin next_state <= studentD; end
                studentD: begin next_state <= group; end
                grp_task: begin next_state <= grp_impr; end
                grp_impr: begin next_state <= grp_task; end
                a_task: begin next_state <= a_improv; end
                a_improv: begin next_state <= a_task; end
                b_task: begin next_state <= b_improv; end
                b_improv: begin next_state <= b_task; end
                c_task: begin next_state <= c_improv; end
                c_improv: begin next_state <= c_task; end
                d_task: begin next_state <= d_improv; end
                d_improv: begin next_state <= d_task; end
                default: begin next_state <= state; end
                endcase
            end
            else if (btnU == 1) begin
                case (state)
                group: begin next_state <= studentD; end
                studentA: begin next_state <= group; end
                studentB: begin next_state <= studentA; end
                studentC: begin next_state <= studentB; end
                studentD: begin next_state <= studentC; end
                grp_task: begin next_state <= grp_impr; end
                grp_impr: begin next_state <= grp_task; end
                a_task: begin next_state <= a_improv; end
                a_improv: begin next_state <= a_task; end
                b_task: begin next_state <= b_improv; end
                b_improv: begin next_state <= b_task; end
                c_task: begin next_state <= c_improv; end
                c_improv: begin next_state <= c_task; end
                d_task: begin next_state <= d_improv; end
                d_improv: begin next_state <= d_task; end
                default: begin next_state <= state; end
                endcase
            end
            else if (btnR == 1) begin
                case (state)
                group: next_state <= grp_task;
                studentA: next_state <= a_task;
                studentB: next_state <= b_task;
                studentC: next_state <= c_task;
                studentD: next_state <= d_task;
                default: next_state <= state;
                endcase
            end
            else if (btnL == 1) begin
                case (state)
                grp_task, grp_impr: next_state <= group;
                a_task, a_improv: next_state <= studentA;
                b_task, b_improv: next_state <= studentB;
                c_task, c_improv: next_state <= studentC;
                d_task, d_improv: next_state <= studentD;
                default: next_state <= state;
                endcase
            end
        end
        state = next_state;
    end
    
    reg [6:0] count = 0;
    wire clk_count;
    clk_div slow_clk_count(clock,7_000_000, clk_count);
    always @(posedge clk_count) begin
        count = (count == 108) ? 0 : count + 1;
    end
    
    reg [15:0] btn_color = 0;
    wire clk_color;
    clk_div slow_clk_color(clock,8_000, clk_color);
    always @(posedge clk_color) begin
        btn_color = btn_color + 1;
    end
    always @(posedge clock) begin
        if (y <= 20 && ((alpha[22][y][x%12] == 1 && x >= 25 && x <= 36)
            || (alpha[15][y][x%12] == 1 && x >= 37 && x <= 48)
            || (alpha[6][y][x%12] == 1 && x >= 49 && x <= 60)
            || (alpha[14][y][x%12] == 1 && x >= 61 && x <= 72))) begin
            oled_data <= 16'hffff;
        end
        else if (y >= 22 && y <= 48 && alpha[disp[((x+count)/12)%9]][y-22][(x+count)%12] == 1) begin
            case (state)
            group: oled_data <= 16'he9bf;
            grp_task,grp_impr: oled_data <= 16'he3bd;
            studentA: oled_data <= 16'hfd46;
            a_task, a_improv: oled_data <= 16'hf74c;
            studentB: oled_data <= 16'hefc6;
            b_task, b_improv: oled_data <= 16'hafac;
            studentC: oled_data <= 16'h333f;
            c_task, c_improv: oled_data <= 16'h63be;
            studentD: oled_data <= 16'h37cf;
            d_task, d_improv: oled_data <= 16'h67b1;
            default: oled_data <= 16'hffff;
            endcase
        end    
        else if ((y == 59 && x >= 45 && x <= 53) || (y == 60 && x >= 46 && x <= 52) || (y == 61 && x >= 47 && x <= 51) ||(y == 62 && x >= 48 && x <= 50) || (y == 63 && x==49)
        || (y == 57 && x >= 45 && x <= 53) || (y == 56 && x >= 46 && x <= 52) || (y == 55 && x >= 47 && x <= 51) ||(y == 54 && x >= 48 && x <= 50) || (y == 53 && x==49)) begin
            oled_data <= btn_color;
        end
        else if ((x == 55 && y >= 54 && y <= 62) || (x == 56 && y >= 55 && y <= 61) || (x == 57 && y >= 56 && y <= 60) ||(x == 58 && y >= 57 && y <= 59) || (y == 58 && x==59)) begin
            case (state)
            grp_task,grp_impr, a_task, a_improv,b_task, b_improv,c_task, c_improv,d_task, d_improv: oled_data <= btn_color;
            default: oled_data <= 0;
            endcase
        end
        else if ((x == 43 && y >= 54 && y <= 62) || (x == 42 && y >= 55 && y <= 61) || (x == 41 && y >= 56 && y <= 60) ||(x == 40 && y >= 57 && y <= 59) || (y == 58 && x==39)) begin
            case (state)
            group,studentA,studentB,studentC,studentD: oled_data <= btn_color;
            default: oled_data <= 0;
            endcase
        end
        else begin
            oled_data <= 0;
        end
        
    end
endmodule
