`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.03.2023 11:06:23
// Design Name: 
// Module Name: wall_display
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


module wall_display(
    input clock,
    input [30:0] maze,
    input [4:0] position,
    input [6:0] x, y,
    output reg [15:0] oled_data = 0
    );
    
    reg [19:0] square;
   
    always @ (posedge clock) begin
          square <= 0;
          square[position] <= 1;
        
        if ((x == 11) && (y >= 2) && (y <= 61)) 
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x == 85) && (y >= 2) && (y <= 61)) 
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x >= 11) && (x <= 85) && (y == 2))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x >= 11) && (x <= 85) && (y == 61))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
            
        else if ((x == 26) && (y >= 3) && (y <= 17))
            begin
                if (maze[0] == 0) begin
                oled_data <= 16'b11111_111111_11111;
                end
                else begin
                oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x == 41) && (y >= 3) && (y <= 17))
            begin
                if (maze[1] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
        else if ((x == 56) && (y >= 3) && (y <= 17))
            begin
                if (maze[2] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
        else if ((x == 71) && (y >= 3) && (y <= 17))
            begin
                if (maze[3] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
        else if ((x == 26) && (y >= 18) && (y <= 32))
            begin
                if (maze[4] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x == 41) && (y >= 18) && (y <= 32))
            begin
                if (maze[5] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x == 56) && (y >= 18) && (y <= 32))
            begin
                if (maze[6] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x == 71) && (y >= 18) && (y <= 32))
            begin
                if (maze[7] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x == 26) && (y >= 33) && (y <= 47))
            begin
                if (maze[8] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x == 41) && (y >= 33) && (y <= 47))
            begin
                if (maze[9] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x == 56) && (y >= 33) && (y <= 47))
            begin
                if (maze[10] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
        else if ((x == 71) && (y >= 33) && (y <= 47))
            begin
                if (maze[11] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
        else if ((x == 26) && (y >= 48) && (y <= 60))
            begin
                if (maze[12] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x == 41) && (y >= 48) && (y <= 60))
            begin
                if (maze[13] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x == 56) && (y >= 48) && (y <= 60))
            begin
                if (maze[14] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
        else if ((x == 71) && (y >= 48) && (y <= 60))
            begin
                if (maze[15] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
        
        else if ((x >= 12) && (x <= 25) && (y == 17))
            begin
                if (maze[16] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x >= 27) && (x <= 40) && (y == 17))
            begin
                if (maze[17] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x >= 42) && (x <= 55) && (y == 17))
            begin
                if (maze[18] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x >= 57) && (x <= 70) && (y == 17))
            begin
                if (maze[19] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x >= 72) && (x <= 85) && (y == 17))
            begin
                if (maze[20] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x >= 12) && (x <= 25) && (y == 32))
            begin
                if (maze[21] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x >= 27) && (x <= 40) && (y == 32))
            begin
                if (maze[22] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x >= 42) && (x <= 55) && (y == 32))
            begin
                if (maze[23] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x >= 57) && (x <= 70) && (y == 32))
            begin
                if (maze[24] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x >= 72) && (x <= 85) && (y == 32))
            begin
                if (maze[25] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x >= 12) && (x <= 25) && (y == 47))
            begin
                if (maze[26] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x >= 27) && (x <= 40) && (y == 47))
            begin
                if (maze[27] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
        else if ((x >= 42) && (x <= 55) && (y == 47))
            begin
                if (maze[28] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x >= 57) && (x <= 70) && (y == 47))
            begin
                if (maze[29] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x >= 72) && (x <= 85) && (y == 47))
            begin
                if (maze[30] == 0) begin
                            oled_data <= 16'b11111_111111_11111;
                            end
                            else begin
                            oled_data <= 16'b00000_000000_00000;
                            end
            end
         else if ((x >= 12) && (x <= 25) && (y >= 3) && (y <= 16))
            begin 
                if (square [0] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 16 && x <= 21) && (y == 4)) oled_data <= 16'b11111_000000_00000;
                else if (x == 15 && y == 5) oled_data <= 16'b11111_000000_00000;
                else if (x == 14 && y == 6) oled_data <= 16'b11111_000000_00000;
                else if ((x == 13) && (y >= 7) && (y <= 12)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 24) && (y >= 7) && (y <= 12)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 14 && y == 13)) oled_data <= 16'b11111_000000_00000;
                else if (x == 15 && y == 14) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 16) && (x <= 21) && (y == 15)) oled_data <= 16'b11111_000000_00000;
                else if (x == 16 && y == 8) oled_data <= 16'b11111_000000_00000;
                else if (x == 21 && y == 8) oled_data <= 16'b11111_000000_00000;
                else if (x == 15 && y == 11) oled_data <= 16'b11111_000000_00000;
                else if (x == 22 && y == 11) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 16 && x <= 21) && (y == 4)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 27) && (x <= 40) && (y >= 3) && (y <= 16))
            begin 
                if (square [1] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 31 && x <= 36) && (y == 4)) oled_data <= 16'b11111_000000_00000;
                else if (x == 30 && y == 5) oled_data <= 16'b11111_000000_00000;
                else if (x == 29 && y == 6) oled_data <= 16'b11111_000000_00000;
                else if ((x == 28) && (y >= 7) && (y <= 12)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 39) && (y >= 7) && (y <= 12)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 29 && y == 13)) oled_data <= 16'b11111_000000_00000;
                else if (x == 30 && y == 14) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 31) && (x <= 36) && (y == 15)) oled_data <= 16'b11111_000000_00000;
                else if (x == 31 && y == 8) oled_data <= 16'b11111_000000_00000;
                else if (x == 36 && y == 8) oled_data <= 16'b11111_000000_00000;
                else if (x == 30 && y == 11) oled_data <= 16'b11111_000000_00000;
                else if (x == 37 && y == 11) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 31 && x <= 36) && (y == 4)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 42) && (x <= 55) && (y >= 3) && (y <= 16))
            begin 
                if (square [2] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 46 && x <= 51) && (y == 4)) oled_data <= 16'b11111_000000_00000;
                else if (x == 45 && y == 5) oled_data <= 16'b11111_000000_00000;
                else if (x == 44 && y == 6) oled_data <= 16'b11111_000000_00000;
                else if ((x == 43) && (y >= 7) && (y <= 12)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 54) && (y >= 7) && (y <= 12)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 44 && y == 13)) oled_data <= 16'b11111_000000_00000;
                else if (x == 45 && y == 14) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 46) && (x <= 51) && (y == 15)) oled_data <= 16'b11111_000000_00000;
                else if (x == 46 && y == 8) oled_data <= 16'b11111_000000_00000;
                else if (x == 50 && y == 8) oled_data <= 16'b11111_000000_00000;
                else if (x == 45 && y == 11) oled_data <= 16'b11111_000000_00000;
                else if (x == 52 && y == 11) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 46 && x <= 61) && (y == 4)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 57) && (x <= 70) && (y >= 3) && (y <= 16))
            begin 
                if (square [3] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 61 && x <= 66) && (y == 4)) oled_data <= 16'b11111_000000_00000;
                else if (x == 60 && y == 5) oled_data <= 16'b11111_000000_00000;
                else if (x == 59 && y == 6) oled_data <= 16'b11111_000000_00000;
                else if ((x == 58) && (y >= 7) && (y <= 12)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 69) && (y >= 7) && (y <= 12)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 59 && y == 13)) oled_data <= 16'b11111_000000_00000;
                else if (x == 60 && y == 14) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 61) && (x <= 66) && (y == 15)) oled_data <= 16'b11111_000000_00000;
                else if (x == 61 && y == 8) oled_data <= 16'b11111_000000_00000;
                else if (x == 65 && y == 8) oled_data <= 16'b11111_000000_00000;
                else if (x == 60 && y == 11) oled_data <= 16'b11111_000000_00000;
                else if (x == 67 && y == 11) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 61 && x <= 66) && (y == 4)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 72) && (x <= 85) && (y >= 3) && (y <= 16))
            begin 
                if (square [4] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 76 && x <= 81) && (y == 4)) oled_data <= 16'b11111_000000_00000;
                else if (x == 75 && y == 5) oled_data <= 16'b11111_000000_00000;
                else if (x == 74 && y == 6) oled_data <= 16'b11111_000000_00000;
                else if ((x == 73) && (y >= 7) && (y <= 12)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 84) && (y >= 7) && (y <= 12)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 74 && y == 13)) oled_data <= 16'b11111_000000_00000;
                else if (x == 75 && y == 14) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 76) && (x <= 81) && (y == 15)) oled_data <= 16'b11111_000000_00000;
                else if (x == 76 && y == 8) oled_data <= 16'b11111_000000_00000;
                else if (x == 80 && y == 8) oled_data <= 16'b11111_000000_00000;
                else if (x == 75 && y == 11) oled_data <= 16'b11111_000000_00000;
                else if (x == 77 && y == 11) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 76 && x <= 81) && (y == 4)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        
        else if ((x >= 12) && (x <= 25) && (y >= 18) && (y <= 31))
            begin 
                if (square [5] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 16 && x <= 21) && (y == 19)) oled_data <= 16'b11111_000000_00000;
                else if (x == 15 && y == 20) oled_data <= 16'b11111_000000_00000;
                else if (x == 14 && y == 21) oled_data <= 16'b11111_000000_00000;
                else if ((x == 13) && (y >= 22) && (y <= 27)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 24) && (y >= 22) && (y <= 27)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 14 && y == 28)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 15 && y == 29)) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 16) && (x <= 21) && (y == 30)) oled_data <= 16'b11111_000000_00000;
                else if (x == 16 && y == 23) oled_data <= 16'b11111_000000_00000;
                else if (x == 21 && y == 23) oled_data <= 16'b11111_000000_00000;
                else if (x == 15 && y == 26) oled_data <= 16'b11111_000000_00000;
                else if (x == 22 && y == 26) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 16 && x <= 21) && (y == 19)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 27) && (x <= 40) && (y >= 18) && (y <= 31))
            begin 
                if (square [6] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 31 && x <= 36) && (y == 19)) oled_data <= 16'b11111_000000_00000;
                else if (x == 30 && y == 20) oled_data <= 16'b11111_000000_00000;
                else if (x == 29 && y == 21) oled_data <= 16'b11111_000000_00000;
                else if ((x == 28) && (y >= 22) && (y <= 27)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 39) && (y >= 22) && (y <= 27)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 29 && y == 28)) oled_data <= 16'b11111_000000_00000;
                else if (x == 30 && y == 29) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 31) && (x <= 36) && (y == 30)) oled_data <= 16'b11111_000000_00000;
                else if (x == 31 && y == 23) oled_data <= 16'b11111_000000_00000;
                else if (x == 36 && y == 23) oled_data <= 16'b11111_000000_00000;
                else if (x == 30 && y == 26) oled_data <= 16'b11111_000000_00000;
                else if (x == 37 && y == 26) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 31 && x <= 36) && (y == 19)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 42) && (x <= 55) && (y >= 18) && (y <= 31))
            begin 
                if (square [7] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 46 && x <= 51) && (y == 19)) oled_data <= 16'b11111_000000_00000;
                else if (x == 45 && y == 20) oled_data <= 16'b11111_000000_00000;
                else if (x == 44 && y == 21) oled_data <= 16'b11111_000000_00000;
                else if ((x == 43) && (y >= 22) && (y <= 27)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 54) && (y >= 22) && (y <= 27)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 44 && y == 28)) oled_data <= 16'b11111_000000_00000;
                else if (x == 45 && y == 29) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 46) && (x <= 51) && (y == 30)) oled_data <= 16'b11111_000000_00000;
                else if (x == 46 && y == 23) oled_data <= 16'b11111_000000_00000;
                else if (x == 50 && y == 23) oled_data <= 16'b11111_000000_00000;
                else if (x == 45 && y == 26) oled_data <= 16'b11111_000000_00000;
                else if (x == 52 && y == 26) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 46 && x <= 61) && (y == 19)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 57) && (x <= 70) && (y >= 18) && (y <= 31))
            begin 
                if (square [8] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 61 && x <= 66) && (y == 19)) oled_data <= 16'b11111_000000_00000;
                else if (x == 60 && y == 20) oled_data <= 16'b11111_000000_00000;
                else if (x == 59 && y == 21) oled_data <= 16'b11111_000000_00000;
                else if ((x == 58) && (y >= 22) && (y <= 27)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 69) && (y >= 22) && (y <= 27)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 59 && y == 28)) oled_data <= 16'b11111_000000_00000;
                else if (x == 60 && y == 29) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 61) && (x <= 66) && (y == 30)) oled_data <= 16'b11111_000000_00000;
                else if (x == 61 && y == 23) oled_data <= 16'b11111_000000_00000;
                else if (x == 65 && y == 23) oled_data <= 16'b11111_000000_00000;
                else if (x == 60 && y == 26) oled_data <= 16'b11111_000000_00000;
                else if (x == 67 && y == 26) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 61 && x <= 66) && (y == 19)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 72) && (x <= 85) && (y >= 18) && (y <= 31))
            begin 
                if (square [9] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 76 && x <= 81) && (y == 19)) oled_data <= 16'b11111_000000_00000;
                else if (x == 75 && y == 20) oled_data <= 16'b11111_000000_00000;
                else if (x == 74 && y == 21) oled_data <= 16'b11111_000000_00000;
                else if ((x == 73) && (y >= 22) && (y <= 27)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 84) && (y >= 22) && (y <= 27)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 74 && y == 28)) oled_data <= 16'b11111_000000_00000;
                else if (x == 75 && y == 29) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 76) && (x <= 81) && (y == 30)) oled_data <= 16'b11111_000000_00000;
                else if (x == 76 && y == 23) oled_data <= 16'b11111_000000_00000;
                else if (x == 80 && y == 23) oled_data <= 16'b11111_000000_00000;
                else if (x == 75 && y == 26) oled_data <= 16'b11111_000000_00000;
                else if (x == 77 && y == 26) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 76 && x <= 81) && (y == 19)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 12) && (x <= 25) && (y >= 33) && (y <= 46))
            begin 
                if (square [10] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 16 && x <= 21) && (y == 34)) oled_data <= 16'b11111_000000_00000;
                else if (x == 15 && y == 35) oled_data <= 16'b11111_000000_00000;
                else if (x == 14 && y == 36) oled_data <= 16'b11111_000000_00000;
                else if ((x == 13) && (y >= 37) && (y <= 42)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 24) && (y >= 37) && (y <= 42)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 14 && y == 43)) oled_data <= 16'b11111_000000_00000;
                else if (x == 15 && y == 44) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 16) && (x <= 21) && (y == 45)) oled_data <= 16'b11111_000000_00000;
                else if (x == 16 && y == 38) oled_data <= 16'b11111_000000_00000;
                else if (x == 21 && y == 38) oled_data <= 16'b11111_000000_00000;
                else if (x == 15 && y == 41) oled_data <= 16'b11111_000000_00000;
                else if (x == 22 && y == 41) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 16 && x <= 21) && (y == 34)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 27) && (x <= 40) && (y >= 33) && (y <= 46))
            begin 
                if (square [11] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 31 && x <= 36) && (y == 34)) oled_data <= 16'b11111_000000_00000;
                else if (x == 30 && y == 35) oled_data <= 16'b11111_000000_00000;
                else if (x == 29 && y == 36) oled_data <= 16'b11111_000000_00000;
                else if ((x == 28) && (y >= 37) && (y <= 42)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 39) && (y >= 37) && (y <= 42)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 29 && y == 43)) oled_data <= 16'b11111_000000_00000;
                else if (x == 30 && y == 44) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 31) && (x <= 36) && (y == 45)) oled_data <= 16'b11111_000000_00000;
                else if (x == 31 && y == 38) oled_data <= 16'b11111_000000_00000;
                else if (x == 36 && y == 38) oled_data <= 16'b11111_000000_00000;
                else if (x == 30 && y == 41) oled_data <= 16'b11111_000000_00000;
                else if (x == 37 && y == 41) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 31 && x <= 36) && (y == 34)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 42) && (x <= 55) && (y >= 33) && (y <= 46))
            begin 
                if (square [12] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 46 && x <= 51) && (y == 34)) oled_data <= 16'b11111_000000_00000;
                else if (x == 45 && y == 35) oled_data <= 16'b11111_000000_00000;
                else if (x == 44 && y == 36) oled_data <= 16'b11111_000000_00000;
                else if ((x == 43) && (y >= 37) && (y <= 42)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 54) && (y >= 37) && (y <= 42)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 44 && y == 43)) oled_data <= 16'b11111_000000_00000;
                else if (x == 45 && y == 44) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 46) && (x <= 51) && (y == 45)) oled_data <= 16'b11111_000000_00000;
                else if (x == 46 && y == 38) oled_data <= 16'b11111_000000_00000;
                else if (x == 50 && y == 38) oled_data <= 16'b11111_000000_00000;
                else if (x == 45 && y == 41) oled_data <= 16'b11111_000000_00000;
                else if (x == 52 && y == 41) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 46 && x <= 61) && (y == 34)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 57) && (x <= 70) && (y >= 33) && (y <= 46))
            begin 
                if (square [13] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 61 && x <= 66) && (y == 34)) oled_data <= 16'b11111_000000_00000;
                else if (x == 60 && y == 35) oled_data <= 16'b11111_000000_00000;
                else if (x == 59 && y == 36) oled_data <= 16'b11111_000000_00000;
                else if ((x == 58) && (y >= 37) && (y <= 42)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 69) && (y >= 37) && (y <= 42)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 59 && y == 43)) oled_data <= 16'b11111_000000_00000;
                else if (x == 60 && y == 44) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 61) && (x <= 66) && (y == 45)) oled_data <= 16'b11111_000000_00000;
                else if (x == 61 && y == 38) oled_data <= 16'b11111_000000_00000;
                else if (x == 65 && y == 38) oled_data <= 16'b11111_000000_00000;
                else if (x == 60 && y == 41) oled_data <= 16'b11111_000000_00000;
                else if (x == 67 && y == 41) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 61 && x <= 66) && (y == 34)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 72) && (x <= 85) && (y >= 33) && (y <= 46))
            begin
            if (square [14] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 76 && x <= 81) && (y == 34)) oled_data <= 16'b11111_000000_00000;
                else if (x == 75 && y == 35) oled_data <= 16'b11111_000000_00000;
                else if (x == 74 && y == 36) oled_data <= 16'b11111_000000_00000;
                else if ((x == 73) && (y >= 37) && (y <= 42)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 84) && (y >= 37) && (y <= 42)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 74 && y == 43)) oled_data <= 16'b11111_000000_00000;
                else if (x == 75 && y == 44) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 76) && (x <= 81) && (y == 45)) oled_data <= 16'b11111_000000_00000;
                else if (x == 76 && y == 38) oled_data <= 16'b11111_000000_00000;
                else if (x == 80 && y == 38) oled_data <= 16'b11111_000000_00000;
                else if (x == 75 && y == 41) oled_data <= 16'b11111_000000_00000;
                else if (x == 77 && y == 41) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 76 && x <= 81) && (y == 34)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 12) && (x <= 25) && (y >= 48) && (y <= 60))
            begin 
                if (square [15] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 16 && x <= 21) && (y == 49)) oled_data <= 16'b11111_000000_00000;
                else if (x == 15 && y == 50) oled_data <= 16'b11111_000000_00000;
                else if (x == 14 && y == 51) oled_data <= 16'b11111_000000_00000;
                else if ((x == 13) && (y >= 52) && (y <= 57)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 24) && (y >= 52) && (y <= 57)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 14 && y == 58)) oled_data <= 16'b11111_000000_00000;
                else if (x == 15 && y == 59) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 16) && (x <= 21) && (y == 60)) oled_data <= 16'b11111_000000_00000;
                else if (x == 16 && y == 53) oled_data <= 16'b11111_000000_00000;
                else if (x == 21 && y == 53) oled_data <= 16'b11111_000000_00000;
                else if (x == 15 && y == 56) oled_data <= 16'b11111_000000_00000;
                else if (x == 22 && y == 56) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 16 && x <= 21) && (y == 49)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 27) && (x <= 40) && (y >= 48) && (y <= 60))
            begin 
                if (square [16] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 31 && x <= 36) && (y == 49)) oled_data <= 16'b11111_000000_00000;
                else if (x == 30 && y == 50) oled_data <= 16'b11111_000000_00000;
                else if (x == 29 && y == 51) oled_data <= 16'b11111_000000_00000;
                else if ((x == 28) && (y >= 52) && (y <= 57)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 39) && (y >= 52) && (y <= 57)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 29 && y == 58)) oled_data <= 16'b11111_000000_00000;
                else if (x == 30 && y == 59) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 31) && (x <= 36) && (y == 60)) oled_data <= 16'b11111_000000_00000;
                else if (x == 31 && y == 53) oled_data <= 16'b11111_000000_00000;
                else if (x == 36 && y == 53) oled_data <= 16'b11111_000000_00000;
                else if (x == 30 && y == 56) oled_data <= 16'b11111_000000_00000;
                else if (x == 37 && y == 56) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 31 && x <= 36) && (y == 49)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 42) && (x <= 55) && (y >= 48) && (y <= 60))
            begin 
                if (square [17] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 46 && x <= 51) && (y == 49)) oled_data <= 16'b11111_000000_00000;
                else if (x == 45 && y == 50) oled_data <= 16'b11111_000000_00000;
                else if (x == 44 && y == 51) oled_data <= 16'b11111_000000_00000;
                else if ((x == 43) && (y >= 52) && (y <= 57)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 54) && (y >= 52) && (y <= 57)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 44 && y == 58)) oled_data <= 16'b11111_000000_00000;
                else if (x == 45 && y == 59) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 46) && (x <= 51) && (y == 60)) oled_data <= 16'b11111_000000_00000;
                else if (x == 46 && y == 53) oled_data <= 16'b11111_000000_00000;
                else if (x == 50 && y == 53) oled_data <= 16'b11111_000000_00000;
                else if (x == 45 && y == 56) oled_data <= 16'b11111_000000_00000;
                else if (x == 52 && y == 56) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 46 && x <= 61) && (y == 49)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 57) && (x <= 70) && (y >= 48) && (y <= 60))
            begin 
                if (square [18] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 61 && x <= 66) && (y == 49)) oled_data <= 16'b11111_000000_00000;
                else if (x == 60 && y == 50) oled_data <= 16'b11111_000000_00000;
                else if (x == 59 && y == 51) oled_data <= 16'b11111_000000_00000;
                else if ((x == 58) && (y >= 52) && (y <= 57)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 69) && (y >= 52) && (y <= 57)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 59 && y == 58)) oled_data <= 16'b11111_000000_00000;
                else if (x == 60 && y == 59) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 61) && (x <= 66) && (y == 60)) oled_data <= 16'b11111_000000_00000;
                else if (x == 61 && y == 53) oled_data <= 16'b11111_000000_00000;
                else if (x == 65 && y == 53) oled_data <= 16'b11111_000000_00000;
                else if (x == 60 && y == 56) oled_data <= 16'b11111_000000_00000;
                else if (x == 67 && y == 56) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 61 && x <= 66) && (y == 49)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else if ((x >= 72) && (x <= 85) && (y >= 48) && (y <= 60))
            begin 
                if (square [19] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((x >= 76 && x <= 81) && (y == 49)) oled_data <= 16'b11111_000000_00000;
                else if (x == 75 && y == 50) oled_data <= 16'b11111_000000_00000;
                else if (x == 74 && y == 51) oled_data <= 16'b11111_000000_00000;
                else if ((x == 73) && (y >= 52) && (y <= 57)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 84) && (y >= 52) && (y <= 57)) oled_data <= 16'b11111_000000_00000;
                else if ((x == 74 && y == 58)) oled_data <= 16'b11111_000000_00000;
                else if (x == 75 && y == 59) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 76) && (x <= 81) && (y == 60)) oled_data <= 16'b11111_000000_00000;
                else if (x == 76 && y == 53) oled_data <= 16'b11111_000000_00000;
                else if (x == 80 && y == 53) oled_data <= 16'b11111_000000_00000;
                else if (x == 75 && y == 56) oled_data <= 16'b11111_000000_00000;
                else if (x == 77 && y == 56) oled_data <= 16'b11111_000000_00000;
                else if ((x >= 76 && x <= 81) && (y == 49)) oled_data <= 16'b11111_000000_00000;
                else oled_data <= 16'b00000_000000_00000;
                end
            end
        else 
            begin
                oled_data <= 16'b11111_111111_11111;
            end
        end
endmodule
