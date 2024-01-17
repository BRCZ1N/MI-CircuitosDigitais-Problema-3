module modulo_reset_contador_d(cd, rst_cd);
	
	input [3:0] cd;
	output rst_cd;
	
	and_gate_2_inputs gate_1(.A(cd[3]),.B(cd[2]),.S(rst_cd));
	
endmodule 