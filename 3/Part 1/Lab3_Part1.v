module Lab3_Part1(SW,LEDR,LEDG);
	input [17:0] SW;
	output [17:0] LEDR;
	output [7:0] LEDG;
	
	wire Q, Qbar, S, R, clk;
	
	assign LEDG[1] = Q;
	assign LEDG[0] = Qbar;
	assign S = SW[1];
	assign R = SW[0];
	assign clk = SW[2];
	
	gated_sr_latch(S,R,clk,Q,Qbar);
	
	assign LEDR = SW;
endmodule

module gated_sr_latch(S,R,clk,Q,Qbar);
	input S,R,clk;
	output Q,Qbar;
	
	wire R_g, S_g;
	
	assign R_g = R & clk;
	assign S_g = S & clk;
	
	nor(Q,R_g,Qbar);
	nor(Qbar,S_g,Q);
endmodule
