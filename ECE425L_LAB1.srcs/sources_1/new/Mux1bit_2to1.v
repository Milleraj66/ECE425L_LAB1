`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// AUTHOR: ARTHUR J. MILLER
// Create Date: 10/10/2015 05:19:26 PM
// Module Name: 
// ECE425L LAB #1, Problem 3
// Purpose: Generic 1bit 2-to-1 Mux
//////////////////////////////////////////////////////////////////////////////////

//                   Enable,Select,Input1,Input2,Output
module Mux1bit_2to1(E     ,   S  , X1   , X0   , Z);
    input E, S;
    input X1;
    input X0;
    output Z;
    // INtermediate gate outputs     
    wire Snot; 
    wire A1;
    wire A2; 
    
    // Structural model for 2-to-1 MUX
    // Intermediate gates
    not         n1(Snot,S);
    and         a1(A1,E,S,X1);
    and         a2(A2,E,Snot,X0);
    // Output
    or          o1(Z, A1, A2);
    
endmodule
