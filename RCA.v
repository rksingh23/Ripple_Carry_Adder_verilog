//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// File: RCA.v
// Purpose: Design a ripple carry adder which is n bit wide. Here, n is not a fixed number
// Concept: 1. Implemented "genvar" to instantiate the FA dynamically.
//          2. RCA has two modules: module FA and module RCA. 
//          3. Ripple carry adder, ripples the carry to the output, faster than normal Adders.
// 
// Owner: Rohit Kumar Singh
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


`timescale 1ns/1ns
`include "full_adder.v"
 
module RCA #(parameter n)(A,B,C_in,C_out,S_out);
  input [n-1:0] A;
  input [n-1:0] B;
  input C_in;
  output [n:0]S_out;
  output C_out;
  reg [n:0] Sum;
  
  wire [n:0] wire_carry;
  wire [n-1:0] wire_sum;
   
  assign wire_carry[0] = C_in;        
   
  genvar i;
  generate 
    for (i=0; i<n; i=i+1) 
      begin
        full_adder full_adder_dut (.A_i(A[i]), .B_i(B[i]), .Cin_i(wire_carry[i]),
              .Sum_o(wire_sum[i]),.Cout_o(wire_carry[i+1]));
      end
  endgenerate
   
  assign S_out = wire_sum;   // Verilog Concatenation
  assign C_out = wire_carry[n];
  always@(S_out,C_out)
  begin
  Sum = {wire_carry[n],wire_sum};
  end
 
endmodule // ripple_carry_adder


