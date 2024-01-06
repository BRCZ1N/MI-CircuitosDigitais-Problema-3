module modulo_reset_count_d(cdd, out);
	
	input [3:0] cdd;
	output out;
	
	not(Ncdd[1], cdd[1]);
	not(Ncdd[3], cdd[3]);
	
	and_gate_4_inputs gate_1(.A(cdd[3]),.B(Ncdd[2]),.C(cdd[1]),.D(Ncdd[0]),.S(out));
	
endmodule 