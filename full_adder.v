//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// File: ful_adder.v  *part of Ripple Carry Adder.
// Purpose: Design a ripple carry adder which is n bit wide. Here, n is not a fixed number
// Concept: 1. Implemented "genvar" to instantiate the FA dynamically.
//          2. RCA has two modules: module FA and module RCA. 
//          3. Ripple carry adder, ripples the carry to the output, faster than normal Adders.
// 
// Owner: Rohit Kumar Singh
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


`timescale 1ns/1ns
module full_adder (A_i,B_i,Cin_i,Sum_o,Cout_o);
input A_i;
input B_i;
input Cin_i;
output Sum_o;
output Cout_o;

wire   w1;
wire   w2;
wire   w3;
       
assign w1 = A_i ^ B_i;
assign w2 = w1 & Cin_i;
assign w3 = A_i & B_i;
 
assign Sum_o   = w1 ^ Cin_i;
assign Cout_o  = w2 | w3;
   
endmodule