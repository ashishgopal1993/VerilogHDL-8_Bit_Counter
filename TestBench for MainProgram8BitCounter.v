// Title: Test bench for 8-bit UpDown Counter
// Programmer name: Ashish Ashok Gopal, 1702005, FY MTech
// Department: Department of Electronics Engineering
// Mentor: Prof. Arati Phadke
// Department: Department of Electronics Engineering
// Date: 15/09/2017

// ***************Test Bench starts here*************************
module countertest;
   
wire [7:0] out;
 
reg up_down, reset, clk=1'b0;
  
counter u1(out, up_down, clk,  reset);

always #1 clk= ~clk; 
 
initial begin
	reset = 1'b1;
	
	up_down = 1'b1;
	#5
	
	reset = 1'b0;
	#30
	
	up_down = 1'b0;
	#30
	
	up_down = 1'b1;
	#60
	
	up_down = 1'b0;
	#70
	
	up_down = 1'b1;
	end
endmodule 
// ***************Test Bench ends here*************************