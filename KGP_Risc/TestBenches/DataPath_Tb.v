`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:52:40 11/12/2021
// Design Name:   DataPath
// Module Name:   /home/ishan/Desktop/sem5/COA lab/KGP_RISC/DataPath_Tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataPath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DataPath_Tb;

	// Inputs
	reg clk;
	reg rst;
	reg [31:0] pc;

	// Outputs
	wire [31:0] result;
	wire [31:0] instruction;
	wire [31:0] pc_next;
	wire [31:0] read1,read2,writeRegFile, memOut;
	wire [3:0] AluOp, BranchOp;
	//assign pc = pc_next;
	// Instantiate the Unit Under Test (UUT)
	DataPath uut (.clk(clk), .rst(rst), .pc(pc), .result(result),
		.instruction(instruction),.pc_next(pc_next), .read1(read1), .read2(read2), .writeRegFile(writeRegFile),
		.memOut(memOut), .AluOp(AluOp), .BranchOp(BranchOp));

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		pc = 0;
	
		#10 rst = 0;

	end
	always @(posedge ~clk)
		pc = pc_next;
   always begin
		#5 clk = ~clk;
	end 
endmodule

