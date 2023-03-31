`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2023 14:31:25
// Design Name: 
// Module Name: maze_generator
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


module maze_generator(
    input clk,
    input [1:0] clk_random,
    input start_generating,
    output reg [30:0] walls = 31'h7FFFFFFF,
    output reg [4:0] bomb = 0
    );
    
    //dummy_walls = 31'b1111011110111100000000000000000;
    //all_walls = 31'h7FFFFFFF
    
    reg [19:0] visited = 0;
    
    reg [4:0] stack [19:0];
    reg [4:0] steps_from_start = 0;
    reg [4:0] current = 0;
    reg start = 0;
    
    reg [2:0] bomb_random = 0;
    
    
    always @ (posedge start_generating) begin
        //use clk and clk_random to decide a square for bomb
        bomb_random = (clk * 4) + clk_random;
        case (bomb_random)
            0 : bomb <= 8;
            1 : bomb <= 9;
            2 : bomb <= 12;
            3 : bomb <= 13;
            4 : bomb <= 14;
            5 : bomb <= 17;
            6 : bomb <= 18;
            7 : bomb <= 19;
        endcase
    end
    
    wire neighbour_exists;
    wire [4:0] neighbour;
    reg [1:0] direction = 0;
    reg direction_change = 0;
    get_neighbour get_neighbour(current, direction, neighbour_exists, neighbour);
    
    wire wall_exists;
    wire [4:0] wall;
    get_wall get_wall(current, direction, walls, wall_exists, wall);
    
    wire clk1000;
    clock_freq clock_1000Hz(clk, 500_000, clk1000);
    reg generation_complete = 1;
    
    always @ (posedge clk1000) begin   
        if(generation_complete == 1) begin
            if(start_generating == 1) begin
                walls <= 31'h7FFFFFFF;
                visited <= 0;
                steps_from_start <= 0;
                current <= 0;
                
                generation_complete = 0;
            end
        end
        else begin 
            visited[current] = 1;
            stack[steps_from_start] = current;
            direction = clk_random;
            direction_change = direction[0];
            
            #1_000;
            //check if neighbours visited
            if(neighbour_exists == 1 && visited[neighbour] == 0) begin
                walls[wall] = 0;
                steps_from_start <= steps_from_start + 1;
                current <= neighbour;
            end
            else begin
                if(direction_change == 1)
                    direction = direction + 1;
                else
                    direction = direction - 1;
                #1_000;
                if(neighbour_exists == 1 && visited[neighbour] == 0) begin
                    walls[wall] = 0;
                    steps_from_start <= steps_from_start + 1;
                    current <= neighbour;
                end
                else begin
                    if(direction_change == 1)
                        direction = direction + 1;
                    else
                        direction = direction - 1;
                    #1_000;
                    if(neighbour_exists == 1 && visited[neighbour] == 0) begin
                        walls[wall] = 0;
                        steps_from_start <= steps_from_start + 1;
                        current <= neighbour;
                    end
                    else begin
                        if(direction_change == 1)
                            direction = direction + 1;
                        else
                            direction = direction - 1;
                        #1_000;
                        if(neighbour_exists == 1 && visited[neighbour] == 0) begin
                            walls[wall] = 0;
                            steps_from_start <= steps_from_start + 1;
                            current <= neighbour;
                        end
                        //if all neighbours visited
                        else begin
                            //backtrack if not at starting square
                            if(current !== 0) begin
                                steps_from_start = steps_from_start - 1;
                                current <= stack[steps_from_start];
                            end
                            else
                                generation_complete = 1;
                            //if at current, means all squares have been visited
                        end
                    end
                end
            end    
        end
    end
    
    
    
//    always @ (current or start_generating) begin
//        if(start_generating == 1) begin
//            walls <= 31'h7FFFFFFF; #10;
//            visited <= 0;
//            steps_from_start <= 0;
//            current <= 0;
//        end
        
        
//        visited[current] = 1;
//        stack[steps_from_start] = current;
//        direction = clk_random;
//        direction_change = direction[0];
        
//        #50;
//        //check if neighbours visited
//        if(neighbour_exists == 1 && visited[neighbour] == 0) begin
//            walls[wall] = 0;
//            steps_from_start <= steps_from_start + 1;
//            current <= neighbour;
//        end
//        else begin
//            if(direction_change == 1)
//                direction = direction + 1;
//            else
//                direction = direction - 1;
//            #50;
//            if(neighbour_exists == 1 && visited[neighbour] == 0) begin
//                walls[wall] = 0;
//                steps_from_start <= steps_from_start + 1;
//                current <= neighbour;
//            end
//            else begin
//                if(direction_change == 1)
//                    direction = direction + 1;
//                else
//                    direction = direction - 1;
//                #50;
//                if(neighbour_exists == 1 && visited[neighbour] == 0) begin
//                    walls[wall] = 0;
//                    steps_from_start <= steps_from_start + 1;
//                    current <= neighbour;
//                end
//                else begin
//                    if(direction_change == 1)
//                        direction = direction + 1;
//                    else
//                        direction = direction - 1;
//                    #50;
//                    if(neighbour_exists == 1 && visited[neighbour] == 0) begin
//                        walls[wall] = 0;
//                        steps_from_start <= steps_from_start + 1;
//                        current <= neighbour;
//                    end
//                    //if all neighbours visited
//                    else begin
//                        //backtrack if not at starting square
//                        if(current !== 0) begin
//                            steps_from_start = steps_from_start - 1;
//                            current <= stack[steps_from_start];
//                        end
//                        //else
//                        //generation_completed = 1;
//                        //if at current, means all squares have been visited
//                    end
//                end
//            end
//        end
//    end
    
endmodule
