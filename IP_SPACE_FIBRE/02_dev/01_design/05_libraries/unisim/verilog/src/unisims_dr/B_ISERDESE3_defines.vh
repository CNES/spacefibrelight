// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_ISERDESE3_DEFINES_VH
`else
`define B_ISERDESE3_DEFINES_VH

// Look-up table parameters
//

`define ISERDESE3_ADDR_N  10
`define ISERDESE3_ADDR_SZ 32
`define ISERDESE3_DATA_SZ 152

// Attribute addresses
//

`define ISERDESE3__DATA_WIDTH    32'h00000000
`define ISERDESE3__DATA_WIDTH_SZ 4

`define ISERDESE3__DDR_CLK_EDGE    32'h00000001
`define ISERDESE3__DDR_CLK_EDGE_SZ 152

`define ISERDESE3__FIFO_ENABLE    32'h00000002
`define ISERDESE3__FIFO_ENABLE_SZ 40

`define ISERDESE3__FIFO_SYNC_MODE    32'h00000003
`define ISERDESE3__FIFO_SYNC_MODE_SZ 40

`define ISERDESE3__IDDR_MODE    32'h00000004
`define ISERDESE3__IDDR_MODE_SZ 40

`define ISERDESE3__IS_CLK_B_INVERTED    32'h00000005
`define ISERDESE3__IS_CLK_B_INVERTED_SZ 1

`define ISERDESE3__IS_CLK_INVERTED    32'h00000006
`define ISERDESE3__IS_CLK_INVERTED_SZ 1

`define ISERDESE3__IS_RST_INVERTED    32'h00000007
`define ISERDESE3__IS_RST_INVERTED_SZ 1

`define ISERDESE3__SIM_DEVICE    32'h00000008
`define ISERDESE3__SIM_DEVICE_SZ 152

`define ISERDESE3__SIM_VERSION    32'h00000009
`define ISERDESE3__SIM_VERSION_SZ 64

`endif  // B_ISERDESE3_DEFINES_VH