`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2023 18:21:04
// Design Name: 
// Module Name: get_coordinate
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


module get_coordinate(
    input [4:0] square,
    output [2:0] x,
    output [1:0] y
);

    assign x = square % 5;
    assign y = square / 5;

endmodule
