module modulo_ff_d(
  input d, clk, clr, enable,
  output reg q, nq
);

  always @(negedge clk or posedge clr) begin
    if (clr) begin
      q <= 1'b0;
      nq <= 1'b1; 
    end
    else if (enable) begin
      q <= d;
      nq <= ~q;
    end
  end

endmodule
