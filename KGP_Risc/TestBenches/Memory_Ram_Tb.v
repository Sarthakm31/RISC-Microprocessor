`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:02:45 11/12/2021
// Design Name:   Memory_Ram
// Module Name:   /home/ishan/Desktop/sem5/COA lab/KGP_RISC/Memory_Ram_Tb.v
// Project Name:  KGP_RISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Memory_Ram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Memory_Ram_Tb;

	// Inputs
	reg clka;
	reg [3:0] wea;
	reg [31:0] addra;
	reg [31:0] dina;

	// Outputs
	wire [31:0] douta;

	// Instantiate the Unit Under Test (UUT)
	Memory_Ram uut (
		.clka(clka), 
		.wea(wea), 
		.addra(addra), 
		.dina(dina), 
		.douta(douta)
	);

	initial begin
		// Initialize Inputs
		clka = 0;
		wea = 0;
		addra = 0;
		dina = 0;
		// Add stimulus here
		#10 addra = 1; dina = 5;
		#10 addra = 1; 
		#10 addra = 1; wea = 1'b0; dina = 10;
		#10 addra = 2; wea = 1; dina = 7;
		#10;
		

	end
   always begin
		#5 clka = ~clka;
	end 
endmodule

