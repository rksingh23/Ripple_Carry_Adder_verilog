//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// File: RCA.v
// Purpose: Design a ripple carry adder which is n bit wide. Here, n is not a fixed number
// Concept: 1. Implemented "genvar" to instantiate the FA dynamically.
//          2. RCA has two modules: module FA and module RCA. 
//          3. Ripple carry adder, ripples the carry to the output, faster than normal Adders.
// 
// Owner: Rohit Kumar Singh
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


`include "RCA.v"
 
module ripple_carry_adder_tb ();
 
 parameter n = 5;
 
 reg [n-1:0] A = 0;
 reg [n-1:0] B = 0;
 reg C_in;
 wire [n:0]  S_out;
 wire C_out;
   
 RCA #(.n(n)) dut(.A(A),.B(B),.C_in(C_in),.C_out(C_out),.S_out(S_out));
 
 initial
 begin
      A = 5'b00101;
      B = 5'b01111;
	  C_in =1;
    #10;
      A = 5'b10101;
      B = 5'b01001;
	  C_in =0;
    #10;
      A = 5'b01111;
      B = 5'b11111;
	  C_in =1;
    #10;
      A = 5'b11111;
      B = 5'b11111;
	  C_in =0;
    #10;
end

initial
begin
$monitor ("Value of A is %d, B is %d, Cin is %d, and the calculated sum is %d, as well as the Cout is %d at time %0t",A,B,C_in,S_out,C_out,$time);
end
 
endmodule