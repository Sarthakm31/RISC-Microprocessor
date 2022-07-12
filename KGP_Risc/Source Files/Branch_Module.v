`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:25:27 11/12/2021 
// Design Name: 
// Module Name:    Branch_Module 
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
module Branch_Module(input clk,input reset,input [31:0] label,
            input [3:0] BranchOp, input [31:0] pc,
            input [31:0] result, input carry, input zero, output reg [31:0] pc_next
            );
	 reg [31:0] ra;
    always @(*)
        begin
            if(reset)
                begin
						  ra = 32'd0;
                    pc_next=32'd 0;
                end
            else
                begin
                    case(BranchOp)
                            4'b 0000:       //pc+4
                                begin
                                    pc_next = pc + 32'd 4;   
                                end
                            
                            4'b 0001:          //b
                                begin
                                    pc_next=label;
                                end
                            
                            4'b 0010:       //bl
                                begin
												pc_next = pc + 4;
												ra = pc_next;
												pc_next = label;
										  end
                            
                            4'b 0011:          //bcy
                                begin
                                        if(carry)
                                            pc_next=label;
                                        else
                                            pc_next= pc + 32'd4;
                                end
                            
                            4'b 0100:           //bncy
                                begin
                                         if(carry)
                                            pc_next= pc + 32'd4;
                                        else
                                            pc_next=label;
                                end
                            
                            4'b 0101:           //br
                                begin
                                        pc_next=ra;
                                end
                            
                            4'b 0110:           //bltz
                                begin
                                    if(zero)
                                        pc_next=label;
                                    else
                                        pc_next=pc+ 32'd 4;
                                end
                            
                            4'b 0111:              //bz
                                begin
                                    if(zero)
                                        pc_next=label;
                                    else
                                        pc_next=pc+ 32'd 4;
                                end

                            4'b 1000:           //bnz
                                begin
                                    if(zero)
                                        pc_next=pc+ 32'd 4;
                                    else
                                        pc_next=label;
                                end
                    endcase
                end
                            
        end
endmodule
