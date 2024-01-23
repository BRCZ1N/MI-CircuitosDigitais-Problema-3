//Finalizado
module modulo_verificador_ausencia_rolhas(reg_r, ro);


	input [6:0]reg_r;
	output ro;

	or_gate_7_inputs gate_1(.A(reg_r[6]),.B(reg_r[5]),.C(reg_r[4]),.D(reg_r[3]),.E(reg_r[2]),.F(reg_r[1]),.G(reg_r[0]),.S(ro));

	
endmodule 