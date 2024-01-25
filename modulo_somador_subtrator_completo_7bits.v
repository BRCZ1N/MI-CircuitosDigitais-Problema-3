module modulo_somador_subtrator_completo_7bits(op_aritmetica,a,b,sum);

	input [6:0] a,b;
	input op_aritmetica;
	output [6:0] sum;
	wire [6:0] transporte_aux_somadores_subtratores_completo;
	
	modulo_somador_subtrator_completo somador_subtrator_1(.m(op_aritmetica),.a(a[0]),.b(b[0]),.Te(1'b0),.S(sum[0]),.Ts(transporte_aux_somadores_subtratores_completo[0]));
	modulo_somador_subtrator_completo somador_subtrator_2(.m(op_aritmetica),.a(a[1]),.b(b[1]),.Te(transporte_aux_somadores_subtratores_completo[0]),.S(sum[1]),.Ts(transporte_aux_somadores_subtratores_completo[1]));
	modulo_somador_subtrator_completo somador_subtrator_3(.m(op_aritmetica),.a(a[2]),.b(b[2]),.Te(transporte_aux_somadores_subtratores_completo[1]),.S(sum[2]),.Ts(transporte_aux_somadores_subtratores_completo[2]));
	modulo_somador_subtrator_completo somador_subtrator_4(.m(op_aritmetica),.a(a[3]),.b(b[3]),.Te(transporte_aux_somadores_subtratores_completo[2]),.S(sum[3]),.Ts(transporte_aux_somadores_subtratores_completo[3]));
	modulo_somador_subtrator_completo somador_subtrator_5(.m(op_aritmetica),.a(a[4]),.b(b[4]),.Te(transporte_aux_somadores_subtratores_completo[3]),.S(sum[4]),.Ts(transporte_aux_somadores_subtratores_completo[4]));
	modulo_somador_subtrator_completo somador_subtrator_6(.m(op_aritmetica),.a(a[5]),.b(b[5]),.Te(transporte_aux_somadores_subtratores_completo[4]),.S(sum[5]),.Ts(transporte_aux_somadores_subtratores_completo[5]));
	modulo_somador_subtrator_completo somador_subtrator_7(.m(op_aritmetica),.a(a[6]),.b(b[6]),.Te(transporte_aux_somadores_subtratores_completo[5]),.S(sum[6]),.Ts());
	
endmodule 