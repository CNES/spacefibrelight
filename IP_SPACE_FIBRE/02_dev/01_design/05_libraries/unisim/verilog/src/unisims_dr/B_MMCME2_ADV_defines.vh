// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_MMCME2_ADV_DEFINES_VH
`else
`define B_MMCME2_ADV_DEFINES_VH

// Look-up table parameters
//

`define MMCME2_ADV_ADDR_N  54
`define MMCME2_ADV_ADDR_SZ 32
`define MMCME2_ADV_DATA_SZ 88

// Attribute addresses
//

`define MMCME2_ADV__BANDWIDTH    32'h0000
`define MMCME2_ADV__BANDWIDTH_SZ 72

`define MMCME2_ADV__CLKFBOUT_MULT_F    32'h0001
`define MMCME2_ADV__CLKFBOUT_MULT_F_SZ 64

`define MMCME2_ADV__CLKFBOUT_PHASE    32'h0002
`define MMCME2_ADV__CLKFBOUT_PHASE_SZ 64

`define MMCME2_ADV__CLKFBOUT_USE_FINE_PS    32'h0003
`define MMCME2_ADV__CLKFBOUT_USE_FINE_PS_SZ 40

`define MMCME2_ADV__CLKIN1_PERIOD    32'h0004
`define MMCME2_ADV__CLKIN1_PERIOD_SZ 64

`define MMCME2_ADV__CLKIN2_PERIOD    32'h0005
`define MMCME2_ADV__CLKIN2_PERIOD_SZ 64

`define MMCME2_ADV__CLKIN_FREQ_MAX    32'h0006
`define MMCME2_ADV__CLKIN_FREQ_MAX_SZ 64

`define MMCME2_ADV__CLKIN_FREQ_MIN    32'h0007
`define MMCME2_ADV__CLKIN_FREQ_MIN_SZ 64

`define MMCME2_ADV__CLKOUT0_DIVIDE_F    32'h0008
`define MMCME2_ADV__CLKOUT0_DIVIDE_F_SZ 64

`define MMCME2_ADV__CLKOUT0_DUTY_CYCLE    32'h0009
`define MMCME2_ADV__CLKOUT0_DUTY_CYCLE_SZ 64

`define MMCME2_ADV__CLKOUT0_PHASE    32'h000a
`define MMCME2_ADV__CLKOUT0_PHASE_SZ 64

`define MMCME2_ADV__CLKOUT0_USE_FINE_PS    32'h000b
`define MMCME2_ADV__CLKOUT0_USE_FINE_PS_SZ 40

`define MMCME2_ADV__CLKOUT1_DIVIDE    32'h000c
`define MMCME2_ADV__CLKOUT1_DIVIDE_SZ 32

`define MMCME2_ADV__CLKOUT1_DUTY_CYCLE    32'h000d
`define MMCME2_ADV__CLKOUT1_DUTY_CYCLE_SZ 64

`define MMCME2_ADV__CLKOUT1_PHASE    32'h000e
`define MMCME2_ADV__CLKOUT1_PHASE_SZ 64

`define MMCME2_ADV__CLKOUT1_USE_FINE_PS    32'h000f
`define MMCME2_ADV__CLKOUT1_USE_FINE_PS_SZ 40

`define MMCME2_ADV__CLKOUT2_DIVIDE    32'h0010
`define MMCME2_ADV__CLKOUT2_DIVIDE_SZ 32

`define MMCME2_ADV__CLKOUT2_DUTY_CYCLE    32'h0011
`define MMCME2_ADV__CLKOUT2_DUTY_CYCLE_SZ 64

`define MMCME2_ADV__CLKOUT2_PHASE    32'h0012
`define MMCME2_ADV__CLKOUT2_PHASE_SZ 64

`define MMCME2_ADV__CLKOUT2_USE_FINE_PS    32'h0013
`define MMCME2_ADV__CLKOUT2_USE_FINE_PS_SZ 40

`define MMCME2_ADV__CLKOUT3_DIVIDE    32'h0014
`define MMCME2_ADV__CLKOUT3_DIVIDE_SZ 32

`define MMCME2_ADV__CLKOUT3_DUTY_CYCLE    32'h0015
`define MMCME2_ADV__CLKOUT3_DUTY_CYCLE_SZ 64

`define MMCME2_ADV__CLKOUT3_PHASE    32'h0016
`define MMCME2_ADV__CLKOUT3_PHASE_SZ 64

`define MMCME2_ADV__CLKOUT3_USE_FINE_PS    32'h0017
`define MMCME2_ADV__CLKOUT3_USE_FINE_PS_SZ 40

`define MMCME2_ADV__CLKOUT4_CASCADE    32'h0018
`define MMCME2_ADV__CLKOUT4_CASCADE_SZ 40

`define MMCME2_ADV__CLKOUT4_DIVIDE    32'h0019
`define MMCME2_ADV__CLKOUT4_DIVIDE_SZ 32

`define MMCME2_ADV__CLKOUT4_DUTY_CYCLE    32'h001a
`define MMCME2_ADV__CLKOUT4_DUTY_CYCLE_SZ 64

`define MMCME2_ADV__CLKOUT4_PHASE    32'h001b
`define MMCME2_ADV__CLKOUT4_PHASE_SZ 64

`define MMCME2_ADV__CLKOUT4_USE_FINE_PS    32'h001c
`define MMCME2_ADV__CLKOUT4_USE_FINE_PS_SZ 40

`define MMCME2_ADV__CLKOUT5_DIVIDE    32'h001d
`define MMCME2_ADV__CLKOUT5_DIVIDE_SZ 32

`define MMCME2_ADV__CLKOUT5_DUTY_CYCLE    32'h001e
`define MMCME2_ADV__CLKOUT5_DUTY_CYCLE_SZ 64

`define MMCME2_ADV__CLKOUT5_PHASE    32'h001f
`define MMCME2_ADV__CLKOUT5_PHASE_SZ 64

`define MMCME2_ADV__CLKOUT5_USE_FINE_PS    32'h0020
`define MMCME2_ADV__CLKOUT5_USE_FINE_PS_SZ 40

`define MMCME2_ADV__CLKOUT6_DIVIDE    32'h0021
`define MMCME2_ADV__CLKOUT6_DIVIDE_SZ 32

`define MMCME2_ADV__CLKOUT6_DUTY_CYCLE    32'h0022
`define MMCME2_ADV__CLKOUT6_DUTY_CYCLE_SZ 64

`define MMCME2_ADV__CLKOUT6_PHASE    32'h0023
`define MMCME2_ADV__CLKOUT6_PHASE_SZ 64

`define MMCME2_ADV__CLKOUT6_USE_FINE_PS    32'h0024
`define MMCME2_ADV__CLKOUT6_USE_FINE_PS_SZ 40

`define MMCME2_ADV__CLKPFD_FREQ_MAX    32'h0025
`define MMCME2_ADV__CLKPFD_FREQ_MAX_SZ 64

`define MMCME2_ADV__CLKPFD_FREQ_MIN    32'h0026
`define MMCME2_ADV__CLKPFD_FREQ_MIN_SZ 64

`define MMCME2_ADV__COMPENSATION    32'h0027
`define MMCME2_ADV__COMPENSATION_SZ 64

`define MMCME2_ADV__DIVCLK_DIVIDE    32'h0028
`define MMCME2_ADV__DIVCLK_DIVIDE_SZ 32

`define MMCME2_ADV__IS_CLKINSEL_INVERTED    32'h0029
`define MMCME2_ADV__IS_CLKINSEL_INVERTED_SZ 1

`define MMCME2_ADV__IS_PSEN_INVERTED    32'h002a
`define MMCME2_ADV__IS_PSEN_INVERTED_SZ 1

`define MMCME2_ADV__IS_PSINCDEC_INVERTED    32'h002b
`define MMCME2_ADV__IS_PSINCDEC_INVERTED_SZ 1

`define MMCME2_ADV__IS_PWRDWN_INVERTED    32'h002c
`define MMCME2_ADV__IS_PWRDWN_INVERTED_SZ 1

`define MMCME2_ADV__IS_RST_INVERTED    32'h002d
`define MMCME2_ADV__IS_RST_INVERTED_SZ 1

`define MMCME2_ADV__REF_JITTER1    32'h002e
`define MMCME2_ADV__REF_JITTER1_SZ 64

`define MMCME2_ADV__REF_JITTER2    32'h002f
`define MMCME2_ADV__REF_JITTER2_SZ 64

`define MMCME2_ADV__SS_EN    32'h0030
`define MMCME2_ADV__SS_EN_SZ 40

`define MMCME2_ADV__SS_MODE    32'h0031
`define MMCME2_ADV__SS_MODE_SZ 88

`define MMCME2_ADV__SS_MOD_PERIOD    32'h0032
`define MMCME2_ADV__SS_MOD_PERIOD_SZ 32

`define MMCME2_ADV__STARTUP_WAIT    32'h0033
`define MMCME2_ADV__STARTUP_WAIT_SZ 40

`define MMCME2_ADV__VCOCLK_FREQ_MAX    32'h0034
`define MMCME2_ADV__VCOCLK_FREQ_MAX_SZ 64

`define MMCME2_ADV__VCOCLK_FREQ_MIN    32'h0035
`define MMCME2_ADV__VCOCLK_FREQ_MIN_SZ 64

`endif  // B_MMCME2_ADV_DEFINES_VH