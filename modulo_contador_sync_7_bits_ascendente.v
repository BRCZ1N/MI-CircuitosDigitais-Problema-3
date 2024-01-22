//Finalizado
module modulo_contador_sync_7_bits_ascendente(preset, clear, clock, q);


	input clock,preset,clear;
	wire [4:0]ff_inputs;
	output [6:0] q;
	
	modulo_ff_t ff_1(.t(1'b1),.clock(clock),.preset(preset),.clear(clear),.q(q[0]),.q_bar());
	
	modulo_ff_t ff_2(.t(q[0]),.clock(clock),.preset(preset),.clear(clear),.q(q[1]),.q_bar());
	
	and_gate_2_inputs gate_1(.A(q[0]),.B(q[1]),.S(ff_inputs[0]));
	
	
	modulo_ff_t ff_3(.t(ff_inputs[0]),.clock(clock),.preset(preset),.clear(clear),.q(q[2]),.q_bar());
	
	and_gate_2_inputs gate_2(.A(ff_inputs[0]),.B(q[2]),.S(ff_inputs[1])); 
	
	
	modulo_ff_t ff_4(.t(ff_inputs[1]),.clock(clock),.preset(preset),.clear(clear),.q(q[3]),.q_bar());
	
	and_gate_2_inputs gate_3(.A(ff_inputs[1]),.B(q[3]),.S(ff_inputs[2])); 
	
	
	modulo_ff_t ff_5(.t(ff_inputs[2]),.clock(clock),.preset(preset),.clear(clear),.q(q[4]),.q_bar());
	and_gate_2_inputs gate_4(.A(ff_inputs[2]),.B(q[4]),.S(ff_inputs[3])); 
	
	
	modulo_ff_t ff_6(.t(ff_inputs[3]),.clock(clock),.preset(preset),.clear(clear),.q(q[5]),.q_bar());
	and_gate_2_inputs gate_5(.A(ff_inputs[3]),.B(q[5]),.S(ff_inputs[4])); 
	
	modulo_ff_t ff_7(.t(ff_inputs[4]),.clock(clock),.preset(preset),.clear(clear),.q(q[6]),.q_bar());

	
endmodule 
	
	