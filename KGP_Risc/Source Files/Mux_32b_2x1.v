`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:12:26 11/12/2021 
// Design Name: 
// Module Name:    Mux_32b_2x1 
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
module Mux_32b_2x1(input wire [31:0] a, input wire [31:0] b, input wire select, output reg[31:0] out);
	always @(*)
	begin 
		if(select)
			out = b;
		else out = a;
	end
endmodule