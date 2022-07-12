`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:47:13 11/11/2021
// Design Name:   Control_Unit
// Module Name:   /home/ishan/Desktop/sem5/COA lab/KGP_RISC/Control_Unit_Tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control_Unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Control_Unit_Tb;

    reg [2:0]opcode ;
    reg [3:0] Funccode;
    reg reset;
    reg clk;

    wire [3:0] BranchOp,ALUop;
    wire MemWrite,MemToReg,MemToRead,RegWrite;

    Control_Unit test(
                        .opcode(opcode),.Funccode(Funccode),.clk(clk),.reset(reset),
                        .RegWrite(RegWrite),.MemToRead(MemToRead),.MemToReg(MemToReg),
                        .MemWrite(MemWrite),.BranchOp(BranchOp),.ALUop(ALUop)
    );
    initial  
    begin 
        reset=1;
        #10 reset=0;
        #10 opcode=3'b 000; Funccode=4'b 0000;
        #10 opcode=3'b 000; Funccode=4'b 0001;
        #10 opcode=3'b 000; Funccode=4'b 0010;
        #10 opcode=3'b 000; Funccode=4'b 0011;
        #10 opcode=3'b 000; Funccode=4'b 0100;
        #10 opcode=3'b 000; Funccode=4'b 0101;
        #10 opcode=3'b 000; Funccode=4'b 0110;
        #10 opcode=3'b 001; Funccode=4'b 0001;
        #10 opcode=3'b 001; Funccode=4'b 0010;
        #10 opcode=3'b 001; Funccode=4'b 0011;
        #10 opcode=3'b 001; Funccode=4'b 0100;
        #10 opcode=3'b 001; Funccode=4'b 0101;
        #10 opcode=3'b 010; Funccode=4'b 0000;
        #10 opcode=3'b 010; Funccode=4'b 0001;
        #10 opcode=3'b 011; Funccode=4'b 0000;
        #10 opcode=3'b 011; Funccode=4'b 0001;
        #10 opcode=3'b 011; Funccode=4'b 0010;
        #10 opcode=3'b 011; Funccode=4'b 0011;
        #10 opcode=3'b 100; Funccode=4'b 0000;
        #10 opcode=3'b 101; Funccode=4'b 0000;
        #10 opcode=3'b 101; Funccode=4'b 0001;
        #10 opcode=3'b 101; Funccode=4'b 0010;
        
    end

    initial $monitor("opcode=%b,\t Func code=%b,\t,RegWrite=%b, MemtoRead=%b, MemToReg=%b, MemtoWrite=%b,\t Branchop=%b,ALUop=%b, time=%d",
    opcode,Funccode,RegWrite,MemToRead,MemToReg,MemWrite,BranchOp,ALUop,$time);
        
endmodule

