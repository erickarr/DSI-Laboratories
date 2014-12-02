module Lab4_Part5(SW,LEDR,LEDG,HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0,CLOCK_50);
	input [17:0] SW;
	input CLOCK_50;
	output [17:0] LEDR;
	output [7:0] LEDG;
	output [6:0] HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0;
	
	integer cntr;
	reg [3:0] number;
	
	always @ (posedge CLOCK_50) begin
		cntr <= cntr + 1;
		
		if(cntr == 50000000) begin
			number = number + 1'b1;
			cntr <= 0;
		end
		
		if(number > 7) begin
			number = 0;
		end
	end
	
	hexDisplay h0 ((number+7)%8,HEX0);
	hexDisplay h1 ((number+6)%8,HEX1);
	hexDisplay h2 ((number+5)%8,HEX2);
	hexDisplay h3 ((number+4)%8,HEX3);
	hexDisplay h4 ((number+3)%8,HEX4);
	hexDisplay h5 ((number+2)%8,HEX5);
	hexDisplay h6 ((number+1)%8,HEX6);
	hexDisplay h7 (number%8,HEX7);
	
endmodule

module hexDisplay(input [3:0] bits, output reg [6:0] hex);
	always @ (*) begin
		case(bits)
			4'b0000: hex = 7'b1111111; //blank
			4'b0001: hex = 7'b1111111; //blank
			4'b0010: hex = 7'b1111111; //blank
			4'b0011: hex = 7'b0001001; //H
			4'b0100: hex = 7'b0000110; //E
			4'b0101: hex = 7'b1000111; //L
			4'b0110: hex = 7'b1000111; //L
			4'b0111: hex = 7'b1000000; //O
			default: hex = 7'b1111111;
		endcase
	end
endmodule
