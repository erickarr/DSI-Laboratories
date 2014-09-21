module Lab1_Part3(SW,LEDR,LEDG);
	input [17:0] SW;
	output [17:0] LEDR;
	output [7:0] LEDG;

	wire[2:0] U,V,W,X,Y; //Output value of the MUX
	wire[3:0] selectors = SW[17:15];
	reg[2:0] M; //The outut
	
	//Setup the last 15 switches to each of the inputs
	assign U = SW[14:12];
	assign V = SW[11:9];
	assign W = SW[8:6];
	assign X = SW[5:3];
	assign Y = SW[2:0];

	always @(selectors)//Look uptable for selector bits
		case(selectors)
			4'b0000: M = U; //U
			4'b0001: M = V; //V
			4'b0011: M = X; //X
			4'b0010: M = W; //W
			default: M = Y;
		endcase
	
	assign LEDR = SW;
	
	assign LEDG[2:0] = M;
endmodule
