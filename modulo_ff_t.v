module modulo_ff_t (
  input t, clk, clr, prst, enable,
  output reg q, q_bar
);

	initial begin
		
		q <= 1'b0;
		q_bar <= 1'b1;
	
	
	end

  always @(negedge clk or negedge clr or negedge prst) begin
    
	 if (!clr) begin
	 
			q <= 1'b0;
			q_bar <= 1'b1;
		
    end
	 
    else if (!prst) begin
		
			q <= 1'b1;
			q_bar <= 1'b0;
		
    end
	 
    else if (t) begin
	 
		if(enable) begin
		
			q <= ~q;
			q_bar <= q;
			
		end
		
	 end
	 
	end
    
endmodule
