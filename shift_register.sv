module shift_register (clk, reset ,data0, data1, data2, data3, data4, data5, data6, data7);

input logic clk;
input logic reset;

output logic [6:0] data0, data1, data2, data3, data4, data5, data6, data7;

always @(posedge clk)
	begin
		if (reset == 1'b0)
		 begin
				data0 <= 'd1;
				data1 <= 'd2;
				data2 <= 'd5;
				data3 <= 'd15;
				data4 <= 'd35;
				data5 <= 'd50;
				data6 <= 'd75;
				data7 <= 'd100;
		 end
		else
		 begin
				data0 <= data7;
				data1 <= data0;
				data2 <= data1;
				data3 <= data2;
				data4 <= data3;
				data5 <= data4;
				data6 <= data5;
				data7 <= data6;
		 end
	end
endmodule
