module Lab3_Part2(SW,LEDR,LEDG);
	input [17:0] SW;
	output [17:0] LEDR;
	output [7:0] LEDG;
	
	wire D,clk,Q,Qbar;
	
	assign D = SW[0];
	assign clk = SW[1];
	assign LEDG[1] = Q;
	assign LEDG[0] = Qbar;
	
	d_flip_flop(D,clk,Q,Qbar);
	
	assign LEDR = SW;
endmodule

module d_flip_flop(D,clk,Q,Qbar);
	input D,clk;
	output Q,Qbar;
	
	wire R,S,R_g,S_g;
	
	assign S = D;
	assign R = ~D;	
	assign R_g = R & clk;
	assign S_g = S & clk;
	
	nor(Q,R_g,Qbar);
	nor(Qbar,S_g,Q);
endmodule
