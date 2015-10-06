`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// AUTHOR: ARTHUR J. MILLER
// Create Date: 10/03/2015 08:58:39 PM
// ECE425L LAB #1, Problem 1
// Purpose: Develope a Verilog structural model for a 16-bit 2-to-1 MUX and a 3-to-8
//          decoder includeing ENABLE signals. Develop a testbench, perofrm a waveform
//          simulation, and demonstrate the output to the Instructor.

//      Testbench file
//////////////////////////////////////////////////////////////////////////////////

module TB_Mux16bit_2to1();
    // Inputs
    reg E, S;
    reg [15:0] X1;
    reg [15:0] X0;
    // Output
    wire [15:0] Z;

    //instantiate your circuit
    //                               Enable, Select, Input2(16bit), Input1(16bit), Output(16bit)
    Mux16bit_2to1       MUX1        (E     , S     , X1           , X0           , Z           );

    //Behavioral code block generates stimulus to test circuit
         initial 
         begin
            // X1 = 15
            // X2 = 100
            // Enable zero, output should be zero
            E = 1'b0; S = 1'b0 ; X1 = 16'd15; X0 = 16'd100;
            #50;
            // Enable one, with select 0
            E = 1'b1; S = 1'b0 ; X1 = 16'd15; X0 = 16'd100;
            #50;
            // Enable one, with select 1
            E = 1'b1; S = 1'b1 ; X1 = 16'd15; X0 = 16'd100;
            #50;
          end
endmodule
