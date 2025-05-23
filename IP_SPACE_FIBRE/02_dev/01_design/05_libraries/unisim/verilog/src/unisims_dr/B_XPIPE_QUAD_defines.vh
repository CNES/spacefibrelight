// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_XPIPE_QUAD_DEFINES_VH
`else
`define B_XPIPE_QUAD_DEFINES_VH

// Look-up table parameters
//

`define XPIPE_QUAD_ADDR_N  12
`define XPIPE_QUAD_ADDR_SZ 32
`define XPIPE_QUAD_DATA_SZ 144

// Attribute addresses
//

`define XPIPE_QUAD__DATA_RATE    32'h00000000
`define XPIPE_QUAD__DATA_RATE_SZ 64

`define XPIPE_QUAD__GT_CHANNELS    32'h00000001
`define XPIPE_QUAD__GT_CHANNELS_SZ 5

`define XPIPE_QUAD__SIM_DEVICE    32'h00000002
`define XPIPE_QUAD__SIM_DEVICE_SZ 144

`define XPIPE_QUAD__XPIPE_CLKDLY_CFG    32'h00000003
`define XPIPE_QUAD__XPIPE_CLKDLY_CFG_SZ 32

`define XPIPE_QUAD__XPIPE_CLK_CFG    32'h00000004
`define XPIPE_QUAD__XPIPE_CLK_CFG_SZ 32

`define XPIPE_QUAD__XPIPE_INSTANTIATED    32'h00000005
`define XPIPE_QUAD__XPIPE_INSTANTIATED_SZ 1

`define XPIPE_QUAD__XPIPE_LINK0_CFG    32'h00000006
`define XPIPE_QUAD__XPIPE_LINK0_CFG_SZ 56

`define XPIPE_QUAD__XPIPE_LINK1_CFG    32'h00000007
`define XPIPE_QUAD__XPIPE_LINK1_CFG_SZ 56

`define XPIPE_QUAD__XPIPE_LOC    32'h00000008
`define XPIPE_QUAD__XPIPE_LOC_SZ 40

`define XPIPE_QUAD__XPIPE_MODE    32'h00000009
`define XPIPE_QUAD__XPIPE_MODE_SZ 2

`define XPIPE_QUAD__XPIPE_REG_CFG    32'h0000000a
`define XPIPE_QUAD__XPIPE_REG_CFG_SZ 16

`define XPIPE_QUAD__XPIPE_RSVD    32'h0000000b
`define XPIPE_QUAD__XPIPE_RSVD_SZ 32

`endif  // B_XPIPE_QUAD_DEFINES_VH