`timescale 1 ns / 1 ps

module use_dac #
(
  parameter integer DAC_DATA_WIDTH = 14
)
(
  // PLL signals
  input  wire                        aclk,
  input  wire                        ddr_clk,
  input  wire                        locked,
  // DAC signals
  output wire                        dac_clk,
  output wire                        dac_rst,
  output wire                        dac_sel,
  output wire                        dac_wrt,
  output wire [DAC_DATA_WIDTH-1:0]   dac_dat,

  // Slave side
  input  wire [DAC_DATA_WIDTH-1:0]   data_dac
  //input  wire                        dac_valid
);

  reg [DAC_DATA_WIDTH-1:0] int_dat_a_reg;
  reg [DAC_DATA_WIDTH-1:0] int_dat_b_reg;
  reg int_rst_reg; //= 1'b0

  wire [DAC_DATA_WIDTH-1:0] int_dat_a_wire;
  wire [DAC_DATA_WIDTH-1:0] int_dat_b_wire;
  

  assign int_dat_a_wire = data_dac[DAC_DATA_WIDTH-1:0];
  assign int_dat_b_wire = 14'b10000000000000;

  genvar j;
  
  
  always @(posedge aclk)
  begin
//    if(~locked | ~dac_valid)
    if(~locked )
    begin
      int_dat_a_reg <= {(DAC_DATA_WIDTH){1'b0}};
      int_dat_b_reg <= {(DAC_DATA_WIDTH){1'b0}};
    end
    else
    begin
//      int_dat_a_reg <= {int_dat_a_wire[DAC_DATA_WIDTH-1], ~int_dat_a_wire[DAC_DATA_WIDTH-2:0]};
//      int_dat_b_reg <= {int_dat_b_wire[DAC_DATA_WIDTH-1], ~int_dat_b_wire[DAC_DATA_WIDTH-2:0]};
      int_dat_a_reg <= int_dat_a_wire[DAC_DATA_WIDTH-1:0];
      int_dat_b_reg <= int_dat_b_wire[DAC_DATA_WIDTH-1:0];  
    end
    //int_rst_reg <= ~locked | ~dac_valid;
    int_rst_reg <= ~locked;
  end
    
  ODDR ODDR_rst(.Q(dac_rst), .D1(int_rst_reg), .D2(int_rst_reg), .C(aclk), .CE(1'b1), .R(1'b0), .S(1'b0));
  ODDR ODDR_sel(.Q(dac_sel), .D1(1'b0), .D2(1'b1), .C(aclk), .CE(1'b1), .R(1'b0), .S(1'b0));
  ODDR ODDR_wrt(.Q(dac_wrt), .D1(1'b0), .D2(1'b1), .C(ddr_clk), .CE(1'b1), .R(1'b0), .S(1'b0));
  ODDR ODDR_clk(.Q(dac_clk), .D1(1'b0), .D2(1'b1), .C(ddr_clk), .CE(1'b1), .R(1'b0), .S(1'b0));
    
    
  generate
    for(j = 0; j < DAC_DATA_WIDTH; j = j + 1)
    begin : DAC_DAT
      ODDR ODDR_inst(
        .Q(dac_dat[j]),
        .D1(int_dat_a_reg[j]),
        .D2(int_dat_b_reg[j]),
        .C(aclk),
        .CE(1'b1),
        .R(1'b0),
        .S(1'b0)
      );
    end
  endgenerate
endmodule