module modulo_contador_sync_2_bits_ascendente(input_primeiro_ff,clr, clk, q, prst);

  input clk, clr, prst, input_primeiro_ff;
  output [1:0] q;

  modulo_ff_t ff_1(.t(input_primeiro_ff), .clk(clk), .clr(clr), .prst(prst), .q(q[0]));
  modulo_ff_t ff_2(.t(q[0]), .clk(clk), .clr(clr), .prst(prst), .q(q[1]));

endmodule
