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
    input [6:0] x, y,
    output reg [15:0] oled_data = 0
    );

    always @ (posedge clock) begin
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
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x == 41) && (y >= 3) && (y <= 17))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x == 56) && (y >= 3) && (y <= 17))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x == 71) && (y >= 3) && (y <= 17))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x == 26) && (y >= 18) && (y <= 32))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x == 41) && (y >= 18) && (y <= 32))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x == 56) && (y >= 18) && (y <= 32))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x == 71) && (y >= 18) && (y <= 32))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x == 26) && (y >= 33) && (y <= 47))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x == 41) && (y >= 33) && (y <= 47))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x == 56) && (y >= 33) && (y <= 47))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x == 71) && (y >= 33) && (y <= 47))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x == 26) && (y >= 48) && (y <= 60))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x == 41) && (y >= 48) && (y <= 60))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x == 56) && (y >= 48) && (y <= 60))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x == 71) && (y >= 48) && (y <= 60))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        
        else if ((x >= 12) && (x <= 35) && (y == 17))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x >= 27) && (x <= 40) && (y == 17))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x >= 42) && (x <= 55) && (y == 17))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x >= 57) && (x <= 70) && (y == 17))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x >= 72) && (x <= 35) && (y == 17))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x >= 12) && (x <= 35) && (y == 32))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x >= 27) && (x <= 40) && (y == 32))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x >= 42) && (x <= 55) && (y == 32))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x >= 57) && (x <= 70) && (y == 32))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x >= 72) && (x <= 35) && (y == 32))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x >= 12) && (x <= 35) && (y == 47))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x >= 27) && (x <= 40) && (y == 47))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x >= 42) && (x <= 55) && (y == 47))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x >= 57) && (x <= 70) && (y == 47))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        else if ((x >= 72) && (x <= 35) && (y == 47))
            begin
                oled_data <= 16'b00000_000000_00000;
            end
        end
endmodule
