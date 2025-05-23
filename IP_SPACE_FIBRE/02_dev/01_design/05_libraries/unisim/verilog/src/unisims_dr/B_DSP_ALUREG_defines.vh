// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DSP_ALUREG_DEFINES_VH
`else
`define B_DSP_ALUREG_DEFINES_VH

// Look-up table parameters
//

`define DSP_ALUREG_ADDR_N  13
`define DSP_ALUREG_ADDR_SZ 32
`define DSP_ALUREG_DATA_SZ 48

// Attribute addresses
//

`define DSP_ALUREG__ALUMODEREG    32'h00000000
`define DSP_ALUREG__ALUMODEREG_SZ 32

`define DSP_ALUREG__CARRYINREG    32'h00000001
`define DSP_ALUREG__CARRYINREG_SZ 32

`define DSP_ALUREG__CARRYINSELREG    32'h00000002
`define DSP_ALUREG__CARRYINSELREG_SZ 32

`define DSP_ALUREG__DSP_MODE    32'h00000003
`define DSP_ALUREG__DSP_MODE_SZ 48

`define DSP_ALUREG__IS_ALUMODE_INVERTED    32'h00000004
`define DSP_ALUREG__IS_ALUMODE_INVERTED_SZ 4

`define DSP_ALUREG__IS_CARRYIN_INVERTED    32'h00000005
`define DSP_ALUREG__IS_CARRYIN_INVERTED_SZ 1

`define DSP_ALUREG__IS_OPMODE_INVERTED    32'h00000006
`define DSP_ALUREG__IS_OPMODE_INVERTED_SZ 9

`define DSP_ALUREG__IS_RSTALLCARRYIN_INVERTED    32'h00000007
`define DSP_ALUREG__IS_RSTALLCARRYIN_INVERTED_SZ 1

`define DSP_ALUREG__IS_RSTALUMODE_INVERTED    32'h00000008
`define DSP_ALUREG__IS_RSTALUMODE_INVERTED_SZ 1

`define DSP_ALUREG__IS_RSTCTRL_INVERTED    32'h00000009
`define DSP_ALUREG__IS_RSTCTRL_INVERTED_SZ 1

`define DSP_ALUREG__MREG    32'h0000000a
`define DSP_ALUREG__MREG_SZ 32

`define DSP_ALUREG__OPMODEREG    32'h0000000b
`define DSP_ALUREG__OPMODEREG_SZ 32

`define DSP_ALUREG__RESET_MODE    32'h0000000c
`define DSP_ALUREG__RESET_MODE_SZ 40

`endif  // B_DSP_ALUREG_DEFINES_VH