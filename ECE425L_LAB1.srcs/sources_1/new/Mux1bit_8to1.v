`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 10/10/2015 06:18:37 PM
// Module Name: Mux1bit_8to1
// AUTHOR: ARTHUR J. MILLER
// ECE425L LAB #1, Problem 3
// Purpose: Generic 1bit 8-to-1 Mux
//////////////////////////////////////////////////////////////////////////////////

//                  Enable,Select(3bit),Input(8b),Output
module Mux1bit_8to1(E     , S          , In      , Out);
    input E;
    input [2:0] S;
    input [7:0] In;
    output Out;
    // Intermediate wires between mux's
    wire Z0, Z1;
   
    // Instatiate two 4-to-1 Mux's & one 2-to-1 Mux
    //                                   Enable,Select,Input1(4b),Output
    Mux1bit_4to1        MUX1            (E     ,   S[0]  , In[3:0] , Z0);
    Mux1bit_4to1        MUX2            (E     ,   S[0]  , In[7:4] , Z1);
    //                                   Enable,Select   ,Input1 ,Input2,Output
    Mux1bit_2to1        MUX3            (E     ,   S[1]  , Z0    , Z1   , Out);
endmodule 
