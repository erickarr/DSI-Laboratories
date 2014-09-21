module Lab1_Part4 (SW, LEDR, HEX0);
	input [2:0] SW; //18 Switches on the board
	output [2:0] LEDR; //Output to 3 LEDS
	output [6:0] HEX0; //Output for the 7seg
	
	wire [2:0] chars = SW[2:0];
	reg[6:0] char;
	
	always @(chars)//Look uptable for selector bits
		case(chars)
			3'b000: char = 7'b0001001; //'H'
			3'b001: char = 7'b0000110; //'E'
			3'b011: char = 7'b1000111; //'L'
			3'b010: char = 7'b1000000; //'O'
			default: char = 7'b1111111; //''
		endcase
	
	assign HEX0 = char;
	
	assign LEDR = SW;
	
endmodule
