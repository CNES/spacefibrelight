// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_OSERDESE3_DEFINES_VH
`else
`define B_OSERDESE3_DEFINES_VH

// Look-up table parameters
//

`define OSERDESE3_ADDR_N  10
`define OSERDESE3_ADDR_SZ 32
`define OSERDESE3_DATA_SZ 152

// Attribute addresses
//

`define OSERDESE3__DATA_WIDTH    32'h00000000
`define OSERDESE3__DATA_WIDTH_SZ 4

`define OSERDESE3__INIT    32'h00000001
`define OSERDESE3__INIT_SZ 1

`define OSERDESE3__IS_CLKDIV_INVERTED    32'h00000002
`define OSERDESE3__IS_CLKDIV_INVERTED_SZ 1

`define OSERDESE3__IS_CLK_INVERTED    32'h00000003
`define OSERDESE3__IS_CLK_INVERTED_SZ 1

`define OSERDESE3__IS_RST_INVERTED    32'h00000004
`define OSERDESE3__IS_RST_INVERTED_SZ 1

`define OSERDESE3__ODDR_MODE    32'h00000005
`define OSERDESE3__ODDR_MODE_SZ 40

`define OSERDESE3__OSERDES_D_BYPASS    32'h00000006
`define OSERDESE3__OSERDES_D_BYPASS_SZ 40

`define OSERDESE3__OSERDES_T_BYPASS    32'h00000007
`define OSERDESE3__OSERDES_T_BYPASS_SZ 40

`define OSERDESE3__SIM_DEVICE    32'h00000008
`define OSERDESE3__SIM_DEVICE_SZ 152

`define OSERDESE3__SIM_VERSION    32'h00000009
`define OSERDESE3__SIM_VERSION_SZ 64

`endif  // B_OSERDESE3_DEFINES_VH