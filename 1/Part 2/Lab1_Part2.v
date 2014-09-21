module Lab1_Part2 (SW, LEDR, LEDG);
	input [17:0] SW; // toggle switches
	output [17:0] LEDR; // red LEDs
	output [7:0] LEDG; // green LEDs
	
	assign LEDR = SW;
	
	assign x0 = SW[0];
	assign x1 = SW[1];
	assign x2 = SW[2];
	assign x3 = SW[3];
	assign x4 = SW[4];
	assign x5 = SW[5];
	assign x6 = SW[6];
	assign x7 = SW[7];
	
	assign y0 = SW[8];
	assign y1 = SW[9];
	assign y2 = SW[10];
	assign y3 = SW[11];
	assign y4 = SW[12];
	assign y5 = SW[13];
	assign y6 = SW[14];
	assign y7 = SW[15];
	
	assign s = SW[17];
	
	//Write 8 assign statements specifically for each light
   assign LEDG[0] = (~s & x0) | (s & y0);
	assign LEDG[1] = (~s & x1) | (s & y1);
	assign LEDG[2] = (~s & x2) | (s & y2);
	assign LEDG[3] = (~s & x3) | (s & y3);
	assign LEDG[4] = (~s & x4) | (s & y4);
	assign LEDG[5] = (~s & x5) | (s & y5);
	assign LEDG[6] = (~s & x6) | (s & y6);
	assign LEDG[7] = (~s & x7) | (s & y7);
	
endmodule
