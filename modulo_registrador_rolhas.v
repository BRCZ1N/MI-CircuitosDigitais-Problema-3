module modulo_registrador_rolhas (m_in,clk,clr,m_out,enable);

	input [6:0] m_in;
	input clr,clk,enable;
	output [6:0] m_out;
	
	modulo_ff_d ff_1(.d(m_in[6]),.clk(clk),.clr(clr),.enable(enable),.q(m_out[6]),.nq());
	
	modulo_ff_d ff_2(.d(m_in[5]),.clk(clk),.clr(clr),.enable(enable),.q(m_out[5]),.nq());
	
	modulo_ff_d ff_3(.d(m_in[4]),.clk(clk),.clr(clr),.enable(enable),.q(m_out[4]),.nq());
	
	modulo_ff_d ff_4(.d(m_in[3]),.clk(clk),.clr(clr),.enable(enable),.q(m_out[3]),.nq());
	
	modulo_ff_d ff_5(.d(m_in[2]),.clk(clk),.clr(clr),.enable(enable),.q(m_out[2]),.nq());
	
	modulo_ff_d ff_6(.d(m_in[1]),.clk(clk),.clr(clr),.enable(enable),.q(m_out[1]),.nq());
	
	modulo_ff_d ff_7(.d(m_in[0]),.clk(clk),.clr(clr),.enable(enable),.q(m_out[0]),.nq());

endmodule
