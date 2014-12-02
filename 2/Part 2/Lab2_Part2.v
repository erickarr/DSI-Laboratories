module Lab2_Part2 (SW, LEDR, HEX1, HEX0);
	input [3:0] SW;		// toggle switches
	output [17:0] LEDR;
	output reg [6:0] HEX0;	// 7-seg displays
	output reg [6:0] HEX1;	// 7-seg displays
	
	always @(SW[3:0])
		if(SW[3:0] >= 4'b1010)
			HEX1 = 7'b1111001; //1
		else
			HEX1 = 7'b1000000; //0

	always@(SW[3:0])
		case(SW[3:0]%10)
			4'd0: HEX0 = 7'b1000000; //0
			4'd1: HEX0 = 7'b1111001; //1
			4'd2: HEX0 = 7'b0100100; //2
			4'd3: HEX0 = 7'b0110000; //3
			4'd4: HEX0 = 7'b0011001; //4
			4'd5: HEX0 = 7'b0010010; //5
			4'd6: HEX0 = 7'b0000010; //6
			4'd7: HEX0 = 7'b1111000; //7
			4'd8: HEX0 = 7'b0000000; //8
			4'd9: HEX0 = 7'b0011000; //9	
		endcase
		
	assign LEDR = SW;
endmodule
