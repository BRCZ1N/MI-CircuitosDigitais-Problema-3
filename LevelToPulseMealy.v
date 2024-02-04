module	LevelToPulseMealy(
			Clock,
			Reset,
			Level,
			Pulse
	);
	input		Clock;	
	input		Reset;	
	input		Level;
	output	Pulse;
	
	wire Qi,NQi;
	
	modulo_ff_d ff_1(.d(Level),.clk(Clock),.clr(Reset),.enable(1'b1),.q(Qi),.nq(NQi));
	
	and(Pulse,Level,NQi);
		

endmodule 