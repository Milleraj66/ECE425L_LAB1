`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: ShiftReg
// AUTHOR: ARTHUR J. MILLER
// Create Date: 10/03/2015 08:58:39 PM
// ECE425L LAB #1, Problem 3
// Purpose: Develop a structural Verilog model for a 4-bit shift register. 
//          Your shift register should implement functions for LOAD, HOLD, 
//          RIGHT SHIFT and LEFT SHIFT. In addition to regular inputs, your 
//          shift register should provide a SHIFT LEFT INPUT and a SHIFT RIGHT 
//          INPUT that input the value shifted into the right-most and leftmost bits, 
//          respectively. Your register should also include an ENABLE input and a 
//          CLOCK input. Design your register to be a positive level-triggered device. 
//          Develop a test bench for your Verilog shift register that demonstrates 
//          each function.  Develop a testbench, perform a waveform simulation, and 
//          demonstrate the result to the Instructor.

// Variables:
//              E :  Enable input
//              Clk: Clock
//              Load: 
//              H: Hold the current values in the register
//              Funct: 3 bit input for selecting shift function needed
//                  RS (right shift):
//                  LS (left shift):
//                  RSI (right shift input):
//                  LSI (left shift input):
//              In: serial input data
//              Out:Serial output data

//              Building the shift reg with multiple modules like this for a 
//              SISO implemnation means we can only choose one function at a
//              time or the reg will be reset.

//              The decoder is 3-to-8 so we can expand the function paramter

//              The enable paramater needs to have logic setup

//              Need to fix so only one "Out" rather than four

//////////////////////////////////////////////////////////////////////////////////

//              Clock, Enable, Hold, Function, InputData, OutputData
module ShiftReg(Clk  , E     , H   , Funct   , In       , Out);
    input Clk, E, H, In;
    input [2:0] Funct;
    output Out;
    // Enable or disable shift reg modules depending on function selected
    wire [7:0] EF;
    
    //                                       Enable,Input(3b)    ,Output(8b)                
    Decoder_3to8                D1          (E     ,Funct        ,EF);
    
    // Instantiation of the 4 function modules
    //                                      Clock, Enable, DataIn, DataOut
    ShiftRight_4BitSerial       SR1         (Clk  ,EF[0] , In   , Out);
    //                                      Clock, Enable, DataIn, DataOut
    ShiftLeft_4BitSerial        SL1         (Clk  ,EF[1] , In   , Out);
    //                                       Clock, Enable, DataOut
    ShiftRightIn_4BitSerial     SRI1        (Clk  ,EF[2]  , Out);
    //                                       Clock, Enable, DataOut
    ShiftLeftIn_4BitSerial      SLI1        (Clk  ,EF[3]  , Out);
    
    
    
endmodule
