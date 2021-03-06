// --------------------------------------------------------------------
// Copyright (c) 2005 by Terasic Technologies Inc.
// --------------------------------------------------------------------
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development
//   Kits made by Terasic.  Other use of this code, including the selling
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use
//   or functionality of this code.
//
// --------------------------------------------------------------------
//
//                     Terasic Technologies Inc
//                     356 Fu-Shin E. Rd Sec. 1. JhuBei City,
//                     HsinChu County, Taiwan
//                     302
//
//                     web: http://www.terasic.com/
//                     email: support@terasic.com
//
// --------------------------------------------------------------------
//
// Major Functions:	DE1 TOP LEVEL
//
// --------------------------------------------------------------------
//
// Revision History :
// --------------------------------------------------------------------
//   Ver  :| Author            :| Mod. Date :| Changes Made:
//   V1.0 :| Johnny Chen       :| 06/04/24  :|      Initial Revision
// --------------------------------------------------------------------

module templateDE1
	(
		////////////////////	Clock Input	 	////////////////////
		CLOCK_24,						//	24 MHz
		CLOCK_27,						//	27 MHz
		CLOCK_50,						//	50 MHz
		EXT_CLOCK,						//	External Clock
		////////////////////	Push Button		////////////////////
		KEY,							//	Pushbutton[3:0]
		////////////////////	DPDT Switch		////////////////////
		SW,								//	Toggle Switch[9:0]
		////////////////////	7-SEG Dispaly	////////////////////
		HEX0,							//	Seven Segment Digit 0
		HEX1,							//	Seven Segment Digit 1
		HEX2,							//	Seven Segment Digit 2
		HEX3,							//	Seven Segment Digit 3
		////////////////////////	LED		////////////////////////
		LEDG,							//	LED Green[7:0]
		LEDR,							//	LED Red[9:0]
		////////////////////////	UART	////////////////////////
		UART_TXD,						//	UART Transmitter
		UART_RXD,						//	UART Receiver
		/////////////////////	SDRAM Interface		////////////////
		DRAM_DQ,						//	SDRAM Data bus 16 Bits
		DRAM_ADDR,						//	SDRAM Address bus 12 Bits
		DRAM_LDQM,						//	SDRAM Low-byte Data Mask
		DRAM_UDQM,						//	SDRAM High-byte Data Mask
		DRAM_WE_N,						//	SDRAM Write Enable
		DRAM_CAS_N,						//	SDRAM Column Address Strobe
		DRAM_RAS_N,						//	SDRAM Row Address Strobe
		DRAM_CS_N,						//	SDRAM Chip Select
		DRAM_BA_0,						//	SDRAM Bank Address 0
		DRAM_BA_1,						//	SDRAM Bank Address 0
		DRAM_CLK,						//	SDRAM Clock
		DRAM_CKE,						//	SDRAM Clock Enable
		////////////////////	Flash Interface		////////////////
		FL_DQ,							//	FLASH Data bus 8 Bits
		FL_ADDR,						//	FLASH Address bus 22 Bits
		FL_WE_N,						//	FLASH Write Enable
		FL_RST_N,						//	FLASH Reset
		FL_OE_N,						//	FLASH Output Enable
		FL_CE_N,						//	FLASH Chip Enable
		////////////////////	SRAM Interface		////////////////
		SRAM_DQ,						//	SRAM Data bus 16 Bits
		SRAM_ADDR,						//	SRAM Address bus 18 Bits
		SRAM_UB_N,						//	SRAM High-byte Data Mask
		SRAM_LB_N,						//	SRAM Low-byte Data Mask
		SRAM_WE_N,						//	SRAM Write Enable
		SRAM_CE_N,						//	SRAM Chip Enable
		SRAM_OE_N,						//	SRAM Output Enable
		////////////////////	SD_Card Interface	////////////////
		SD_DAT,							//	SD Card Data
		SD_DAT3,						//	SD Card Data 3
		SD_CMD,							//	SD Card Command Signal
		SD_CLK,							//	SD Card Clock
		////////////////////	USB JTAG link	////////////////////
		TDI,  							// CPLD -> FPGA (data in)
		TCK,  							// CPLD -> FPGA (clk)
		TCS,  							// CPLD -> FPGA (CS)
	    TDO,  							// FPGA -> CPLD (data out)
		////////////////////	I2C		////////////////////////////
		I2C_SDAT,						//	I2C Data
		I2C_SCLK,						//	I2C Clock
		////////////////////	PS2		////////////////////////////
		PS2_DAT,						//	PS2 Data
		PS2_CLK,						//	PS2 Clock
		////////////////////	VGA		////////////////////////////
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_R,   						//	VGA Red[3:0]
		VGA_G,	 						//	VGA Green[3:0]
		VGA_B,  						//	VGA Blue[3:0]
		////////////////	Audio CODEC		////////////////////////
		AUD_ADCLRCK,					//	Audio CODEC ADC LR Clock
		AUD_ADCDAT,						//	Audio CODEC ADC Data
		AUD_DACLRCK,					//	Audio CODEC DAC LR Clock
		AUD_DACDAT,						//	Audio CODEC DAC Data
		AUD_BCLK,						//	Audio CODEC Bit-Stream Clock
		AUD_XCK,						//	Audio CODEC Chip Clock
		////////////////////	GPIO	////////////////////////////
		GPIO_0,							//	GPIO Connection 0
		GPIO_1							//	GPIO Connection 1
	);

