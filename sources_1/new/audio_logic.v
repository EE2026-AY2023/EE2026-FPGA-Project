`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2023 14:11:01
// Design Name: 
// Module Name: audio_individual_task
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


module audio_logic(
    input clk100M, clk200, clk400,
    input [3:0] state,
    input pushbutton,
    input [15:0] sw,
    input valid,
    input [3:0] valid_number,
    input [4:0] maze_position, maze_bomb,
    output reg [11:0] audio_out = 0
    );
    
    parameter [3:0] grp_task = 4'b0001;
    parameter [3:0] grp_impr = 4'b0010;
    parameter [3:0] b_task = 4'b0111;
    parameter [3:0] b_improv = 4'b1000;
    parameter [3:0] d_improv = 4'b1110;
    
    wire [11:0] keys_pressed = sw[13:2];
    
    wire [11:0] individual_task_out;
    wire [11:0] group_task_out;
    wire [11:0] individual_improvement_out;
    wire [11:0] group_improvement_out;
    
    always @ state begin
        case (state)
            grp_task : begin
                if(valid == 1)
                    audio_out <= group_task_out;
            end
            grp_impr : audio_out <= group_improvement_out;
            b_task : audio_out <= individual_task_out;
            b_improv : audio_out <= individual_improvement_out;
            d_improv : audio_out <= individual_improvement_out;
            default : audio_out <= 0;
        endcase
    end
    //assign audio_out = (sw[1] == 1) ? individual_improvement_out : (valid == 1) ? group_task_out : individual_task_out;
    
    audio_individual_task individual_task(clk100M, clk200, clk400, pushbutton, sw[0], individual_task_out);
    audio_group_task group_task(clk100M, clk200, valid, valid_number, group_task_out);
    audio_individual_improvement individual_improvement(clk100M, keys_pressed, individual_improvement_out);
    maze_proximity group_improvement(clk100M, maze_position, maze_bomb, group_improvement_out);
    
endmodule
