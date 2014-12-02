module Lab2_Part5(SW,LEDR,LEDG,HEX7,HEX6,HEX5,HEX4,HEX2,HEX1,HEX0);
	input [15:0] SW;
	output [15:0] LEDR;
	output [7:0] LEDG;
	output [7:0] HEX0;
	output [7:0] HEX1;
	output [7:0] HEX2;
	output [7:0] HEX4;
	output [7:0] HEX5;
	output [7:0] HEX6;
	output [7:0] HEX7;
	
	wire [3:0] S7,S6,S5,S4,S3,S2,S1,S0;
	reg[3:0] invalidNums;
	
	//HEX displays
	hexDisplay h7 (SW[15:12],HEX7);
	hexDisplay h6 (SW[11:8],HEX6);
	
	hexDisplay h5 (SW[7:4],HEX5);
	hexDisplay h4 (SW[3:0],HEX4);
	
	add_2_4bit_nums a1 (SW[11:8],SW[3:0],S1,S0);
	
	//put S0 on HEX0
	
	hexDisplay h0 (S0,HEX0);
	
	//2
	add_2_4bit_nums a2 (SW[15:12],S1,S3,S2);
	
	//3
	add_2_4bit_nums a3 (SW[7:4],S2,S5,S4);
	
	hexDisplay h1 (S4,HEX1);
	
	//4
	add_2_4bit_nums a4 (S5,S3,S7,S6);
	
	hexDisplay h2 (S6,HEX2);
	
	assign LEDR = SW;
	
	//If any of the four input numbers is invalid a corresponding LEDG will be illuminated
	always @ (SW) begin
		if(SW[15:12] > 4'b1001) begin
			invalidNums[3] = 1;
		end else
			invalidNums[3] = 0;
		if(SW[11:8] > 4'b1001) begin
			invalidNums[2] = 1;
		end else 
			invalidNums[2] = 0;
		if(SW[7:4] > 4'b1001) begin
			invalidNums[1] = 1;
		end else
			invalidNums[1] = 0;
		if(SW[3:0] > 4'b1001) begin
			invalidNums[0] = 1;
		end else
			invalidNums[0] = 0;
	end
	
	assign LEDG[3:0] = invalidNums;
endmodule

//This module will accept two 4 bit numbers and add them for a 5 bit result
module add_2_4bit_nums(A,B,S1,S0);
	input [3:0] A;
	input [3:0] B;
	output [3:0] S1;
	output [3:0] S0;
	reg [3:0] num1,num0;
	reg [4:0] S;
	
	always @ ( * ) begin
		S = A + B;
		
		if(S > 4'b1001) begin
			num1 = 4'b0001;
			num0 = S + 4'b0110;
		end else begin
			num1 = 4'b0000;
			num0 = S;
		end
	end
	
	assign S1 = num1;
	assign S0 = num0;
endmodule

//This module will display the 4 bit numbers on the HEX displays
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
