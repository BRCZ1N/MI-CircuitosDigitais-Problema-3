module modulo_contador_sync_7_bits_ascendente_descendente(clk, q, prst, clr, up_down, enable);

  input clk, clr, prst, up_down,enable;
  wire Nup_down;
  wire [6:0] q_bar;
  wire [5:0] ff_inputs,ff_inputs_aux, N_ff_inputs_aux;
  output [6:0] q;
  
  not (Nup_down,up_down);

  modulo_ff_t ff_1(.t(1'b1),.clk(clk),.clr(clr),.prst(prst),.enable(enable),.q(q[0]),.q_bar(q_bar[0]));

  and_gate_2_inputs gate_1(.A(up_down), .B(q[0]), .S(ff_inputs_aux[0]));
  and_gate_2_inputs gate_2(.A(Nup_down), .B(q_bar[0]), .S(N_ff_inputs_aux[0]));
  or_gate_2_inputs gate_3(.A(ff_inputs_aux[0]), .B(N_ff_inputs_aux[0]), .S(ff_inputs[0]));
  
  modulo_ff_t ff_2(.t(ff_inputs[0]),.clk(clk),.clr(clr),.prst(prst),.enable(enable),.q(q[1]),.q_bar(q_bar[1]));

  and_gate_2_inputs gate_4(.A(q[1]),.B(ff_inputs_aux[0]),.S(ff_inputs_aux[1]));
  and_gate_2_inputs gate_5(.A(q_bar[1]),.B(N_ff_inputs_aux[0]),.S(N_ff_inputs_aux[1]));
  or_gate_2_inputs gate_6(.A(ff_inputs_aux[1]), .B(N_ff_inputs_aux[1]), .S(ff_inputs[1]));

  modulo_ff_t ff_3(.t(ff_inputs[1]),.clk(clk),.clr(clr),.prst(prst),.enable(enable),.q(q[2]),.q_bar(q_bar[2]));

  and_gate_2_inputs gate_7(.A(q[2]),.B(ff_inputs_aux[1]),.S(ff_inputs_aux[2]));
  and_gate_2_inputs gate_8(.A(q_bar[2]),.B(N_ff_inputs_aux[1]),.S(N_ff_inputs_aux[2]));
  or_gate_2_inputs gate_9(.A(ff_inputs_aux[2]), .B(N_ff_inputs_aux[2]), .S(ff_inputs[2]));

  modulo_ff_t ff_4(.t(ff_inputs[2]),.clk(clk),.clr(clr),.prst(prst),.enable(enable),.q(q[3]),.q_bar(q_bar[3]));

  and_gate_2_inputs gate_10(.A(q[3]),.B(ff_inputs_aux[2]),.S(ff_inputs_aux[3]));
  and_gate_2_inputs gate_11(.A(q_bar[3]),.B(N_ff_inputs_aux[2]),.S(N_ff_inputs_aux[3]));
  or_gate_2_inputs gate_13(.A(ff_inputs_aux[3]), .B(N_ff_inputs_aux[3]), .S(ff_inputs[3]));

  modulo_ff_t ff_5(.t(ff_inputs[3]),.clk(clk),.clr(clr),.prst(prst),.enable(enable),.q(q[4]),.q_bar(q_bar[4]));
  
  and_gate_2_inputs gate_14(.A(q[4]),.B(ff_inputs_aux[3]),.S(ff_inputs_aux[4]));
  and_gate_2_inputs gate_15(.A(q_bar[4]),.B(N_ff_inputs_aux[3]),.S(N_ff_inputs_aux[4]));
  or_gate_2_inputs gate_16(.A(ff_inputs_aux[4]), .B(N_ff_inputs_aux[4]), .S(ff_inputs[4]));

  modulo_ff_t ff_6(.t(ff_inputs[4]),.clk(clk),.clr(clr),.prst(prst),.enable(enable),.q(q[5]),.q_bar(q_bar[5]));
  
  and_gate_2_inputs gate_17(.A(q[5]),.B(ff_inputs_aux[4]),.S(ff_inputs_aux[5]));
  and_gate_2_inputs gate_18(.A(q_bar[5]),.B(N_ff_inputs_aux[4]),.S(N_ff_inputs_aux[5]));
  or_gate_2_inputs gate_19(.A(ff_inputs_aux[5]), .B(N_ff_inputs_aux[5]), .S(ff_inputs[5]));

  modulo_ff_t ff_7(.t(ff_inputs[5]),.clk(clk),.clr(clr),.prst(prst),.enable(enable),.q(q[6]),.q_bar(q_bar[6]));

endmodule
