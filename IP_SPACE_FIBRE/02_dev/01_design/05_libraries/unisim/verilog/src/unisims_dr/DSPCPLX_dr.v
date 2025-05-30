`include "B_DSPCPLX_defines.vh"
`include "B_DSP_A_B_DATA58_defines.vh"
`include "B_DSP_ALUADD_defines.vh"
`include "B_DSP_ALUMUX_defines.vh"
`include "B_DSP_ALUREG_defines.vh"
`include "B_DSP_C_DATA58_defines.vh"
`include "B_DSP_M_DATA58_defines.vh"
`include "B_DSP_MULTIPLIER58_defines.vh"
`include "B_DSP_OUTPUT58_defines.vh"
`include "B_DSP_PATDET_defines.vh"
`include "B_DSP_PREADD_DATA58_defines.vh"
`include "B_DSP_PREADD58_defines.vh"
`include "B_DSP_SRCMX_OPTINV_defines.vh"

reg [`DSPCPLX_DATA_SZ-1:0] ATTR [0:`DSPCPLX_ADDR_N-1];
reg [`DSPCPLX__ACASCREG_IM_SZ-1:0] ACASCREG_IM_REG = ACASCREG_IM;
reg [`DSPCPLX__ACASCREG_RE_SZ-1:0] ACASCREG_RE_REG = ACASCREG_RE;
reg [`DSPCPLX__ADREG_SZ-1:0] ADREG_REG = ADREG;
reg [`DSPCPLX__ALUMODEREG_IM_SZ-1:0] ALUMODEREG_IM_REG = ALUMODEREG_IM;
reg [`DSPCPLX__ALUMODEREG_RE_SZ-1:0] ALUMODEREG_RE_REG = ALUMODEREG_RE;
reg [`DSPCPLX__AREG_IM_SZ-1:0] AREG_IM_REG = AREG_IM;
reg [`DSPCPLX__AREG_RE_SZ-1:0] AREG_RE_REG = AREG_RE;
reg [`DSPCPLX__AUTORESET_PATDET_IM_SZ:1] AUTORESET_PATDET_IM_REG = AUTORESET_PATDET_IM;
reg [`DSPCPLX__AUTORESET_PATDET_RE_SZ:1] AUTORESET_PATDET_RE_REG = AUTORESET_PATDET_RE;
reg [`DSPCPLX__AUTORESET_PRIORITY_IM_SZ:1] AUTORESET_PRIORITY_IM_REG = AUTORESET_PRIORITY_IM;
reg [`DSPCPLX__AUTORESET_PRIORITY_RE_SZ:1] AUTORESET_PRIORITY_RE_REG = AUTORESET_PRIORITY_RE;
reg [`DSPCPLX__A_INPUT_IM_SZ:1] A_INPUT_IM_REG = A_INPUT_IM;
reg [`DSPCPLX__A_INPUT_RE_SZ:1] A_INPUT_RE_REG = A_INPUT_RE;
reg [`DSPCPLX__BCASCREG_IM_SZ-1:0] BCASCREG_IM_REG = BCASCREG_IM;
reg [`DSPCPLX__BCASCREG_RE_SZ-1:0] BCASCREG_RE_REG = BCASCREG_RE;
reg [`DSPCPLX__BREG_IM_SZ-1:0] BREG_IM_REG = BREG_IM;
reg [`DSPCPLX__BREG_RE_SZ-1:0] BREG_RE_REG = BREG_RE;
reg [`DSPCPLX__B_INPUT_IM_SZ:1] B_INPUT_IM_REG = B_INPUT_IM;
reg [`DSPCPLX__B_INPUT_RE_SZ:1] B_INPUT_RE_REG = B_INPUT_RE;
reg [`DSPCPLX__CARRYINREG_IM_SZ-1:0] CARRYINREG_IM_REG = CARRYINREG_IM;
reg [`DSPCPLX__CARRYINREG_RE_SZ-1:0] CARRYINREG_RE_REG = CARRYINREG_RE;
reg [`DSPCPLX__CARRYINSELREG_IM_SZ-1:0] CARRYINSELREG_IM_REG = CARRYINSELREG_IM;
reg [`DSPCPLX__CARRYINSELREG_RE_SZ-1:0] CARRYINSELREG_RE_REG = CARRYINSELREG_RE;
reg [`DSPCPLX__CONJUGATEREG_A_SZ-1:0] CONJUGATEREG_A_REG = CONJUGATEREG_A;
reg [`DSPCPLX__CONJUGATEREG_B_SZ-1:0] CONJUGATEREG_B_REG = CONJUGATEREG_B;
reg [`DSPCPLX__CREG_IM_SZ-1:0] CREG_IM_REG = CREG_IM;
reg [`DSPCPLX__CREG_RE_SZ-1:0] CREG_RE_REG = CREG_RE;
reg [`DSPCPLX__IS_ALUMODE_IM_INVERTED_SZ-1:0] IS_ALUMODE_IM_INVERTED_REG = IS_ALUMODE_IM_INVERTED;
reg [`DSPCPLX__IS_ALUMODE_RE_INVERTED_SZ-1:0] IS_ALUMODE_RE_INVERTED_REG = IS_ALUMODE_RE_INVERTED;
reg IS_ASYNC_RST_INVERTED_REG = IS_ASYNC_RST_INVERTED;
reg IS_CARRYIN_IM_INVERTED_REG = IS_CARRYIN_IM_INVERTED;
reg IS_CARRYIN_RE_INVERTED_REG = IS_CARRYIN_RE_INVERTED;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
reg IS_CONJUGATE_A_INVERTED_REG = IS_CONJUGATE_A_INVERTED;
reg IS_CONJUGATE_B_INVERTED_REG = IS_CONJUGATE_B_INVERTED;
reg [`DSPCPLX__IS_OPMODE_IM_INVERTED_SZ-1:0] IS_OPMODE_IM_INVERTED_REG = IS_OPMODE_IM_INVERTED;
reg [`DSPCPLX__IS_OPMODE_RE_INVERTED_SZ-1:0] IS_OPMODE_RE_INVERTED_REG = IS_OPMODE_RE_INVERTED;
reg IS_RSTAD_INVERTED_REG = IS_RSTAD_INVERTED;
reg IS_RSTALLCARRYIN_IM_INVERTED_REG = IS_RSTALLCARRYIN_IM_INVERTED;
reg IS_RSTALLCARRYIN_RE_INVERTED_REG = IS_RSTALLCARRYIN_RE_INVERTED;
reg IS_RSTALUMODE_IM_INVERTED_REG = IS_RSTALUMODE_IM_INVERTED;
reg IS_RSTALUMODE_RE_INVERTED_REG = IS_RSTALUMODE_RE_INVERTED;
reg IS_RSTA_IM_INVERTED_REG = IS_RSTA_IM_INVERTED;
reg IS_RSTA_RE_INVERTED_REG = IS_RSTA_RE_INVERTED;
reg IS_RSTB_IM_INVERTED_REG = IS_RSTB_IM_INVERTED;
reg IS_RSTB_RE_INVERTED_REG = IS_RSTB_RE_INVERTED;
reg IS_RSTCONJUGATE_A_INVERTED_REG = IS_RSTCONJUGATE_A_INVERTED;
reg IS_RSTCONJUGATE_B_INVERTED_REG = IS_RSTCONJUGATE_B_INVERTED;
reg IS_RSTCTRL_IM_INVERTED_REG = IS_RSTCTRL_IM_INVERTED;
reg IS_RSTCTRL_RE_INVERTED_REG = IS_RSTCTRL_RE_INVERTED;
reg IS_RSTC_IM_INVERTED_REG = IS_RSTC_IM_INVERTED;
reg IS_RSTC_RE_INVERTED_REG = IS_RSTC_RE_INVERTED;
reg IS_RSTM_IM_INVERTED_REG = IS_RSTM_IM_INVERTED;
reg IS_RSTM_RE_INVERTED_REG = IS_RSTM_RE_INVERTED;
reg IS_RSTP_IM_INVERTED_REG = IS_RSTP_IM_INVERTED;
reg IS_RSTP_RE_INVERTED_REG = IS_RSTP_RE_INVERTED;
reg [`DSPCPLX__MASK_IM_SZ-1:0] MASK_IM_REG = MASK_IM;
reg [`DSPCPLX__MASK_RE_SZ-1:0] MASK_RE_REG = MASK_RE;
reg [`DSPCPLX__MREG_IM_SZ-1:0] MREG_IM_REG = MREG_IM;
reg [`DSPCPLX__MREG_RE_SZ-1:0] MREG_RE_REG = MREG_RE;
reg [`DSPCPLX__OPMODEREG_IM_SZ-1:0] OPMODEREG_IM_REG = OPMODEREG_IM;
reg [`DSPCPLX__OPMODEREG_RE_SZ-1:0] OPMODEREG_RE_REG = OPMODEREG_RE;
reg [`DSPCPLX__PATTERN_IM_SZ-1:0] PATTERN_IM_REG = PATTERN_IM;
reg [`DSPCPLX__PATTERN_RE_SZ-1:0] PATTERN_RE_REG = PATTERN_RE;
reg [`DSPCPLX__PREG_IM_SZ-1:0] PREG_IM_REG = PREG_IM;
reg [`DSPCPLX__PREG_RE_SZ-1:0] PREG_RE_REG = PREG_RE;
reg [`DSPCPLX__RESET_MODE_SZ:1] RESET_MODE_REG = RESET_MODE;
reg [`DSPCPLX__RND_IM_SZ-1:0] RND_IM_REG = RND_IM;
reg [`DSPCPLX__RND_RE_SZ-1:0] RND_RE_REG = RND_RE;
reg [`DSPCPLX__SEL_MASK_IM_SZ:1] SEL_MASK_IM_REG = SEL_MASK_IM;
reg [`DSPCPLX__SEL_MASK_RE_SZ:1] SEL_MASK_RE_REG = SEL_MASK_RE;
reg [`DSPCPLX__SEL_PATTERN_IM_SZ:1] SEL_PATTERN_IM_REG = SEL_PATTERN_IM;
reg [`DSPCPLX__SEL_PATTERN_RE_SZ:1] SEL_PATTERN_RE_REG = SEL_PATTERN_RE;
reg [`DSPCPLX__USE_PATTERN_DETECT_IM_SZ:1] USE_PATTERN_DETECT_IM_REG = USE_PATTERN_DETECT_IM;
reg [`DSPCPLX__USE_PATTERN_DETECT_RE_SZ:1] USE_PATTERN_DETECT_RE_REG = USE_PATTERN_DETECT_RE;

initial begin
  ATTR[`DSPCPLX__ACASCREG_IM] = ACASCREG_IM;
  ATTR[`DSPCPLX__ACASCREG_RE] = ACASCREG_RE;
  ATTR[`DSPCPLX__ADREG] = ADREG;
  ATTR[`DSPCPLX__ALUMODEREG_IM] = ALUMODEREG_IM;
  ATTR[`DSPCPLX__ALUMODEREG_RE] = ALUMODEREG_RE;
  ATTR[`DSPCPLX__AREG_IM] = AREG_IM;
  ATTR[`DSPCPLX__AREG_RE] = AREG_RE;
  ATTR[`DSPCPLX__AUTORESET_PATDET_IM] = AUTORESET_PATDET_IM;
  ATTR[`DSPCPLX__AUTORESET_PATDET_RE] = AUTORESET_PATDET_RE;
  ATTR[`DSPCPLX__AUTORESET_PRIORITY_IM] = AUTORESET_PRIORITY_IM;
  ATTR[`DSPCPLX__AUTORESET_PRIORITY_RE] = AUTORESET_PRIORITY_RE;
  ATTR[`DSPCPLX__A_INPUT_IM] = A_INPUT_IM;
  ATTR[`DSPCPLX__A_INPUT_RE] = A_INPUT_RE;
  ATTR[`DSPCPLX__BCASCREG_IM] = BCASCREG_IM;
  ATTR[`DSPCPLX__BCASCREG_RE] = BCASCREG_RE;
  ATTR[`DSPCPLX__BREG_IM] = BREG_IM;
  ATTR[`DSPCPLX__BREG_RE] = BREG_RE;
  ATTR[`DSPCPLX__B_INPUT_IM] = B_INPUT_IM;
  ATTR[`DSPCPLX__B_INPUT_RE] = B_INPUT_RE;
  ATTR[`DSPCPLX__CARRYINREG_IM] = CARRYINREG_IM;
  ATTR[`DSPCPLX__CARRYINREG_RE] = CARRYINREG_RE;
  ATTR[`DSPCPLX__CARRYINSELREG_IM] = CARRYINSELREG_IM;
  ATTR[`DSPCPLX__CARRYINSELREG_RE] = CARRYINSELREG_RE;
  ATTR[`DSPCPLX__CONJUGATEREG_A] = CONJUGATEREG_A;
  ATTR[`DSPCPLX__CONJUGATEREG_B] = CONJUGATEREG_B;
  ATTR[`DSPCPLX__CREG_IM] = CREG_IM;
  ATTR[`DSPCPLX__CREG_RE] = CREG_RE;
  ATTR[`DSPCPLX__IS_ALUMODE_IM_INVERTED] = IS_ALUMODE_IM_INVERTED;
  ATTR[`DSPCPLX__IS_ALUMODE_RE_INVERTED] = IS_ALUMODE_RE_INVERTED;
  ATTR[`DSPCPLX__IS_ASYNC_RST_INVERTED] = IS_ASYNC_RST_INVERTED;
  ATTR[`DSPCPLX__IS_CARRYIN_IM_INVERTED] = IS_CARRYIN_IM_INVERTED;
  ATTR[`DSPCPLX__IS_CARRYIN_RE_INVERTED] = IS_CARRYIN_RE_INVERTED;
  ATTR[`DSPCPLX__IS_CLK_INVERTED] = IS_CLK_INVERTED;
  ATTR[`DSPCPLX__IS_CONJUGATE_A_INVERTED] = IS_CONJUGATE_A_INVERTED;
  ATTR[`DSPCPLX__IS_CONJUGATE_B_INVERTED] = IS_CONJUGATE_B_INVERTED;
  ATTR[`DSPCPLX__IS_OPMODE_IM_INVERTED] = IS_OPMODE_IM_INVERTED;
  ATTR[`DSPCPLX__IS_OPMODE_RE_INVERTED] = IS_OPMODE_RE_INVERTED;
  ATTR[`DSPCPLX__IS_RSTAD_INVERTED] = IS_RSTAD_INVERTED;
  ATTR[`DSPCPLX__IS_RSTALLCARRYIN_IM_INVERTED] = IS_RSTALLCARRYIN_IM_INVERTED;
  ATTR[`DSPCPLX__IS_RSTALLCARRYIN_RE_INVERTED] = IS_RSTALLCARRYIN_RE_INVERTED;
  ATTR[`DSPCPLX__IS_RSTALUMODE_IM_INVERTED] = IS_RSTALUMODE_IM_INVERTED;
  ATTR[`DSPCPLX__IS_RSTALUMODE_RE_INVERTED] = IS_RSTALUMODE_RE_INVERTED;
  ATTR[`DSPCPLX__IS_RSTA_IM_INVERTED] = IS_RSTA_IM_INVERTED;
  ATTR[`DSPCPLX__IS_RSTA_RE_INVERTED] = IS_RSTA_RE_INVERTED;
  ATTR[`DSPCPLX__IS_RSTB_IM_INVERTED] = IS_RSTB_IM_INVERTED;
  ATTR[`DSPCPLX__IS_RSTB_RE_INVERTED] = IS_RSTB_RE_INVERTED;
  ATTR[`DSPCPLX__IS_RSTCONJUGATE_A_INVERTED] = IS_RSTCONJUGATE_A_INVERTED;
  ATTR[`DSPCPLX__IS_RSTCONJUGATE_B_INVERTED] = IS_RSTCONJUGATE_B_INVERTED;
  ATTR[`DSPCPLX__IS_RSTCTRL_IM_INVERTED] = IS_RSTCTRL_IM_INVERTED;
  ATTR[`DSPCPLX__IS_RSTCTRL_RE_INVERTED] = IS_RSTCTRL_RE_INVERTED;
  ATTR[`DSPCPLX__IS_RSTC_IM_INVERTED] = IS_RSTC_IM_INVERTED;
  ATTR[`DSPCPLX__IS_RSTC_RE_INVERTED] = IS_RSTC_RE_INVERTED;
  ATTR[`DSPCPLX__IS_RSTM_IM_INVERTED] = IS_RSTM_IM_INVERTED;
  ATTR[`DSPCPLX__IS_RSTM_RE_INVERTED] = IS_RSTM_RE_INVERTED;
  ATTR[`DSPCPLX__IS_RSTP_IM_INVERTED] = IS_RSTP_IM_INVERTED;
  ATTR[`DSPCPLX__IS_RSTP_RE_INVERTED] = IS_RSTP_RE_INVERTED;
  ATTR[`DSPCPLX__MASK_IM] = MASK_IM;
  ATTR[`DSPCPLX__MASK_RE] = MASK_RE;
  ATTR[`DSPCPLX__MREG_IM] = MREG_IM;
  ATTR[`DSPCPLX__MREG_RE] = MREG_RE;
  ATTR[`DSPCPLX__OPMODEREG_IM] = OPMODEREG_IM;
  ATTR[`DSPCPLX__OPMODEREG_RE] = OPMODEREG_RE;
  ATTR[`DSPCPLX__PATTERN_IM] = PATTERN_IM;
  ATTR[`DSPCPLX__PATTERN_RE] = PATTERN_RE;
  ATTR[`DSPCPLX__PREG_IM] = PREG_IM;
  ATTR[`DSPCPLX__PREG_RE] = PREG_RE;
  ATTR[`DSPCPLX__RESET_MODE] = RESET_MODE;
  ATTR[`DSPCPLX__RND_IM] = RND_IM;
  ATTR[`DSPCPLX__RND_RE] = RND_RE;
  ATTR[`DSPCPLX__SEL_MASK_IM] = SEL_MASK_IM;
  ATTR[`DSPCPLX__SEL_MASK_RE] = SEL_MASK_RE;
  ATTR[`DSPCPLX__SEL_PATTERN_IM] = SEL_PATTERN_IM;
  ATTR[`DSPCPLX__SEL_PATTERN_RE] = SEL_PATTERN_RE;
  ATTR[`DSPCPLX__USE_PATTERN_DETECT_IM] = USE_PATTERN_DETECT_IM;
  ATTR[`DSPCPLX__USE_PATTERN_DETECT_RE] = USE_PATTERN_DETECT_RE;
