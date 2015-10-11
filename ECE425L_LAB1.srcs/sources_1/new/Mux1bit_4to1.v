`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 10/07/2015 08:04:29 PM
// Module Name: Mux1bit_4to1
// AUTHOR: ARTHUR J. MILLER
// ECE425L LAB #1, Problem 3
// Purpose: Generic 1bit 4-to-1 Mux
//////////////////////////////////////////////////////////////////////////////////

//                  Enable,Select,Input(4b),Output
module Mux1bit_4to1(E, S, In, Out);
    input E;
    input [1:0] S;
    input [3:0] In;
    output Out;
    // Intermediate wires between mux's
    wire Z0, Z1;
   
    // Instatiate 2 2-to-1 Mux's
    //                                   Enable,Select,Input1,Input2 ,Output
    Mux1bit_2to1        MUX1            (E     ,   S[0]  , In[0] , In[1], Z0);
    Mux1bit_2to1        MUX2            (E     ,   S[0]  , In[2] , In[3], Z1);
    Mux1bit_2to1        MUX3            (E     ,   S[1]  , Z0    , Z1   , Out);
endmodule 
