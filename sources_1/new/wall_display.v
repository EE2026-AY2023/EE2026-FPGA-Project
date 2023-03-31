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
    wire [2:0] curr_x;
    wire [1:0] curr_y;
    wire [6:0] oled_pos_x , oled_pos_y;
    assign oled_pos_x = (curr_x+1) * 15 + 2;
    assign oled_pos_y = curr_y * 15 + 3;
    get_coordinate curr(position,curr_x, curr_y);
    wire [3:0] px, py;
    assign px = x - oled_pos_x;
    assign py = y - oled_pos_y;
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
         else if ((x >= oled_pos_x) && (x <= oled_pos_x+14) && (y >= oled_pos_y) && (y <= oled_pos_y+14))
            begin 
                if (square [0] == 0) begin
                    oled_data <= 16'b11111_111111_11111;
                end
                else begin
                if ((py == 7 && px == 1) || (py == 8 && px == 1) || (py == 7 && px == 2) || (py == 8 && px == 2) || (py == 5 && px == 3) || (py == 6 && px == 3) || (py == 9 && px == 3) || (py == 5 && px == 4) || (py == 6 && px == 4) || (py == 9 && px == 4) || (py == 2 && px == 6) || (py == 9 && px == 6) || (py == 2 && px == 7) || (py == 9 && px == 7) || (py == 3 && px == 9) || (py == 4 && px == 9) || (py == 9 && px == 9) || (py == 3 && px == 10) || (py == 4 && px == 10) || (py == 9 && px == 10) || (py == 2 && px == 11)) oled_data <= 16'hcc88;
                else if ((py == 5 && px == 1) || (py == 6 && px == 1) || (py == 9 && px == 1) || (py == 5 && px == 2) || (py == 6 && px == 2) || (py == 9 && px == 2) || (py == 10 && px == 3) || (py == 11 && px == 3) || (py == 12 && px == 3) || (py == 13 && px == 3) || (py == 10 && px == 4) || (py == 11 && px == 4) || (py == 12 && px == 4) || (py == 13 && px == 4) || (py == 9 && px == 5) || (py == 10 && px == 5) || (py == 11 && px == 5) || (py == 3 && px == 6) || (py == 4 && px == 6) || (py == 5 && px == 6) || (py == 6 && px == 6) || (py == 7 && px == 6) || (py == 8 && px == 6) || (py == 10 && px == 6) || (py == 11 && px == 6) || (py == 3 && px == 7) || (py == 4 && px == 7) || (py == 5 && px == 7) || (py == 6 && px == 7) || (py == 7 && px == 7) || (py == 8 && px == 7) || (py == 10 && px == 7) || (py == 11 && px == 7) || (py == 3 && px == 8) || (py == 4 && px == 8) || (py == 7 && px == 8) || (py == 8 && px == 8) || (py == 9 && px == 8) || (py == 10 && px == 8) || (py == 11 && px == 8) || (py == 12 && px == 8) || (py == 13 && px == 8) || (py == 7 && px == 9) || (py == 8 && px == 9) || (py == 10 && px == 9) || (py == 11 && px == 9) || (py == 5 && px == 10) || (py == 6 && px == 10) || (py == 7 && px == 10) || (py == 8 && px == 10) || (py == 10 && px == 10) || (py == 11 && px == 10) || (py == 3 && px == 11) || (py == 4 && px == 11) || (py == 7 && px == 11) || (py == 8 && px == 11)) oled_data <= 16'hdd6e;
                else if ((py == 12 && px == 5) || (py == 13 && px == 5) || (py == 12 && px == 9) || (py == 13 && px == 9) || (py == 12 && px == 10) || (py == 13 && px == 10)) oled_data <= 16'h9346;
                else if ((py == 5 && px == 8) || (py == 6 && px == 8) || (py == 5 && px == 9) || (py == 6 && px == 9) || (py == 5 && px == 11) || (py == 6 && px == 11) || (py == 5 && px == 12) || (py == 6 && px == 12)) oled_data <= 16'he803;
                else oled_data <= 16'b11111_111111_11111;
                end
            end
         end
