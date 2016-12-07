/*


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
