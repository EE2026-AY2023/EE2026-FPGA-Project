`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2023 18:02:42
// Design Name: 
// Module Name: get_neighbour
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


module get_neighbour(
    input [4:0] current,
    input [1:0] direction,
    output reg neighbour_exists = 0,
    output [4:0] neighbour
    );
    
    parameter up = 0;
    parameter right = 1;
    parameter down = 2;
    parameter left = 3;
    
    wire [2:0] x;
    wire [1:0] y;
    get_coordinate get_coordinates(current, x, y);
    
    reg [2:0] neighbour_x = 0;
    reg [1:0] neighbour_y = 0;
    get_square get_square(neighbour_x, neighbour_y, neighbour);
    
    always @ * begin
        if(
        (direction == up && y == 0) ||
        (direction == right && x == 4) ||
        (direction == down && y == 3) ||
        (direction == left && x == 0))
            neighbour_exists = 0;
        else begin
            neighbour_exists = 1;
            neighbour_x = x;
            neighbour_y = y;
            case (direction)
                up      : neighbour_y = y - 1;
                right   : neighbour_x = x + 1;
                down    : neighbour_y = y + 1;
                left    : neighbour_x = x - 1;
            endcase
        end
    end
    
endmodule
