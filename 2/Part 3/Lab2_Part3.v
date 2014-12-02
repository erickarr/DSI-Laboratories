module Lab2_Part3(SW,LEDR,LEDG);
	input [8:0] SW;
	output [8:0] LEDR;
	output [7:0] LEDG;
	wire [3:0] a,b;
	wire cin,cout,c1,c2,c3;
	
	assign cin = SW[8];
	
	assign a = SW[3:0];
	assign b = SW[7:4];
	
	adder a0 (a[0],b[0],cin,LEDG[0],c1);
	adder a1 (a[1],b[1],c1,LEDG[1],c2);
	adder a2 (a[2],b[2],c2,LEDG[2],c3);
	adder a3 (a[3],b[3],c3,LEDG[3],cout);
	
	assign LEDG[4] = cout;
 	
	assign LEDR = SW;
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
