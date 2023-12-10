module modulo_ff_t(t,clk,clr,q);

	input t,clk,clr;
	output reg q;
	
	always @(negedge clk) 
	
	begin 
	
		if(clr == 1'b1) 
		
		begin 
	
			q <= 1'b0;
	
		end 
		
		else if( t )
		
		begin
		
			q <= !q;
		
		end
		
		else
		
		begin
		
			q <= q;
		
		end
		
	
	end



endmodule 