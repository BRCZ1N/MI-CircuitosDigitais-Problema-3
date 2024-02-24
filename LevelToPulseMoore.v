
module	LevelToPulseMoore(
			Clock,
			Reset,
			Level,
			Pulse
	);
	input		Clock;	
	input		Reset;	
	input		Level;
	output	Pulse;
	
	wire Qi0,NQi0,Qi1,NQi1, ff_2_input;
	
	modulo_ff_d ff_1(.d(Level),.clk(Clock),.enable(1'b1),.q(Qi0),.nq(NQi0));
	and(ff_2_input, Level,Qi0);
	
	modulo_ff_d ff_2(.d(ff_2_input),.clk(Clock),.enable(1'b1),.q(Qi1),.nq(NQi1));
	and(Pulse,NQi1,Qi0);
		

endmodule 


/*
module LevelToPulseMoore(
    input Level,
    input Clock,
	 input Reset,
    output Pulse
);

    reg FFD1; 
    reg FFD2;

    initial begin
        FFD1 = 1'b0;
        FFD2 = 1'b0;
    end

// TRANSITAR DE ESTADOS
    always @ ( posedge Clock) begin
        FFD1 <= Level;
        FFD2 <= FFD1 & Level;
    end

// DEFINIR SAÍDA
    wire aneg;
    not ( aneg, FFD2);
    and (Pulse, FFD1, aneg);
 
endmodule
*/