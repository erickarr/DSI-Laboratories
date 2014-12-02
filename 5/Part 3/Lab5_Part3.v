module Lab5_Part3(SW,LEDR,LEDG,KEY,HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,CLOCK_50);
	input [3:0] KEY;
	input [15:0] SW;
	input CLOCK_50;
	output [15:0] LEDR;
	output [7:0] LEDG;
	output [6:0] HEX7,HEX6,HEX5,HEX4,HEX3,HEX2;
	
	integer cntr = 0; //Strictly for timing
	reg [3:0] sec0, sec1, min0, min1, hr0, hr1;
	reg [3:0] sec0Init;
	reg cnt;
	//integer test = 4;
	

	/*always @ (SW) begin
		sec0Init = SW[3:0];
	end*/
			
	assign LEDG[3:0] = sec0;
	
	hexDisplay s0(sec0,HEX2);
	hexDisplay s1(sec1,HEX3);
	
	hexDisplay m0(min0,HEX4);
	hexDisplay m1(min1,HEX5);
	
	hexDisplay h0(hr0,HEX6);
	hexDisplay h1(hr1,HEX7);
	
	always @ (posedge CLOCK_50) begin
		cntr <= cntr + 1;
		
		if(cntr == 30000000) begin
			cnt <= ~cnt;
			cntr <= 0;
		end
	end
	
	always @ (posedge cnt) begin
		if(hr1 == 2 && hr0 == 3 && min1 == 5 && min0 == 9 && sec1 == 5 && sec0 == 9) begin
			hr1 <= 0;
			hr0 <= 0;
			min1 <= 0;
			min0 <= 0;
			sec1 <= 0;
			sec0 <= 0;
		end else if(hr1 == 2 && hr0 < 3 && min1 == 5 && min0 == 9 && sec1 == 5 && sec0 == 9) begin
			hr0 <= hr0 + 1;
			min1 <= 0;
			min0 <= 0;
			sec1 <= 0;
			sec0 <= 0;
		end else if(hr1 < 2 && hr0 == 9 && min1 == 5 && min0 == 9 && sec1 == 5 && sec0 == 9) begin
			hr1 <= hr1 + 1;
			hr0 <= 0;
			min1 <= 0;
			min0 <= 0;
			sec1 <= 0;
			sec0 <= 0;
		end else if(min1 == 5 && min0 == 9 && sec1 == 5 && sec0 == 9) begin
			hr0 <= hr0 + 1;
			min1 <= 0;
			min0 <= 0;
			sec1 <= 0;
			sec0 <= 0;
		end else if(min0 == 9 && sec1 == 5 && sec0 == 9) begin
			min1 <= min1 + 1;
			min0 <= 0;
			sec1 <= 0;
			sec0 <= 0;
		end else if(sec1 == 5 && sec0 == 9) begin
			min0 <= min0 + 1;
			sec1 <= 0;
			sec0 <= 0;
		end else if(sec0 == 9) begin
			sec1 <= sec1 + 1;
			sec0 <= 0;
		end else
			sec0 <= sec0 + 1 + sec0Init;
			sec0Init = 0;
	end
	
	assign LEDR = SW;
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
