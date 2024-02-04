//Finalizado
module modulo_ff_d(
  input d, clk, clr, prst,
  output reg q, nq
);

  always @(posedge clk) begin
  
    if (prst) begin
	 
		q <= 1'b1;
		nq <= 1'b0; 
		
    end
	 
	 else if(clr) begin
	 
		q <= 1'b0;
		nq <= 1'b1; 
		
    end
	 
    else begin
	 
      q <= d;
      nq <= ~q;
		
    end
	 
  end
  
endmodule
