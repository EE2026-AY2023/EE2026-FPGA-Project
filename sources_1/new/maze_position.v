`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 12:03:45
// Design Name: 
// Module Name: maze_position
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


module maze_position(
    input btnC, btnD, btnU, btnL, btnR, clock,
    input [30:0] walls,
    input start_game,
    output reg [4:0] position = 0 //start at the "0" square
    );
    
    //wire x, y; //x-coor and y-coor of the player
    wire [4:0] neighbour; //square of neighbour
    reg [1:0] direction = 0; //up == 0, down == 2, left == 3, right == 1
   
    reg [4:0] wall; 
    
    wire has_neighbour; 
    wire has_wall;
    
    get_neighbour get_neighour(position, direction, has_neighbour, neighbour);
    get_wall get_wall(position, direction, walls, has_wall, wall);
    
//    clk_random unit_random(clock, clk_random);
//    maze_generator unit_generator(clock, clk_random, btnC, walls, bomb);
//    get_neighbour unit_neighbour(position, direction, has_neighbour, neighbour_position);
//    get_wall unit_wall(position, direction, walls, has_wall, wall); 

    always @ (posedge start_game) begin
        position <= 0;
    end
    //when U, D, L, R, button is pressed, check whether neighbour exists first
    //if neighbour exists, check whether there is a wall
    //then, move/dont move accordingly
    //.......
    //if center btn is pressed, check whether player is at the bomb
    
    always @ (*) begin
        if(btnU == 1) begin //go up
            direction <= 0;
            if(has_neighbour == 1 && has_wall == 0) begin
                position <= neighbour;    
            end
        end
        if(btnD == 1) begin //go down
            direction <= 2;
            if(has_neighbour == 1 && has_wall == 0) begin
                position <= neighbour;    
            end   
        end
        if(btnL == 1) begin //go left
            direction <= 3;
            if(has_neighbour == 1 && has_wall == 0) begin
                position <= neighbour;    
            end
        end
        if(btnR == 1) begin //go left
            direction <= 1;
            if(has_neighbour == 1 && has_wall == 0) begin
                position <= neighbour;    
            end
        end
//        if(btnC == 1) begin //check if bomb located
//            if(position == bomb) begin
//                bomb_found <= 1;        
//            end
//        end
    end
endmodule
