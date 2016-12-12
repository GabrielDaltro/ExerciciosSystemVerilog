/*********************************************************************
*
*IFPB
*Joao Pessoa, 02 de dezembro de 2016
*Aluno: Gabriel Daltro Duarte
*
*Disciplina System Verilog - Programa de Execelencia em Microeletronica
*
*
*Exercicio: O cronômetro com precisão de centésimos de segundo e botões de start/continue, 
*stop, e lap (3 posições de armazenamento  lap1 - lap2 - lap3);
*
**********************************************************************/

module cronometro (clk, cent_seg, seg, pause, start, stop, store, disp_lap);

   // ENTRADA
	input logic clk; // pino do clock de entrada (100 Hz)
	input logic pause; // pino de pause - pausa a contagem - acionado com nivel 0 -  botao pulso 
	input logic start; // pino de start - inicia a contagem - acionado com nivel 0 - botao pulso
	input logic stop; // pino de stop - para a contagem e zera a saida - acionado com nivel 0 - botao pulso
	input logic store; // quando pressionado, armazena o atual valor da saida em uma das 3 posições de armazenamento- acionado com nivel 0 - botao pulso
	input logic [2:0] disp_lap; //quando 3'b000,  a saída possuirá o valor da contagem do cronômetro
										 //quando 3'b001,  a saída possuirá o valor salvo em lap1
										 //quando 3'b010,  a saída possuirá o valor salvo em lap2
										 //quando 3'b001,  a saída possuirá o valor salvo em lap3
	
	//SAIDA
	output logic [6:0] cent_seg; // saida dos centesimos de segundo
	output logic [5:0] seg; // saida dos segundos
	
	// VARIAVEIS DE CONTROLE
	logic run; // quando 0 -> contagem parada, quando 1 -> contagem em execucao
	logic [1:0] counter; /* contador que determina em qual varável lap sera salvo o valor da contagem quando store for pressionado. 
							para contador igual a 0, o valor da saída será salvo em lap1, para contador igual 1, será salvo em lap2
							e para contador igual a 2, será salvo em lap3 */
	
	logic [5:0] counter_seg; // register que armazena o valor da contagem  dos segundos
	logic [6:0] counter_cseg; // register que armazena o valor da contagem dos  centésimos de segundo
							
	
	// POSICOES DE ARMAZENAMENTO
	logic [6:0]  lap1_cseg; // register que armazena os centésimos de segundo da posição de armazenamento lap1
	logic [5:0]  lap1_seg;  // register que armazena os valores de segundo da posição de armazenamento lap1
	
	logic [6:0]  lap2_cseg; // register que armazena os centésimos de segundo da posição de armazenamento lap2
	logic [5:0]  lap2_seg;  // register que armazena os valores de segundo da posição de armazenamento lap2
	
	logic [6:0]  lap3_cseg; // register que armazena os centésimos de segundo da posição de armazenamento lap3
	logic [5:0]  lap3_seg;  // register que armazena os valores de segundo da posição de armazenamento lap3
	
	
	// CONEXÕES
	logic db_out;
	
	initial // Não sintetizável, mas no FPGA funciona XD
	begin
		lap1_cseg <= 0;
		lap1_seg <= 0;
		lap2_cseg <= 0;
		lap2_seg <= 0;
		lap3_cseg <= 0;
		lap3_seg <= 0;
		run <= 0;
		counter <= 0;
		cent_seg <= 'b0;
		seg <= 'b0;
	   counter_seg <= 'b0;
		counter_cseg <= 'b0;
		
	end
	

	always_ff @(posedge clk)
	 begin
	 
	  // if de controle de stop, pause e run da contagem do cronômetro
		if (stop == 1'b0) // quando o pino de reset eh colocado em nivel 0
		 begin
			cent_seg <= 'b0; // a saida do cronometro vai para zero (centesimos de segundo e segundo)
			counter_cseg <= 'b0;
			counter_seg <= 'b0;
		 end
		else if (pause == 1'b0) // quado pause é pressionado, a vari
			run <= 'b0;
		else if (start == 1'b0)
			run <= 'b1;
		//else
		 
		// if que controla o incremento dos cantadores de  centésimos de segundo e segundo
		if (run == 1'b1) // se o botao pause nao for acionado
		 begin
			if (counter_cseg == 7'd99) // E se a contagem dos centesimos de segundo  chegou em 99
			   begin
					counter_cseg <= 'b0; // a contagem dos centesimos de segundo volta para ao valor zero
					
					if (counter_seg == 6'd59) // Se a contagem dos segundo chegou em  59, ela volta para zero
						counter_seg <= 'b0;
					else	// Se ela ainda nao chegou em 59, ela incrementa uma unidade sempre que cent_seg for igual a 99
						counter_seg <= counter_seg + 1'b1;
			   end
			else //Se a contagem dos centesimos de segundo  ainda nao chegou em 99, cent_seg eh incrementado a cada pulso de clock
				   counter_cseg <= counter_cseg + 1;					
		 end // end do if
	  //else

		//debounce db (.data(store), .clock(clk), .output_data(db_out)); 	 ISSO NÃO PODE FICAR AQUI?
			
		 if (store == 1'b0)
			begin
				case (counter)
				0:
					begin
						lap1_cseg <= cent_seg ;
						lap1_seg <= seg ;
						counter <= 'b1;
					end
				1:
					begin
						lap2_cseg <= cent_seg;
						lap2_seg <= seg;
						counter <= 'b10;
					end
				2:
					begin
						lap3_cseg <= cent_seg ;
						lap3_seg <= seg ;
						counter <= 'b0;
					end
				endcase		
			end //end do if 
			
			
			case (disp_lap)
			0:
				begin
					cent_seg <= counter_cseg ;
					seg <= counter_seg  ;
				end
			1:
				begin
					cent_seg <= lap1_cseg ;
					seg <= lap1_seg  ;
				end
			2:
				begin
					cent_seg <= lap2_cseg ;
					seg <= lap2_seg  ;
				end
			4:
				begin
					cent_seg <= lap3_cseg ;
					seg <= lap3_seg  ;
				end
			endcase
			
			
	 end // end do always

endmodule
