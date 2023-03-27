`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2023 13:42:29
// Design Name: 
// Module Name: get_wall
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


module get_wall(
    input [4:0] current,
    input [1:0] direction,
    input [30:0] walls,
    output reg wall_exists = 0,
    output reg [4:0] wall = 0
    );

    parameter up = 0;
    parameter right = 1;
    parameter down = 2;
    parameter left = 3;
    
    wire neighbour_exists;
    wire [4:0] neighbour;
    get_neighbour get_neighbour(current, direction, neighbour_exists, neighbour);
    
    wire [2:0] x;
    wire [1:0] y;
    get_coordinate get_coordinates(current, x, y);
    
    always @ * begin
        if(neighbour_exists == 0)
            wall_exists = 1;
        else begin
            case (direction)
                up      : wall = 11 + 5 * y + x;
                right   : wall = 4 * y + x;
                down    : wall = 16 + 5 * y + x;
                left    : wall = 4 * y + (x - 1);
            endcase
        
            wall_exists = walls[wall];
        end
    end
    
endmodule
