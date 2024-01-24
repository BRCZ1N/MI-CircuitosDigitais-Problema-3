//Finalizado
module modulo_contador_sync_7_bits_descendente(clk, load, e, q_bar,prst_input_test, clr_input_test);

	input clk,load;
	input [6:0] e;
	wire [4:0]ff_inputs;
	output [6:0] q_bar,prst_input_test, clr_input_test;
	wire [6:0] prst_input, clr_input, q;
	
	assign prst_input_test = prst_input;
	assign clr_input_test = clr_input;
	
	and_gate_2_inputs gate_6(.A(load),.B(e[6]),.S(clr_input[6]));
	and_gate_2_inputs gate_7(.A(load),.B(e[5]),.S(clr_input[5]));
	and_gate_2_inputs gate_8(.A(load),.B(e[4]),.S(clr_input[4]));
	and_gate_2_inputs gate_9(.A(load),.B(e[3]),.S(clr_input[3]));
	and_gate_2_inputs gate_10(.A(load),.B(e[2]),.S(clr_input[2]));
	and_gate_2_inputs gate_11(.A(load),.B(e[1]),.S(clr_input[1]));
	and_gate_2_inputs gate_12(.A(load),.B(e[0]),.S(clr_input[0]));
	
	and_gate_2_inputs gate_13(.A(load),.B(clr_input[6]),.S(prst_input[6]));
	and_gate_2_inputs gate_14(.A(load),.B(clr_input[5]),.S(prst_input[5]));
	and_gate_2_inputs gate_15(.A(load),.B(clr_input[4]),.S(prst_input[4]));
	and_gate_2_inputs gate_16(.A(load),.B(clr_input[3]),.S(prst_input[3]));
	and_gate_2_inputs gate_17(.A(load),.B(clr_input[2]),.S(prst_input[2]));
	and_gate_2_inputs gate_18(.A(load),.B(clr_input[1]),.S(prst_input[1]));
	and_gate_2_inputs gate_19(.A(load),.B(clr_input[0]),.S(prst_input[0]));
	
	
	modulo_ff_t ff_1(.t(1'b1),.clk(clk),.prst(prst_input[0]),.clr(clr_input[0]),.q(q[0]),.q_bar(q_bar[0]));
	
	modulo_ff_t ff_2(.t(q[0]),.clk(clk),.prst(prst_input[1]),.clr(clr_input[1]),.q(q[1]),.q_bar(q_bar[1]));
	and_gate_2_inputs gate_1(.A(q[0]),.B(q[1]),.S(ff_inputs[0]));
	
	
	modulo_ff_t ff_3(.t(ff_inputs[0]),.clk(clk),.prst(prst_input[2]),.clr(clr_input[2]),.q(q[2]),.q_bar(q_bar[2]));
	and_gate_2_inputs gate_2(.A(ff_inputs[0]),.B(q[2]),.S(ff_inputs[1])); 
	
	
	modulo_ff_t ff_4(.t(ff_inputs[1]),.clk(clk),.prst(prst_input[3]),.clr(clr_input[3]),.q(q[3]),.q_bar(q_bar[3]));
	and_gate_2_inputs gate_3(.A(ff_inputs[1]),.B(q[3]),.S(ff_inputs[2])); 
	
	
	modulo_ff_t ff_5(.t(ff_inputs[2]),.clk(clk),.prst(prst_input[4]),.clr(clr_input[4]),.q(q[4]),.q_bar(q_bar[4]));
	and_gate_2_inputs gate_4(.A(ff_inputs[2]),.B(q[4]),.S(ff_inputs[3])); 
	
	
	modulo_ff_t ff_6(.t(ff_inputs[3]),.clk(clk),.prst(prst_input[5]),.clr(clr_input[5]),.q(q[5]),.q_bar(q_bar[5]));
	and_gate_2_inputs gate_5(.A(ff_inputs[3]),.B(q[5]),.S(ff_inputs[4])); 
	
	modulo_ff_t ff_7(.t(ff_inputs[4]),.clk(clk),.prst(prst_input[6]),.clr(clr_input[6]),.q(q[6]),.q_bar(q_bar[6]));

	
endmodule 
	
	