`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:44:08 11/11/2021 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(
                    input [2:0] opcode,input [3:0] Funccode,input reset,input clk, 
                    output reg MemToRead,output reg MemToReg,
                    output reg MemWrite,output reg RegWrite,
                    output reg [3:0]BranchOp,output reg [3:0] ALUop
                    );
   
    reg [6:0] sel;
    
    always@(Funccode or opcode or reset )
        begin
            sel={opcode,Funccode};
            if(reset)
                begin   
                    MemToRead<=0;
                    MemToReg<=0;
                    MemWrite<=0;
                    BranchOp<=0;
                    ALUop<=0;
                    RegWrite<=0;
                end
            else
                begin   
                    case(sel)
                        7'b 0000000:        //Add
                            begin 
                                MemToRead<=0;
                                MemToReg<=1;
                                MemWrite<=0;
                                BranchOp<=4'b 0000;
                                ALUop<=4'b 0000;
                                RegWrite<=1;
                            end
                        
                        7'b 0000001:            //comp
                            begin 
                                MemToRead<=0;
                                MemToReg<=1;
                                MemWrite<=0;
                                BranchOp<=4'b 0000;
                                ALUop<=4'b 0001;
                                RegWrite<=1;
                            end
                        
                        7'b 0000010:            //and
                            begin 
                                MemToRead<=0;
                                MemToReg<=1;
                                MemWrite<=0;
                                BranchOp<=4'b 0000;
                                ALUop<=4'b 0011;
                                RegWrite<=1;
                            end
                        
                        7'b 0000011:            //xor
                            begin 
                                MemToRead<=0;
                                MemToReg<=1;
                                MemWrite<=0;
                                BranchOp<=4'b 0000;
                                ALUop<=4'b 0010;
                                RegWrite<=1;
                            end
                        
                        7'b 0000100:            //shllv
                            begin 
                                MemToRead<=0;
                                MemToReg<=1;
                                MemWrite<=0;
                                BranchOp<=4'b 0000;
                                ALUop<=4'b 0100;
                                RegWrite<=1;
                            end
                        
                        7'b 0000101:            //shrlv
                            begin 
                                MemToRead<=0;
                                MemToReg<=1;
                                MemWrite<=0;
                                BranchOp<=4'b 0000;
                                ALUop<=4'b 0101;
                                RegWrite<=1;
                            end
                        
                       7'b 0000110:            //shrav
                            begin 
                                MemToRead<=0;
                                MemToReg<=1;
                                MemWrite<=0;
                                BranchOp<=4'b 0000;
                                ALUop<=4'b 0110;
                                RegWrite<=1;
                            end
                        
                         
                        7'b 0010001:            //addi
                            begin 
                                MemToRead<=1;
                                MemToReg<=1;
                                MemWrite<=0;
                                BranchOp<=4'b 0000;
                                ALUop<=4'b 0000;
                                RegWrite<=1;
                            end
                        
                        7'b 0010010:            //compi
                            begin 
                                MemToRead<=1;
                                MemToReg<=1;
                                MemWrite<=0;
                                BranchOp<=4'b 0000;
                                ALUop<=4'b 0001;
                                RegWrite<=1;
                            end
                        
                        7'b 0010011:            //shll
                            begin 
                                MemToRead<=1;
                                MemToReg<=1;
                                MemWrite<=0;
                                BranchOp<=4'b 0000;
                                ALUop<=4'b 0100;
                                RegWrite<=1;
                            end
                        
                        7'b 0010100:            //shrl
                            begin 
                                MemToRead<=1;
                                MemToReg<=1;
                                MemWrite<=0;
                                BranchOp<=4'b 0000;
                                ALUop<=4'b 0101;
                                RegWrite<=1;
                            end
                        
                        7'b 0010101:            //shra
                            begin 
                                MemToRead<=1;
                                MemToReg<=1;
                                MemWrite<=0;
                                BranchOp<=4'b 0000;
                                ALUop<=4'b 0110;
                                RegWrite<=1;
                            end
                        
                        7'b 0100000:            //lw
                            begin 
                                MemToRead<=1;
                                MemToReg<=0;
                                MemWrite<=0;
                                BranchOp<=4'b 0000;
                                ALUop<=4'b 0000;
                                RegWrite<=1;
                            end
                        
                         7'b 0100001:            //sw
                            begin 
                                MemToRead<=1;
                                MemToReg<=1'b x;
                                MemWrite<=1;
                                BranchOp<=4'b 0000;
                                ALUop<=4'b 0000;
                                RegWrite<=0;
                            end
                        
                         7'b 0110000:            //b
                            begin 
                                MemToRead<=1'b x;
                                MemToReg<=1'b x;
                                MemWrite<=0;
                                BranchOp<=4'b 0001;
                                ALUop<=4'b x;
                                RegWrite<=0;
                            end
                        
                         7'b 0110001:            //bl
                            begin 
                                MemToRead<=1'b x;
                                MemToReg<=1'b x;
                                MemWrite<=0;
                                BranchOp<=4'b 0010;
                                ALUop<=4'b x;
                                RegWrite<=0;
                            end
                        
                        7'b 0110010:            //bcy
                            begin 
                                MemToRead<=1'b x;
                                MemToReg<=1'b x;
                                MemWrite<=0;
                                BranchOp<=4'b 0011;
                                ALUop<=4'b x;
                                RegWrite<=0;
                            end
                         
                        7'b 0110011:            //bncy
                            begin 
                                MemToRead<=1'b x;
                                MemToReg<=1'b x;
                                MemWrite<=0;
                                BranchOp<=4'b 0100;
                                ALUop<=4'b x;
                                RegWrite<=0;
                            end
                         
                        7'b 1000000:            //br
                            begin 
                                MemToRead<=1'b x;
                                MemToReg<=1'b x;
                                MemWrite<=0;
                                BranchOp<=4'b 0101;
                                ALUop<=4'b x;
                                RegWrite<=0;
                            end
                        
                        7'b 1010000:            //bltz
                            begin 
                                MemToRead<=0;
                                MemToReg<=1'b x;
                                MemWrite<=0;
                                BranchOp<=4'b 0110;
                                ALUop<=4'b 0111;
                                RegWrite<=0;
                            end
                        
                         7'b 1010001:            //bz
                            begin 
                                MemToRead<=0;
                                MemToReg<=1'b x;
                                MemWrite<=0;
                                BranchOp<=4'b 0111;
                                ALUop<=4'b 1000;
                                RegWrite<=0;
                            end
                        
                         7'b 1010010:            //bnz
                            begin 
                                MemToRead<=0;
                                MemToReg<=1'b x;
                                MemWrite<=0;
                                BranchOp<=4'b 1000;
                                ALUop<=4'b 1000;
                                RegWrite<=0;
                            end
                    endcase
                end
        end
                        

endmodule
