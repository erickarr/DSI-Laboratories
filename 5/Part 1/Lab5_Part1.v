module Lab5_Part1(LEDR,LEDG,KEY);
	input [3:0] KEY;
	output [17:0] LEDR;
	output [7:0] LEDG;
	
	parameter cntrBits = 8;
	parameter k = 5;
	wire clock, reset_n;
	wire [2:0] Q;
	
	assign clock = KEY[2];
	assign reset_n = KEY[1];

	counter three_bit(~clock,reset_n,Q);
		defparam three_bit.n = cntrBits;
		defparam three_bit.k = k;
	
	assign LEDR[cntrBits-1:0] = Q;
	
endmodule

module counter(clock, reset_n, Q);
	parameter n = 4;
	parameter k;
	
	input clock, reset_n;
	output [n-1:0] Q;
	reg [n-1:0] Q;
	
	always @(posedge clock or negedge reset_n) begin
		if (~reset_n)
			Q <= 'd0;
		else if(Q == k-1)
			Q <= 'd0;
		else
			Q <= Q + 1'b1;
	end
endmodule
