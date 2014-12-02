module Lab5_Part2(LEDR,LEDG,KEY,CLOCK_50,HEX2,HEX1,HEX0);
	input [3:0] KEY;
	input CLOCK_50;
	output [17:0] LEDR;
	output [7:0] LEDG;
	output [6:0] HEX2,HEX1,HEX0;
	
	integer cntr = 0;
	
	wire clk,reset;
	reg [3:0] num0,num1,num2;
	reg Q;
	
	assign clk = CLOCK_50;
	assign reset = KEY[1];
	
	always @ (posedge clk) begin
		cntr <= cntr + 1;
		
		if(cntr == 25000000) begin
			Q <= ~Q;
			cntr <= 0;
		end
	end
	
	always @(posedge Q or negedge reset) begin
		if (~reset) begin
			num0 <= 'd0;
			num1 <= 'd0;
			num2 <= 'd0;
		end else if(num2 == 4'b1001 && num1 == 4'b1001 && num0 == 4'b1001) begin
			num0 <= 'd0;
			num1 <= 'd0;
			num2 <= 'd0;
		end else if(num1 == 4'b1001 && num0 == 4'b1001) begin
			num0 <= 'd0;
			num1 <= 'd0;
			num2 <= num2 + 1;
		end else if(num0 == 4'b1001) begin
			num0 <= 'd0;
			num1 <= num1 + 1;
		end else
			num0 <= num0 + 1;
	end
	
	hexDisplay h0 (num0, HEX0);
	hexDisplay h1 (num1, HEX1);
	hexDisplay h2 (num2, HEX2);
	
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
			default: hex = 7'b1111111;
		endcase
	end
endmodule
