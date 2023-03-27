`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2023 20:38:29
// Design Name: 
// Module Name: clk_random
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


module clk_random(
    input clk100M,
    output [1:0] random
    );
    
    //62 out of 64 values covered, 21 & 42 not covered
    //21 = 6'b010101
    //42 = 6'b101010
    //if it reaches either of these values, it is stuck switching between them
    reg [5:0] number = 0;
    
    //from simulation, these bits give most distributed values
    assign random = {number[2], number[0]};
    
    always @ (posedge clk100M) begin
        if(number == 21)
            number <= 0;
        else begin
            number[5] <= number[4];
            number[4] <= number[3];
            number[3] <= number[2];
            number[2] <= number[1];
            number[1] <= number[0];
            number[0] <= ~(number[2] ^ number[3] ^ number[5]);
        end
    end
    
endmodule
