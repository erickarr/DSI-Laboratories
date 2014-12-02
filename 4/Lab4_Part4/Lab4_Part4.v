module Lab4_Part4(SW,LEDR,LEDG,HEX0,CLOCK_50);
	input [17:0] SW;
	input CLOCK_50;
	output [17:0] LEDR;
	output [7:0] LEDG;
	output [6:0] HEX0;
	
	integer cntr;
	reg [3:0] number;
	
	always @ (posedge CLOCK_50) begin
		cntr <= cntr + 1;
		
		if(cntr == 50000000) begin
			number = number + 1'b1;
			cntr <= 0;
		end
		
		if(number > 9) begin
			number = 0;
		end
	end
	
	hexDisplay h0 (number,HEX0);
	
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