////////////////////////	Clock Input	 	////////////////////////
input	[1:0]	CLOCK_24;				//	24 MHz
input	[1:0]	CLOCK_27;				//	27 MHz
input			CLOCK_50;				//	50 MHz
input			EXT_CLOCK;				//	External Clock
////////////////////////	Push Button		////////////////////////
input	[3:0]	KEY;					//	Pushbutton[3:0]
////////////////////////	DPDT Switch		////////////////////////
input	[9:0]	SW;						//	Toggle Switch[9:0]
////////////////////////	7-SEG Dispaly	////////////////////////
output	[6:0]	HEX0;					//	Seven Segment Digit 0
output	[6:0]	HEX1;					//	Seven Segment Digit 1
output	[6:0]	HEX2;					//	Seven Segment Digit 2
output	[6:0]	HEX3;					//	Seven Segment Digit 3
////////////////////////////	LED		////////////////////////////
output	[7:0]	LEDG;					//	LED Green[7:0]
output	[9:0]	LEDR;					//	LED Red[9:0]
////////////////////////////	UART	////////////////////////////
output			UART_TXD;				//	UART Transmitter
input			UART_RXD;				//	UART Receiver
///////////////////////		SDRAM Interface	////////////////////////
inout	[15:0]	DRAM_DQ;				//	SDRAM Data bus 16 Bits
output	[11:0]	DRAM_ADDR;				//	SDRAM Address bus 12 Bits
output			DRAM_LDQM;				//	SDRAM Low-byte Data Mask
output			DRAM_UDQM;				//	SDRAM High-byte Data Mask
output			DRAM_WE_N;				//	SDRAM Write Enable
output			DRAM_CAS_N;				//	SDRAM Column Address Strobe
output			DRAM_RAS_N;				//	SDRAM Row Address Strobe
output			DRAM_CS_N;				//	SDRAM Chip Select
output			DRAM_BA_0;				//	SDRAM Bank Address 0
output			DRAM_BA_1;				//	SDRAM Bank Address 0
output			DRAM_CLK;				//	SDRAM Clock
output			DRAM_CKE;				//	SDRAM Clock Enable
////////////////////////	Flash Interface	////////////////////////
inout	[7:0]	FL_DQ;					//	FLASH Data bus 8 Bits
output	[21:0]	FL_ADDR;				//	FLASH Address bus 22 Bits
output			FL_WE_N;				//	FLASH Write Enable
output			FL_RST_N;				//	FLASH Reset
output			FL_OE_N;				//	FLASH Output Enable
output			FL_CE_N;				//	FLASH Chip Enable
////////////////////////	SRAM Interface	////////////////////////
inout	[15:0]	SRAM_DQ;				//	SRAM Data bus 16 Bits
output	[17:0]	SRAM_ADDR;				//	SRAM Address bus 18 Bits
output			SRAM_UB_N;				//	SRAM High-byte Data Mask
output			SRAM_LB_N;				//	SRAM Low-byte Data Mask
output			SRAM_WE_N;				//	SRAM Write Enable
output			SRAM_CE_N;				//	SRAM Chip Enable
output			SRAM_OE_N;				//	SRAM Output Enable
////////////////////	SD Card Interface	////////////////////////
inout			SD_DAT;					//	SD Card Data
inout			SD_DAT3;				//	SD Card Data 3
inout			SD_CMD;					//	SD Card Command Signal
output			SD_CLK;					//	SD Card Clock
////////////////////////	I2C		////////////////////////////////
inout			I2C_SDAT;				//	I2C Data
output			I2C_SCLK;				//	I2C Clock
////////////////////////	PS2		////////////////////////////////
input		 	PS2_DAT;				//	PS2 Data
input			PS2_CLK;				//	PS2 Clock
////////////////////	USB JTAG link	////////////////////////////
input  			TDI;					// CPLD -> FPGA (data in)
input  			TCK;					// CPLD -> FPGA (clk)
input  			TCS;					// CPLD -> FPGA (CS)
output 			TDO;					// FPGA -> CPLD (data out)
////////////////////////	VGA			////////////////////////////
output			VGA_HS;					//	VGA H_SYNC
output			VGA_VS;					//	VGA V_SYNC
output	[3:0]	VGA_R;   				//	VGA Red[3:0]
output	[3:0]	VGA_G;	 				//	VGA Green[3:0]
output	[3:0]	VGA_B;   				//	VGA Blue[3:0]
////////////////////	Audio CODEC		////////////////////////////
inout			AUD_ADCLRCK;			//	Audio CODEC ADC LR Clock
input			AUD_ADCDAT;				//	Audio CODEC ADC Data
inout			AUD_DACLRCK;			//	Audio CODEC DAC LR Clock
output			AUD_DACDAT;				//	Audio CODEC DAC Data
inout			AUD_BCLK;				//	Audio CODEC Bit-Stream Clock
output			AUD_XCK;				//	Audio CODEC Chip Clock
////////////////////////	GPIO	////////////////////////////////
inout	[35:0]	GPIO_0;					//	GPIO Connection 0
inout	[35:0]	GPIO_1;					//	GPIO Connection 1

