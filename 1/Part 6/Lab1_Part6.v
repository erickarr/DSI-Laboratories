module Lab1_Part6 (SW, LEDR, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
	input [17:0] SW; // toggle switches
	output [17:0] LEDR;
	output [6:0] HEX0; // 7-seg displays
	output [6:0] HEX1; // 7-seg displays
	output [6:0] HEX2; // 7-seg displays
	output [6:0] HEX3; // 7-seg displays
	output [6:0] HEX4; // 7-seg displays
	output [6:0] HEX5; // 7-seg displays
	output [6:0] HEX6; // 7-seg displays
	output [6:0] HEX7; // 7-seg displays
	
	wire [2:0] M0;
	wire [2:0] M1;
	wire [2:0] M2;
	wire [2:0] M3;
	wire [2:0] M4;
	wire [2:0] M5;
	wire [2:0] M6;
	wire [2:0] M7;
	
	//U, V, W, X, Y
	mux_3bit_5to1 m0 (SW[17:15], SW[14:12], SW[11:9], SW[8:6], SW[5:3], SW[2:0], M0);
	/*mux_3bit_5to1 m1 (SW[17:15], SW[2:0], SW[14:12], SW[11:9], SW[8:6], SW[5:3], M1);
	mux_3bit_5to1 m2 (SW[17:15], SW[5:3], SW[2:0], SW[14:12], SW[11:9], SW[8:6], M2);
	mux_3bit_5to1 m3 (SW[17:15], SW[8:6], SW[5:3], SW[2:0], SW[14:12], SW[11:9], M3);
	mux_3bit_5to1 m4 (SW[17:15], SW[11:9], SW[8:6], SW[5:3], SW[2:0], SW[14:12], M4);*/
	
	char_7seg H0 (M0, HEX0);
	char_7seg H1 (M1, HEX1);
	char_7seg H2 (M2, HEX2);
	char_7seg H3 (M3, HEX3);
	char_7seg H4 (M4, HEX4);
	/*char_7seg H5 (M5, HEX5);
	char_7seg H6 (M6, HEX6);*/
	
	assign LEDR = SW;
endmodule

// This method picks which letter is displayed in which of the five positions
module mux_3bit_5to1 (S, U, V, W, X, Y, M);
	input [2:0] S, U, V, W, X, Y;
	output [2:0] M;
	
	reg [2:0] result;

	always @(S)//Look uptable for selector bits
		case(S)
			4'b0000: result = U; //U (H)
			4'b0001: result = V; //V (E)
			4'b0010: result = W; //W (L)
			4'b0011: result = X; //X (O)
			default: result = Y;
		endcase
		
	assign M = result;
endmodule

// implements a 7-segment decoder for H, E, L, O, and ‘blank’
module char_7seg (C, Display);
	input [2:0] C; // input code
	output [6:0] Display; // output 7-seg code

	reg[6:0] char;
	
	always @(C)//Look uptable for selector bits
		case(C)
			3'b000: char = 7'b0001001; //'H'
			3'b001: char = 7'b0000110; //'E'
			3'b011: char = 7'b1000111; //'L'
			3'b010: char = 7'b1000000; //'O'
			default: char = 7'b1111111; //''
		endcase
	
	assign Display = char;
endmodule
