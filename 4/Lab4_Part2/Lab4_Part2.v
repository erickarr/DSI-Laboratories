module Lab4_Part2(SW,LEDR,LEDG,KEY,HEX3,HEX2,HEX1,HEX0);
	input [17:0] SW;
	input [3:0] KEY;
	output [17:0] LEDR;
	output [7:0] LEDG;
	output [6:0] HEX3,HEX2,HEX1,HEX0;
	
	wire clear, clk, enable;
	reg [15:0] cntr;
	
	assign clear = SW[0];
	assign enable = SW[1];
	assign clk = KEY[1];
	
	always @ (negedge clk or negedge clear) begin
		if (clear == 0) begin
			cntr <= 0;
		end else if (enable == 1)begin
			cntr <= cntr + 1;
		end
	end
	
	assign LEDR = SW;
	assign LEDG = cntr;
	
	hexDisplay h0 (cntr[3:0], HEX0);
	hexDisplay h1 (cntr[7:4], HEX1);
	hexDisplay h2 (cntr[11:8], HEX2);
	hexDisplay h3 (cntr[15:12], HEX3);

endmodule

module hexDisplay(input [3:0] bits, output reg [6:0] hex);
	always @ (*) begin
		case(bits)
			4'b0000: hex = 7'b1000000; //0
			4'b0001: hex = 7'b1111001; //1
			4'b0010: hex = 7'b0100100; //2
			4'b0011: hex = 7'b0110000; //3
			4'b0100: hex = 7'b0011001; //4
			4'b0101: hex = 7'b0010010; //5
			4'b0110: hex = 7'b0000010; //6
			4'b0111: hex = 7'b1111000; //7
			4'b1000: hex = 7'b0000000; //8
			4'b1001: hex = 7'b0011000; //9
			4'b1010: hex = 7'b0001000; //A
			4'b1011: hex = 7'b0000011; //B
			4'b1100: hex = 7'b1000110; //C
			4'b1101: hex = 7'b0100001; //D
			4'b1110: hex = 7'b0000110; //E
			4'b1111: hex = 7'b0001110; //F
			default: hex = 7'b1111111;
		endcase
	end
endmodule
