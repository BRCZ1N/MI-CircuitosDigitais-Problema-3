module modulo_registrador_rolhas(
  input [6:0] m_in,
  input clk, clr, enable,
  output [6:0] m_out
);

  modulo_ff_d ff[6:0](
    .d({m_in[6], m_in[5], m_in[4], m_in[3], m_in[2], m_in[1], m_in[0]}),
    .clk(clk),
    .clr(clr),
	 .enable(enable),
    .q({m_out[6], m_out[5], m_out[4], m_out[3], m_out[2], m_out[1], m_out[0]}),
    .nq()
  );

endmodule
