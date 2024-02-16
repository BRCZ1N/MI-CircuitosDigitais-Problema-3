//Finalizado
module modulo_valor_minimo_rolhas(reg_r, min_signal);


	input [4:0]reg_r;
	output min_signal;
	wire [4:0] Nreg_r;
	wire [1:0] ands;

	not(Nreg_r[4], reg_r[4]);

	not(Nreg_r[3], reg_r[3]);

	not(Nreg_r[2], reg_r[2]);

	not(Nreg_r[1], reg_r[1]);

	and_gate_3_inputs gate_1(.A(Nreg_r[4]),.B(Nreg_r[3]),.C(Nreg_r[2]),.S(ands[0]));

	and_gate_3_inputs gate_2(.A(Nreg_r[4]),.B(Nreg_r[3]),.C(Nreg_r[1]),.S(ands[1]));

	or_gate_2_inputs gate_3(.A(ands[0]),.B(ands[1]),.S(min_signal));

	
endmodule 