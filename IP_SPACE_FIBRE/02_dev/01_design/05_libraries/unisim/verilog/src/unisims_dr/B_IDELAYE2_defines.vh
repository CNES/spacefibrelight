// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IDELAYE2_DEFINES_VH
`else
`define B_IDELAYE2_DEFINES_VH

// Look-up table parameters
//

`define IDELAYE2_ADDR_N  12
`define IDELAYE2_ADDR_SZ 32
`define IDELAYE2_DATA_SZ 104

// Attribute addresses
//

`define IDELAYE2__CINVCTRL_SEL    32'h00000000
`define IDELAYE2__CINVCTRL_SEL_SZ 40

`define IDELAYE2__DELAY_SRC    32'h00000001
`define IDELAYE2__DELAY_SRC_SZ 56

`define IDELAYE2__HIGH_PERFORMANCE_MODE    32'h00000002
`define IDELAYE2__HIGH_PERFORMANCE_MODE_SZ 40

`define IDELAYE2__IDELAY_TYPE    32'h00000003
`define IDELAYE2__IDELAY_TYPE_SZ 104

`define IDELAYE2__IDELAY_VALUE    32'h00000004
`define IDELAYE2__IDELAY_VALUE_SZ 32

`define IDELAYE2__IS_C_INVERTED    32'h00000005
`define IDELAYE2__IS_C_INVERTED_SZ 1

`define IDELAYE2__IS_DATAIN_INVERTED    32'h00000006
`define IDELAYE2__IS_DATAIN_INVERTED_SZ 1

`define IDELAYE2__IS_IDATAIN_INVERTED    32'h00000007
`define IDELAYE2__IS_IDATAIN_INVERTED_SZ 1

`define IDELAYE2__PIPE_SEL    32'h00000008
`define IDELAYE2__PIPE_SEL_SZ 40

`define IDELAYE2__REFCLK_FREQUENCY    32'h00000009
`define IDELAYE2__REFCLK_FREQUENCY_SZ 64

`define IDELAYE2__SIGNAL_PATTERN    32'h0000000a
`define IDELAYE2__SIGNAL_PATTERN_SZ 40

`define IDELAYE2__SIM_DELAY_D    32'h0000000b
`define IDELAYE2__SIM_DELAY_D_SZ 32

`endif  // B_IDELAYE2_DEFINES_VH