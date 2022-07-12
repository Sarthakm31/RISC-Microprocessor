`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:56:44 11/11/2021 
// Design Name: 
// Module Name:    Register_File 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Register_File(clk, rst, opCode, regWrite, writeData, reg_1, reg_2, regRead_1, regRead_2);
input clk, rst, regWrite;
input [31:0] writeData;
input [2:0]opCode;
input [4:0] reg_1;
input [4:0] reg_2;
output [31:0] regRead_1;
output [31:0] regRead_2;

reg [31:0] regFile [31:0];
	integer i;
	always @(posedge clk)
	begin
		if(rst)
		begin
			for(i=0;i<32;i=i+1)
				regFile[i] <=  32'd0;
		end
		if(regWrite)
		begin
			if(opCode == 3'b010)
				regFile[reg_2] <= writeData;
			else
				regFile[reg_1] <= writeData;
		end
	end
	
	assign regRead_1 = regFile[reg_1];
	assign regRead_2 = regFile[reg_2];
	
endmodule
