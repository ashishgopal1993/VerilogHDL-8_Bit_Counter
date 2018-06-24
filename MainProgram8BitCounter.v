// Title: Getting started with Verilog HDL:Counter and its implementation on FPGA Kit.
// Aim: Write a Verilog code for 8 bit updown counter with reset facility and Implement the same on Altera DE 1 board.
// Programmer name: Ashish Ashok Gopal, 1702005, FY MTech
// Department: Department of Electronics Engineering
// Mentor: Prof. Arati Phadke
// Department: Department of Electronics Engineering
// Date: 15/09/2017

// ***************Program starts here*************************

module counter(
	out      ,  // Output of the counter
	up_down  ,  // up_down control for counter
	clk      ,  // clock input
	reset       // reset input
);
//----------Output Ports--------------
output [7:0] out;

//------------Input Ports-------------- 
input up_down, clk, reset;

//------------Internal Variables--------
reg [7:0] out;
reg clk1=1'b0;
integer k = 0;

// Creating new slow clock 
always @(posedge clk)
	begin 
		if (k<30000000) 
			k= k+1;
		else 
		begin
			clk1 = ~clk1;
			k= 0;
		end 
	end

always @(posedge clk1)	//clk1 is the new slow clock
	begin
		if (reset) 		// active high reset
			out = 8'b0 ;
		else 
		if (up_down==1'b1) 
			out = out + 1;	// Counting UP
		else 
			out = out - 1;	// Counting DOWN
	end
endmodule 
// ***************Program ends here*************************