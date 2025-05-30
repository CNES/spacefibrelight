// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_RXTX_BITSLICE_DEFINES_VH
`else
`define B_RXTX_BITSLICE_DEFINES_VH

// Look-up table parameters
//

`define RXTX_BITSLICE_ADDR_N  28
`define RXTX_BITSLICE_ADDR_SZ 32
`define RXTX_BITSLICE_DATA_SZ 152

// Attribute addresses
//

`define RXTX_BITSLICE__ENABLE_PRE_EMPHASIS    32'h00000000
`define RXTX_BITSLICE__ENABLE_PRE_EMPHASIS_SZ 40

`define RXTX_BITSLICE__FIFO_SYNC_MODE    32'h00000001
`define RXTX_BITSLICE__FIFO_SYNC_MODE_SZ 40

`define RXTX_BITSLICE__INIT    32'h00000002
`define RXTX_BITSLICE__INIT_SZ 1

`define RXTX_BITSLICE__IS_RX_CLK_INVERTED    32'h00000003
`define RXTX_BITSLICE__IS_RX_CLK_INVERTED_SZ 1

`define RXTX_BITSLICE__IS_RX_RST_DLY_INVERTED    32'h00000004
`define RXTX_BITSLICE__IS_RX_RST_DLY_INVERTED_SZ 1

`define RXTX_BITSLICE__IS_RX_RST_INVERTED    32'h00000005
`define RXTX_BITSLICE__IS_RX_RST_INVERTED_SZ 1

`define RXTX_BITSLICE__IS_TX_CLK_INVERTED    32'h00000006
`define RXTX_BITSLICE__IS_TX_CLK_INVERTED_SZ 1

`define RXTX_BITSLICE__IS_TX_RST_DLY_INVERTED    32'h00000007
`define RXTX_BITSLICE__IS_TX_RST_DLY_INVERTED_SZ 1

`define RXTX_BITSLICE__IS_TX_RST_INVERTED    32'h00000008
`define RXTX_BITSLICE__IS_TX_RST_INVERTED_SZ 1

`define RXTX_BITSLICE__LOOPBACK    32'h00000009
`define RXTX_BITSLICE__LOOPBACK_SZ 40

`define RXTX_BITSLICE__NATIVE_ODELAY_BYPASS    32'h0000000a
`define RXTX_BITSLICE__NATIVE_ODELAY_BYPASS_SZ 40

`define RXTX_BITSLICE__RX_DATA_TYPE    32'h0000000b
`define RXTX_BITSLICE__RX_DATA_TYPE_SZ 112

`define RXTX_BITSLICE__RX_DATA_WIDTH    32'h0000000c
`define RXTX_BITSLICE__RX_DATA_WIDTH_SZ 4

`define RXTX_BITSLICE__RX_DELAY_FORMAT    32'h0000000d
`define RXTX_BITSLICE__RX_DELAY_FORMAT_SZ 40

`define RXTX_BITSLICE__RX_DELAY_TYPE    32'h0000000e
`define RXTX_BITSLICE__RX_DELAY_TYPE_SZ 64

`define RXTX_BITSLICE__RX_DELAY_VALUE    32'h0000000f
`define RXTX_BITSLICE__RX_DELAY_VALUE_SZ 11

`define RXTX_BITSLICE__RX_REFCLK_FREQUENCY    32'h00000010
`define RXTX_BITSLICE__RX_REFCLK_FREQUENCY_SZ 64

`define RXTX_BITSLICE__RX_UPDATE_MODE    32'h00000011
`define RXTX_BITSLICE__RX_UPDATE_MODE_SZ 48

`define RXTX_BITSLICE__SIM_DEVICE    32'h00000012
`define RXTX_BITSLICE__SIM_DEVICE_SZ 152

`define RXTX_BITSLICE__SIM_VERSION    32'h00000013
`define RXTX_BITSLICE__SIM_VERSION_SZ 64

`define RXTX_BITSLICE__TBYTE_CTL    32'h00000014
`define RXTX_BITSLICE__TBYTE_CTL_SZ 64

`define RXTX_BITSLICE__TX_DATA_WIDTH    32'h00000015
`define RXTX_BITSLICE__TX_DATA_WIDTH_SZ 4

`define RXTX_BITSLICE__TX_DELAY_FORMAT    32'h00000016
`define RXTX_BITSLICE__TX_DELAY_FORMAT_SZ 40

`define RXTX_BITSLICE__TX_DELAY_TYPE    32'h00000017
`define RXTX_BITSLICE__TX_DELAY_TYPE_SZ 64

`define RXTX_BITSLICE__TX_DELAY_VALUE    32'h00000018
`define RXTX_BITSLICE__TX_DELAY_VALUE_SZ 11

`define RXTX_BITSLICE__TX_OUTPUT_PHASE_90    32'h00000019
`define RXTX_BITSLICE__TX_OUTPUT_PHASE_90_SZ 40

`define RXTX_BITSLICE__TX_REFCLK_FREQUENCY    32'h0000001a
`define RXTX_BITSLICE__TX_REFCLK_FREQUENCY_SZ 64

`define RXTX_BITSLICE__TX_UPDATE_MODE    32'h0000001b
`define RXTX_BITSLICE__TX_UPDATE_MODE_SZ 48

`endif  // B_RXTX_BITSLICE_DEFINES_VH