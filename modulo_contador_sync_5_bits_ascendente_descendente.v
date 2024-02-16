module modulo_contador_sync_5_bits_ascendente_descendente(clk, q, up_down, enable, load, e_load);

  input clk, up_down, enable, load;
  input [4:0] e_load;
  wire Nup_down;
  wire [4:0] q_bar;
  wire [3:0] ff_inputs,ff_inputs_aux, N_ff_inputs_aux;
  output [4:0] q;
  
  not (Nup_down,up_down);
  
  wire [4:0] clr_input, prst_input;
	
  nand_gate_2_inputs gate_22(.A(load),.B(e_load[4]),.S(prst_input[4]));
  nand_gate_2_inputs gate_23(.A(load),.B(e_load[3]),.S(prst_input[3]));
  nand_gate_2_inputs gate_24(.A(load),.B(e_load[2]),.S(prst_input[2]));
  nand_gate_2_inputs gate_25(.A(load),.B(e_load[1]),.S(prst_input[1]));
  nand_gate_2_inputs gate_26(.A(load),.B(e_load[0]),.S(prst_input[0]));
	
  nand_gate_2_inputs gate_29(.A(load),.B(prst_input[4]),.S(clr_input[4]));
  nand_gate_2_inputs gate_30(.A(load),.B(prst_input[3]),.S(clr_input[3]));
  nand_gate_2_inputs gate_31(.A(load),.B(prst_input[2]),.S(clr_input[2]));
  nand_gate_2_inputs gate_32(.A(load),.B(prst_input[1]),.S(clr_input[1]));
  nand_gate_2_inputs gate_33(.A(load),.B(prst_input[0]),.S(clr_input[0]));


  modulo_ff_t ff_1(.t(1'b1),.clk(clk),.clr(clr_input[0]),.prst(prst_input[0]),.enable(enable),.q(q[0]),.q_bar(q_bar[0]));

  and_gate_2_inputs gate_1(.A(up_down), .B(q[0]), .S(ff_inputs_aux[0]));
  and_gate_2_inputs gate_2(.A(Nup_down), .B(q_bar[0]), .S(N_ff_inputs_aux[0]));
  or_gate_2_inputs gate_3(.A(ff_inputs_aux[0]), .B(N_ff_inputs_aux[0]), .S(ff_inputs[0]));
  
  modulo_ff_t ff_2(.t(ff_inputs[0]),.clk(clk),.clr(clr_input[1]),.prst(prst_input[1]),.enable(enable),.q(q[1]),.q_bar(q_bar[1]));

  and_gate_2_inputs gate_4(.A(q[1]),.B(ff_inputs_aux[0]),.S(ff_inputs_aux[1]));
  and_gate_2_inputs gate_5(.A(q_bar[1]),.B(N_ff_inputs_aux[0]),.S(N_ff_inputs_aux[1]));
  or_gate_2_inputs gate_6(.A(ff_inputs_aux[1]), .B(N_ff_inputs_aux[1]), .S(ff_inputs[1]));

  modulo_ff_t ff_3(.t(ff_inputs[1]),.clk(clk),.clr(clr_input[2]),.prst(prst_input[2]),.enable(enable),.q(q[2]),.q_bar(q_bar[2]));

  and_gate_2_inputs gate_7(.A(q[2]),.B(ff_inputs_aux[1]),.S(ff_inputs_aux[2]));
  and_gate_2_inputs gate_8(.A(q_bar[2]),.B(N_ff_inputs_aux[1]),.S(N_ff_inputs_aux[2]));
  or_gate_2_inputs gate_9(.A(ff_inputs_aux[2]), .B(N_ff_inputs_aux[2]), .S(ff_inputs[2]));

  modulo_ff_t ff_4(.t(ff_inputs[2]),.clk(clk),.clr(clr_input[3]),.prst(prst_input[3]),.enable(enable),.q(q[3]),.q_bar(q_bar[3]));

  and_gate_2_inputs gate_10(.A(q[3]),.B(ff_inputs_aux[2]),.S(ff_inputs_aux[3]));
  and_gate_2_inputs gate_11(.A(q_bar[3]),.B(N_ff_inputs_aux[2]),.S(N_ff_inputs_aux[3]));
  or_gate_2_inputs gate_13(.A(ff_inputs_aux[3]), .B(N_ff_inputs_aux[3]), .S(ff_inputs[3]));

  modulo_ff_t ff_5(.t(ff_inputs[3]),.clk(clk),.clr(clr_input[4]),.prst(prst_input[4]),.enable(enable),.q(q[4]),.q_bar(q_bar[4]));
  

endmodule
