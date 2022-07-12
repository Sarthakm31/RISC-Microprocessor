`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:40:34 11/11/2021
// Design Name:   Instruction_Rom
// Module Name:   /home/ishan/Desktop/sem5/COA lab/KGP_RISC/Instruction_Rom_Tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Instruction_Rom
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Instruction_Rom_Tb;

	// Inputs
	reg clka;
	reg [31:0] addra;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	Instruction_Rom uut (
		.clka(clka), 
		.addra(addra), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		addra = 0;
        
		// Add stimulus here
		#10 addra = 0;
		#10 addra = 4;
		#10 addra = 8;
		#10 addra = 16;
	end
   always begin
		#5 clka = ~clka;
	end   
endmodule

