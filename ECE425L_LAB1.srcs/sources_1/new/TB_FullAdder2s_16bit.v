`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////: 
// Author: Bibek B.
// Create Date: 10/07/2015 09:26:53 AM
// Module Name: TB_FullAdder2s_16bit
// ECE425L LAB #1, Problem 2
// Purpose: Develop a Verilog structural model for a two's complement adder. Develop 
//          a testbench, perform a waveform simulation, and demonstrate the output 
//          to the Instructor.


//      Testbench for FullAdder2s_16bit()
//////////////////////////////////////////////////////////////////////////////////


module TB_FullAdder2s_16bit( );
reg [15:0] x,y;
reg Cin;
wire [15:0]Sum;
wire Cout;

//                          input1(16b),input2(16b),CarryIn,CarryOut,Output(16b)
FullAdder2s_16bit       uut(x          ,y          ,Cin    ,Cout    ,Sum);
initial 
    begin
        x=0; y=0; Cin=0;
        #1 x=522; y=244; Cin=0;
        #1 x=1032; y=500; Cin=1;
        #1 x=7; y=7; Cin=1;
        #1 x=1501; y=800; Cin=1;
    end


endmodule
