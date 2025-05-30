// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_XPIO_ZMATCH_BLK_DEFINES_VH
`else
`define B_XPIO_ZMATCH_BLK_DEFINES_VH

// Look-up table parameters
//

`define XPIO_ZMATCH_BLK_ADDR_N  15
`define XPIO_ZMATCH_BLK_ADDR_SZ 32
`define XPIO_ZMATCH_BLK_DATA_SZ 96

// Attribute addresses
//

`define XPIO_ZMATCH_BLK__CASCADE    32'h00000000
`define XPIO_ZMATCH_BLK__CASCADE_SZ 48

`define XPIO_ZMATCH_BLK__DCIUPDATEMODE    32'h00000001
`define XPIO_ZMATCH_BLK__DCIUPDATEMODE_SZ 80

`define XPIO_ZMATCH_BLK__DCI_CASCADE_SEL    32'h00000002
`define XPIO_ZMATCH_BLK__DCI_CASCADE_SEL_SZ 2

`define XPIO_ZMATCH_BLK__DCI_CONFIG    32'h00000003
`define XPIO_ZMATCH_BLK__DCI_CONFIG_SZ 48

`define XPIO_ZMATCH_BLK__DCI_CSSD_CTRL    32'h00000004
`define XPIO_ZMATCH_BLK__DCI_CSSD_CTRL_SZ 36

`define XPIO_ZMATCH_BLK__DCI_DEBUG_SEL    32'h00000005
`define XPIO_ZMATCH_BLK__DCI_DEBUG_SEL_SZ 16

`define XPIO_ZMATCH_BLK__DCI_DEBUG_SEL_ADV    32'h00000006
`define XPIO_ZMATCH_BLK__DCI_DEBUG_SEL_ADV_SZ 25

`define XPIO_ZMATCH_BLK__DCI_FLTR_CTRL    32'h00000007
`define XPIO_ZMATCH_BLK__DCI_FLTR_CTRL_SZ 4

`define XPIO_ZMATCH_BLK__DCI_REF_OPT    32'h00000008
`define XPIO_ZMATCH_BLK__DCI_REF_OPT_SZ 9

`define XPIO_ZMATCH_BLK__DCI_SCL_CTRL    32'h00000009
`define XPIO_ZMATCH_BLK__DCI_SCL_CTRL_SZ 96

`define XPIO_ZMATCH_BLK__EN_DCI    32'h0000000a
`define XPIO_ZMATCH_BLK__EN_DCI_SZ 40

`define XPIO_ZMATCH_BLK__EN_OUT_FLTR    32'h0000000b
`define XPIO_ZMATCH_BLK__EN_OUT_FLTR_SZ 40

`define XPIO_ZMATCH_BLK__TST_EN    32'h0000000c
`define XPIO_ZMATCH_BLK__TST_EN_SZ 40

`define XPIO_ZMATCH_BLK__UPDATE_CONTROL    32'h0000000d
`define XPIO_ZMATCH_BLK__UPDATE_CONTROL_SZ 2

`define XPIO_ZMATCH_BLK__WAIT_BYPASS    32'h0000000e
`define XPIO_ZMATCH_BLK__WAIT_BYPASS_SZ 40

`endif  // B_XPIO_ZMATCH_BLK_DEFINES_VH