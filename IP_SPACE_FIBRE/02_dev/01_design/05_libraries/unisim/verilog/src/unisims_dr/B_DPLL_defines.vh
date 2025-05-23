// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DPLL_DEFINES_VH
`else
`define B_DPLL_DEFINES_VH

// Look-up table parameters
//

`define DPLL_ADDR_N  39
`define DPLL_ADDR_SZ 32
`define DPLL_DATA_SZ 64

// Attribute addresses
//

`define DPLL__CLKFBOUT_FRACT    32'h00000000
`define DPLL__CLKFBOUT_FRACT_SZ 32

`define DPLL__CLKFBOUT_MULT    32'h00000001
`define DPLL__CLKFBOUT_MULT_SZ 32

`define DPLL__CLKIN_FREQ_MAX    32'h00000002
`define DPLL__CLKIN_FREQ_MAX_SZ 64

`define DPLL__CLKIN_FREQ_MIN    32'h00000003
`define DPLL__CLKIN_FREQ_MIN_SZ 64

`define DPLL__CLKIN_PERIOD    32'h00000004
`define DPLL__CLKIN_PERIOD_SZ 64

`define DPLL__CLKOUT0_DIVIDE    32'h00000005
`define DPLL__CLKOUT0_DIVIDE_SZ 32

`define DPLL__CLKOUT0_PHASE    32'h00000006
`define DPLL__CLKOUT0_PHASE_SZ 64

`define DPLL__CLKOUT0_PHASE_CTRL    32'h00000007
`define DPLL__CLKOUT0_PHASE_CTRL_SZ 2

`define DPLL__CLKOUT1_DIVIDE    32'h00000008
`define DPLL__CLKOUT1_DIVIDE_SZ 32

`define DPLL__CLKOUT1_PHASE    32'h00000009
`define DPLL__CLKOUT1_PHASE_SZ 64

`define DPLL__CLKOUT1_PHASE_CTRL    32'h0000000a
`define DPLL__CLKOUT1_PHASE_CTRL_SZ 2

`define DPLL__CLKOUT2_DIVIDE    32'h0000000b
`define DPLL__CLKOUT2_DIVIDE_SZ 32

`define DPLL__CLKOUT2_PHASE    32'h0000000c
`define DPLL__CLKOUT2_PHASE_SZ 64

`define DPLL__CLKOUT2_PHASE_CTRL    32'h0000000d
`define DPLL__CLKOUT2_PHASE_CTRL_SZ 2

`define DPLL__CLKOUT3_DIVIDE    32'h0000000e
`define DPLL__CLKOUT3_DIVIDE_SZ 32

`define DPLL__CLKOUT3_PHASE    32'h0000000f
`define DPLL__CLKOUT3_PHASE_SZ 64

`define DPLL__CLKOUT3_PHASE_CTRL    32'h00000010
`define DPLL__CLKOUT3_PHASE_CTRL_SZ 2

`define DPLL__CLKTDC_FREQ_MAX    32'h00000011
`define DPLL__CLKTDC_FREQ_MAX_SZ 64

`define DPLL__CLKTDC_FREQ_MIN    32'h00000012
`define DPLL__CLKTDC_FREQ_MIN_SZ 64

`define DPLL__DESKEW_DELAY    32'h00000013
`define DPLL__DESKEW_DELAY_SZ 32

`define DPLL__DESKEW_DELAY_EN    32'h00000014
`define DPLL__DESKEW_DELAY_EN_SZ 40

`define DPLL__DESKEW_DELAY_PATH    32'h00000015
`define DPLL__DESKEW_DELAY_PATH_SZ 40

`define DPLL__DIVCLK_DIVIDE    32'h00000016
`define DPLL__DIVCLK_DIVIDE_SZ 32

`define DPLL__IS_CLKFB_DESKEW_INVERTED    32'h00000017
`define DPLL__IS_CLKFB_DESKEW_INVERTED_SZ 1

`define DPLL__IS_CLKIN_DESKEW_INVERTED    32'h00000018
`define DPLL__IS_CLKIN_DESKEW_INVERTED_SZ 1

`define DPLL__IS_CLKIN_INVERTED    32'h00000019
`define DPLL__IS_CLKIN_INVERTED_SZ 1

`define DPLL__IS_PSEN_INVERTED    32'h0000001a
`define DPLL__IS_PSEN_INVERTED_SZ 1

`define DPLL__IS_PSINCDEC_INVERTED    32'h0000001b
`define DPLL__IS_PSINCDEC_INVERTED_SZ 1

`define DPLL__IS_PWRDWN_INVERTED    32'h0000001c
`define DPLL__IS_PWRDWN_INVERTED_SZ 1

`define DPLL__IS_RST_INVERTED    32'h0000001d
`define DPLL__IS_RST_INVERTED_SZ 1

`define DPLL__LOCK_WAIT    32'h0000001e
`define DPLL__LOCK_WAIT_SZ 40

`define DPLL__PERF_MODE    32'h0000001f
`define DPLL__PERF_MODE_SZ 56

`define DPLL__REF_JITTER    32'h00000020
`define DPLL__REF_JITTER_SZ 64

`define DPLL__SEL_LOCKED_IN    32'h00000021
`define DPLL__SEL_LOCKED_IN_SZ 1

`define DPLL__SEL_REG_DELAY    32'h00000022
`define DPLL__SEL_REG_DELAY_SZ 2

`define DPLL__USE_REG_VALID    32'h00000023
`define DPLL__USE_REG_VALID_SZ 1

`define DPLL__VCOCLK_FREQ_MAX    32'h00000024
`define DPLL__VCOCLK_FREQ_MAX_SZ 64

`define DPLL__VCOCLK_FREQ_MIN    32'h00000025
`define DPLL__VCOCLK_FREQ_MIN_SZ 64

`define DPLL__ZHOLD    32'h00000026
`define DPLL__ZHOLD_SZ 40

`endif  // B_DPLL_DEFINES_VH