`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:46:21 11/12/2021
// Design Name:   Branch_Module
// Module Name:   /home/ishan/Desktop/sem5/COA lab/KGP_RISC/Branch_Module_Tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Branch_Module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Branch_Module_Tb;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] label;
	reg [3:0] BranchOp;
	reg [31:0] pc;
	reg [31:0] result;
	reg carry;
	reg zero;

	// Outputs
	wire [31:0] pc_next;

	// Instantiate the Unit Under Test (UUT)
	Branch_Module uut (
		.clk(clk), 
		.reset(reset), 
		.label(label), 
		.BranchOp(BranchOp), 
		.pc(pc), 
		.result(result), 
		.carry(carry), 
		.zero(zero), 
		.pc_next(pc_next)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		label = 0;
		BranchOp = 0;
		pc = 0;
		result = 0;
		carry = 0;
		zero = 0;

		#10;
		reset = 0;
      label = 32'd16;
		BranchOp = 1;
		// Add stimulus here

	end
	always begin
		#5 clk = ~clk;
	end 
      
endmodule

