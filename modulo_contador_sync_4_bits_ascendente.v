//Finalizado
module modulo_contador_sync_4_bits_ascendente(input_primeiro_ff, preset, clear, clock, q);
	
	
	input clock,preset,clear,input_primeiro_ff;
	output [3:0] q;
	wire [1:0] ff_inputs;
	
	modulo_ff_t ff_1(.t(input_primeiro_ff),.clock(clock),.preset(preset),.clear(clear),.q(q[0]),.q_bar());
	modulo_ff_t ff_2(.t(q[0]),.clock(clock),.preset(preset),.clear(clear),.q(q[1]),.q_bar());
	
	and(ff_inputs[0], q[1],q[0]);
	
	modulo_ff_t ff_3(.t(ff_inputs[0]),.clock(clock),.preset(preset),.clear(clear),.q(q[2]),.q_bar());
	
	and(ff_inputs[1], ff_inputs[0], q[2]);
	
	modulo_ff_t ff_4(.t(ff_inputs[1]),.clock(clock),.preset(preset),.clear(clear),.q(q[3]),.q_bar());
	
	
endmodule
