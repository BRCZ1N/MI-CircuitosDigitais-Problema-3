//Finalizado
module pbl(start_stop,pg,ch,cq,hh_load,clock_50mhz,m,ve,al,Nal,ev,mef_estado,Nout_7seg,Nac_7segmentos,op_c_deboucing,op_deboucing, test_buffer_secundario, test_buffer_secundario_controle_min_rolhas, test_buffer_secundario_controle_operador, test_controle_reset);
	
	input start_stop,pg,ch,cq,clock_50mhz,op_c_deboucing,op_deboucing, hh_load;
	output m,ve,al,ev,Nal;
	output [1:0] mef_estado;
	output [7:0] Nout_7seg;
	output [3:0] Nac_7segmentos;
	wire Nload_input, load_reg, Nop_c_deboucing, out_comparador_controle, Nout_range_buffer, perm_load_registrador, sel_op_a_mx, perm_input, Nop_deboucing, Nstart_stop, load_input, comparator_aux, clk_div, out_range_buffer, sinal_duzias_reset, conta_duzias, sinal_dezenas_duzias_reset_aux,sinal_dezenas_duzias_reset, op_arimetica, signal_min_rolhas, ro;
	wire [3:0] out_4_bits_duzias,out_4_bits_dezena_duzias,display_in,ac_7segmentos, codificacao_4bits_d_garrafas, codificacao_4bits_u_garrafas, codificacao_4bits_d_rolhas,codificacao_4bits_u_rolhas;
	wire [6:0] min_trans_rolhas, Nbuffer_secundario_controle_min_rolhas, buffer_secundario_controle_min_rolhas, buffer_secundario_controle_operador, buffer_principal, buffer_secundario, buffer_secundario_atual_sum_op, buffer_secundario_controle, buffer_secundario_aux, buffer_entrada_aux_secundario_in, buffer_entrada_aux_secundario_out, rolhas_entrada_secundario, buffer_entrada_aux_secundario_in_aux;
	wire [2:0] out_comparador;
	wire [7:0] out_7seg;
	wire [1:0] sel_mux_display, load_aux, load_input_pulse, controle_reset;
	
	not(Nbuffer_secundario_controle_min_rolhas[6],buffer_secundario_controle_min_rolhas[6]);
	not(Nbuffer_secundario_controle_min_rolhas[5],buffer_secundario_controle_min_rolhas[5]);
	not(Nbuffer_secundario_controle_min_rolhas[4],buffer_secundario_controle_min_rolhas[4]);
	not(Nbuffer_secundario_controle_min_rolhas[3],buffer_secundario_controle_min_rolhas[3]);
	not(Nbuffer_secundario_controle_min_rolhas[2],buffer_secundario_controle_min_rolhas[2]);
	not(Nbuffer_secundario_controle_min_rolhas[1],buffer_secundario_controle_min_rolhas[1]);
	not(Nbuffer_secundario_controle_min_rolhas[0],buffer_secundario_controle_min_rolhas[0]);
	not(Nload_input,load_input);
	not(Nop_c_deboucing,op_c_deboucing);
	not(Nout_range_buffer,out_range_buffer);
	not(Nop_deboucing, op_deboucing);
	not(Nstart_stop,start_stop);
	not(Nal,al);
	not(Nac_7segmentos[3],ac_7segmentos[3]);
	not(Nac_7segmentos[2],ac_7segmentos[2]);
	not(Nac_7segmentos[1],ac_7segmentos[1]);
	not(Nac_7segmentos[0],ac_7segmentos[0]);
	not(Nout_7seg[7],out_7seg[7]);
	not(Nout_7seg[6],out_7seg[6]);
	not(Nout_7seg[5],out_7seg[5]);
	not(Nout_7seg[4],out_7seg[4]);
	not(Nout_7seg[3],out_7seg[3]);
	not(Nout_7seg[2],out_7seg[2]);
	not(Nout_7seg[1],out_7seg[1]);
	not(Nout_7seg[0],out_7seg[0]);
	
	modulo_divisor_frequencia divisor_f(.prst(1'b0),.clr(1'b0),.clk(clock_50mhz),.clk_div(clk_div));
	
	modulo_mef_enchimento_vedacao mef_1(.enable(start_stop),.pg(pg),.ch(ch),.ro(ro),.eb(sinal_duzias_reset),.clk(clk_div),.m(m),.ve(ve),.al(al),.ev(ev),.q0(mef_estado[0]),.q1(mef_estado[1]));
	
	//Circuito auxiliar de contagem de dúzias
	
	and_gate_2_inputs gate_1(.A(ve),.B(cq),.S(conta_duzias));
	
	modulo_contador_sync_4_bits_ascendente contador_duzias(.input_primeiro_ff(conta_duzias),.prst(1'b0),.clr(sinal_duzias_reset),.clk(clk_div),.q(out_4_bits_duzias));
	modulo_reset_contador_d reset_1(.cd(out_4_bits_duzias), .rst_cd(sinal_duzias_reset));
	
	modulo_contador_sync_4_bits_ascendente contador_dezenas_duzias(.input_primeiro_ff(sinal_duzias_reset),.prst(1'b0),.clr(sinal_dezenas_duzias_reset),.clk(clk_div),.q(out_4_bits_dezena_duzias));
	modulo_reset_contador_dd reset_2(.cdd(out_4_bits_dezena_duzias),.rst_cdd(sinal_dezenas_duzias_reset_aux));
	
	or_gate_2_inputs gate_2(.A(start_stop),.B(sinal_dezenas_duzias_reset_aux),.S(sinal_dezenas_duzias_reset));
	
	//Circuito auxiliar de contagem de rolhas
	
	or(comparator_aux, out_comparador[1], out_comparador[0]);
	
	and(load_aux[1], Nop_deboucing,Nout_range_buffer);
	
	and(load_aux[0], op_deboucing,comparator_aux,signal_min_rolhas,min_trans_rolhas);
	
	or(load_input, load_aux[1], load_aux[0]);
	
	LevelToPulseMealy pulsador_1(.Clock(clk_div),.Reset(),.Level(load_input),.Pulse(load_input_pulse));
	
	modulo_contador_sync_7_bits_ascendente contador_entrada_rolhas(.prst(1'b0),.clr(1'b0),.clk(Nop_c_deboucing),.q(rolhas_entrada_secundario));
	
	modulo_mux2_1 mux_1(.A(rolhas_entrada_secundario[6]),.B(1'b0),.SEL(op_deboucing),.OUT(buffer_entrada_aux_secundario_in_aux[6]));
	modulo_mux2_1 mux_2(.A(rolhas_entrada_secundario[5]),.B(1'b0),.SEL(op_deboucing),.OUT(buffer_entrada_aux_secundario_in_aux[5]));
	modulo_mux2_1 mux_3(.A(rolhas_entrada_secundario[4]),.B(1'b1),.SEL(op_deboucing),.OUT(buffer_entrada_aux_secundario_in_aux[4]));
	modulo_mux2_1 mux_4(.A(rolhas_entrada_secundario[3]),.B(1'b0),.SEL(op_deboucing),.OUT(buffer_entrada_aux_secundario_in_aux[3]));
	modulo_mux2_1 mux_5(.A(rolhas_entrada_secundario[2]),.B(1'b1),.SEL(op_deboucing),.OUT(buffer_entrada_aux_secundario_in_aux[2]));
	modulo_mux2_1 mux_6(.A(rolhas_entrada_secundario[1]),.B(1'b0),.SEL(op_deboucing),.OUT(buffer_entrada_aux_secundario_in_aux[1]));
	modulo_mux2_1 mux_7(.A(rolhas_entrada_secundario[0]),.B(1'b0),.SEL(op_deboucing),.OUT(buffer_entrada_aux_secundario_in_aux[0]));
	
	modulo_registrador_rolhas registrador_1(.m_in(buffer_secundario),.clk(load_input_pulse),.m_out(buffer_secundario_aux),.enable(1'b1));
	
	modulo_somador_subtrator_completo_7bits(.op_aritmetica(load_aux[1]),.a(buffer_secundario_aux),.b(buffer_entrada_aux_secundario_in_aux),.sum(buffer_secundario_atual_sum_op));
	
	modulo_mux2_1 mux_8(.A(buffer_secundario_atual_sum_op[6]),.B(buffer_entrada_aux_secundario_in_aux[6]),.SEL(op_deboucing),.OUT(buffer_entrada_aux_secundario_in[6]));
	modulo_mux2_1 mux_9(.A(buffer_secundario_atual_sum_op[5]),.B(buffer_entrada_aux_secundario_in_aux[5]),.SEL(op_deboucing),.OUT(buffer_entrada_aux_secundario_in[5]));
	modulo_mux2_1 mux_10(.A(buffer_secundario_atual_sum_op[4]),.B(buffer_entrada_aux_secundario_in_aux[4]),.SEL(op_deboucing),.OUT(buffer_entrada_aux_secundario_in[4]));
	modulo_mux2_1 mux_11(.A(buffer_secundario_atual_sum_op[3]),.B(buffer_entrada_aux_secundario_in_aux[3]),.SEL(op_deboucing),.OUT(buffer_entrada_aux_secundario_in[3]));
	modulo_mux2_1 mux_12(.A(buffer_secundario_atual_sum_op[2]),.B(buffer_entrada_aux_secundario_in_aux[2]),.SEL(op_deboucing),.OUT(buffer_entrada_aux_secundario_in[2]));
	modulo_mux2_1 mux_13(.A(buffer_secundario_atual_sum_op[1]),.B(buffer_entrada_aux_secundario_in_aux[1]),.SEL(op_deboucing),.OUT(buffer_entrada_aux_secundario_in[1]));
	modulo_mux2_1 mux_14(.A(buffer_secundario_atual_sum_op[0]),.B(buffer_entrada_aux_secundario_in_aux[0]),.SEL(op_deboucing),.OUT(buffer_entrada_aux_secundario_in[0]));
	
	modulo_registrador_rolhas registrador_2(.m_in(buffer_entrada_aux_secundario_in),.clk(load_input_pulse),.m_out(buffer_entrada_aux_secundario_out),.enable(1'b1));
	
	modulo_comparador7bits comparador_1(.A(buffer_secundario_aux),.B(buffer_entrada_aux_secundario_out),.AltB_out(out_comparador[2]),.AeqB_out(out_comparador[1]),.AgtB_out(out_comparador[0]));
	
	modulo_count_superior99 m_out_range(.reg_data(buffer_entrada_aux_secundario_out),.cont_superior_99(out_range_buffer));
	
	modulo_ff_d ff_1(.d(load_aux[0]),.clk(load_input_pulse[0]),.clr(controle_reset[0]),.enable(1'b1),.q(load_reg_min_rolhas),.nq());
	
	modulo_ff_d ff_2(.d(load_aux[1]),.clk(load_input_pulse[1]),.clr(controle_reset[1]),.enable(1'b1),.q(load_reg_operador),.nq());
	
	output [6:0] test_buffer_secundario = buffer_secundario;
	output [6:0] test_buffer_secundario_controle_min_rolhas = buffer_secundario_controle_min_rolhas;
	output [6:0] test_buffer_secundario_controle_operador = buffer_secundario_controle_operador;
	output test_controle_reset = controle_reset[0];
	
	and(controle_reset[0], Nbuffer_secundario_controle_min_rolhas[6], Nbuffer_secundario_controle_min_rolhas[5], buffer_secundario_controle_min_rolhas[4], Nbuffer_secundario_controle_min_rolhas[3], buffer_secundario_controle_min_rolhas[2], Nbuffer_secundario_controle_min_rolhas[1], Nbuffer_secundario_controle_min_rolhas[0]);
	
	modulo_contador_sync_7_bits_ascendente_descendente contador_1_buffer_secundario(.clk(clk_div),.enable(load_reg_min_rolhas),.q(buffer_secundario),.prst(),.clr(),.up_down(load_aux[1]));
	modulo_contador_sync_7_bits_ascendente_descendente contador_2_buffer_secundario(.clk(clk_div),.enable(load_reg_min_rolhas),.q(buffer_secundario_controle_min_rolhas),.prst(),.clr(controle_reset[0]),.up_down(1'b1));
	modulo_contador_sync_7_bits_ascendente_descendente contador_3_buffer_secundario(.clk(clk_div),.enable(load_reg_operador),.q(buffer_secundario_controle_operador),.prst(),.clr(),.up_down(1'b0));
	modulo_comparador7bits comparador_2(.A(buffer_secundario_controle),.B(buffer_entrada_aux_secundario_out),.AltB_out(),.AeqB_out(out_comparador_controle),.AgtB_out());
	
	modulo_valor_transfer_rolhas m_trans_rolha(.reg_r(buffer_secundario),.transfer_rolhas(min_trans_rolhas));
	modulo_valor_minimo_rolhas m_min_rolhas(.reg_r(buffer_principal),.min_signal(signal_min_rolhas));
	modulo_verificador_ausencia_rolhas m_aus_rolhas(.reg_r(buffer_principal),.ro(ro));
	modulo_contador_sync_2_bits_ascendente contador_display(.clr(1'b0),.clk(clk_div),.q(sel_mux_display));
	
	modulo_codificador_dezena_garrafas codificador_garrafas_1(.cdd(out_4_bits_dezena_duzias),.cdfd(codificacao_4bits_d_garrafas));
	modulo_codificador_unidade_garrafas codificador_garrafas_2(.cdd(out_4_bits_dezena_duzias),.cdfu(codificacao_4bits_u_garrafas));
	modulo_codificador_dezena_rolhas codificador_rolhas_1(.reg_r(buffer_principal),.reg_rd(codificacao_4bits_d_rolhas));
	modulo_codificador_unidade_rolhas codificador_rolhas_2(.reg_r(buffer_principal),.reg_ru(codificacao_4bits_u_rolhas));
	
	modulo_mux4_1 mux_36(.A(codificacao_4bits_d_garrafas[3]),.B(codificacao_4bits_u_garrafas[3]),.C(codificacao_4bits_d_rolhas[3]),.D(codificacao_4bits_u_rolhas[3]),.input_sel(sel_mux_display),.out(display_in[3]));
	modulo_mux4_1 mux_37(.A(codificacao_4bits_d_garrafas[2]),.B(codificacao_4bits_u_garrafas[2]),.C(codificacao_4bits_d_rolhas[2]),.D(codificacao_4bits_u_rolhas[2]),.input_sel(sel_mux_display),.out(display_in[2]));
	modulo_mux4_1 mux_38(.A(codificacao_4bits_d_garrafas[1]),.B(codificacao_4bits_u_garrafas[1]),.C(codificacao_4bits_d_rolhas[1]),.D(codificacao_4bits_u_rolhas[1]),.input_sel(sel_mux_display),.out(display_in[1]));
	modulo_mux4_1 mux_39(.A(codificacao_4bits_d_garrafas[0]),.B(codificacao_4bits_u_garrafas[0]),.C(codificacao_4bits_d_rolhas[0]),.D(codificacao_4bits_u_rolhas[0]),.input_sel(sel_mux_display),.out(display_in[0]));
	
	modulo_demux1_4 demux_1(.A(1'b1),.input_sel(sel_mux_display),.out(ac_7segmentos));

	modulo_decodificadorBCD_7Segmentos bcd_1(.ABCD(display_in),.ABCDEFGDP(out_7seg));
	
	
endmodule 