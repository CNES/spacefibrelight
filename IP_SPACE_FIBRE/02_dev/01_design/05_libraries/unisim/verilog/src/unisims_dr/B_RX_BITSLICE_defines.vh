// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_RX_BITSLICE_DEFINES_VH
`else
`define B_RX_BITSLICE_DEFINES_VH

// Look-up table parameters
//

`define RX_BITSLICE_ADDR_N  18
`define RX_BITSLICE_ADDR_SZ 32
`define RX_BITSLICE_DATA_SZ 152

// Attribute addresses
//

`define RX_BITSLICE__CASCADE    32'h00000000
`define RX_BITSLICE__CASCADE_SZ 40

`define RX_BITSLICE__DATA_TYPE    32'h00000001
`define RX_BITSLICE__DATA_TYPE_SZ 112

`define RX_BITSLICE__DATA_WIDTH    32'h00000002
`define RX_BITSLICE__DATA_WIDTH_SZ 4

`define RX_BITSLICE__DELAY_FORMAT    32'h00000003
`define RX_BITSLICE__DELAY_FORMAT_SZ 40

`define RX_BITSLICE__DELAY_TYPE    32'h00000004
`define RX_BITSLICE__DELAY_TYPE_SZ 64

`define RX_BITSLICE__DELAY_VALUE    32'h00000005
`define RX_BITSLICE__DELAY_VALUE_SZ 11

`define RX_BITSLICE__DELAY_VALUE_EXT    32'h00000006
`define RX_BITSLICE__DELAY_VALUE_EXT_SZ 11

`define RX_BITSLICE__FIFO_SYNC_MODE    32'h00000007
`define RX_BITSLICE__FIFO_SYNC_MODE_SZ 40

`define RX_BITSLICE__IS_CLK_EXT_INVERTED    32'h00000008
`define RX_BITSLICE__IS_CLK_EXT_INVERTED_SZ 1

`define RX_BITSLICE__IS_CLK_INVERTED    32'h00000009
`define RX_BITSLICE__IS_CLK_INVERTED_SZ 1

`define RX_BITSLICE__IS_RST_DLY_EXT_INVERTED    32'h0000000a
`define RX_BITSLICE__IS_RST_DLY_EXT_INVERTED_SZ 1

`define RX_BITSLICE__IS_RST_DLY_INVERTED    32'h0000000b
`define RX_BITSLICE__IS_RST_DLY_INVERTED_SZ 1

`define RX_BITSLICE__IS_RST_INVERTED    32'h0000000c
`define RX_BITSLICE__IS_RST_INVERTED_SZ 1

`define RX_BITSLICE__REFCLK_FREQUENCY    32'h0000000d
`define RX_BITSLICE__REFCLK_FREQUENCY_SZ 64

`define RX_BITSLICE__SIM_DEVICE    32'h0000000e
`define RX_BITSLICE__SIM_DEVICE_SZ 152

`define RX_BITSLICE__SIM_VERSION    32'h0000000f
`define RX_BITSLICE__SIM_VERSION_SZ 64

`define RX_BITSLICE__UPDATE_MODE    32'h00000010
`define RX_BITSLICE__UPDATE_MODE_SZ 48

`define RX_BITSLICE__UPDATE_MODE_EXT    32'h00000011
`define RX_BITSLICE__UPDATE_MODE_EXT_SZ 48

`endif  // B_RX_BITSLICE_DEFINES_VH