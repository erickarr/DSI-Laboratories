// This is the complete code from Figure 8
module part5 (SW, HEX0);
	input [17:0] SW;		// toggle switches
	output [0:6] HEX0;	// 7-seg displays

	wire [2:0] M;

	// module mux_3bit_5to1 (S, U, V, W, X, Y, M);
	mux_3bit_5to1 M0 (SW[17:15], SW[14:12], SW[11:9], SW[8:6], SW[5:3], SW[2:0], M);

	// module char_7seg (C, Display);
	char_7seg H0 (M, HEX0);
endmodule

// implements a 3-bit wide 5-to-1 multiplexer
module mux_3bit_5to1 (S, U, V, W, X, Y, M);
	input [2:0] S, U, V, W, X, Y;
	output [2:0] M;
	wire [1:3] m_0, m_1, m_2;	// intermediate multiplexers

	// 5-to-1 multiplexer for bit 0
	assign m_0[1] = (!S[0] & U[0]) | (S[0] & V[0]);
	assign m_0[2] = (!S[0] & W[0]) | (S[0] & X[0]);
	assign m_0[3] = (!S[1] & m_0[1]) | (S[1] & m_0[2]);
	assign M[0] = (!S[2] & m_0[3]) | (S[2] & Y[0]); // 5-to-1 multiplexer output

	// 5-to-1 multiplexer for bit 1
	assign m_1[1] = (!S[0] & U[1]) | (S[0] & V[1]);
	assign m_1[2] = (!S[0] & W[1]) | (S[0] & X[1]);
	assign m_1[3] = (!S[1] & m_1[1]) | (S[1] & m_1[2]);
	assign M[1] = (!S[2] & m_1[3]) | (S[2] & Y[1]); // 5-to-1 multiplexer output
	
	// 5-to-1 multiplexer for bit 2
	assign m_2[1] = (!S[0] & U[2]) | (S[0] & V[2]);
	assign m_2[2] = (!S[0] & W[2]) | (S[0] & X[2]);
	assign m_2[3] = (!S[1] & m_2[1]) | (S[1] & m_2[2]);
	assign M[2] = (!S[2] & m_2[3]) | (S[2] & Y[2]); // 5-to-1 multiplexer output
endmodule	

// Converts 3-bit input code on C2-0 into 7-bit code that produces
// a character on a 7-segment display. The conversion is defined by:
// 	 C 2 1 0		Char
// 	----------------
// 	   0 0 0  	'H'
// 		0 0 1		'E'
// 		0 1 0 	'L'
// 		0 1 1		'O'
// 		1 0 0    ' ' Blank
// 		1 0 1    ' ' Blank
// 		1 1 0    ' ' Blank
// 		1 1 1		' ' Blank
//
//    Codes 100, 101, 110 are not used
//
module char_7seg (C, Display);
	input [2:0] C;				// input code
	output [0:6] Display;	// output 7-seg code

	/*
	 *       0  
	 *      ---  
	 *     |   |
	 *    5|   |1
	 *     | 6 |
	 *      ---  
	 *     |   |
	 *    4|   |2
	 *     |   |
	 *      ---  
	 *       3  
	 */
	// the following equations describe display functions in cannonical SOP form
	assign Display[0] = !((!C[2] & !C[1] & C[0]) | (!C[2] & C[1] & C[0])); 
	assign Display[1] = !((!C[2] & !C[1] & !C[0]) | (!C[2] & C[1] & C[0])); 
	assign Display[2] = !((!C[2] & !C[1] & !C[0]) | (!C[2] & C[1] & C[0])); 
	assign Display[3] = !((!C[2] & !C[1] & C[0]) | (!C[2] & C[1] & !C[0]) |
		(!C[2] & C[1] & C[0])); 
	assign Display[4] = !((!C[2] & !C[1] & !C[0]) | (!C[2] & !C[1] & C[0]) | 
		(!C[2] & C[1] & !C[0]) | (!C[2] & C[1] & C[0]));
	assign Display[5] = !((!C[2] & !C[1] & !C[0]) | (!C[2] & !C[1] & C[0]) | 
		(!C[2] & C[1] & !C[0]) | (!C[2] & C[1] & C[0])); 
	assign Display[6] = !((!C[2] & !C[1] & !C[0]) | (!C[2] & !C[1] & C[0]));
endmodule