//        else if ((x >= 27) && (x <= 40) && (y >= 3) && (y <= 16))
//            begin 
//                if (square [1] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
                
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 42) && (x <= 55) && (y >= 3) && (y <= 16))
//            begin 
//                if (square [2] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
//                if ((x >= 46 && x <= 51) && (y == 4)) oled_data <= 16'b11111_000000_00000;
//                else if (x == 45 && y == 5) oled_data <= 16'b11111_000000_00000;
//                else if (x == 44 && y == 6) oled_data <= 16'b11111_000000_00000;
//                else if ((x == 43) && (y >= 7) && (y <= 12)) oled_data <= 16'b11111_000000_00000;
//                else if ((x == 54) && (y >= 7) && (y <= 12)) oled_data <= 16'b11111_000000_00000;
//                else if ((x == 44 && y == 13)) oled_data <= 16'b11111_000000_00000;
//                else if (x == 45 && y == 14) oled_data <= 16'b11111_000000_00000;
//                else if ((x >= 46) && (x <= 51) && (y == 15)) oled_data <= 16'b11111_000000_00000;
//                else if (x == 46 && y == 8) oled_data <= 16'b11111_000000_00000;
//                else if (x == 50 && y == 8) oled_data <= 16'b11111_000000_00000;
//                else if (x == 45 && y == 11) oled_data <= 16'b11111_000000_00000;
//                else if (x == 52 && y == 11) oled_data <= 16'b11111_000000_00000;
//                else if ((x >= 46 && x <= 61) && (y == 14)) oled_data <= 16'b11111_000000_00000;
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 57) && (x <= 70) && (y >= 3) && (y <= 16))
//            begin 
//                if (square [3] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
                
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 72) && (x <= 85) && (y >= 3) && (y <= 16))
//            begin 
//                if (square [4] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
                
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
        
//        else if ((x >= 12) && (x <= 25) && (y >= 18) && (y <= 31))
//            begin 
//                if (square [5] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
                
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 27) && (x <= 40) && (y >= 18) && (y <= 31))
//            begin 
//                if (square [6] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
                
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 42) && (x <= 55) && (y >= 18) && (y <= 31))
//            begin 
//                if (square [7] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
                
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 57) && (x <= 70) && (y >= 18) && (y <= 31))
//            begin 
//                if (square [8] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
                
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 72) && (x <= 85) && (y >= 18) && (y <= 31))
//            begin 
//                if (square [9] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
                
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 12) && (x <= 25) && (y >= 33) && (y <= 46))
//            begin 
//                if (square [10] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
                
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 27) && (x <= 40) && (y >= 33) && (y <= 46))
//            begin 
//                if (square [11] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
                
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 42) && (x <= 55) && (y >= 33) && (y <= 46))
//            begin 
//                if (square [12] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
                
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 57) && (x <= 70) && (y >= 33) && (y <= 46))
//            begin 
//                if (square [13] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
                
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 72) && (x <= 85) && (y >= 33) && (y <= 46))
//            begin
//            if (square [14] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
                
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 12) && (x <= 25) && (y >= 48) && (y <= 60))
//            begin 
//                if (square [15] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
                
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 27) && (x <= 40) && (y >= 48) && (y <= 60))
//            begin 
//                if (square [16] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
                
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 42) && (x <= 55) && (y >= 48) && (y <= 60))
//            begin 
//                if (square [17] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
               
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 57) && (x <= 70) && (y >= 48) && (y <= 60))
//            begin 
//                if (square [18] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
               
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else if ((x >= 72) && (x <= 85) && (y >= 48) && (y <= 60))
//            begin 
//                if (square [19] == 0) begin
//                    oled_data <= 16'b11111_111111_11111;
//                end
//                else begin
               
//                else oled_data <= 16'b11111_111111_11111;
//                end
//            end
//        else 
//            begin
//                oled_data <= 16'b11111_111111_11111;
//            end
//        end
endmodule
