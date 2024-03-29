module modulo_contador_sync_4_bits_ascendente(clr, clk, q, prst);
  
  input clk, clr, prst;
  output [3:0] q;
  wire [1:0] ff_inputs;

  modulo_ff_t ff_1(.t(1'b1),.clk(clk),.clr(clr),.prst(prst),.q(q[0]) ,.enable(1'b1));
  modulo_ff_t ff_2(.t(q[0]),.clk(clk),.clr(clr),.prst(prst), .q(q[1]),.enable(1'b1));

  and_gate_2_inputs gate_1(.A(q[1]), .B(q[0]), .S(ff_inputs[0]));

  modulo_ff_t ff_3(.t(ff_inputs[0]),.clk(clk),.clr(clr),.prst(prst),.q(q[2]),.enable(1'b1));

  and_gate_2_inputs gate_2(.A(ff_inputs[0]), .B(q[2]), .S(ff_inputs[1]));

  modulo_ff_t ff_4(.t(ff_inputs[1]),.clk(clk),.clr(clr),.prst(prst),.q(q[3]),.enable(1'b1));

endmodule
