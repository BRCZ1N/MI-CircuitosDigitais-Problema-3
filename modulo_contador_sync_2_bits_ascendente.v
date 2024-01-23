module modulo_contador_sync_2_bits_ascendente(clr, clk, q, prst);

  input clk, clr, prst;
  output [1:0] q;

  modulo_ff_t ff_1(.t(1'b1), .clk(clk), .clr(clr), .prst(prst), .q(q[0]));
  modulo_ff_t ff_2(.t(q[0]), .clk(clk), .clr(clr), .prst(prst), .q(q[1]));

endmodule
