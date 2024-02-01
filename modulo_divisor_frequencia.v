//Finalizado
module modulo_divisor_frequencia(prst, clr, clk_div, clk);


	input clk, prst, clr;
	wire [19:0] q;
	output clk_div;
	
	and(clk_div,1'b1,q[3]);

	
	modulo_ff_t ff_1(.t(1'b1),.clk(clk),.prst(prst),.clr(clr),.q(q[0]),.q_bar());
	
	// F/2
	
	modulo_ff_t ff_2(.t(1'b1),.clk(q[0]),.prst(prst),.clr(clr),.q(q[1]),.q_bar()); 
	
	// F/4
	
	modulo_ff_t ff_3(.t(1'b1),.clk(q[1]),.prst(prst),.clr(clr),.q(q[2]),.q_bar()); 
	
	// F/8
	
	modulo_ff_t ff_4(.t(1'b1),.clk(q[2]),.prst(prst),.clr(clr),.q(q[3]),.q_bar()); 
	
	// F/16
	
	modulo_ff_t ff_5(.t(1'b1),.clk(q[3]),.prst(prst),.clr(clr),.q(q[4]),.q_bar()); 
	
	// F/32
	
	modulo_ff_t ff_6(.t(1'b1),.clk(q[4]),.prst(prst),.clr(clr),.q(q[5]),.q_bar()); 
	
	// F/64
	
	modulo_ff_t ff_7(.t(1'b1),.clk(q[5]),.prst(prst),.clr(clr),.q(q[6]),.q_bar()); 
	
	// F/128
	
	modulo_ff_t ff_8(.t(1'b1),.clk(q[6]),.prst(prst),.clr(clr),.q(q[7]),.q_bar());
																					  
	// F/256
	
	modulo_ff_t ff_9(.t(1'b1),.clk(q[7]),.prst(prst),.clr(clr),.q(q[8]),.q_bar());
																					  
	// F/512
	
	modulo_ff_t ff_10(.t(1'b1),.clk(q[8]),.prst(prst),.clr(clr),.q(q[9]),.q_bar());
																					  
	// F/1024
	
	modulo_ff_t ff_11(.t(1'b1),.clk(q[9]),.prst(prst),.clr(clr),.q(q[10]),.q_bar());
				
	// F/2048
	
	modulo_ff_t ff_12(.t(1'b1),.clk(q[10]),.prst(prst),.clr(clr),.q(q[11]),.q_bar());
																					  
	// F/4096
	
	modulo_ff_t ff_13(.t(1'b1),.clk(q[11]),.prst(prst),.clr(clr),.q(q[12]),.q_bar());
																					  
	// F/8192
	
	modulo_ff_t ff_14(.t(1'b1),.clk(q[12]),.prst(prst),.clr(clr),.q(q[13]),.q_bar());
			
	// F/16384
	
	modulo_ff_t ff_15(.t(1'b1),.clk(q[13]),.prst(prst),.clr(clr),.q(q[14]),.q_bar());
					
	// F/32768					
	
	modulo_ff_t ff_16(.t(1'b1),.clk(q[14]),.prst(prst),.clr(clr),.q(q[15]),.q_bar());
					
	// F/65536

	modulo_ff_t ff_17(.t(1'b1),.clk(q[15]),.prst(prst),.clr(clr),.q(q[16]),.q_bar());
					
	// F/131072
	
	modulo_ff_t ff_18(.t(1'b1),.clk(q[16]),.prst(prst),.clr(clr),.q(q[17]),.q_bar());
					
	// F/262144
	
	modulo_ff_t ff_19(.t(1'b1),.clk(q[17]),.prst(prst),.clr(clr),.q(q[18]),.q_bar());
	

endmodule 