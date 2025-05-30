// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_ODELAYE2_DEFINES_VH
`else
`define B_ODELAYE2_DEFINES_VH

// Look-up table parameters
//

`define ODELAYE2_ADDR_N  11
`define ODELAYE2_ADDR_SZ 32
`define ODELAYE2_DATA_SZ 104

// Attribute addresses
//

`define ODELAYE2__CINVCTRL_SEL    32'h00000000
`define ODELAYE2__CINVCTRL_SEL_SZ 40

`define ODELAYE2__DELAY_SRC    32'h00000001
`define ODELAYE2__DELAY_SRC_SZ 56

`define ODELAYE2__HIGH_PERFORMANCE_MODE    32'h00000002
`define ODELAYE2__HIGH_PERFORMANCE_MODE_SZ 40

`define ODELAYE2__IS_C_INVERTED    32'h00000003
`define ODELAYE2__IS_C_INVERTED_SZ 1

`define ODELAYE2__IS_ODATAIN_INVERTED    32'h00000004
`define ODELAYE2__IS_ODATAIN_INVERTED_SZ 1

`define ODELAYE2__ODELAY_TYPE    32'h00000005
`define ODELAYE2__ODELAY_TYPE_SZ 104

`define ODELAYE2__ODELAY_VALUE    32'h00000006
`define ODELAYE2__ODELAY_VALUE_SZ 32

`define ODELAYE2__PIPE_SEL    32'h00000007
`define ODELAYE2__PIPE_SEL_SZ 40

`define ODELAYE2__REFCLK_FREQUENCY    32'h00000008
`define ODELAYE2__REFCLK_FREQUENCY_SZ 64

`define ODELAYE2__SIGNAL_PATTERN    32'h00000009
`define ODELAYE2__SIGNAL_PATTERN_SZ 40

`define ODELAYE2__SIM_DELAY_D    32'h0000000a
`define ODELAYE2__SIM_DELAY_D_SZ 32

`endif  // B_ODELAYE2_DEFINES_VH