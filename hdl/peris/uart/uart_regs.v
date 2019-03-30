/*******************************************************************************
*                          AUTOGENERATED BY REGBLOCK                           *
*                            Do not edit manually.                             *
*          Edit the source file (or regblock utility) and regenerate.          *
*******************************************************************************/

// Block name           : uart
// Bus type             : apb
// Bus data width       : 32
// Bus address width    : 16

module uart_regs (
	input wire clk,
	input wire rst_n,
	
	// APB Port
	input wire apbs_psel,
	input wire apbs_penable,
	input wire apbs_pwrite,
	input wire [15:0] apbs_paddr,
	input wire [31:0] apbs_pwdata,
	output wire [31:0] apbs_prdata,
	output wire apbs_pready,
	output wire apbs_pslverr,
	
	// Register interfaces
	output reg  csr_en_o,
	input wire  csr_busy_i,
	output reg  csr_txie_o,
	output reg  csr_rxie_o,
	output reg  csr_loopback_o,
	output reg [9:0] div_int_o,
	output reg [7:0] div_frac_o,
	input wire [7:0] fstat_txlevel_i,
	input wire  fstat_txfull_i,
	input wire  fstat_txempty_i,
	input wire  fstat_txover_i,
	input wire  fstat_txunder_i,
	input wire [7:0] fstat_rxlevel_i,
	input wire  fstat_rxfull_i,
	input wire  fstat_rxempty_i,
	input wire  fstat_rxover_i,
	input wire  fstat_rxunder_i,
	output reg [7:0] tx_o,
	output reg tx_wen,
	input wire [7:0] rx_i,
	output reg rx_ren
);

// APB adapter
wire [31:0] wdata = apbs_pwdata;
reg [31:0] rdata;
wire wen = apbs_psel && apbs_penable && apbs_pwrite;
wire ren = apbs_psel && apbs_penable && !apbs_pwrite;
wire [15:0] addr = apbs_paddr & 16'h1f;
assign apbs_prdata = rdata;
assign apbs_pready = 1'b1;
assign apbs_pslverr = 1'b0;

localparam ADDR_CSR = 0;
localparam ADDR_DIV = 4;
localparam ADDR_FSTAT = 8;
localparam ADDR_TX = 12;
localparam ADDR_RX = 16;

wire __csr_wen = wen && addr == ADDR_CSR;
wire __csr_ren = ren && addr == ADDR_CSR;
wire __div_wen = wen && addr == ADDR_DIV;
wire __div_ren = ren && addr == ADDR_DIV;
wire __fstat_wen = wen && addr == ADDR_FSTAT;
wire __fstat_ren = ren && addr == ADDR_FSTAT;
wire __tx_wen = wen && addr == ADDR_TX;
wire __tx_ren = ren && addr == ADDR_TX;
wire __rx_wen = wen && addr == ADDR_RX;
wire __rx_ren = ren && addr == ADDR_RX;

wire  csr_en_wdata = wdata[0];
wire  csr_en_rdata;
wire  csr_busy_wdata = wdata[1];
wire  csr_busy_rdata;
wire  csr_txie_wdata = wdata[2];
wire  csr_txie_rdata;
wire  csr_rxie_wdata = wdata[3];
wire  csr_rxie_rdata;
wire  csr_loopback_wdata = wdata[8];
wire  csr_loopback_rdata;
wire [31:0] __csr_rdata = {23'h0, csr_loopback_rdata, 4'h0, csr_rxie_rdata, csr_txie_rdata, csr_busy_rdata, csr_en_rdata};
assign csr_en_rdata = csr_en_o;
assign csr_busy_rdata = csr_busy_i;
assign csr_txie_rdata = csr_txie_o;
assign csr_rxie_rdata = csr_rxie_o;
assign csr_loopback_rdata = csr_loopback_o;

