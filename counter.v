`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: skyMeiJ
// 
// Create Date: 2018/04/22 00:02:30
// Design Name: 
// Module Name: my_counter_3
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


module my_counter_3(
    input clk,
    input  up,
    output reg [7:0]enable,//enable
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g
    );     

    wire my_clk;
    reg [3:0]in;
    wire [2:0]en;
    my_clk(clk,my_clk);//frequency 100M/2^26=1HZ
    count8(clk,en);  
    always@(posedge my_clk)
        if(up==0)
            in<=in-1;
        else 
            in<=in+1;
   always
    begin    
        if(up==0)begin//count down
             enable[3]<= ~(~en[2]  & ~en[1]  & ~en[0]);
             enable[2]<= ~(~en[2]  & ~en[1]  &  en[0]);
             enable[1]<= ~(~en[2]  &  en[1]  & ~en[0]);
             enable[0]<= ~(~en[2]  &  en[1]  &  en[0]);
             enable[7]<=  ~(en[2]  & ~en[1]  & ~en[0]);
             enable[6]<=  ~(en[2]  & ~en[1]  &  en[0]);
             enable[5]<=  ~(en[2]  &  en[1]  & ~en[0]); 
             enable[4]<=  ~(en[2]  &  en[1]  &  en[0]);  
            end           
         else  begin
             enable[4]<= ~(~en[2]  & ~en[1]  & ~en[0]);
             enable[5]<= ~(~en[2]  & ~en[1]  &  en[0]);
             enable[6]<= ~(~en[2]  &  en[1]  & ~en[0]); 
             enable[7]<= ~(~en[2]  &  en[1]  &  en[0]);
             enable[0]<=  ~(en[2]  & ~en[1]  & ~en[0]);
             enable[1]<=  ~(en[2]  & ~en[1]  &  en[0]);
             enable[2]<=  ~(en[2]  &  en[1]  & ~en[0]); 
             enable[3]<=  ~(en[2]  &  en[1]  &  en[0]);
            end
    end    
  // here using switch is more elegant, but I use logic function to display 7 segment display
  
  assign a = (~in[3] & ~in[2]& ~in[1] &  in[0])|( in[2] & ~in[0])|(in[3] & in[1]);
  assign b = ( in[2] & ~in[1]&  in[0])|( in[2] &  in[1] & ~in[0])|(in[3] & in[1]);
  assign c = (~in[2] &  in[1]& ~in[0])|( in[3] &  in[2]);
  assign d = (~in[2] & ~in[1]&  in[0])|( in[2] & ~in[1] & ~in[0])|(in[2] & in[1] & in[0]);
  assign e = ( in[0])|( in[2]& ~in[1]);             
  assign f = (~in[3] & ~in[2]&  in[0])|(~in[2] &  in[1])|( in[1] & in[0]);
  assign g = (~in[3] & ~in[2]& ~in[1])|( in[2] &  in[1] &  in[0]);                                                     
endmodule


