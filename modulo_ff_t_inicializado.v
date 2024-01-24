module modulo_ff_t_inicializado (
  input t, clk, clr, prst,
  output reg q, q_bar
);

	initial begin
		q = 1'b1;
		q_bar = 1'b0;
	end

  always @(posedge clk or posedge clr or posedge prst)
    if (clr) begin
      q <= 1'b0;
		q_bar <= 1'b1;
    end
    else if (prst) begin
      q <= 1'b1;
		q_bar <= 1'b0;
    end
    else if (t) begin
      q <= ~q;
		q_bar <= q;
    end

endmodule