//	Turn off all unused display
//assign	HEX0		=	7'h7F;
//assign	HEX1		=	7'h7F;
//assign	HEX2		=	7'h7F;
//assign	HEX3		=	7'h7F;
//assign	LEDG		=	8'h0;
//assign	LEDR		=	10'h0;

//	All unused inout port turn to tri-state
assign	DRAM_DQ		=	16'hzzzz;
assign	FL_DQ		=	8'hzz;
assign	SRAM_DQ		=	16'hzzzz;
assign	SD_DAT		=	1'bz;
assign	I2C_SDAT	=	1'bz;
assign	AUD_ADCLRCK	=	1'bz;
assign	AUD_DACLRCK	=	1'bz;
assign	AUD_BCLK	=	1'bz;
assign	GPIO_0		=	36'hzzzzzzzzz;
assign	GPIO_1		=	36'hzzzzzzzzz;


/*######################## INSTANCIA O BLOCO sequenciaLED ###########################

assign	HEX0		=	7'h7F;
assign	HEX1		=	7'h7F;
assign	HEX2		=	7'h7F;
assign	HEX3		=	7'h7F;

wire conection;

divisor_clock div_clk1(.clk_in(CLOCK_50), .clk_out(conection), .reset(KEY[1]));

assign LEDR[0] = conection; // a saida do bloco div_clk1 pode ser visualizada no LEDR[0]

sequeciaLED sequenciaLED1(.out(LEDG[3:0]), .clk(conection), .reset(KEY[0]), .direction(LEDR[9]), .state(LEDR[2:1]) );
									
/*#####################################################*/

/*######################## INSTANCIA O CONTADOR UP/DOWN DE 4 BITS TIPO 1 ###########################

assign	HEX2		=	7'h7F;
assign	HEX3		=	7'h7F;

wire conection;

wire [3:0] conection_2;

assign LEDG[3:0] = conection_2;

divisor_clock div_clk1(.clk_in(CLOCK_50), .clk_out(conection), .reset(KEY[1]));

assign LEDR[0] = conection; // a saida do bloco div_clk1 pode ser visualizada no LEDR[0]

counterUpDown4bits_t1  myCounterT1(.clk(conection),.out(conection_2),.reset(KEY[0]));

binary_to_disp7 decoder(.number_in(conection_2), .disp_unidade(HEX0), .disp_dezena(HEX1) );
									
/*################################################################################################*/


