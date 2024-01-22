//Finalizado
module modulo_contador_sync_2_bits_ascendente(preset, clear, clock, q);


	input clock,preset,clear;
	output [1:0] q;
	
	modulo_ff_t ff_1(.t(1'b1),.clock(clock),.preset(preset),.clear(clear),.q(q[0]),.q_bar());
	
	modulo_ff_t ff_2(.t(q[0]),.clock(clock),.preset(preset),.clear(clear),.q(q[1]),.q_bar());

	
endmodule 
