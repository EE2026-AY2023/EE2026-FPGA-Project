`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2023 06:54:20 PM
// Design Name: 
// Module Name: player_position
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


module player_position(
    input btnD, btnU, btnL, btnR,
    output reg [4:0] position = 0 //start at the "0" square
    );
    
    wire x, y; //x-coor and y-coor of the player
    wire [4:0] neighbour_position; //square of neighbour
    reg [1:0] direction; //up == 0, down == 2, left == 3, right == 1
    
    reg [31:0] walls; //represents the maze as a whole
    reg [4:0] wall; 
    
    wire has_neighbour; 
    wire has_wall;
    
    get_neighbour(position, direction, has_neighbour, neighbour_position);
    get_wall(position, direction, walls, has_wall, wall); 
    get_square(x,y,position);
    
    //when button is pressed, check whether neighbour exists first
    //if neighbour exists, check whether there is a wall
    //then, move/dont move accordingly
    always @ (*) begin
        if(btnU == 1) begin //go up
            direction <= 0;
            if(has_neighbour == 1) begin
                if(has_wall == 0) begin
                    position <= neighbour_position;    
                end   
            end
        end
        if(btnD == 1) begin //go down
            direction <= 2;
            if(has_neighbour == 1) begin
                if(has_wall == 0) begin
                    position <= neighbour_position;    
                end 
            end      
        end
        if(btnL == 1) begin //go left
            direction <= 3;
            if(has_neighbour == 1) begin
                if(has_wall == 0) begin
                    position <= neighbour_position;    
                end 
            end     
        end
        if(btnR == 1) begin //go left
            direction <= 1;
            if(has_neighbour == 1) begin
                if(has_wall == 0) begin
                    position <= neighbour_position;    
                end 
            end 
        end
    end
endmodule