/*######################## INSTANCIA O CONTADOR UP/DOWN DE 4 BITS TIPO 2 ###########################

assign	HEX2		=	7'h7F;
assign	HEX3		=	7'h7F;

wire conection;

wire [3:0] conection_2;

assign LEDG[3:0] = conection_2;

divisor_clock div_clk1(.clk_in(CLOCK_50), .clk_out(conection), .reset(KEY[1]));

assign LEDR[0] = conection; // a saida do bloco div_clk1 pode ser visualizada no LEDR[0]

counterUpDown4bits_t2  myCounterT2(.clk(conection),.out(conection_2),.reset(KEY[0]));

binary_to_disp7 decoder(.number_in(conection_2), .disp_unidade(HEX0), .disp_dezena(HEX1) );
									
/*#####################################################*/


/*######################## INSTANCIA  CRONOMETRO ###########################

wire conection;
wire [6:0] conection_2;
wire [6:0] conection_3;

wire clock_for_debounce_out;
//assign LEDR[8] = clock_for_debounce_out;

wire db_out; 
//assign LEDR[9] = db_out;

divisor_clock_10ms div_clk1(.clk_in(CLOCK_50), .clk_out(conection), .reset(1'b1));

divisor_clock_for_debounce(.clk_in(CLOCK_50), .clk_out(clock_for_debounce_out), .reset(1'b1));

debounce db (.data(KEY[3]), .clock(clock_for_debounce_out), .output_data(db_out)); 

cronometro c1(.clk(conection), .cent_seg(conection_2),.seg(conection_3) , .pause(KEY[1]), .start(KEY[0]), .stop(KEY[2]), .store(db_out), .disp_lap(SW[2:0])); // trocar KEY[3] por db_out

binary_to_disp7 decoder1(.number_in(conection_2), .disp_unidade(HEX0), .disp_dezena(HEX1) );

binary_to_disp7 decoder2(.number_in(conection_3), .disp_unidade(HEX2), .disp_dezena(HEX3) );
									
/*#####################################################*/

/*######################## ACIONAR LEDs com Luminosidades diferentes ###########################

// Desliga os displays 7 segmentos
assign	HEX0		=	7'h7F;
assign	HEX1		=	7'h7F;
assign	HEX2		=	7'h7F;
assign	HEX3		=	7'h7F;

// fios para conetar a saida dos blocos de divisão de clock a outros blocos
wire conection_clock_out1;
wire conection_clock_out2;

// fios para conectar as saidas do shift register aos blocos de pwm
wire [6:0] duty0,duty1,duty2,duty3,duty4,duty5,duty6,duty7;

// instanciação dos blocos que geram clock de 1Hz para o shift register e 10KHz para os blocos de PWM
divisor_clock_10KHz div_clk_1(.clk_in(CLOCK_50), .clk_out(conection_clock_out1), .reset(1'd1));
divisor_clock_1Hz   div_clk_2(.clk_in(CLOCK_50), .clk_out(conection_clock_out2), .reset(1'd1));

// instanciação dos blocos de PWM
pwm pwm0(.clk(conection_clock_out1), .tau(duty0),.pwmout(LEDR[0]));
pwm pwm1(.clk(conection_clock_out1), .tau(duty1),.pwmout(LEDR[1]));
pwm pwm2(.clk(conection_clock_out1), .tau(duty2),.pwmout(LEDR[2]));
pwm pwm3(.clk(conection_clock_out1), .tau(duty3),.pwmout(LEDR[3]));
pwm pwm4(.clk(conection_clock_out1), .tau(duty4),.pwmout(LEDR[4]));
pwm pwm5(.clk(conection_clock_out1), .tau(duty5),.pwmout(LEDR[5]));
pwm pwm6(.clk(conection_clock_out1), .tau(duty6),.pwmout(LEDR[6]));
pwm pwm7(.clk(conection_clock_out1), .tau(duty7),.pwmout(LEDR[7]));

// instanciação do shift register
shift_register shift_register1(.clk(conection_clock_out2), .reset(KEY[0]) , .data0(duty0), .data1(duty1), .data2(duty2), .data3(duty3), .data4(duty4), .data5(duty5), .data6(duty6), .data7(duty7) );

/*#####################################################*/

/*######################## Ordenador ###########################

	logic [3:0]numb[5:0];
	logic [3:0]numb_sort[5:0];
	/*assign numb[0] = 5;
	assign numb[1] = 4;
	assign numb[2] = 3;
	assign numb[3] = 2; 
	assign numb[4] = 1;
	assign numb[5] = 0;*/


	ordenador sort1 (ordenar(KEY[0]));

	//assign LEDG[3:0] = numb_sort[5];
	
/*#####################################################*/

endmodule
