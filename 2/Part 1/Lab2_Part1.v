module Lab2_Part1 (SW, LEDR, HEX3, HEX2, HEX1, HEX0);
	input [17:0] SW; // toggle switches
	output [17:0] LEDR;
	output [6:0] HEX0; // 7-seg displays
	output [6:0] HEX1; // 7-seg displays
	output [6:0] HEX2; // 7-seg displays
	output [6:0] HEX3; // 7-seg displays
	
	setDisplay s0 (SW[3:0],HEX0);
	setDisplay s1 (SW[7:4],HEX1);
	setDisplay s2 (SW[11:8],HEX2);
	setDisplay s3 (SW[15:12],HEX3);

	assign LEDR = SW;
endmodule

module setDisplay (in,out);
	input [3:0] in;
	output reg [6:0] out;
	
	always @(in)
		case(in)
			4'b0000: out = 7'b1000000; //0
			4'b0001: out = 7'b1111001; //1
			4'b0010: out = 7'b0100100; //2
			4'b0011: out = 7'b0110000; //3
			4'b0100: out = 7'b0011001; //4
			4'b0101: out = 7'b0010010; //5
			4'b0110: out = 7'b0000010; //6
			4'b0111: out = 7'b1111000; //7
			4'b1000: out = 7'b0000000; //8
			4'b1001: out = 7'b0011000; //9
			default: out = 7'b1111111;
		endcase
		
		//FIX: Assign previous value to HEX display
endmodule
