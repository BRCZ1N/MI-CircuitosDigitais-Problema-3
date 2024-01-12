module modulo_codificador_contador4bitsU(cdd,cdf);

	input [3:0] cdd;
	output [3:0] cdf;
	wire [2:0] Ncdd;

	not(Ncdd[2], cdd[2]);
	not(Ncdd[0], cdd[0]);
	
	and_gate_2_inputs gate_1(.A(cdd[0]),.B(Ncdd[2]),.S(cdf[3]));
	
	and_gate_2_inputs gate_2(.A(1'b1),.B(cdd[1]),.S(cdf[2]));
	
	and_gate_2_inputs gate_3(.A(Ncdd[0]),.B(cdd[2]),.S(cdf[1]));
	
	and_gate_2_inputs gate_4(.A(1'b1),.B(cdd[3]),.S(cdf[0]));
	
endmodule
