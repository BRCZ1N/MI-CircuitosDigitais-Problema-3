//Finalizado
module modulo_registrador_rolhas(
  input [6:0] m_in, e_load,
  input clk, enable, load,
  output [6:0] m_out
);
	
	wire [6:0] clr_input, prst_input;
	
	nand_gate_2_inputs gate_6(.A(load),.B(e_load[6]),.S(prst_input[6]));
	nand_gate_2_inputs gate_7(.A(load),.B(e_load[5]),.S(prst_input[5]));
	nand_gate_2_inputs gate_8(.A(load),.B(e_load[4]),.S(prst_input[4]));
	nand_gate_2_inputs gate_9(.A(load),.B(e_load[3]),.S(prst_input[3]));
	nand_gate_2_inputs gate_10(.A(load),.B(e_load[2]),.S(prst_input[2]));
	nand_gate_2_inputs gate_11(.A(load),.B(e_load[1]),.S(prst_input[1]));
	nand_gate_2_inputs gate_12(.A(load),.B(e_load[0]),.S(prst_input[0]));
	
	nand_gate_2_inputs gate_13(.A(load),.B(prst_input[6]),.S(clr_input[6]));
	nand_gate_2_inputs gate_14(.A(load),.B(prst_input[5]),.S(clr_input[5]));
	nand_gate_2_inputs gate_15(.A(load),.B(prst_input[4]),.S(clr_input[4]));
	nand_gate_2_inputs gate_16(.A(load),.B(prst_input[3]),.S(clr_input[3]));
	nand_gate_2_inputs gate_17(.A(load),.B(prst_input[2]),.S(clr_input[2]));
	nand_gate_2_inputs gate_18(.A(load),.B(prst_input[1]),.S(clr_input[1]));
	nand_gate_2_inputs gate_19(.A(load),.B(prst_input[0]),.S(clr_input[0]));

  modulo_ff_d ff[6:0](
    .d({m_in[6], m_in[5], m_in[4], m_in[3], m_in[2], m_in[1], m_in[0]}),
    .clk(clk),
    .clr({clr_input[6], clr_input[5], clr_input[4], clr_input[3], clr_input[2], clr_input[1], clr_input[0]}),
	 .prst({prst_input[6], prst_input[5],prst_input[4], prst_input[3], prst_input[2], prst_input[1], prst_input[0]}),
	 .enable(enable),
    .q({m_out[6], m_out[5], m_out[4], m_out[3], m_out[2], m_out[1], m_out[0]}),
    .nq()
  );

endmodule
