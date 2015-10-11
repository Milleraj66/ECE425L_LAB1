`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// AUTHOR: ARTHUR J. MILLER
// Create Date: 10/10/2015 05:02:38 PM
// Module Name: ShiftLeft_4BitSerial
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

//          Module for Serial I/O Shift Right for 4 bits
//////////////////////////////////////////////////////////////////////////////////


//                           Clock, Enable, DataIn, DataOut
module ShiftLeft_4BitSerial(Clk  ,E      , Din   , Dout);
    input Clk, E, Din;
    output Dout;
    wire [2:0] Q; // output for first 3 FF's
    
    // For now reset is always 0
    // Instantiate 4 D flip flop modules
    //                           Clock, Reset, Input, Output                                
    D_FF        dff1            (Clk  , 1'b0 , Q[2] , Dout); 
    //                           Clock, Reset, Input, Output                                
    D_FF        dff2            (Clk  , 1'b0 , Q[1] , Q[2]); 
    //                           Clock, Reset, Input, Output                                
    D_FF        dff3            (Clk  , 1'b0 , Q[0] , Q[1]); 
    //                           Clock, Reset, Input, Output                                
    D_FF        dff4            (Clk  , 1'b0 , Din  , Q[0]); 
    
endmodule