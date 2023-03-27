`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2023 18:21:04
// Design Name: 
// Module Name: get_square
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


module get_square(
    input [2:0] x,
    input [1:0] y,
    output [4:0] square
    );
    
    assign square = y * 5 + x;
    
endmodule
