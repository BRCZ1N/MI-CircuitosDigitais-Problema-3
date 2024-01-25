module modulo_ff_t_inicializado (
  input t, clk, clr, prst, enable,
  output reg q, q_bar
);

	initial begin
		q = 1'b1;
		q_bar = 1'b0;
	end

  always @(posedge clk or posedge clr or posedge prst)
		
		if (clr) begin
			if(enable)begin
				q <= 1'b0;
				q_bar <= 1'b1;
			end
		end
		else if (prst) begin
			if(enable)begin
				q <= 1'b1;
				q_bar <= 1'b0;
			end
		end
		else if (t) begin
			if(!enable)begin
				q <= ~q;
				q_bar <= q;
			end
		end

	 
endmodule