wire [9:0] div_int_wdata = wdata[17:8];
wire [9:0] div_int_rdata;
wire [7:0] div_frac_wdata = wdata[7:0];
wire [7:0] div_frac_rdata;
wire [31:0] __div_rdata = {14'h0, div_int_rdata, div_frac_rdata};
assign div_int_rdata = div_int_o;
assign div_frac_rdata = div_frac_o;

wire [7:0] fstat_txlevel_wdata = wdata[7:0];
wire [7:0] fstat_txlevel_rdata;
wire  fstat_txfull_wdata = wdata[8];
wire  fstat_txfull_rdata;
wire  fstat_txempty_wdata = wdata[9];
wire  fstat_txempty_rdata;
wire  fstat_txover_wdata = wdata[10];
wire  fstat_txover_rdata;
wire  fstat_txunder_wdata = wdata[11];
wire  fstat_txunder_rdata;
wire [7:0] fstat_rxlevel_wdata = wdata[23:16];
wire [7:0] fstat_rxlevel_rdata;
wire  fstat_rxfull_wdata = wdata[24];
wire  fstat_rxfull_rdata;
wire  fstat_rxempty_wdata = wdata[25];
wire  fstat_rxempty_rdata;
wire  fstat_rxover_wdata = wdata[26];
wire  fstat_rxover_rdata;
wire  fstat_rxunder_wdata = wdata[27];
wire  fstat_rxunder_rdata;
wire [31:0] __fstat_rdata = {4'h0, fstat_rxunder_rdata, fstat_rxover_rdata, fstat_rxempty_rdata, fstat_rxfull_rdata, fstat_rxlevel_rdata, 4'h0, fstat_txunder_rdata, fstat_txover_rdata, fstat_txempty_rdata, fstat_txfull_rdata, fstat_txlevel_rdata};
assign fstat_txlevel_rdata = fstat_txlevel_i;
assign fstat_txfull_rdata = fstat_txfull_i;
assign fstat_txempty_rdata = fstat_txempty_i;
reg  fstat_txover;
assign fstat_txover_rdata = fstat_txover;
reg  fstat_txunder;
assign fstat_txunder_rdata = fstat_txunder;
assign fstat_rxlevel_rdata = fstat_rxlevel_i;
assign fstat_rxfull_rdata = fstat_rxfull_i;
assign fstat_rxempty_rdata = fstat_rxempty_i;
reg  fstat_rxover;
assign fstat_rxover_rdata = fstat_rxover;
reg  fstat_rxunder;
assign fstat_rxunder_rdata = fstat_rxunder;

wire [7:0] tx_wdata = wdata[7:0];
wire [7:0] tx_rdata;
wire [31:0] __tx_rdata = {24'h0, tx_rdata};
assign tx_rdata = 8'h0;

wire [7:0] rx_wdata = wdata[7:0];
wire [7:0] rx_rdata;
wire [31:0] __rx_rdata = {24'h0, rx_rdata};
assign rx_rdata = rx_i;

always @ (*) begin
	case (addr)
		ADDR_CSR: rdata = __csr_rdata;
		ADDR_DIV: rdata = __div_rdata;
		ADDR_FSTAT: rdata = __fstat_rdata;
		ADDR_TX: rdata = __tx_rdata;
		ADDR_RX: rdata = __rx_rdata;
		default: rdata = 32'h0;
	endcase
	tx_wen = __tx_wen;
	tx_o = tx_wdata;
	rx_ren = __rx_ren;
end

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		csr_en_o <= 1'h0;
		csr_txie_o <= 1'h0;
		csr_rxie_o <= 1'h0;
		csr_loopback_o <= 1'h0;
		div_int_o <= 10'h1;
		div_frac_o <= 8'h0;
		fstat_txover <= 1'h0;
		fstat_txunder <= 1'h0;
		fstat_rxover <= 1'h0;
		fstat_rxunder <= 1'h0;
	end else begin
		if (__csr_wen)
			csr_en_o <= csr_en_wdata;
		if (__csr_wen)
			csr_txie_o <= csr_txie_wdata;
		if (__csr_wen)
			csr_rxie_o <= csr_rxie_wdata;
		if (__csr_wen)
			csr_loopback_o <= csr_loopback_wdata;
		if (__div_wen)
			div_int_o <= div_int_wdata;
		if (__div_wen)
			div_frac_o <= div_frac_wdata;
		fstat_txover <= (fstat_txover && !(__fstat_wen && fstat_txover_wdata)) || fstat_txover_i;
		fstat_txunder <= (fstat_txunder && !(__fstat_wen && fstat_txunder_wdata)) || fstat_txunder_i;
		fstat_rxover <= (fstat_rxover && !(__fstat_wen && fstat_rxover_wdata)) || fstat_rxover_i;
		fstat_rxunder <= (fstat_rxunder && !(__fstat_wen && fstat_rxunder_wdata)) || fstat_rxunder_i;
	end
end

endmodule
