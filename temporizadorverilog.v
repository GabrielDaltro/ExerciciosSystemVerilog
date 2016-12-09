module temporizadorverilog(input clk, input rst,input ena,output full_count,
output [6:0] dig1,output [6:0] dig2);
 
	reg [23:0] count0; 
	reg [3:0] count1;
	reg [2:0] count2;
   reg fclk = 24'b100110001001011010000000;

always begin: main_process
if(rst <= 1)begin
	count0 = 0;
	count1 = 0;
	count2 = 0;
	assign full_count = 0;
end 
else if(count1 == 0 && count2 == 6)begin
		full_count <= 1;
	 end
else if(clk == 1)begin 
		if (ena == 1)begin 
			count0 = count0 + 1;
			if (count0 == fclk)begin
				count0 = 0;
				count1 = count1 + 1;
		        if (count1 == 10)begin
				    count1 = 0;
				    count2 = count2 + 1;
			    end
			end
		end
	  end
	
	case (count1)
			4'b0000: dig1 = 7'b1000000;
			4'b0001: dig1 = 7'b1111001;
			4'b0010: dig1 = 7'b0100100;
			4'b0011: dig1 = 7'b0110000;
			4'b0100: dig1 = 7'b0011001;
			4'b0101: dig1 = 7'b0010010;
			4'b0110: dig1 = 7'b0000010;
			4'b0111: dig1 = 7'b1111000;
			4'b1000: dig1 = 7'b0000000;
			4'b1001: dig1 = 7'b0010000;
			default: dig1 = 7'b1001111;
		endcase
	case (count2)
			3'b000: dig2 = 7'b1000000;
			3'b001: dig2 = 7'b1111001;
			3'b010: dig2 = 7'b0100100;
			3'b011: dig2 = 7'b0110000;
			3'b100: dig2 = 7'b0011001;
			3'b101: dig2 = 7'b0010010;
			3'b110: dig2 = 7'b0000010;
			default: dig2 = 7'b1001111;
		endcase
	end
	endmodule 