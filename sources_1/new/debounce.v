`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.03.2023 15:47:15
// Design Name: 
// Module Name: debounce
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

//credits: https://www.fpga4student.com/2017/04/simple-debouncing-verilog-code-for.html
module debounce(
    input clk100M,
    input pushbutton,
    output signal
    );
    wire slow_clk_en;
    wire Q1,Q2,Q2_bar,Q0;
    clock_enable u1(clk100M,slow_clk_en);
    my_dff_en d0(clk100M,slow_clk_en,pushbutton,Q0);
    
    my_dff_en d1(clk100M,slow_clk_en,Q0,Q1);
    my_dff_en d2(clk100M,slow_clk_en,Q1,Q2);
    assign Q2_bar = ~Q2;
    assign signal = Q1 & Q2_bar;
endmodule
// Slow clock enable for debouncing button 
module clock_enable(input Clk_100M,output slow_clk_en);
    reg [26:0]counter=0;
    always @(posedge Clk_100M)
    begin
        counter <= (counter>=20_000_000)?0:counter+1;
    end
    assign slow_clk_en = (counter == 20_000_000)?1'b1:1'b0;
endmodule
// D-flip-flop with clock enable signal for debouncing module 
module my_dff_en(input DFF_CLOCK, clock_enable,D, output reg Q=0);
    always @ (posedge DFF_CLOCK) begin
  if(clock_enable==1) 
           Q <= D;
    end
endmodule
