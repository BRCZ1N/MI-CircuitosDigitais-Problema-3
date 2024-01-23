//Finalizado
module modulo_divisor_frequencia(preset, clear, clock, clock_div);


	input clock,preset,clear;
	wire [19:0] q;
	output clock_div;
	
	and(clock_div,1'b1,q[18]);

	
	modulo_ff_t ff_1(.t(1'b1),.clock(clock),.preset(1'b0),.clear(1'b0),.q(q[0]),.q_bar());
	
	// F/2
	
	modulo_ff_t ff_2(.t(1'b1),.clock(q[0]),.preset(1'b0),.clear(1'b0),.q(q[1]),.q_bar()); 
	
	// F/4
	
	modulo_ff_t ff_3(.t(1'b1),.clock(q[1]),.preset(1'b0),.clear(1'b0),.q(q[2]),.q_bar()); 
	
	// F/8
	
	modulo_ff_t ff_4(.t(1'b1),.clock(q[2]),.preset(1'b0),.clear(1'b0),.q(q[3]),.q_bar()); 
	
	// F/16
	
	modulo_ff_t ff_5(.t(1'b1),.clock(q[3]),.preset(1'b0),.clear(1'b0),.q(q[4]),.q_bar()); 
	
	// F/32
	
	modulo_ff_t ff_6(.t(1'b1),.clock(q[4]),.preset(1'b0),.clear(1'b0),.q(q[5]),.q_bar()); 
	
	// F/64
	
	modulo_ff_t ff_7(.t(1'b1),.clock(q[5]),.preset(1'b0),.clear(1'b0),.q(q[6]),.q_bar()); 
	
	// F/128
	
	modulo_ff_t ff_8(.t(1'b1),.clock(q[6]),.preset(1'b0),.clear(1'b0),.q(q[7]),.q_bar());
																					  
	// F/256
	
	modulo_ff_t ff_9(.t(1'b1),.clock(q[7]),.preset(1'b0),.clear(1'b0),.q(q[8]),.q_bar());
																					  
	// F/512
	
	modulo_ff_t ff_10(.t(1'b1),.clock(q[8]),.preset(1'b0),.clear(1'b0),.q(q[9]),.q_bar());
																					  
	// F/1024
	
	modulo_ff_t ff_11(.t(1'b1),.clock(q[9]),.preset(1'b0),.clear(1'b0),.q(q[10]),.q_bar());
				
	// F/2048
	
	modulo_ff_t ff_12(.t(1'b1),.clock(q[10]),.preset(1'b0),.clear(1'b0),.q(q[11]),.q_bar());
																					  
	// F/4096
	
	modulo_ff_t ff_13(.t(1'b1),.clock(q[11]),.preset(1'b0),.clear(1'b0),.q(q[12]),.q_bar());
																					  
	// F/8192
	
	modulo_ff_t ff_14(.t(1'b1),.clock(q[12]),.preset(1'b0),.clear(1'b0),.q(q[13]),.q_bar());
			
	// F/16384
	
	modulo_ff_t ff_15(.t(1'b1),.clock(q[13]),.preset(1'b0),.clear(1'b0),.q(q[14]),.q_bar());
					
	// F/32768					
	
	modulo_ff_t ff_16(.t(1'b1),.clock(q[14]),.preset(1'b0),.clear(1'b0),.q(q[15]),.q_bar());
					
	// F/65536

	modulo_ff_t ff_17(.t(1'b1),.clock(q[15]),.preset(1'b0),.clear(1'b0),.q(q[16]),.q_bar());
					
	// F/131072
	
	modulo_ff_t ff_18(.t(1'b1),.clock(q[16]),.preset(1'b0),.clear(1'b0),.q(q[17]),.q_bar());
					
	// F/262144
	
	modulo_ff_t ff_19(.t(1'b1),.clock(q[17]),.preset(1'b0),.clear(1'b0),.q(q[18]),.q_bar());
				
	// F/524288
	

endmodule 