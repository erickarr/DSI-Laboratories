module Lab2_Part6(SW,LEDR,LEDG,HEX7,HEX6,HEX5,HEX4,HEX2,HEX1,HEX0);
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
	
	reg[3:0] invalidNums;
	wire [3:0] A0,A1,B0,B1;
	reg [3:0] Z0,Z1;
	reg[4:0] T0,T1,S0,S1,S2;
	reg c1,c2;
	
	//Assign the numbers to the wires
	assign A0 = SW[11:8];
	assign A1 = SW[15:12];
	
	assign B0 = SW[3:0];
	assign B1 = SW[7:4];	
	
	//HEX displays
	hexDisplay h7 (A1,HEX7);
	hexDisplay h6 (A0,HEX6);
	
	hexDisplay h5 (B1,HEX5);
	hexDisplay h4 (B0,HEX4);

	always @ (*) begin
		T0 = A0 + B0;
		
		if(T0 > 9) begin
			Z0 = 6;
			c1 = 1;
		end else begin
			Z0 = 0;
			c1 = 0;
		end
		
		S0 = T0 + Z0;
	end
	
	hexDisplay h0 (S0,HEX0);
	
	always @ (*) begin
		T1 = A1 + B1 + c1;
		
		if(T1 > 9) begin
			Z1 = 6;
			c2 = 1;
		end else begin
			Z1 = 0;
			c2 = 0;
		end
		
		S1 = T1 + Z1;
		S2 = c2;
	end
	
	hexDisplay h1 (S1,HEX1);
	hexDisplay h2 (S2,HEX2);
	
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
	
	assign LEDR = SW;
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
