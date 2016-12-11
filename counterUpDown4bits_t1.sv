module counterUpDown4bits_t1 (clk,out,reset);

	input logic clk; // entrada de clock
	input logic reset; // ativo com zero
	output logic [3:0] out; // valor da contagem - saida do bloco
	
	logic direction; // 0 - crescente; 1 - decrescente;

	always_ff @(posedge clk)
	 begin
		if (reset == 1'b0)
		 begin
			out <= 'b0;
			direction <= 'b0;
		 end
		else
		 begin
			if (direction == 1'b0)
			 begin
				if (out < 4'b1111)
					out <= out + 1;
				else
					direction <= ~direction;
			 end
			else
			 begin
				if (out > 4'b0)
					out <= out - 1;
				else
					direction <= ~direction;
			 end
				
		 end	 
	 end

endmodule
