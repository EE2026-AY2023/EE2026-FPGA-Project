`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2023 23:35:27
// Design Name: 
// Module Name: lfsr
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

//credits: https://simplefpga.blogspot.com/2013/02/random-number-generator-in-verilog-fpga.html
module lfsr(
    input clock,
    input reset,
    output [4:0] rnd,
    input [4:0] start
    );
    reg [4:0] random, random_next, random_done;
    reg [2:0] count=0, count_next=0; //to keep track of the shifts
    wire feedback = random[4] ^ random[2]; 
    initial begin
        random=start;
        random_next=start;
        random_done=start;
    end
    always @ (posedge clock or posedge reset)
    begin
     if (reset)
     begin
      random <= 5'hF; //An LFSR cannot have an all 0 state, thus reset to FF
      count <= 0;
     end
     else
     begin
      random <= random_next;
      count <= count_next;
     end
    end
    
    always @ (*)
    begin
     random_next = random; //default state stays the same
     count_next = count;
     
     random_next = {random[3:0], feedback}; //shift left the xor'd every posedge clock
     count_next = count + 1;
    
     if (count == 5)
     begin
      count = 0;
      random_done = random; //assign the random number to output after 5 shifts
     end
    end
    
    assign rnd = random_done % 28;
endmodule
