module Lab3_Part5(SW,LEDR,LEDG,KEY1,HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0);
	input [17:0] SW;
	input KEY1;
	output [17:0] LEDR;
	output [7:0] LEDG;
	output reg [6:0] HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0;
	
	reg [3:0] a,b,c,d,e,f,g,h;

	always @ (*) begin
		if(SW[17] == 1) begin
			a = SW[15:12];
			b = SW[11:8];
			c = SW[7:4];
			d = SW[3:0];
		end else begin
			e = SW[15:12];
			f = SW[11:8];
			g = SW[7:4];
			h = SW[3:0];
		end
	end
	
	hexDisplay h7 (a,HEX7);
	hexDisplay h6 (b,HEX6);
	hexDisplay h5 (c,HEX5);
	hexDisplay h4 (d,HEX4);
	
	hexDisplay h3 (e,HEX3);
	hexDisplay h2 (f,HEX2);
	hexDisplay h1 (g,HEX1);
	hexDisplay h0 (h,HEX0);

endmodule


module hexDisplay(input [3:0] bits, input highOrLow, output reg [6:0] hex);
	always@(bits) begin
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
			4'b1001: hex = 7'b0001000; //A
			4'b1010: hex = 7'b0000011; //B
			4'b1011: hex = 7'b1000110; //C
			4'b1100: hex = 7'b0100001; //D
			4'b1101: hex = 7'b0000110; //E
			4'b1110: hex = 7'b0001110; //F
			default: hex = 7'b1111111;
		endcase
	end
endmodule
