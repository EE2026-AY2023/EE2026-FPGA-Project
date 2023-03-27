`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//  STUDENT A NAME: 
//  STUDENT B NAME:
//  STUDENT C NAME: 
//  STUDENT D NAME:  
//
//////////////////////////////////////////////////////////////////////////////////
module Top_Student (
    input clock,
    input [15:0] sw,
    input btnC, btnD,btnU,btnL,btnR,
    
    //7-segment display
    output [3:0] an,
    output [6:0] seg,
    output dp,
    
    output [3:0] JB,
    
    //For audio input
    input JA3,
    output JA1, JA4,
    
   //For OLED display
    inout PS2Clk, PS2Data,
    output [15:0] led,
    output [7:0] JC,JXADC
    );
    parameter [3:0] group = 4'b0000;
    parameter [3:0] studentA = 4'b0011;
    parameter [3:0] studentB = 4'b0110;
    parameter [3:0] studentC = 4'b1001;
    parameter [3:0] studentD = 4'b1100;
    parameter [3:0] grp_task = 4'b0001;
    parameter [3:0] grp_impr = 4'b0010;
    parameter [3:0] a_task = 4'b0100;
    parameter [3:0] a_improv = 4'b0101;
    parameter [3:0] b_task = 4'b0111;
    parameter [3:0] b_improv = 4'b1000;
    parameter [3:0] c_task = 4'b1010;
    parameter [3:0] c_improv = 4'b1011;
    parameter [3:0] d_task = 4'b1101;
    parameter [3:0] d_improv = 4'b1110;
    //audio out
    //clocks for audio out
    wire clk20k;
    wire clk50M;
    wire clk200;
    wire clk400;
    
    //period = 50M / freq
    clock_freq clock_20kHz(clock, 2_500, clk20k);
    clock_freq clock_50MHz(clock, 1, clk50M);
    clock_freq clock_200Hz(clock, 250_000, clk200);
    clock_freq clock_400Hz(clock, 125_000, clk400);

    //audio input stuff
    wire [11:0] MIC_in;
    wire [8:0] first_nine_LED;
    wire [3:0] audio_input_number;
    wire AN0;
    wire [3:0] task_input_number;
    //audio improv stuff
    wire [8:0] LED_morse;
    wire [3:0] improv_input_number;
    
    Audio_Input unit_Audio (
        .CLK(clock), // 100MHz clock
        .cs(clk20k), // sampling clock, 20kHz
        .MISO(JA3), // J_MIC3_Pin3, serial mic input
        .clk_samp(JA1), // J_MIC3_Pin1
        .sclk(JA4), // J_MIC3_Pin4, MIC3 serial clock
        .sample(MIC_in) // 12-bit audio sample data
        );
        
    audio_input_task audio_task(clk20k, MIC_in, first_nine_LED, AN0, task_input_number);
    
    //audio_improv 
    audio_input_improv audio_improv(clk20k, MIC_in, sw[1], LED_morse, AN0, improv_input_number); 
    
    wire is_valid_number;
    wire [3:0] valid_number;

    //group task audio
    //replace sw[15] and valid_number with signal from oled
    wire valid;
    button_sensor test_valid(clock, sw[15], valid);
    
    //audio out stuff
    wire [11:0] audio_out;
    
    audio_logic audio_main(clock, clk200, clk400, btnC, sw, is_valid_number, valid_number, audio_out);
        
    Audio_Output speaker(
    .CLK(clk50M), .START(clk20k), .DATA1(audio_out), .RST(0),
    .D1(JB[1]), .D2(JB[2]), .CLK_OUT(JB[3]), .nSYNC(JB[0])
    );
    
    //mouse instantiation
    reg rst = 0;
    wire[11:0] mouse_xpos, mouse_ypos;
    wire[3:0] mouse_zpos;
    wire mouse_left_click, mouse_middle_click, mouse_right_click, mouse_new_event;
    MouseCtl mouse(
    .clk(clock), .rst(rst), 
    .xpos(mouse_xpos), .ypos(mouse_ypos), .zpos(mouse_zpos), 
    .left(mouse_left_click), .middle(mouse_middle_click), .right(mouse_right_click), .new_event(mouse_new_event),
    .value(0), .setx(0), .sety(0), .setmax_x(0), .setmax_y(0),
    .ps2_clk(PS2Clk), .ps2_data(PS2Data)
    );
    
    //OLED Instantiation
    wire clk6p25m;
    clk_div slow_clk6p25(clock,7, clk6p25m);
    
    wire [15:0] oled_data;
    wire frame_begin, sending_pixels, sample_pixel;
    wire [12:0] pixel_index;
    
    Oled_Display oled(
    .clk(clk6p25m), .reset(rst), .frame_begin(frame_begin), .sending_pixels(sending_pixels),
    .sample_pixel(sample_pixel), .pixel_index(pixel_index), .pixel_data(oled_data), 
    .cs(JC[0]), .sdin(JC[1]), .sclk(JC[3]), .d_cn(JC[4]), .resn(JC[5]), .vccen(JC[6]), .pmoden(JC[7])
    );
    
    
    //menu student c improvement
    wire [15:0] menu_oled_data;
    wire menu_frame_begin, menu_sending_pixels, menu_sample_pixel;
    wire [12:0] menu_pixel_index;
    
    wire [6:0] menu_oled_x;
    wire [6:0] menu_oled_y;
    flipped_xy_coord xy_menu(menu_pixel_index, menu_oled_x, menu_oled_y);
    wire clean_btnD;
    debounce test_btnD(clock, btnD, clean_btnD);
    wire clean_btnU;
    debounce test_btnU(clock, btnU, clean_btnU);
    wire clean_btnR;
    debounce test_btnR(clock, btnR, clean_btnR);
    wire clean_btnL;
    debounce test_btnL(clock, btnL, clean_btnL);
    wire [3:0] state;
    menu menu_disp(clock,clean_btnU,clean_btnD,clean_btnL,clean_btnR,sw[14],menu_oled_x,menu_oled_y,menu_oled_data,state);
    //menu menu_disp(clock,sw[0],sw[1],sw[2],sw[3],sw[14],menu_oled_x,menu_oled_y,menu_oled_data);
    
    Oled_Display menu_oled(
    .clk(clk6p25m), .reset(rst), .frame_begin(menu_frame_begin), .sending_pixels(menu_sending_pixels),
    .sample_pixel(menu_sample_pixel), .pixel_index(menu_pixel_index), .pixel_data(menu_oled_data), 
    .cs(JXADC[0]), .sdin(JXADC[1]), .sclk(JXADC[3]), .d_cn(JXADC[4]), .resn(JXADC[5]), .vccen(JXADC[6]), .pmoden(JXADC[7])
    );
    
            
    wire [6:0] oled_x;
    wire [6:0] oled_y;
    oled_x_y_coord xy(pixel_index, oled_x, oled_y);
    
    //Student C
    wire [6:0] mouse_x_scale;
    wire [6:0] mouse_y_scale;
    mouse_xy_scale xy_scale(mouse_xpos, mouse_ypos, mouse_x_scale, mouse_y_scale);
    wire [15:0] c_indiv_oled_data;
    stu_C_indiv_task c_indiv_task(clock, mouse_middle_click, oled_x, oled_y, mouse_x_scale, mouse_y_scale, c_indiv_oled_data);
    
    //Student C improvement: Find the white game 
    wire [15:0] ftw_oled_data;
    find_the_white ftw_game(clock, mouse_left_click, oled_x, oled_y, ftw_oled_data);

    //Student D
    wire [15:0] d_indiv_oled_data;
    stu_D_indiv_task d_indiv_task(clock, oled_x, oled_y, sw, d_indiv_oled_data);
    
    //Student D improvement: Piano display
    wire [15:0] oled_oled_data;
    oled_individual_improvement piano_display(clock, oled_x, oled_y, sw, oled_oled_data);
        
    wire[15:0] group_task_oled_data;
    wire [6:0] clicked;

    group_task task_group(clock, oled_x, oled_y, mouse_x_scale, mouse_y_scale, sw, clicked, group_task_oled_data);  
     
    group_mouse_click group_task_click(
    clock, mouse_left_click, mouse_right_click, mouse_x_scale, mouse_y_scale, sw[15],
    clicked, is_valid_number, valid_number);
    wire [3:0] an_group;
    
    assign audio_input_number = state == a_improv ? (sw[1] ? improv_input_number : task_input_number) : task_input_number;
    
    seven_seg_display seven_seg_display(clk20k, is_valid_number, valid_number, audio_input_number, an_group, seg, dp);
    
    //assignment of anodes of 7-segment display
    assign an[3] = an_group[3];
    assign an[2] = an_group[2];
    assign an[1] = an_group[1];
    assign an[0] = AN0;
    
    //assignment of LEDs
    assign led[15] = state == c_task ? ((mouse_left_click)? 1 : 0) : (state == grp_task && sw[15]) ? is_valid_number : 0;
    assign led[14] = (mouse_middle_click)? 1 : 0;
    assign led[13] = (mouse_right_click)? 1 : 0;
    assign led[8:0] = state == a_improv ? (sw[1] ? LED_morse : first_nine_LED) : first_nine_LED;
    
    assign oled_data = state == grp_task ? group_task_oled_data : (state == c_task ? c_indiv_oled_data : state == d_task ? d_indiv_oled_data :(state == c_improv ? ftw_oled_data : 0));
        
endmodule
