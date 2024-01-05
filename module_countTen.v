module and_gate_3_inputs(A,B,C,D,countPhase, out);
	input A,B,C,D;
	input [3:0] countPhase;
	output out;
	not(NcountPhase[1], countPhase[1]);
	not(NcountPhase[3], countPhase[3]);
	
	and_gate_4_inputs gate_1(.A(countPhase[0]),.B(Ninput_sel[1]),.C(countPhase[2]),.D(Ninput_sel[3]),.S(out),);
	
	endmodule 