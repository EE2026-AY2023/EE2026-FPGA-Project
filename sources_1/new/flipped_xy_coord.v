`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2023 21:22:03
// Design Name: 
// Module Name: flipped_xy_coord
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


module flipped_xy_coord(
    input [12:0] pixel_index,
    output [6:0] x,
    output [6:0] y
    );
    assign x = (pixel_index % 96);
    assign y = 64 - (pixel_index / 96);
endmodule
