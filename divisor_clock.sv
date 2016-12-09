/*
Gabriel Daltro Darte
Data: 02/12/2016

Descriç~ao: Bloco que possui como entrada um clock de 50 MHz e possui como sa´ida um CLOCK de 1 Hz
O bloco tambem possui uma entrada reset que quando colocada em nivel zero coloca a saida tambem em zero
 */

module divisor_clock (clk_in, clk_out, reset);

	input logic clk_in;
	input logic reset;
	output logic clk_out;

	logic[25:0] counter; // cabe 49999999 


	always_ff @(posedge clk_in)
	begin
		if (reset == 0) // 
		 begin
			counter <= '0;
			clk_out <= '0;
		 end
		else if (counter == 24999999)
		 begin
			counter <= '0;
			clk_out = ~clk_out;
		 end
		else
		 begin
			counter <= counter + 1'd1;
		 end
	end

endmodule
