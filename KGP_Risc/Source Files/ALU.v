`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:38 11/06/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(a, b, aluop, result, carry, zero);
input signed [31:0]a;
input signed [31:0]b;
input [3:0]aluop;
output reg [31:0]result;
output reg carry, zero;

	always @(a or b or aluop)
	begin
	carry = 0;		//Manage to store the previous carry somehow
	zero = 0;
	case(aluop)
		4'b0000:{carry,result} = a+b;
		4'b0001:result =  ~b+1;
		4'b0010:result = a^b;		
		4'b0011:result = a&b;
		4'b0100:result = a<<b;
		4'b0101:result = a>>b;
		4'b0110:result = a>>>b;
		4'b0111:zero = ($signed(a)<$signed(32'd0))?1:0;
		4'b1000:zero = (a==32'd0)?1:0;
		default:  result = 32'd0;
	endcase
	end


endmodule
