/*********************************************************************
*
*IFPB
*Joao Pessoa, 02 de dezembro de 2016
*Aluno: Gabriel Daltro Duarte
*
*Disciplina System Verilog - Programa de Execelencia em Microeletronica
*
*
*Exercicio: Fazer sequenciador que gera a sequência 0 1 2 3 ... 13 14 15 14 13 12 ... 3 2 1 0 1 2 3 ...
*
**********************************************************************/


module counterUpDown4bits_t2 (clk,out,reset);

	input logic clk; // entrada de clock
	input logic reset; // ativo com zero
	output logic [3:0] out; // valor da contagem - saida do bloco
	
	logic direction; // 0 - crescente; 1 - decrescente;

	always_ff @(posedge clk) // Always sensivel a borda positiva do clock
	 begin
		if (reset == 1'b0) // Caso o botao de reset seja pressionado
		 begin
			out <= 'b0; // saida vai para o estado zero
			direction <= 'b0; // a direçao eh definida como crescente
		 end
		else // se reset nao pressionado
		 begin
		 
			if (direction == 1'b0) // Caso direçao for crescente
				out <= out + 1'b1; // saida eh incrementada
			else // Caso direçao seja decrescente
				out <= out - 1; // a saida eh decrementada
				
			if ( (out == 4'b1110 && direction == 0)||(out == 4'b0001 && direction == 1) ) 
					direction <= ~direction; 
										/* a direçao deve mudar quando out chegar em 15 e a direçao for crescente ou
										quando out chegar em 0 e a direçao for decrescente.Como esse if  eh  executado 
										paralelamente com o if que modifica o valor de out e  eh utilizado a atribuiçao 
										nao bloqueante, esse if sempre testa o  antigo valor  de out.  Quando out mudar
										para 15, esse if v^e o estado 14 e quando out mudar para zero  o if ver´a 1.
										*/
				
		 end	 
	 end // end do always 

endmodule
