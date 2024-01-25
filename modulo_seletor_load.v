//Finalizado
module modulo_seletor_load(ve,min_r,op,out_range_b,load);
	
	
	input ve,min_r,op,out_range_b;
	output load;
	wire nve,nmin_r,nop,nout_range_b;
	wire [1:0] load_aux;
	
	not (nve, ve);
	not (nmin_r, min_r);
	not (nop, op);
	not (nout_range_b,out_range_b);
	
	and_gate_3_inputs gate_1(.A(nmin_r),.B(op),.C(nout_range_b),.S(load_aux[1]));
	and_gate_3_inputs gate_2(.A(min_r),.B(nop),.C(nout_range_b),.S(load_aux[0]));
	
	or_gate_3_inputs gate_3(.A(load_aux[1]),.B(load_aux[0]),.C(ve),.S(load));
	
	
endmodule 