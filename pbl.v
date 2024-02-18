//Finalizado
module pbl(start_stop,pg,ch,cq,clock_50mhz,m,ve,al,Nal,ev,mef_estado,Nout_7seg,Nac_7segmentos,op_c_deboucing,op_deboucing, test_buffer_secundario, test_buffer_secundario_controle_min_rolhas, test_buffer_secundario_controle_operador, test_buffer_principal);
	
	input start_stop,pg,ch,cq,clock_50mhz,op_c_deboucing,op_deboucing;
	output m,ve,al,ev,Nal;
	output [1:0] mef_estado;
	output [7:0] Nout_7seg;
	output [3:0] Nac_7segmentos;
	wire estado_vedacao, enable_buffer_principal, Nenable_count_operador, enable_count_min_rolhas_aux, reset_ff_operador, reset_ff_rolhas, load_count_operador, enable_count_operador, enable_count_min_rolhas, load_count_min_rolhas, enable_buffer_secundario, Nop_c_deboucing; 
	wire Nestado_vedacao, Nout_range_buffer, Nop_deboucing, Nstart_stop, comparator_aux, clk_div, controle_sel_rolhas, controle_sel_operador;
	wire Nsinal_dezenas_duzias_reset, Nsinal_duzias_reset, out_range_buffer, sinal_duzias_reset, conta_duzias, sinal_dezenas_duzias_reset_aux,sinal_dezenas_duzias_reset, signal_min_rolhas, ro, min_trans_rolhas;
	wire [3:0] out_4_bits_duzias,out_4_bits_dezena_duzias,display_in, ac_7segmentos, codificacao_4bits_d_garrafas, codificacao_4bits_u_garrafas, codificacao_4bits_d_rolhas,codificacao_4bits_u_rolhas;
	wire [6:0] Nbuffer_secundario_controle_operador, buffer_secundario_controle_operador, buffer_secundario, buffer_secundario_atual_sum_op, buffer_secundario_controle, buffer_secundario_aux, buffer_entrada_aux_secundario_out, rolhas_entrada_secundario;
	wire [2:0] out_comparador;
	wire [7:0] out_7seg;
	wire [1:0] Nmef_estado, Ncontador_mef_controle_state_operador, Ncontador_mef_controle_state_rolha,load_reg, sel_mux_display, load_aux, load_input_pulse, controle_reset, contador_mef_controle_state_rolha, contador_mef_controle_state_operador;
	wire [4:0] init_rolhas, buffer_principal, Nbuffer_secundario_controle_min_rolhas, buffer_secundario_controle_min_rolhas;
	wire controle_reset_aux_min_rolhas, controle_reset_aux_operador;
	
	and(init_rolhas[4],1'b1,1'b1);
	and(init_rolhas[3],1'b1,1'b0);
	and(init_rolhas[2],1'b1,1'b1);
	and(init_rolhas[1],1'b1,1'b0);
	and(init_rolhas[0],1'b1,1'b0);
	
	not(Nsinal_duzias_reset,sinal_duzias_reset);
	not(Nsinal_dezenas_duzias_reset,sinal_dezenas_duzias_reset);
	not(Nestado_vedacao,estado_vedacao);
	not(Nmef_estado[1],mef_estado[1]);
	not(Nmef_estado[0],mef_estado[0]);
	not(Nenable_count_operador,enable_count_operador);
	not(Ncontador_mef_controle_state_rolha[1],contador_mef_controle_state_rolha[1]);
	not(Ncontador_mef_controle_state_rolha[0],contador_mef_controle_state_rolha[0]);
	not(Ncontador_mef_controle_state_operador[1],contador_mef_controle_state_operador[1]);
	not(Ncontador_mef_controle_state_operador[0],contador_mef_controle_state_operador[0]);
	not(Nbuffer_secundario_controle_min_rolhas[4],buffer_secundario_controle_min_rolhas[4]);
	not(Nbuffer_secundario_controle_min_rolhas[3],buffer_secundario_controle_min_rolhas[3]);
	not(Nbuffer_secundario_controle_min_rolhas[2],buffer_secundario_controle_min_rolhas[2]);
	not(Nbuffer_secundario_controle_min_rolhas[1],buffer_secundario_controle_min_rolhas[1]);
	not(Nbuffer_secundario_controle_min_rolhas[0],buffer_secundario_controle_min_rolhas[0]);
	not(Nbuffer_secundario_controle_operador[6],buffer_secundario_controle_operador[6]);
	not(Nbuffer_secundario_controle_operador[5],buffer_secundario_controle_operador[5]);
	not(Nbuffer_secundario_controle_operador[4],buffer_secundario_controle_operador[4]);
	not(Nbuffer_secundario_controle_operador[3],buffer_secundario_controle_operador[3]);
	not(Nbuffer_secundario_controle_operador[2],buffer_secundario_controle_operador[2]);
	not(Nbuffer_secundario_controle_operador[1],buffer_secundario_controle_operador[1]);
	not(Nbuffer_secundario_controle_operador[0],buffer_secundario_controle_operador[0]);
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
	
	modulo_divisor_frequencia divisor_f(.prst(1'b1),.clr(1'b1),.clk(clock_50mhz),.clk_div(clk_div));
	
	modulo_mef_enchimento_vedacao mef_1(.enable(start_stop),.pg(pg),.ch(ch),.ro(ro),.eb(sinal_duzias_reset),.clk(clk_div),.m(m),.ve(ve),.al(al),.ev(ev),.q0(mef_estado[0]),.q1(mef_estado[1]));
	
	//Circuito auxiliar de contagem de dúzias
	
	and_gate_2_inputs gate_1(.A(ve),.B(cq),.S(conta_duzias));
	
	modulo_contador_sync_4_bits_ascendente contador_duzias(.input_primeiro_ff(conta_duzias),.prst(1'b1),.clr(Nsinal_duzias_reset),.clk(clk_div),.q(out_4_bits_duzias));
	modulo_reset_contador_d reset_1(.cd(out_4_bits_duzias), .rst_cd(sinal_duzias_reset));
	
	modulo_contador_sync_4_bits_ascendente contador_dezenas_duzias(.input_primeiro_ff(sinal_duzias_reset),.prst(1'b1),.clr(Nsinal_dezenas_duzias_reset),.clk(clk_div),.q(out_4_bits_dezena_duzias));
	modulo_reset_contador_dd reset_2(.cdd(out_4_bits_dezena_duzias),.rst_cdd(sinal_dezenas_duzias_reset_aux));
	
	or_gate_2_inputs gate_2(.A(start_stop),.B(sinal_dezenas_duzias_reset_aux),.S(sinal_dezenas_duzias_reset));
	
	//Circuito auxiliar de contagem de rolhas
	
	or(comparator_aux, out_comparador[1], out_comparador[0]);
	and(load_aux[1], Nop_deboucing,Nout_range_buffer);
	and(load_aux[0], op_deboucing,comparator_aux,signal_min_rolhas,min_trans_rolhas);
	
	LevelToPulseMealy pulsador_1(.Clock(clk_div),.Reset(),.Level(load_aux[0]),.Pulse(load_input_pulse[0]));
	LevelToPulseMealy pulsador_2(.Clock(clk_div),.Reset(),.Level(load_aux[1]),.Pulse(load_input_pulse[1]));
	
	modulo_contador_sync_7_bits_ascendente contador_entrada_rolhas(.prst(1'b1),.clr(1'b1),.enable(1'b1),.clk(Nop_c_deboucing),.q(rolhas_entrada_secundario));
	
	modulo_registrador_rolhas registrador_1(.m_in(buffer_secundario),.clk(load_input_pulse[1]),.m_out(buffer_secundario_aux),.enable(1'b1));
	modulo_somador_subtrator_completo_7bits(.op_aritmetica(1'b0),.a(buffer_secundario_aux),.b(rolhas_entrada_secundario),.sum(buffer_secundario_atual_sum_op));
	modulo_registrador_rolhas registrador_2(.m_in(buffer_secundario_atual_sum_op),.clk(load_input_pulse[1]),.m_out(buffer_entrada_aux_secundario_out),.enable(1'b1));
	
	modulo_comparador5bits comparador_1(.A(buffer_secundario),.B(init_rolhas),.AltB_out(out_comparador[2]),.AeqB_out(out_comparador[1]),.AgtB_out(out_comparador[0]));
	
	modulo_ff_d ff_1(.d(1'b1),.clk(load_input_pulse[0]),.clr(reset_ff_rolhas),.enable(1'b1),.q(load_reg[0]),.nq());
	modulo_ff_d ff_2(.d(1'b1),.clk(load_input_pulse[1]),.clr(reset_ff_operador),.enable(1'b1),.q(load_reg[1]),.nq());
	
	output [6:0] test_buffer_secundario = buffer_secundario;
	output [4:0] test_buffer_secundario_controle_min_rolhas = buffer_secundario_controle_min_rolhas;
	output [6:0] test_buffer_secundario_controle_operador = buffer_secundario_controle_operador;
	output [4:0] test_buffer_principal = buffer_principal;
	
	and(controle_reset_aux_min_rolhas, Nbuffer_secundario_controle_min_rolhas[4], Nbuffer_secundario_controle_min_rolhas[3], Nbuffer_secundario_controle_min_rolhas[2], Nbuffer_secundario_controle_min_rolhas[1], buffer_secundario_controle_min_rolhas[0]);
	and(controle_reset_aux_operador, Nbuffer_secundario_controle_operador[6], Nbuffer_secundario_controle_operador[5], Nbuffer_secundario_controle_operador[4], Nbuffer_secundario_controle_operador[3], Nbuffer_secundario_controle_operador[2], Nbuffer_secundario_controle_operador[1], buffer_secundario_controle_operador[0]);
	
	xor(enable_buffer_secundario,enable_count_min_rolhas,enable_count_operador);
	
	and(estado_vedacao, mef_estado[1], mef_estado[0]);
	
	and(enable_count_min_rolhas,Nestado_vedacao,Nenable_count_operador,enable_count_min_rolhas_aux);
	
	modulo_mef_controle_contador(.enable(1'b1),.Load_Reg(load_reg[0]),.EmptyBuffer(controle_reset_aux_min_rolhas),.clk(clk_div),.Enable_C(enable_count_min_rolhas_aux),.Load_C(load_count_min_rolhas),.Clear_Reg(reset_ff_rolhas),.q0(contador_mef_controle_state_rolha[0]),.q1(contador_mef_controle_state_rolha[1]));
	modulo_mef_controle_contador(.enable(1'b1),.Load_Reg(load_reg[1]),.EmptyBuffer(controle_reset_aux_operador),.clk(clk_div),.Enable_C(enable_count_operador),.Load_C(load_count_operador),.Clear_Reg(reset_ff_operador),.q0(contador_mef_controle_state_operador[0]),.q1(contador_mef_controle_state_operador[1]));
	
	modulo_contador_sync_7_bits_ascendente_descendente contador_1_buffer_secundario(.clk(clk_div),.enable(enable_buffer_secundario),.q(buffer_secundario),.up_down(load_reg[1]));
	modulo_contador_sync_5_bits_ascendente_descendente contador_2_buffer_secundario_controle_rolhas(.clk(clk_div),.enable(enable_count_min_rolhas),.q(buffer_secundario_controle_min_rolhas),.load(load_count_min_rolhas),.e_load(init_rolhas),.up_down(1'b0));
	modulo_contador_sync_7_bits_ascendente_descendente contador_3_buffer_secundario_controle_operador(.clk(clk_div),.enable(enable_count_operador),.q(buffer_secundario_controle_operador),.load(load_count_operador),.e_load(buffer_entrada_aux_secundario_out),.up_down(1'b0));
	
	or(enable_buffer_principal,estado_vedacao,enable_count_min_rolhas);
	
	modulo_contador_sync_5_bits_ascendente_descendente contador_4_buffer_principal(.clk(clk_div),.enable(enable_buffer_principal),.q(buffer_principal),.up_down(Nestado_vedacao));
	
	modulo_count_superior99 m_out_range(.reg_data(buffer_entrada_aux_secundario_out),.cont_superior_99(out_range_buffer));
	modulo_valor_transfer_rolhas m_trans_rolha(.reg_r(buffer_secundario),.transfer_rolhas(min_trans_rolhas));
	modulo_valor_minimo_rolhas m_min_rolhas(.reg_r(buffer_principal),.min_signal(signal_min_rolhas));
	modulo_verificador_ausencia_rolhas m_aus_rolhas(.reg_r(buffer_principal),.ro(ro));
	modulo_contador_sync_2_bits_ascendente contador_display(.prst(1'b1),.clr(1'b1),.clk(clk_div),.q(sel_mux_display));
	
	modulo_codificador_dezena_garrafas codificador_garrafas_1(.cdd(out_4_bits_dezena_duzias),.cdfd(codificacao_4bits_d_garrafas));
	modulo_codificador_unidade_garrafas codificador_garrafas_2(.cdd(out_4_bits_dezena_duzias),.cdfu(codificacao_4bits_u_garrafas));
	modulo_codificador_dezena_rolhas codificador_rolhas_1(.reg_r(buffer_secundario),.reg_rd(codificacao_4bits_d_rolhas));
	modulo_codificador_unidade_rolhas codificador_rolhas_2(.reg_r(buffer_secundario),.reg_ru(codificacao_4bits_u_rolhas));
	
	modulo_mux4_1 mux_36(.A(codificacao_4bits_d_garrafas[3]),.B(codificacao_4bits_u_garrafas[3]),.C(codificacao_4bits_d_rolhas[3]),.D(codificacao_4bits_u_rolhas[3]),.input_sel(sel_mux_display),.out(display_in[3]));
	modulo_mux4_1 mux_37(.A(codificacao_4bits_d_garrafas[2]),.B(codificacao_4bits_u_garrafas[2]),.C(codificacao_4bits_d_rolhas[2]),.D(codificacao_4bits_u_rolhas[2]),.input_sel(sel_mux_display),.out(display_in[2]));
	modulo_mux4_1 mux_38(.A(codificacao_4bits_d_garrafas[1]),.B(codificacao_4bits_u_garrafas[1]),.C(codificacao_4bits_d_rolhas[1]),.D(codificacao_4bits_u_rolhas[1]),.input_sel(sel_mux_display),.out(display_in[1]));
	modulo_mux4_1 mux_39(.A(codificacao_4bits_d_garrafas[0]),.B(codificacao_4bits_u_garrafas[0]),.C(codificacao_4bits_d_rolhas[0]),.D(codificacao_4bits_u_rolhas[0]),.input_sel(sel_mux_display),.out(display_in[0]));
	
	modulo_demux1_4 demux_1(.A(1'b1),.input_sel(sel_mux_display),.out(ac_7segmentos));

	modulo_decodificadorBCD_7Segmentos bcd_1(.ABCD(display_in),.ABCDEFGDP(out_7seg));
	
	
endmodule 