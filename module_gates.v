module and_gate_3_inputs(A,B,C,S);

	input A,B,C;
	output S;

	and(S,A,B,C);

endmodule 

module and_gate_4_inputs(A,B,C,D,S);

	input A,B,C,D;
	output S;

	and(S,A,B,C,D);

endmodule 

module and_gate_7_inputs(A,B,C,D,E,F,G,S);

	input A,B,C,D,E,F,G;
	output S;

	and(S,A,B,C,D,E,F,G);

endmodule 

module or_gate_4_inputs(A,B,C,D,S);

	input A,B,C,D;
	output S;
	
	or(S,A,B,C,D);


endmodule

module or_gate_3_inputs(A,B,C,S);

	input A,B,C;
	output S;
	
	or(S,A,B,C);


endmodule

module or_gate_2_inputs(A,B,S);

	input A,B;
	output S;
	
	or(S,A,B);


endmodule


module or_gate_5_inputs(A,B,C,D,E,S);

	input A,B,C,D,E;
	output S;
	
	or(S,A,B,C,E,D);


endmodule

module and_gate_2_inputs(A,B,S);

	input A,B;
	output S;
	
	and(S,A,B);
	
	
endmodule 

module and_gate_5_inputs(A,B,C,D,E,S);

	input A,B,C,D,E;
	output S;

	and(S,A,B,C,E,D);

endmodule 

