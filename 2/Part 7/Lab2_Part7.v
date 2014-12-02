module Lab2_Part7(SW,LEDR,HEX1,HEX0);
	input [5:0] SW;
	output [5:0] LEDR;
	output [6:0] HEX0;
	output [6:0] HEX1;
	
	reg [3:0] tens;
	reg [3:0] ones;
	
	integer i;
	
	always @ (SW) begin
		tens = 4'd0;
		ones = 4'd0;
		
		for(i = 5; i >=0; i=i-1)
		begin
			if(tens >= 5)
				tens = tens + 3;
			if(ones >= 5)
				ones = ones + 3;
				
			tens = tens << 1;
			tens[0] = ones[3];
			ones = ones << 1;
			ones[0] = SW[i];
		end
	end
	
	hexDisplay h1 (tens,HEX1);
	hexDisplay h0 (ones,HEX0);

	assign LEDR = SW;
endmodule

//Take a 4bit number and put it on the HEX display
module hexDisplay(input [3:0] BCD, output reg [6:0] hex);
	always@(BCD) begin
		case(BCD)
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
