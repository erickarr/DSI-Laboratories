module Lab2_Part4(SW,LEDR,LEDG,HEX6,HEX4,HEX1,HEX0);
	input [8:0] SW;
	output [8:0] LEDR;
	output [7:0] LEDG;
	output [7:0] HEX0;
	output [7:0] HEX1;
	output [7:0] HEX4;
	output [7:0] HEX6;
	wire [3:0] a,b;
	wire cin,cout,c1,c2,c3;
	reg error;
	
	assign cin = SW[8];
	
	assign a = SW[3:0];
	assign b = SW[7:4];
	
	adder a0 (a[0],b[0],cin,LEDG[0],c1);
	adder a1 (a[1],b[1],c1,LEDG[1],c2);
	adder a2 (a[2],b[2],c2,LEDG[2],c3);
	adder a3 (a[3],b[3],c3,LEDG[3],cout);
	
	assign LEDG[4] = cout;
	
	//Putting the BCD numbers on the HEX displays
	hexDisplay h4 (SW[3:0],HEX4);
	hexDisplay h6 (SW[7:4],HEX6);
	
	//Putting the result on HEX1 & HEX0
	hexSumDisplay h0 (LEDG[4:0], HEX0, HEX1);	
 	
	assign LEDR = SW;
	//If an invalid number has been chosen
	always @ (SW) begin
		if(SW[3:0] > 4'b1001 | SW[7:4] > 4'b1001) begin 
			error = 1;
		end else begin
			error = 0;
		end 
	end
	
	assign LEDG[7] = error;
	
endmodule

//Takes 2 bits, the carry in, and adds them to result with the sum and carry out
module adder(a,b,cin,s,cout);
	input a;
	input b;
	input cin;
	output s;
	output cout;
	
	assign s = a ^ b ^ cin;
	assign cout = (b & cin) | (a & cin) | (a & b);
endmodule

//Take a 4bit number and put it on the HEX display
module hexDisplay(input [3:0] BCD,output reg [6:0] hex);
	
	always@(BCD)
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
		
endmodule

//Take a 5bit number and put it on the HEX display
module hexSumDisplay(input [4:0] sum,
						output reg [6:0] hex0,
						output reg [6:0] hex1);
	always @ (sum) begin
		if(sum > 4'b1001)
			hex1 = 7'b1111001; //1
		else
			hex1 = 7'b1000000; //0
	end
	
	always@(sum)
		case(sum%10)
			4'd0: hex0 = 7'b1000000; //0
			4'd1: hex0 = 7'b1111001; //1
			4'd2: hex0 = 7'b0100100; //2
			4'd3: hex0 = 7'b0110000; //3
			4'd4: hex0 = 7'b0011001; //4
			4'd5: hex0 = 7'b0010010; //5
			4'd6: hex0 = 7'b0000010; //6
			4'd7: hex0 = 7'b1111000; //7
			4'd8: hex0 = 7'b0000000; //8
			4'd9: hex0 = 7'b0011000; //9
			default: hex0 = 7'b1111111;
		endcase
		
endmodule
