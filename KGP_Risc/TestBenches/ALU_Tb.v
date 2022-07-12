`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:29:00 11/06/2021
// Design Name:   ALU
// Module Name:   /home/ishan/Desktop/sem5/COA lab/KGP_RISC/KGP_RISC/ALU_Tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_Tb;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [3:0] aluop;

	// Outputs
	wire [31:0] result;
	wire carry;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.a(a), 
		.b(b), 
		.aluop(aluop), 
		.result(result), 
		.carry(carry), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		a = 32'd10;
		b = 32'd5;
		aluop = 0;
		
		#10;
		aluop = 1;
		
		#10;
		aluop = 2;
		
		#10;
		aluop = 3;
		
		#10;
		aluop = 4;
		
		#10;
		aluop = 5;
		a = -32'd64;
		b = 32'd3;
		
		#10;
		aluop = 6;
		a = -32'd64;
		b = 32'd3;
		
		#10;
		aluop = 6;
		a = 32'd64;
		b = 32'd3;
		
		#10;
		aluop = 7;
		a = -32'd64;
		b = 32'd3;
		
		#10;
		aluop = 7;
		a = 32'd64;
		b = 32'd3;
		
		#10;
		aluop = 8;
		a = 32'd64;
		b = 32'd3;
		
		#10;
		aluop = 8;
		a = 32'd0;
		b = 32'd3;
	end
      
endmodule

