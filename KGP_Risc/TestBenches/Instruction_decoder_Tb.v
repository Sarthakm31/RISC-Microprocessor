`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:59:16 11/07/2021
// Design Name:   Instruction_Decoder
// Module Name:   /home/ishan/Desktop/sem5/COA lab/KGP_RISC/KGP_RISC/Instruction_decoder_Tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Instruction_Decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Instruction_decoder_Tb;

	// Inputs
	reg [31:0] instr;

	// Outputs
	wire [2:0] opCode;
	wire [3:0] functCode;
	wire [4:0] reg_1;
	wire [4:0] reg_2;
	wire [31:0] imm;
	wire [31:0] label;

	// Instantiate the Unit Under Test (UUT)
	Instruction_Decoder uut (
		.instr(instr), 
		.opCode(opCode), 
		.functCode(functCode), 
		.reg_1(reg_1), 
		.reg_2(reg_2), 
		.imm(imm), 
		.label(label)
	);

	initial begin
		// Initialize Inputs
		//instr = 32'b000,01010,00011,101110011010111,0011;
		instr = 0;
		#10;
		instr = 32'b00001010000111011100110101110011;
		#10;
		instr = 32'b00101010000111011100110101110011;
		#10;
		instr = 32'b01001010000111011100110101110011;
		#10;
		instr = 32'b01101010000111011100110101110011;
		#10;
		instr = 32'b10001010000111011100110101110011;
		#10;
		instr = 32'b10101010000111011100110101110011;
		#10;
		instr = 32'b11001010000111011100110101110011;
		#10;
	end      
endmodule
