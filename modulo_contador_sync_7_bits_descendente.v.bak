//Finalizado
module modulo_contador_sync_7_bits_descendente(clear, clock, load, q_bar,e);

	input clock,clear,load;
	input [6:0] e;
	wire [4:0]ff_inputs;
	output [6:0] q_bar;
	wire [6:0] preset_input, clear_input;
	
	nand_gate_2_inputs gate_6(.A(load),.B(e[6]),.S(preset_input[6]));
	nand_gate_2_inputs gate_7(.A(load),.B(e[5]),.S(preset_input[5]));
	nand_gate_2_inputs gate_8(.A(load),.B(e[4]),.S(preset_input[4]));
	nand_gate_2_inputs gate_9(.A(load),.B(e[3]),.S(preset_input[3]));
	nand_gate_2_inputs gate_10(.A(load),.B(e[2]),.S(preset_input[2]));
	nand_gate_2_inputs gate_11(.A(load),.B(e[1]),.S(preset_input[1]));
	nand_gate_2_inputs gate_12(.A(load),.B(e[0]),.S(preset_input[0]));
	
	nand_gate_2_inputs gate_13(.A(load),.B(preset_input[6]),.S(clear_input[6]));
	nand_gate_2_inputs gate_14(.A(load),.B(preset_input[5]),.S(clear_input[5]));
	nand_gate_2_inputs gate_15(.A(load),.B(preset_input[4]),.S(clear_input[4]));
	nand_gate_2_inputs gate_16(.A(load),.B(preset_input[3]),.S(clear_input[3]));
	nand_gate_2_inputs gate_17(.A(load),.B(preset_input[2]),.S(clear_input[2]));
	nand_gate_2_inputs gate_18(.A(load),.B(preset_input[1]),.S(clear_input[1]));
	nand_gate_2_inputs gate_19(.A(load),.B(preset_input[0]),.S(clear_input[0]));
	
	
	modulo_ff_t ff_1(.t(1'b1),.clock(clock),.preset(preset_input[6]),.clear(clear_input[6]),.q(),.q_bar(q_bar[0]));
	
	modulo_ff_t ff_2(.t(q_bar[0]),.clock(clock),.preset(preset_input[5]),.clear(clear_input[5]),.q(),.q_bar(q_bar[1]));
	
	and_gate_2_inputs gate_1(.A(q_bar[0]),.B(q_bar[1]),.S(ff_inputs[0]));
	
	
	modulo_ff_t ff_3(.t(ff_inputs[0]),.clock(clock),.preset(preset_input[4]),.clear(clear_input[4]),.q(),.q_bar(q_bar[2]));
	
	and_gate_2_inputs gate_2(.A(ff_inputs[0]),.B(q_bar[2]),.S(ff_inputs[1])); 
	
	
	modulo_ff_t ff_4(.t(ff_inputs[1]),.clock(clock),.preset(preset_input[3]),.clear(clear_input[3]),.q(),.q_bar(q_bar[3]));
	
	and_gate_2_inputs gate_3(.A(ff_inputs[1]),.B(q_bar[3]),.S(ff_inputs[2])); 
	
	
	modulo_ff_t ff_5(.t(ff_inputs[2]),.clock(clock),.preset(preset_input[2]),.clear(clear_input[2]),.q(),.q_bar(q_bar[4]));
	and_gate_2_inputs gate_4(.A(ff_inputs[2]),.B(q_bar[4]),.S(ff_inputs[3])); 
	
	
	modulo_ff_t ff_6(.t(ff_inputs[3]),.clock(clock),.preset(preset_input[1]),.clear(clear_input[1]),.q(),.q_bar(q_bar[5]));
	and_gate_2_inputs gate_5(.A(ff_inputs[3]),.B(q_bar[5]),.S(ff_inputs[4])); 
	
	modulo_ff_t ff_7(.t(ff_inputs[4]),.clock(clock),.preset(preset_input[0]),.clear(clear_input[0]),.q(),.q_bar(q_bar[6]));

	
endmodule 
	
	