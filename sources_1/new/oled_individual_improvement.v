`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2023 10:21:27
// Design Name: 
// Module Name: oled_individual_improvement
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


module oled_individual_improvement(
    input clock,
    input [6:0] x, y,
    input [13:0] sw,
    output reg [15:0] oled_data = 0
    );

    always @ (posedge clock) begin
    
         if ((x == 12) && (y >= 9) && (y <= 55)) 
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x == 84) && (y >= 9) && (y <= 55)) 
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x >= 12) && (x <=  85) && (y == 9)) 
               begin
                   oled_data <= 16'b00000_000000_00000;
               end 
         else if ((x >= 12) && (x <= 85) && (y == 55))
               begin 
                   oled_data <= 16'b00000_000000_00000;
               end
        
         else if ((x == 23) && (y >= 36) && (y <= 55))  
               begin 
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x == 33) && (y >= 36) && (y <= 55))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x == 43) && (y >= 10) && (y <= 55))
               begin 
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x == 53) && (y >= 36) && (y <= 55))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x == 63) && (y >= 36) && (y <= 55))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end 
         else if ((x == 73) && (y >= 36) && (y <= 55))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
               
         else if ((x >= 21) && (x <= 25) && (y == 35))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x >= 31) && (x <= 35) && (y == 35))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x >= 51) && (x <= 55) && (y == 35))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x >= 61) && (x <= 65) && (y == 35))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x >= 71) && (x <= 75) && (y == 35))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         
         else if ((x == 21) && (y >= 9) && (y <= 35))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x == 25) && (y >= 9) && (y <= 35))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x == 31) && (y >= 9) && (y <= 35))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x == 35) && (y >= 9) && (y <= 35))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x == 51) && (y >= 9) && (y <= 35))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x == 55) && (y >= 9) && (y <= 35))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x == 61) && (y >= 9) && (y <= 35))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x == 65) && (y >= 9) && (y <= 35))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x == 71) && (y >= 9) && (y <= 35))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         else if ((x == 75) && (y >= 9) && (y <= 35))
               begin
                   oled_data <= 16'b00000_000000_00000;
               end
         
        
         else if ((x >= 13) && (x <= 20) && (y >= 9) && (y <= 55))
               begin
                   oled_data <= (sw[2]) ? 16'b11111_000000_00000 : 16'b11111_111111_11111;
               end
         else if ((x >= 21) && (x <= 23) && (y >= 36) && (y <= 55)) // C
               begin
                   oled_data <= (sw[2]) ? 16'b11111_000000_00000 : 16'b11111_111111_11111;
               end
         
         else if ((x >= 21) && (x <= 25) && (y >= 9) && (y <= 35))  // C#
               begin
                   oled_data <= (sw[3]) ? 16'b11111_011010_00100 : 16'b00000_000000_00000;
               end
         
         else if ((x >= 25) && (x <= 30) && (y >= 9) && (y <= 55))
               begin
                   oled_data <= (sw[4]) ? 16'b11111_011111_00000 : 16'b11111_111111_11111;
               end
         else if ((x >= 23) && (x <= 24) && (y >= 36) && (y <= 55))
               begin
                   oled_data <= (sw[4]) ? 16'b11111_011111_00000 : 16'b11111_111111_11111;
               end
         else if ((x >= 31) && (x <= 33) && (y >= 36) && (y <= 55)) // D
               begin
                   oled_data <= (sw[4]) ? 16'b11111_011111_00000 : 16'b11111_111111_11111;
               end
        
         else if ((x >= 31) && (x <= 35) && (y >= 9) && (y <= 35))   // D#
               begin
                   oled_data <= (sw[5]) ? 16'b11111_111111_00000 : 16'b00000_000000_00000;
               end
        
         else if ((x >= 33) && (x <= 34) && (y >= 36) && (y <= 55))
               begin
                   oled_data <= (sw[6]) ? 16'b10101_111111_00110 : 16'b11111_111111_11111;
               end
         else if ((x >= 35) && (x <= 42) && (y >= 9) && (y <= 55)) // E
               begin
                   oled_data <= (sw[6]) ? 16'b10101_111111_00110 : 16'b11111_111111_11111;
               end
        
         else if ((x >= 43) && (x <= 50) && (y >= 9) && (y <= 55))
               begin
                   oled_data <= (sw[7]) ? 16'b00000_111111_00000 : 16'b11111_111111_11111;
               end
         else if ((x >= 51) && (x <= 52) && (y >= 36) && (y <= 55)) // F
               begin
                   oled_data <= (sw[7]) ? 16'b00000_111111_00000 : 16'b11111_111111_11111;
               end
        
         else if ((x >= 51) && (x <= 55) && (y >= 9) && (y <= 35))  // F#
               begin
                  oled_data <= (sw[8]) ? 16'b00110_101111_10111 : 16'b00000_000000_00000;
               end
        
         else if ((x >= 55) && (x <= 60) && (y >= 9) && (y <= 55))
               begin
                  oled_data <= (sw[9]) ? 16'b00000_000000_11111 : 16'b11111_111111_11111;
               end
         else if ((x >= 53) && (x <= 54) && (y >= 36) && (y <= 55))
               begin
                  oled_data <= (sw[9]) ? 16'b00000_000000_11111 : 16'b11111_111111_11111;
               end
         else if ((x >= 61) && (x <= 63) && (y >= 36) && (y <= 55)) // G
               begin
                  oled_data <= (sw[9]) ? 16'b00000_000000_11111 : 16'b11111_111111_11111;
               end
       
        else if ((x >= 61) && (x <= 65) && (y >= 9) && (y <= 35))  // G#
               begin
                  oled_data <= (sw[10]) ? 16'b01101_000000_11111 : 16'b00000_000000_00000;
               end
       
        else if ((x >= 65) && (x <= 70) && (y >= 9) && (y <= 55))
               begin
                  oled_data <= (sw[11]) ? 16'b11010_100000_10110 : 16'b11111_111111_11111;
               end
        else if ((x >= 63) && (x <= 64) && (y >= 36) && (y <= 55))
               begin
                  oled_data <= (sw[11]) ? 16'b11010_100000_10110 : 16'b11111_111111_11111;
               end
        else if ((x >= 71) && (x <= 73) && (y >= 36) && (y <= 55)) // A
               begin
                  oled_data <= (sw[11]) ? 16'b11010_100000_10110 : 16'b11111_111111_11111;
               end
      
        else if ((x >= 71) && (x <= 75) && (y >= 9) && (y <= 35))  // A#
              begin
                  oled_data <= (sw[12]) ? 16'b11110_000001_11110 : 16'b00000_000000_00000;
              end
      
        else if ((x >= 73) && (x <= 74) && (y >= 36) && (y <= 55))
              begin
                  oled_data <= (sw[13]) ? 16'b11111_101111_11001 : 16'b11111_111111_11111;
              end
        else if ((x >= 75) && (x <= 82) && (y >= 9) && (y <= 55)) // B
              begin
                  oled_data <= (sw[13]) ? 16'b11111_101111_11001 : 16'b11111_111111_11111;
              end
        else
              begin
                  oled_data <= 16'b00000_000000_00000;
              end
        end
endmodule
