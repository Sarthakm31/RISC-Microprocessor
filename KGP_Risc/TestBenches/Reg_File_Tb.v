`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:35:18 11/11/2021
// Design Name:   Register_File
// Module Name:   /home/ishan/Desktop/sem5/COA lab/KGP_RISC/Reg_File_Tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Register_File
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Reg_File_Tb;

	// Inputs
	reg clk;
	reg rst;
	reg regWrite;
	reg [31:0] writeData;
	reg [2:0] opCode;
	reg [4:0] reg_1;
	reg [4:0] reg_2;

	// Outputs
	wire [31:0] regRead_1;
	wire [31:0] regRead_2;

	// Instantiate the Unit Under Test (UUT)
	Register_File uut (
		.clk(clk), 
		.rst(rst), 
		.opCode(opCode),
		.regWrite(regWrite), 
		.writeData(writeData), 
		.reg_1(reg_1), 
		.reg_2(reg_2), 
		.regRead_1(regRead_1), 
		.regRead_2(regRead_2)
	);
	
	initial begin
		// Initialize Inputs
		clk = 0;
		opCode = 0;
		rst = 0;
		regWrite = 0;
		writeData = 0;
		reg_1 = 0;
		reg_2 = 0;

      #5;
		rst = 1;
		
		#10;		
		rst = 0;
		
		#10;
		regWrite = 1;
		writeData = 5;
		reg_1 = 2;
		reg_2 = 0;
		
		#10;
		regWrite = 1;
		writeData = 15;
		opCode = 3'b010;
		reg_1 = 6;
		reg_2 = 2;
		
		#10;
		regWrite = 1;
		writeData = 16;
		reg_1 = 6;
		reg_2 = 2;
		
		#10;
		regWrite = 0;
		writeData = 15;
		reg_1 = 6;
		reg_2 = 2;
		end

always #5 clk = ~clk;

endmodule

