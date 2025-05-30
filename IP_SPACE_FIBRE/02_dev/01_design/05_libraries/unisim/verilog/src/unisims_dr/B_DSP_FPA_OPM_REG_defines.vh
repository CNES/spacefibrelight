// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_DSP_FPA_OPM_REG_DEFINES_VH
`else
`define B_DSP_FPA_OPM_REG_DEFINES_VH

// Look-up table parameters
//

`define DSP_FPA_OPM_REG_ADDR_N  6
`define DSP_FPA_OPM_REG_ADDR_SZ 32
`define DSP_FPA_OPM_REG_DATA_SZ 64

// Attribute addresses
//

`define DSP_FPA_OPM_REG__FPMPIPEREG    32'h00000000
`define DSP_FPA_OPM_REG__FPMPIPEREG_SZ 32

`define DSP_FPA_OPM_REG__FPOPMREG    32'h00000001
`define DSP_FPA_OPM_REG__FPOPMREG_SZ 32

`define DSP_FPA_OPM_REG__IS_FPOPMODE_INVERTED    32'h00000002
`define DSP_FPA_OPM_REG__IS_FPOPMODE_INVERTED_SZ 7

`define DSP_FPA_OPM_REG__IS_RSTFPOPMODE_INVERTED    32'h00000003
`define DSP_FPA_OPM_REG__IS_RSTFPOPMODE_INVERTED_SZ 1

`define DSP_FPA_OPM_REG__RESET_MODE    32'h00000004
`define DSP_FPA_OPM_REG__RESET_MODE_SZ 40

`define DSP_FPA_OPM_REG__USE_MULT    32'h00000005
`define DSP_FPA_OPM_REG__USE_MULT_SZ 64

`endif  // B_DSP_FPA_OPM_REG_DEFINES_VH