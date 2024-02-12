//Finalizado
module modulo_seletor_permissoes(ve,min_r,op,out_range_b,perm);
	
	
	input ve,min_r,op,out_range_b;
	output [1:0] perm;
	wire nve,nmin_r,nop,nout_range_b;
	
	not (nve, ve);
	not (nmin_r, min_r);
	not (nop, op);
	not (nout_range_b,out_range_b);
	
	and_gate_2_inputs gate_1(.A(nve),.B(nop),.S(perm[1]));
	and_gate_2_inputs gate_2(.A(nve),.B(op),.S(perm[0]));
	
	
	
endmodule 