//Finalizado
module modulo_verificador_ausencia_rolhas(reg_r, ro);


   input [4:0] reg_r;
	output ro;

	or_gate_5_inputs gate_1(.A(reg_r[4]),.B(reg_r[3]),.C(reg_r[2]),.D(reg_r[1]),.E(reg_r[0]),.S(ro));

	
endmodule 