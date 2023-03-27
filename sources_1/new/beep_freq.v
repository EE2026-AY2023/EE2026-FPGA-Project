`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 22:55:36
// Design Name: 
// Module Name: beep_freq
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


module beep_freq(
    input clk,
    output reg [11:0] audio_out
    );
    
    always @ (clk) begin
        audio_out = (clk == 1) ? 12'hFFF : 0;
    end
    
endmodule
