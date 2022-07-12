`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:16:51 11/12/2021 
// Design Name: 
// Module Name:    DataPath 
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
module DataPath(input clk, input rst, input wire [31:0] pc, output wire [31:0] result, output wire [31:0] instruction,
						output wire [31:0] read1, output wire [31:0] read2, output wire [31:0] writeRegFile, 
						output wire [31:0] pc_next, output wire [31:0] memOut, output wire [3:0] AluOp, output wire [3:0] BranchOp);

//wire [31:0] instruction;
Instruction_Rom Instruction_mem (.clka(clk), .addra(pc), .douta(instruction));

wire [2:0] opCode;
wire [3:0] functCode;
wire [31:0] label, immediate;
wire [4:0] reg1, reg2;
Instruction_Decoder InstructionDecoder (.instr(instruction), .opCode(opCode),
	.functCode(functCode), .reg_1(reg1), .reg_2(reg2), .imm(immediate), .label(label));

wire MemToRead, MemToReg, MemWrite, RegWrite;
//wire [3:0] AluOp, BranchOp;
Control_Unit Control(.opcode(opCode),.Funccode(functCode),.clk(clk),.reset(rst),
                  .RegWrite(RegWrite),.MemToRead(MemToRead),.MemToReg(MemToReg),
                  .MemWrite(MemWrite),.BranchOp(BranchOp),.ALUop(AluOp));
						
//wire [31:0] read1, read2, writeRegFile;
Register_File RegFile (.clk(clk), .rst(rst), .opCode(opCode), .regWrite(RegWrite), 
		.writeData(writeRegFile), .reg_1(reg1), .reg_2(reg2), 
		.regRead_1(read1), .regRead_2(read2));

wire [31:0] aluInput2;
Mux_32b_2x1 MuxAluInput(.a(read2), .b(immediate), .select(MemToRead), .out(aluInput2));

wire carry, zero;
//wire [31:0] result;
ALU Alu (.a(read1), .b(aluInput2), .aluop(AluOp), 
		.result(result), .carry(carry), .zero(zero));

Branch_Module BranchModule (.clk(clk), .reset(rst), .label(label), 
		.BranchOp(BranchOp), .pc(pc), .result(result), 
		.carry(carry), .zero(zero), .pc_next(pc_next));

//wire [31:0] memOut;
Memory_Ram Mem (.clka(clk), .wea(MemWrite), .addra(result), 
		.dina(read2), .douta(memOut));

Mux_32b_2x1 MuxMemOutput(.a(memOut), .b(result), .select(MemToReg), .out(writeRegFile));
endmodule
