module modulo_contador_sync_7_bits_ascendente_descendente(clk, q, prst, clr, up_down, enable, load, e_load);

  input clk, clr, prst, up_down, enable, load;
  input [6:0] e_load;
  wire Nup_down;
  wire [6:0] q_bar;
  wire [5:0] ff_inputs,ff_inputs_aux, N_ff_inputs_aux;
  output [6:0] q;
  
  not (Nup_down,up_down);
  
  wire [6:0] clr_input, prst_input;
	
  nand_gate_2_inputs gate_20(.A(load),.B(e_load[6]),.S(prst_input[6]));
  nand_gate_2_inputs gate_21(.A(load),.B(e_load[5]),.S(prst_input[5]));
  nand_gate_2_inputs gate_22(.A(load),.B(e_load[4]),.S(prst_input[4]));
  nand_gate_2_inputs gate_23(.A(load),.B(e_load[3]),.S(prst_input[3]));
  nand_gate_2_inputs gate_24(.A(load),.B(e_load[2]),.S(prst_input[2]));
  nand_gate_2_inputs gate_25(.A(load),.B(e_load[1]),.S(prst_input[1]));
  nand_gate_2_inputs gate_26(.A(load),.B(e_load[0]),.S(prst_input[0]));
	
  nand_gate_2_inputs gate_27(.A(load),.B(prst_input[6]),.S(clr_input[6]));
  nand_gate_2_inputs gate_28(.A(load),.B(prst_input[5]),.S(clr_input[5]));
  nand_gate_2_inputs gate_29(.A(load),.B(prst_input[4]),.S(clr_input[4]));
  nand_gate_2_inputs gate_30(.A(load),.B(prst_input[3]),.S(clr_input[3]));
  nand_gate_2_inputs gate_31(.A(load),.B(prst_input[2]),.S(clr_input[2]));
  nand_gate_2_inputs gate_32(.A(load),.B(prst_input[1]),.S(clr_input[1]));
  nand_gate_2_inputs gate_33(.A(load),.B(prst_input[0]),.S(clr_input[0]));

  modulo_ff_t ff_1(.t(1'b1),.clk(clk),.clr(clr_input[6]),.prst(prst_input[6]),.enable(enable),.q(q[0]),.q_bar(q_bar[0]));

  and_gate_2_inputs gate_1(.A(up_down), .B(q[0]), .S(ff_inputs_aux[0]));
  and_gate_2_inputs gate_2(.A(Nup_down), .B(q_bar[0]), .S(N_ff_inputs_aux[0]));
  or_gate_2_inputs gate_3(.A(ff_inputs_aux[0]), .B(N_ff_inputs_aux[0]), .S(ff_inputs[0]));
  
  modulo_ff_t ff_2(.t(ff_inputs[0]),.clk(clk),.clr(clr_input[5]),.prst(prst_input[5]),.enable(enable),.q(q[1]),.q_bar(q_bar[1]));

  and_gate_3_inputs gate_4(.A(up_down),.B(q[1]),.C(q[0]),.S(ff_inputs_aux[1]));
  and_gate_3_inputs gate_5(.A(Nup_down),.B(q_bar[1]),.C(q_bar[0]),.S(N_ff_inputs_aux[1]));
  or_gate_2_inputs gate_6(.A(ff_inputs_aux[1]), .B(N_ff_inputs_aux[1]), .S(ff_inputs[1]));

  modulo_ff_t ff_3(.t(ff_inputs[1]),.clk(clk),.clr(clr_input[4]),.prst(prst_input[4]),.enable(enable),.q(q[2]),.q_bar(q_bar[2]));

  and_gate_4_inputs gate_7(.A(up_down),.B(q[2]),.C(q[1]),.D(q[0]),.S(ff_inputs_aux[2]));
  and_gate_4_inputs gate_8(.A(Nup_down),.B(q_bar[2]),.C(q_bar[1]),.D(q_bar[0]),.S(N_ff_inputs_aux[2]));
  or_gate_2_inputs gate_9(.A(ff_inputs_aux[2]), .B(N_ff_inputs_aux[2]), .S(ff_inputs[2]));

  modulo_ff_t ff_4(.t(ff_inputs[2]),.clk(clk),.clr(clr_input[3]),.prst(prst_input[3]),.enable(enable),.q(q[3]),.q_bar(q_bar[3]));

  and_gate_5_inputs gate_10(.A(up_down),.B(q[3]),.C(q[2]),.D(q[1]),.E(q[0]),.S(ff_inputs_aux[3]));
  and_gate_5_inputs gate_11(.A(Nup_down),.B(q_bar[3]),.C(q_bar[2]),.D(q_bar[1]),.E(q_bar[0]),.S(N_ff_inputs_aux[3]));
  or_gate_2_inputs gate_13(.A(ff_inputs_aux[3]), .B(N_ff_inputs_aux[3]), .S(ff_inputs[3]));

  modulo_ff_t ff_5(.t(ff_inputs[3]),.clk(clk),.clr(clr_input[2]),.prst(prst_input[2]),.enable(enable),.q(q[4]),.q_bar(q_bar[4]));
  
  and_gate_6_inputs gate_14(.A(up_down),.B(q[4]),.C(q[3]),.D(q[2]),.E(q[1]),.F(q[0]),.S(ff_inputs_aux[4]));
  and_gate_6_inputs gate_15(.A(Nup_down),.B(q_bar[4]),.C(q_bar[3]),.D(q_bar[2]),.E(q_bar[1]),.F(q_bar[0]),.S(N_ff_inputs_aux[4]));
  or_gate_2_inputs gate_16(.A(ff_inputs_aux[4]), .B(N_ff_inputs_aux[4]), .S(ff_inputs[4]));

  modulo_ff_t ff_6(.t(ff_inputs[4]),.clk(clk),.clr(clr_input[1]),.prst(prst_input[1]),.enable(enable),.q(q[5]),.q_bar(q_bar[5]));
  
  and_gate_7_inputs gate_17(.A(up_down),.B(q[5]),.C(q[4]),.D(q[3]),.E(q[2]),.F(q[1]),.G(q[0]),.S(ff_inputs_aux[5]));
  and_gate_7_inputs gate_18(.A(Nup_down),.B(q_bar[5]),.C(q_bar[4]),.D(q_bar[3]),.E(q_bar[2]),.F(q_bar[1]),.G(q_bar[0]),.S(N_ff_inputs_aux[5]));
  or_gate_2_inputs gate_19(.A(ff_inputs_aux[5]), .B(N_ff_inputs_aux[5]), .S(ff_inputs[5]));

  modulo_ff_t ff_7(.t(ff_inputs[5]),.clk(clk),.clr(clr_input[0]),.prst(prst_input[0]),.enable(enable),.q(q[6]),.q_bar(q_bar[6]));

endmodule
