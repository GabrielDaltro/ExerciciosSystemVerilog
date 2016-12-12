module shift_register (clk, reset);

input logic clk;
input logic reset;

logic data0, data1, data2, data3, data4, data5, data6, data7,data8, data9;

always (posedge clk)
	begin
		if (reset == 1'b0)
		 begin
				data0 <= 'd5;
				data1 <= 'd10;
				data2 <= 'd15;
				data3 <= 'd20;
				data4 <= 'd25;
				data5 <= 'd30;
				data6 <= 'd35;
				data7 <= 'd40;
				data8 <= 'd45;
				data9 <= 'd50;
		 end
		else
		 begin
				data0 <= data9;
				data1 <= data0;
				data2 <= data1;
				data3 <= data2;
				data4 <= data3;
				data5 <= data4;
				data6 <= data5;
				data7 <= data6;
				data8 <= data7;
				data9 <= data8;
			
		 end
	end

module
