module modulo_reset_contador_dd(cdd, rst_cdd);
	
	input [3:0] cdd;
	output rst_cdd;
	wire [3:0] Ncdd;
	
	not (Ncdd[3], cdd[3]);
	not (Ncdd[2], cdd[2]);
	not (Ncdd[1], cdd[1]);
	not (Ncdd[0], cdd[0]);
	
	and_gate_4_inputs gate_1(.A(cdd[3]),.B(Ncdd[2]),.C(cdd[1]),.D(Ncdd[0]),.S(rst_cdd));
	
endmodule 