`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// AUTHOR: ARTHUR J. MILLER
// Create Date: 10/03/2015 08:58:39 PM
// ECE425L LAB #1, Problem 1
// Purpose: D Flip Flop with reset module to be used in Sequential Circuits
// Variables:

//////////////////////////////////////////////////////////////////////////////////

//          Clock, Reset, Input, Output                                
module D_FF(Clk  , reset, D    , Q);
    input D, Clk, reset;
    output reg Q;
    
    always @(posedge Clk)
        if (reset)
            begin
                Q <= 1'b0;
            end 
        else
            begin
                Q <= D;
            end
endmodule 