end

always @(trig_attr) begin
  ACASCREG_IM_REG = ATTR[`DSPCPLX__ACASCREG_IM];
  DSP_A_B_DATA58_RE_INST.ATTR[`DSP_A_B_DATA58__ACASCREG]= ATTR[`DSPCPLX__ACASCREG_IM];
  ACASCREG_RE_REG = ATTR[`DSPCPLX__ACASCREG_RE];
  DSP_A_B_DATA58_IM_INST.ATTR[`DSP_A_B_DATA58__ACASCREG] = ATTR[`DSPCPLX__ACASCREG_RE];
  ADREG_REG = ATTR[`DSPCPLX__ADREG];
  DSP_PREADD_DATA58_IM_INST.ATTR[`DSP_PREADD_DATA58__ADREG] = ATTR[`DSPCPLX__ADREG];
  DSP_PREADD_DATA58_RE_INST.ATTR[`DSP_PREADD_DATA58__ADREG] = ATTR[`DSPCPLX__ADREG];
  ALUMODEREG_IM_REG = ATTR[`DSPCPLX__ALUMODEREG_IM];
  DSP_ALUREG_IM_INST.ATTR[`DSP_ALUREG__ALUMODEREG] = ATTR[`DSPCPLX__ALUMODEREG_IM];
  ALUMODEREG_RE_REG = ATTR[`DSPCPLX__ALUMODEREG_RE];
  DSP_ALUREG_RE_INST.ATTR[`DSP_ALUREG__ALUMODEREG] = ATTR[`DSPCPLX__ALUMODEREG_RE];
  AREG_IM_REG = ATTR[`DSPCPLX__AREG_IM];
  DSP_A_B_DATA58_RE_INST.ATTR[`DSP_A_B_DATA58__AREG] = ATTR[`DSPCPLX__AREG_IM];
  DSP_PREADD_DATA58_RE_INST.ATTR[`DSP_PREADD_DATA58__AREG] = ATTR[`DSPCPLX__AREG_IM];
  AREG_RE_REG = ATTR[`DSPCPLX__AREG_RE];
  DSP_A_B_DATA58_IM_INST.ATTR[`DSP_A_B_DATA58__AREG] = ATTR[`DSPCPLX__AREG_RE];
  DSP_PREADD_DATA58_IM_INST.ATTR[`DSP_PREADD_DATA58__AREG] = ATTR[`DSPCPLX__AREG_RE];
  DSP_PREADD_DATA58_IM_INST.ATTR[`DSP_PREADD_DATA58__DREG] = AREG_RE_REG[1] || AREG_RE_REG[0];
  DSP_PREADD_DATA58_RE_INST.ATTR[`DSP_PREADD_DATA58__DREG] = AREG_IM_REG[1] || AREG_IM_REG[0];
  AUTORESET_PATDET_IM_REG = ATTR[`DSPCPLX__AUTORESET_PATDET_IM];
  DSP_OUTPUT58_IM_INST.ATTR[`DSP_OUTPUT58__AUTORESET_PATDET] = ATTR[`DSPCPLX__AUTORESET_PATDET_IM];
  AUTORESET_PATDET_RE_REG = ATTR[`DSPCPLX__AUTORESET_PATDET_RE];
  DSP_OUTPUT58_RE_INST.ATTR[`DSP_OUTPUT58__AUTORESET_PATDET] = ATTR[`DSPCPLX__AUTORESET_PATDET_RE];
  AUTORESET_PRIORITY_IM_REG = ATTR[`DSPCPLX__AUTORESET_PRIORITY_IM];
  DSP_OUTPUT58_IM_INST.ATTR[`DSP_OUTPUT58__AUTORESET_PRIORITY] = ATTR[`DSPCPLX__AUTORESET_PRIORITY_IM];
  AUTORESET_PRIORITY_RE_REG = ATTR[`DSPCPLX__AUTORESET_PRIORITY_RE];
  DSP_OUTPUT58_RE_INST.ATTR[`DSP_OUTPUT58__AUTORESET_PRIORITY] = ATTR[`DSPCPLX__AUTORESET_PRIORITY_RE];
  A_INPUT_IM_REG = ATTR[`DSPCPLX__A_INPUT_IM];
  DSP_A_B_DATA58_RE_INST.ATTR[`DSP_A_B_DATA58__A_INPUT] = ATTR[`DSPCPLX__A_INPUT_IM];
  A_INPUT_RE_REG = ATTR[`DSPCPLX__A_INPUT_RE];
  DSP_A_B_DATA58_IM_INST.ATTR[`DSP_A_B_DATA58__A_INPUT] = ATTR[`DSPCPLX__A_INPUT_RE];
  BCASCREG_IM_REG = ATTR[`DSPCPLX__BCASCREG_IM];
  DSP_A_B_DATA58_RE_INST.ATTR[`DSP_A_B_DATA58__BCASCREG] = ATTR[`DSPCPLX__BCASCREG_IM];
  BCASCREG_RE_REG = ATTR[`DSPCPLX__BCASCREG_RE];
  DSP_A_B_DATA58_IM_INST.ATTR[`DSP_A_B_DATA58__BCASCREG] = ATTR[`DSPCPLX__BCASCREG_RE];
  BREG_IM_REG = ATTR[`DSPCPLX__BREG_IM];
  DSP_A_B_DATA58_RE_INST.ATTR[`DSP_A_B_DATA58__BREG] = ATTR[`DSPCPLX__BREG_IM];
  DSP_PREADD_DATA58_RE_INST.ATTR[`DSP_PREADD_DATA58__BREG] = ATTR[`DSPCPLX__BREG_IM];
  BREG_RE_REG = ATTR[`DSPCPLX__BREG_RE];
  DSP_A_B_DATA58_IM_INST.ATTR[`DSP_A_B_DATA58__BREG] = ATTR[`DSPCPLX__BREG_RE];
  DSP_PREADD_DATA58_IM_INST.ATTR[`DSP_PREADD_DATA58__BREG] = ATTR[`DSPCPLX__BREG_RE];
  B_INPUT_IM_REG = ATTR[`DSPCPLX__B_INPUT_IM];
  DSP_A_B_DATA58_RE_INST.ATTR[`DSP_A_B_DATA58__B_INPUT] = ATTR[`DSPCPLX__B_INPUT_IM];
  B_INPUT_RE_REG = ATTR[`DSPCPLX__B_INPUT_RE];
  DSP_A_B_DATA58_IM_INST.ATTR[`DSP_A_B_DATA58__B_INPUT] = ATTR[`DSPCPLX__B_INPUT_RE];
  CARRYINREG_IM_REG = ATTR[`DSPCPLX__CARRYINREG_IM];
  DSP_ALUREG_IM_INST.ATTR[`DSP_ALUREG__CARRYINREG] = ATTR[`DSPCPLX__CARRYINREG_IM];
  CARRYINREG_RE_REG = ATTR[`DSPCPLX__CARRYINREG_RE];
  DSP_ALUREG_RE_INST.ATTR[`DSP_ALUREG__CARRYINREG] = ATTR[`DSPCPLX__CARRYINREG_RE];
  CARRYINSELREG_IM_REG = ATTR[`DSPCPLX__CARRYINSELREG_IM];
  DSP_ALUREG_IM_INST.ATTR[`DSP_ALUREG__CARRYINSELREG] = ATTR[`DSPCPLX__CARRYINSELREG_IM];
  CARRYINSELREG_RE_REG = ATTR[`DSPCPLX__CARRYINSELREG_RE];
  DSP_ALUREG_RE_INST.ATTR[`DSP_ALUREG__CARRYINSELREG] = ATTR[`DSPCPLX__CARRYINSELREG_RE];
  CONJUGATEREG_A_REG = ATTR[`DSPCPLX__CONJUGATEREG_A];
  DSP_PREADD_DATA58_IM_INST.ATTR[`DSP_PREADD_DATA58__INMODEREG] = ATTR[`DSPCPLX__CONJUGATEREG_A];
  CONJUGATEREG_B_REG = ATTR[`DSPCPLX__CONJUGATEREG_B];
  DSP_PREADD_DATA58_RE_INST.ATTR[`DSP_PREADD_DATA58__INMODEREG] = ATTR[`DSPCPLX__CONJUGATEREG_B];
  CREG_IM_REG = ATTR[`DSPCPLX__CREG_IM];
  DSP_C_DATA58_IM_INST.ATTR[`DSP_C_DATA58__CREG] = ATTR[`DSPCPLX__CREG_IM];
  CREG_RE_REG = ATTR[`DSPCPLX__CREG_RE];
  DSP_C_DATA58_RE_INST.ATTR[`DSP_C_DATA58__CREG] = ATTR[`DSPCPLX__CREG_RE];
  IS_ALUMODE_IM_INVERTED_REG = ATTR[`DSPCPLX__IS_ALUMODE_IM_INVERTED];
  IS_ALUMODE_RE_INVERTED_REG = ATTR[`DSPCPLX__IS_ALUMODE_RE_INVERTED];
  IS_ASYNC_RST_INVERTED_REG = ATTR[`DSPCPLX__IS_ASYNC_RST_INVERTED];
  IS_CARRYIN_IM_INVERTED_REG = ATTR[`DSPCPLX__IS_CARRYIN_IM_INVERTED];
  IS_CARRYIN_RE_INVERTED_REG = ATTR[`DSPCPLX__IS_CARRYIN_RE_INVERTED];
  IS_CLK_INVERTED_REG = ATTR[`DSPCPLX__IS_CLK_INVERTED];
  IS_CONJUGATE_A_INVERTED_REG = ATTR[`DSPCPLX__IS_CONJUGATE_A_INVERTED];
  IS_CONJUGATE_B_INVERTED_REG = ATTR[`DSPCPLX__IS_CONJUGATE_B_INVERTED];
  IS_OPMODE_IM_INVERTED_REG = ATTR[`DSPCPLX__IS_OPMODE_IM_INVERTED];
  IS_OPMODE_RE_INVERTED_REG = ATTR[`DSPCPLX__IS_OPMODE_RE_INVERTED];
  IS_RSTAD_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTAD_INVERTED];
  IS_RSTALLCARRYIN_IM_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTALLCARRYIN_IM_INVERTED];
  IS_RSTALLCARRYIN_RE_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTALLCARRYIN_RE_INVERTED];
  IS_RSTALUMODE_IM_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTALUMODE_IM_INVERTED];
  IS_RSTALUMODE_RE_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTALUMODE_RE_INVERTED];
  IS_RSTA_IM_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTA_IM_INVERTED];
  IS_RSTA_RE_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTA_RE_INVERTED];
  IS_RSTB_IM_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTB_IM_INVERTED];
  IS_RSTB_RE_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTB_RE_INVERTED];
  IS_RSTCONJUGATE_A_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTCONJUGATE_A_INVERTED];
  IS_RSTCONJUGATE_B_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTCONJUGATE_B_INVERTED];
  IS_RSTCTRL_IM_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTCTRL_IM_INVERTED];
  IS_RSTCTRL_RE_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTCTRL_RE_INVERTED];
  IS_RSTC_IM_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTC_IM_INVERTED];
  IS_RSTC_RE_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTC_RE_INVERTED];
  IS_RSTM_IM_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTM_IM_INVERTED];
  IS_RSTM_RE_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTM_RE_INVERTED];
  IS_RSTP_IM_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTP_IM_INVERTED];
  IS_RSTP_RE_INVERTED_REG = ATTR[`DSPCPLX__IS_RSTP_RE_INVERTED];
  MASK_IM_REG = ATTR[`DSPCPLX__MASK_IM];
  DSP_PATDET_IM_INST.ATTR[`DSP_PATDET__MASK] = ATTR[`DSPCPLX__MASK_IM];
  MASK_RE_REG = ATTR[`DSPCPLX__MASK_RE];
  DSP_PATDET_RE_INST.ATTR[`DSP_PATDET__MASK] = ATTR[`DSPCPLX__MASK_RE];
  MREG_IM_REG = ATTR[`DSPCPLX__MREG_IM];
  DSP_ALUREG_IM_INST.ATTR[`DSP_ALUREG__MREG] = ATTR[`DSPCPLX__MREG_IM];
  DSP_M_DATA58_IM_INST.ATTR[`DSP_M_DATA58__MREG] = ATTR[`DSPCPLX__MREG_IM];
  DSP_PREADD_DATA58_IM_INST.ATTR[`DSP_PREADD_DATA58__MREG] = ATTR[`DSPCPLX__MREG_IM];
  MREG_RE_REG = ATTR[`DSPCPLX__MREG_RE];
  DSP_ALUREG_RE_INST.ATTR[`DSP_ALUREG__MREG] = ATTR[`DSPCPLX__MREG_RE];
  DSP_M_DATA58_RE_INST.ATTR[`DSP_M_DATA58__MREG] = ATTR[`DSPCPLX__MREG_RE];
  DSP_PREADD_DATA58_RE_INST.ATTR[`DSP_PREADD_DATA58__MREG] = ATTR[`DSPCPLX__MREG_RE];
  OPMODEREG_IM_REG = ATTR[`DSPCPLX__OPMODEREG_IM];
  DSP_ALUREG_IM_INST.ATTR[`DSP_ALUREG__OPMODEREG] = ATTR[`DSPCPLX__OPMODEREG_IM];
  OPMODEREG_RE_REG = ATTR[`DSPCPLX__OPMODEREG_RE];
  DSP_ALUREG_RE_INST.ATTR[`DSP_ALUREG__OPMODEREG] = ATTR[`DSPCPLX__OPMODEREG_RE];
  PATTERN_IM_REG = ATTR[`DSPCPLX__PATTERN_IM];
  DSP_PATDET_IM_INST.ATTR[`DSP_PATDET__PATTERN] = ATTR[`DSPCPLX__PATTERN_IM];
  PATTERN_RE_REG = ATTR[`DSPCPLX__PATTERN_RE];
  DSP_PATDET_RE_INST.ATTR[`DSP_PATDET__PATTERN] = ATTR[`DSPCPLX__PATTERN_RE];
  PREG_IM_REG = ATTR[`DSPCPLX__PREG_IM];
  DSP_OUTPUT58_IM_INST.ATTR[`DSP_OUTPUT58__PREG] = ATTR[`DSPCPLX__PREG_IM];
  PREG_RE_REG = ATTR[`DSPCPLX__PREG_RE];
  DSP_OUTPUT58_RE_INST.ATTR[`DSP_OUTPUT58__PREG] = ATTR[`DSPCPLX__PREG_RE];
  RESET_MODE_REG = ATTR[`DSPCPLX__RESET_MODE];
  DSP_ALUREG_IM_INST.ATTR[`DSP_ALUREG__RESET_MODE] = ATTR[`DSPCPLX__RESET_MODE];
  DSP_ALUREG_RE_INST.ATTR[`DSP_ALUREG__RESET_MODE] = ATTR[`DSPCPLX__RESET_MODE];
  DSP_A_B_DATA58_IM_INST.ATTR[`DSP_A_B_DATA58__RESET_MODE] = ATTR[`DSPCPLX__RESET_MODE];
  DSP_A_B_DATA58_RE_INST.ATTR[`DSP_A_B_DATA58__RESET_MODE] = ATTR[`DSPCPLX__RESET_MODE];
  DSP_C_DATA58_IM_INST.ATTR[`DSP_C_DATA58__RESET_MODE] = ATTR[`DSPCPLX__RESET_MODE];
  DSP_C_DATA58_RE_INST.ATTR[`DSP_C_DATA58__RESET_MODE] = ATTR[`DSPCPLX__RESET_MODE];
  DSP_M_DATA58_IM_INST.ATTR[`DSP_M_DATA58__RESET_MODE] = ATTR[`DSPCPLX__RESET_MODE];
  DSP_M_DATA58_RE_INST.ATTR[`DSP_M_DATA58__RESET_MODE] = ATTR[`DSPCPLX__RESET_MODE];
  DSP_OUTPUT58_IM_INST.ATTR[`DSP_OUTPUT58__RESET_MODE] = ATTR[`DSPCPLX__RESET_MODE];
  DSP_OUTPUT58_RE_INST.ATTR[`DSP_OUTPUT58__RESET_MODE] = ATTR[`DSPCPLX__RESET_MODE];
  DSP_PREADD_DATA58_IM_INST.ATTR[`DSP_PREADD_DATA58__RESET_MODE] = ATTR[`DSPCPLX__RESET_MODE];
  DSP_PREADD_DATA58_RE_INST.ATTR[`DSP_PREADD_DATA58__RESET_MODE] = ATTR[`DSPCPLX__RESET_MODE];
  RND_IM_REG = ATTR[`DSPCPLX__RND_IM];
  DSP_ALUMUX_IM_INST.ATTR[`DSP_ALUMUX__RND] = ATTR[`DSPCPLX__RND_IM];
  RND_RE_REG = ATTR[`DSPCPLX__RND_RE];
  DSP_ALUMUX_RE_INST.ATTR[`DSP_ALUMUX__RND] = ATTR[`DSPCPLX__RND_RE];
  SEL_MASK_IM_REG = ATTR[`DSPCPLX__SEL_MASK_IM];
  DSP_PATDET_IM_INST.ATTR[`DSP_PATDET__SEL_MASK] = ATTR[`DSPCPLX__SEL_MASK_IM];
  SEL_MASK_RE_REG = ATTR[`DSPCPLX__SEL_MASK_RE];
  DSP_PATDET_RE_INST.ATTR[`DSP_PATDET__SEL_MASK] = ATTR[`DSPCPLX__SEL_MASK_RE];
  SEL_PATTERN_IM_REG = ATTR[`DSPCPLX__SEL_PATTERN_IM];
  DSP_PATDET_IM_INST.ATTR[`DSP_PATDET__SEL_PATTERN] = ATTR[`DSPCPLX__SEL_PATTERN_IM];
  SEL_PATTERN_RE_REG = ATTR[`DSPCPLX__SEL_PATTERN_RE];
  DSP_PATDET_RE_INST.ATTR[`DSP_PATDET__SEL_PATTERN] = ATTR[`DSPCPLX__SEL_PATTERN_RE];
  USE_PATTERN_DETECT_IM_REG = ATTR[`DSPCPLX__USE_PATTERN_DETECT_IM];
  DSP_PATDET_IM_INST.ATTR[`DSP_PATDET__USE_PATTERN_DETECT] = ATTR[`DSPCPLX__USE_PATTERN_DETECT_IM];
  USE_PATTERN_DETECT_RE_REG = ATTR[`DSPCPLX__USE_PATTERN_DETECT_RE];
  DSP_PATDET_RE_INST.ATTR[`DSP_PATDET__USE_PATTERN_DETECT] = ATTR[`DSPCPLX__USE_PATTERN_DETECT_RE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSPCPLX_ADDR_SZ-1:0] addr;
  input  [`DSPCPLX_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
    DSP_A_B_DATA58_RE_INST.trig_attr = trig_attr;
    DSP_A_B_DATA58_IM_INST.trig_attr = trig_attr;
    DSP_ALUMUX_RE_INST.trig_attr = trig_attr;
    DSP_ALUMUX_IM_INST.trig_attr = trig_attr;
    DSP_ALUREG_RE_INST.trig_attr = trig_attr;
    DSP_ALUREG_IM_INST.trig_attr = trig_attr;
    DSP_C_DATA58_RE_INST.trig_attr = trig_attr;
    DSP_C_DATA58_IM_INST.trig_attr = trig_attr;
    DSP_M_DATA58_RE_INST.trig_attr = trig_attr;
    DSP_M_DATA58_IM_INST.trig_attr = trig_attr;
    DSP_OUTPUT58_RE_INST.trig_attr = trig_attr;
    DSP_OUTPUT58_IM_INST.trig_attr = trig_attr;
    DSP_PATDET_RE_INST.trig_attr = trig_attr;
    DSP_PATDET_IM_INST.trig_attr = trig_attr;
    DSP_PREADD_DATA58_RE_INST.trig_attr = trig_attr;
    DSP_PREADD_DATA58_IM_INST.trig_attr = trig_attr;
  end
endtask

function [`DSPCPLX_DATA_SZ-1:0] read_attr;
  input  [`DSPCPLX_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
    trig_attr = ~trig_attr;
    DSP_A_B_DATA58_RE_INST.trig_attr = trig_attr;
    DSP_A_B_DATA58_IM_INST.trig_attr = trig_attr;
    DSP_ALUMUX_RE_INST.trig_attr = trig_attr;
    DSP_ALUMUX_IM_INST.trig_attr = trig_attr;
    DSP_ALUREG_RE_INST.trig_attr = trig_attr;
    DSP_ALUREG_IM_INST.trig_attr = trig_attr;
    DSP_C_DATA58_RE_INST.trig_attr = trig_attr;
    DSP_C_DATA58_IM_INST.trig_attr = trig_attr;
    DSP_M_DATA58_RE_INST.trig_attr = trig_attr;
    DSP_M_DATA58_IM_INST.trig_attr = trig_attr;
    DSP_OUTPUT58_RE_INST.trig_attr = trig_attr;
    DSP_OUTPUT58_IM_INST.trig_attr = trig_attr;
    DSP_PATDET_RE_INST.trig_attr = trig_attr;
    DSP_PATDET_IM_INST.trig_attr = trig_attr;
    DSP_PREADD_DATA58_RE_INST.trig_attr = trig_attr;
    DSP_PREADD_DATA58_IM_INST.trig_attr = trig_attr;
  end
endtask
