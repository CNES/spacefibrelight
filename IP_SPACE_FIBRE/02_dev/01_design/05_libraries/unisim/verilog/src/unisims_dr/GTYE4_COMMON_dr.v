`include "B_GTYE4_COMMON_defines.vh"

reg [`GTYE4_COMMON_DATA_SZ-1:0] ATTR [0:`GTYE4_COMMON_ADDR_N-1];
reg AEN_QPLL0_FBDIV_REG = AEN_QPLL0_FBDIV;
reg AEN_QPLL1_FBDIV_REG = AEN_QPLL1_FBDIV;
reg AEN_SDM0TOGGLE_REG = AEN_SDM0TOGGLE;
reg AEN_SDM1TOGGLE_REG = AEN_SDM1TOGGLE;
reg A_SDM0TOGGLE_REG = A_SDM0TOGGLE;
reg [`GTYE4_COMMON__A_SDM1DATA_HIGH_SZ-1:0] A_SDM1DATA_HIGH_REG = A_SDM1DATA_HIGH;
reg [`GTYE4_COMMON__A_SDM1DATA_LOW_SZ-1:0] A_SDM1DATA_LOW_REG = A_SDM1DATA_LOW;
reg A_SDM1TOGGLE_REG = A_SDM1TOGGLE;
reg [`GTYE4_COMMON__BIAS_CFG0_SZ-1:0] BIAS_CFG0_REG = BIAS_CFG0;
reg [`GTYE4_COMMON__BIAS_CFG1_SZ-1:0] BIAS_CFG1_REG = BIAS_CFG1;
reg [`GTYE4_COMMON__BIAS_CFG2_SZ-1:0] BIAS_CFG2_REG = BIAS_CFG2;
reg [`GTYE4_COMMON__BIAS_CFG3_SZ-1:0] BIAS_CFG3_REG = BIAS_CFG3;
reg [`GTYE4_COMMON__BIAS_CFG4_SZ-1:0] BIAS_CFG4_REG = BIAS_CFG4;
reg [`GTYE4_COMMON__BIAS_CFG_RSVD_SZ-1:0] BIAS_CFG_RSVD_REG = BIAS_CFG_RSVD;
reg [`GTYE4_COMMON__COMMON_CFG0_SZ-1:0] COMMON_CFG0_REG = COMMON_CFG0;
reg [`GTYE4_COMMON__COMMON_CFG1_SZ-1:0] COMMON_CFG1_REG = COMMON_CFG1;
reg [`GTYE4_COMMON__POR_CFG_SZ-1:0] POR_CFG_REG = POR_CFG;
reg [`GTYE4_COMMON__PPF0_CFG_SZ-1:0] PPF0_CFG_REG = PPF0_CFG;
reg [`GTYE4_COMMON__PPF1_CFG_SZ-1:0] PPF1_CFG_REG = PPF1_CFG;
reg [`GTYE4_COMMON__QPLL0CLKOUT_RATE_SZ:1] QPLL0CLKOUT_RATE_REG = QPLL0CLKOUT_RATE;
reg [`GTYE4_COMMON__QPLL0_CFG0_SZ-1:0] QPLL0_CFG0_REG = QPLL0_CFG0;
reg [`GTYE4_COMMON__QPLL0_CFG1_SZ-1:0] QPLL0_CFG1_REG = QPLL0_CFG1;
reg [`GTYE4_COMMON__QPLL0_CFG1_G3_SZ-1:0] QPLL0_CFG1_G3_REG = QPLL0_CFG1_G3;
reg [`GTYE4_COMMON__QPLL0_CFG2_SZ-1:0] QPLL0_CFG2_REG = QPLL0_CFG2;
reg [`GTYE4_COMMON__QPLL0_CFG2_G3_SZ-1:0] QPLL0_CFG2_G3_REG = QPLL0_CFG2_G3;
reg [`GTYE4_COMMON__QPLL0_CFG3_SZ-1:0] QPLL0_CFG3_REG = QPLL0_CFG3;
reg [`GTYE4_COMMON__QPLL0_CFG4_SZ-1:0] QPLL0_CFG4_REG = QPLL0_CFG4;
reg [`GTYE4_COMMON__QPLL0_CP_SZ-1:0] QPLL0_CP_REG = QPLL0_CP;
reg [`GTYE4_COMMON__QPLL0_CP_G3_SZ-1:0] QPLL0_CP_G3_REG = QPLL0_CP_G3;
reg [`GTYE4_COMMON__QPLL0_FBDIV_SZ-1:0] QPLL0_FBDIV_REG = QPLL0_FBDIV;
reg [`GTYE4_COMMON__QPLL0_FBDIV_G3_SZ-1:0] QPLL0_FBDIV_G3_REG = QPLL0_FBDIV_G3;
reg [`GTYE4_COMMON__QPLL0_INIT_CFG0_SZ-1:0] QPLL0_INIT_CFG0_REG = QPLL0_INIT_CFG0;
reg [`GTYE4_COMMON__QPLL0_INIT_CFG1_SZ-1:0] QPLL0_INIT_CFG1_REG = QPLL0_INIT_CFG1;
reg [`GTYE4_COMMON__QPLL0_LOCK_CFG_SZ-1:0] QPLL0_LOCK_CFG_REG = QPLL0_LOCK_CFG;
reg [`GTYE4_COMMON__QPLL0_LOCK_CFG_G3_SZ-1:0] QPLL0_LOCK_CFG_G3_REG = QPLL0_LOCK_CFG_G3;
reg [`GTYE4_COMMON__QPLL0_LPF_SZ-1:0] QPLL0_LPF_REG = QPLL0_LPF;
reg [`GTYE4_COMMON__QPLL0_LPF_G3_SZ-1:0] QPLL0_LPF_G3_REG = QPLL0_LPF_G3;
reg QPLL0_PCI_EN_REG = QPLL0_PCI_EN;
reg QPLL0_RATE_SW_USE_DRP_REG = QPLL0_RATE_SW_USE_DRP;
reg [`GTYE4_COMMON__QPLL0_REFCLK_DIV_SZ-1:0] QPLL0_REFCLK_DIV_REG = QPLL0_REFCLK_DIV;
reg [`GTYE4_COMMON__QPLL0_SDM_CFG0_SZ-1:0] QPLL0_SDM_CFG0_REG = QPLL0_SDM_CFG0;
reg [`GTYE4_COMMON__QPLL0_SDM_CFG1_SZ-1:0] QPLL0_SDM_CFG1_REG = QPLL0_SDM_CFG1;
reg [`GTYE4_COMMON__QPLL0_SDM_CFG2_SZ-1:0] QPLL0_SDM_CFG2_REG = QPLL0_SDM_CFG2;
reg [`GTYE4_COMMON__QPLL1CLKOUT_RATE_SZ:1] QPLL1CLKOUT_RATE_REG = QPLL1CLKOUT_RATE;
reg [`GTYE4_COMMON__QPLL1_CFG0_SZ-1:0] QPLL1_CFG0_REG = QPLL1_CFG0;
reg [`GTYE4_COMMON__QPLL1_CFG1_SZ-1:0] QPLL1_CFG1_REG = QPLL1_CFG1;
reg [`GTYE4_COMMON__QPLL1_CFG1_G3_SZ-1:0] QPLL1_CFG1_G3_REG = QPLL1_CFG1_G3;
reg [`GTYE4_COMMON__QPLL1_CFG2_SZ-1:0] QPLL1_CFG2_REG = QPLL1_CFG2;
reg [`GTYE4_COMMON__QPLL1_CFG2_G3_SZ-1:0] QPLL1_CFG2_G3_REG = QPLL1_CFG2_G3;
reg [`GTYE4_COMMON__QPLL1_CFG3_SZ-1:0] QPLL1_CFG3_REG = QPLL1_CFG3;
reg [`GTYE4_COMMON__QPLL1_CFG4_SZ-1:0] QPLL1_CFG4_REG = QPLL1_CFG4;
reg [`GTYE4_COMMON__QPLL1_CP_SZ-1:0] QPLL1_CP_REG = QPLL1_CP;
reg [`GTYE4_COMMON__QPLL1_CP_G3_SZ-1:0] QPLL1_CP_G3_REG = QPLL1_CP_G3;
reg [`GTYE4_COMMON__QPLL1_FBDIV_SZ-1:0] QPLL1_FBDIV_REG = QPLL1_FBDIV;
reg [`GTYE4_COMMON__QPLL1_FBDIV_G3_SZ-1:0] QPLL1_FBDIV_G3_REG = QPLL1_FBDIV_G3;
reg [`GTYE4_COMMON__QPLL1_INIT_CFG0_SZ-1:0] QPLL1_INIT_CFG0_REG = QPLL1_INIT_CFG0;
reg [`GTYE4_COMMON__QPLL1_INIT_CFG1_SZ-1:0] QPLL1_INIT_CFG1_REG = QPLL1_INIT_CFG1;
reg [`GTYE4_COMMON__QPLL1_LOCK_CFG_SZ-1:0] QPLL1_LOCK_CFG_REG = QPLL1_LOCK_CFG;
reg [`GTYE4_COMMON__QPLL1_LOCK_CFG_G3_SZ-1:0] QPLL1_LOCK_CFG_G3_REG = QPLL1_LOCK_CFG_G3;
reg [`GTYE4_COMMON__QPLL1_LPF_SZ-1:0] QPLL1_LPF_REG = QPLL1_LPF;
reg [`GTYE4_COMMON__QPLL1_LPF_G3_SZ-1:0] QPLL1_LPF_G3_REG = QPLL1_LPF_G3;
reg QPLL1_PCI_EN_REG = QPLL1_PCI_EN;
reg QPLL1_RATE_SW_USE_DRP_REG = QPLL1_RATE_SW_USE_DRP;
reg [`GTYE4_COMMON__QPLL1_REFCLK_DIV_SZ-1:0] QPLL1_REFCLK_DIV_REG = QPLL1_REFCLK_DIV;
reg [`GTYE4_COMMON__QPLL1_SDM_CFG0_SZ-1:0] QPLL1_SDM_CFG0_REG = QPLL1_SDM_CFG0;
reg [`GTYE4_COMMON__QPLL1_SDM_CFG1_SZ-1:0] QPLL1_SDM_CFG1_REG = QPLL1_SDM_CFG1;
reg [`GTYE4_COMMON__QPLL1_SDM_CFG2_SZ-1:0] QPLL1_SDM_CFG2_REG = QPLL1_SDM_CFG2;
reg [`GTYE4_COMMON__RSVD_ATTR0_SZ-1:0] RSVD_ATTR0_REG = RSVD_ATTR0;
reg [`GTYE4_COMMON__RSVD_ATTR1_SZ-1:0] RSVD_ATTR1_REG = RSVD_ATTR1;
reg [`GTYE4_COMMON__RSVD_ATTR2_SZ-1:0] RSVD_ATTR2_REG = RSVD_ATTR2;
reg [`GTYE4_COMMON__RSVD_ATTR3_SZ-1:0] RSVD_ATTR3_REG = RSVD_ATTR3;
reg [`GTYE4_COMMON__RXRECCLKOUT0_SEL_SZ-1:0] RXRECCLKOUT0_SEL_REG = RXRECCLKOUT0_SEL;
reg [`GTYE4_COMMON__RXRECCLKOUT1_SEL_SZ-1:0] RXRECCLKOUT1_SEL_REG = RXRECCLKOUT1_SEL;
reg SARC_ENB_REG = SARC_ENB;
reg SARC_SEL_REG = SARC_SEL;
reg [`GTYE4_COMMON__SDM0INITSEED0_0_SZ-1:0] SDM0INITSEED0_0_REG = SDM0INITSEED0_0;
reg [`GTYE4_COMMON__SDM0INITSEED0_1_SZ-1:0] SDM0INITSEED0_1_REG = SDM0INITSEED0_1;
reg [`GTYE4_COMMON__SDM1INITSEED0_0_SZ-1:0] SDM1INITSEED0_0_REG = SDM1INITSEED0_0;
reg [`GTYE4_COMMON__SDM1INITSEED0_1_SZ-1:0] SDM1INITSEED0_1_REG = SDM1INITSEED0_1;
reg [`GTYE4_COMMON__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;
reg [`GTYE4_COMMON__SIM_MODE_SZ:1] SIM_MODE_REG = SIM_MODE;
reg [`GTYE4_COMMON__SIM_RESET_SPEEDUP_SZ:1] SIM_RESET_SPEEDUP_REG = SIM_RESET_SPEEDUP;
reg [`GTYE4_COMMON__UB_CFG0_SZ-1:0] UB_CFG0_REG = UB_CFG0;
reg [`GTYE4_COMMON__UB_CFG1_SZ-1:0] UB_CFG1_REG = UB_CFG1;
reg [`GTYE4_COMMON__UB_CFG2_SZ-1:0] UB_CFG2_REG = UB_CFG2;
reg [`GTYE4_COMMON__UB_CFG3_SZ-1:0] UB_CFG3_REG = UB_CFG3;
reg [`GTYE4_COMMON__UB_CFG4_SZ-1:0] UB_CFG4_REG = UB_CFG4;
reg [`GTYE4_COMMON__UB_CFG5_SZ-1:0] UB_CFG5_REG = UB_CFG5;
reg [`GTYE4_COMMON__UB_CFG6_SZ-1:0] UB_CFG6_REG = UB_CFG6;

initial begin
  ATTR[`GTYE4_COMMON__AEN_QPLL0_FBDIV] = AEN_QPLL0_FBDIV;
  ATTR[`GTYE4_COMMON__AEN_QPLL1_FBDIV] = AEN_QPLL1_FBDIV;
  ATTR[`GTYE4_COMMON__AEN_SDM0TOGGLE] = AEN_SDM0TOGGLE;
  ATTR[`GTYE4_COMMON__AEN_SDM1TOGGLE] = AEN_SDM1TOGGLE;
  ATTR[`GTYE4_COMMON__A_SDM0TOGGLE] = A_SDM0TOGGLE;
  ATTR[`GTYE4_COMMON__A_SDM1DATA_HIGH] = A_SDM1DATA_HIGH;
  ATTR[`GTYE4_COMMON__A_SDM1DATA_LOW] = A_SDM1DATA_LOW;
  ATTR[`GTYE4_COMMON__A_SDM1TOGGLE] = A_SDM1TOGGLE;
  ATTR[`GTYE4_COMMON__BIAS_CFG0] = BIAS_CFG0;
  ATTR[`GTYE4_COMMON__BIAS_CFG1] = BIAS_CFG1;
  ATTR[`GTYE4_COMMON__BIAS_CFG2] = BIAS_CFG2;
  ATTR[`GTYE4_COMMON__BIAS_CFG3] = BIAS_CFG3;
  ATTR[`GTYE4_COMMON__BIAS_CFG4] = BIAS_CFG4;
  ATTR[`GTYE4_COMMON__BIAS_CFG_RSVD] = BIAS_CFG_RSVD;
  ATTR[`GTYE4_COMMON__COMMON_CFG0] = COMMON_CFG0;
  ATTR[`GTYE4_COMMON__COMMON_CFG1] = COMMON_CFG1;
  ATTR[`GTYE4_COMMON__POR_CFG] = POR_CFG;
  ATTR[`GTYE4_COMMON__PPF0_CFG] = PPF0_CFG;
  ATTR[`GTYE4_COMMON__PPF1_CFG] = PPF1_CFG;
  ATTR[`GTYE4_COMMON__QPLL0CLKOUT_RATE] = QPLL0CLKOUT_RATE;
  ATTR[`GTYE4_COMMON__QPLL0_CFG0] = QPLL0_CFG0;
  ATTR[`GTYE4_COMMON__QPLL0_CFG1] = QPLL0_CFG1;
  ATTR[`GTYE4_COMMON__QPLL0_CFG1_G3] = QPLL0_CFG1_G3;
  ATTR[`GTYE4_COMMON__QPLL0_CFG2] = QPLL0_CFG2;
  ATTR[`GTYE4_COMMON__QPLL0_CFG2_G3] = QPLL0_CFG2_G3;
  ATTR[`GTYE4_COMMON__QPLL0_CFG3] = QPLL0_CFG3;
  ATTR[`GTYE4_COMMON__QPLL0_CFG4] = QPLL0_CFG4;
  ATTR[`GTYE4_COMMON__QPLL0_CP] = QPLL0_CP;
  ATTR[`GTYE4_COMMON__QPLL0_CP_G3] = QPLL0_CP_G3;
  ATTR[`GTYE4_COMMON__QPLL0_FBDIV] = QPLL0_FBDIV;
  ATTR[`GTYE4_COMMON__QPLL0_FBDIV_G3] = QPLL0_FBDIV_G3;
  ATTR[`GTYE4_COMMON__QPLL0_INIT_CFG0] = QPLL0_INIT_CFG0;
  ATTR[`GTYE4_COMMON__QPLL0_INIT_CFG1] = QPLL0_INIT_CFG1;
  ATTR[`GTYE4_COMMON__QPLL0_LOCK_CFG] = QPLL0_LOCK_CFG;
  ATTR[`GTYE4_COMMON__QPLL0_LOCK_CFG_G3] = QPLL0_LOCK_CFG_G3;
  ATTR[`GTYE4_COMMON__QPLL0_LPF] = QPLL0_LPF;
  ATTR[`GTYE4_COMMON__QPLL0_LPF_G3] = QPLL0_LPF_G3;
  ATTR[`GTYE4_COMMON__QPLL0_PCI_EN] = QPLL0_PCI_EN;
  ATTR[`GTYE4_COMMON__QPLL0_RATE_SW_USE_DRP] = QPLL0_RATE_SW_USE_DRP;
  ATTR[`GTYE4_COMMON__QPLL0_REFCLK_DIV] = QPLL0_REFCLK_DIV;
  ATTR[`GTYE4_COMMON__QPLL0_SDM_CFG0] = QPLL0_SDM_CFG0;
  ATTR[`GTYE4_COMMON__QPLL0_SDM_CFG1] = QPLL0_SDM_CFG1;
  ATTR[`GTYE4_COMMON__QPLL0_SDM_CFG2] = QPLL0_SDM_CFG2;
  ATTR[`GTYE4_COMMON__QPLL1CLKOUT_RATE] = QPLL1CLKOUT_RATE;
  ATTR[`GTYE4_COMMON__QPLL1_CFG0] = QPLL1_CFG0;
  ATTR[`GTYE4_COMMON__QPLL1_CFG1] = QPLL1_CFG1;
  ATTR[`GTYE4_COMMON__QPLL1_CFG1_G3] = QPLL1_CFG1_G3;
  ATTR[`GTYE4_COMMON__QPLL1_CFG2] = QPLL1_CFG2;
  ATTR[`GTYE4_COMMON__QPLL1_CFG2_G3] = QPLL1_CFG2_G3;
  ATTR[`GTYE4_COMMON__QPLL1_CFG3] = QPLL1_CFG3;
  ATTR[`GTYE4_COMMON__QPLL1_CFG4] = QPLL1_CFG4;
  ATTR[`GTYE4_COMMON__QPLL1_CP] = QPLL1_CP;
  ATTR[`GTYE4_COMMON__QPLL1_CP_G3] = QPLL1_CP_G3;
  ATTR[`GTYE4_COMMON__QPLL1_FBDIV] = QPLL1_FBDIV;
  ATTR[`GTYE4_COMMON__QPLL1_FBDIV_G3] = QPLL1_FBDIV_G3;
  ATTR[`GTYE4_COMMON__QPLL1_INIT_CFG0] = QPLL1_INIT_CFG0;
  ATTR[`GTYE4_COMMON__QPLL1_INIT_CFG1] = QPLL1_INIT_CFG1;
  ATTR[`GTYE4_COMMON__QPLL1_LOCK_CFG] = QPLL1_LOCK_CFG;
  ATTR[`GTYE4_COMMON__QPLL1_LOCK_CFG_G3] = QPLL1_LOCK_CFG_G3;
  ATTR[`GTYE4_COMMON__QPLL1_LPF] = QPLL1_LPF;
  ATTR[`GTYE4_COMMON__QPLL1_LPF_G3] = QPLL1_LPF_G3;
  ATTR[`GTYE4_COMMON__QPLL1_PCI_EN] = QPLL1_PCI_EN;
  ATTR[`GTYE4_COMMON__QPLL1_RATE_SW_USE_DRP] = QPLL1_RATE_SW_USE_DRP;
  ATTR[`GTYE4_COMMON__QPLL1_REFCLK_DIV] = QPLL1_REFCLK_DIV;
  ATTR[`GTYE4_COMMON__QPLL1_SDM_CFG0] = QPLL1_SDM_CFG0;
  ATTR[`GTYE4_COMMON__QPLL1_SDM_CFG1] = QPLL1_SDM_CFG1;
  ATTR[`GTYE4_COMMON__QPLL1_SDM_CFG2] = QPLL1_SDM_CFG2;
  ATTR[`GTYE4_COMMON__RSVD_ATTR0] = RSVD_ATTR0;
  ATTR[`GTYE4_COMMON__RSVD_ATTR1] = RSVD_ATTR1;
  ATTR[`GTYE4_COMMON__RSVD_ATTR2] = RSVD_ATTR2;
  ATTR[`GTYE4_COMMON__RSVD_ATTR3] = RSVD_ATTR3;
  ATTR[`GTYE4_COMMON__RXRECCLKOUT0_SEL] = RXRECCLKOUT0_SEL;
  ATTR[`GTYE4_COMMON__RXRECCLKOUT1_SEL] = RXRECCLKOUT1_SEL;
  ATTR[`GTYE4_COMMON__SARC_ENB] = SARC_ENB;
  ATTR[`GTYE4_COMMON__SARC_SEL] = SARC_SEL;
  ATTR[`GTYE4_COMMON__SDM0INITSEED0_0] = SDM0INITSEED0_0;
  ATTR[`GTYE4_COMMON__SDM0INITSEED0_1] = SDM0INITSEED0_1;
  ATTR[`GTYE4_COMMON__SDM1INITSEED0_0] = SDM1INITSEED0_0;
  ATTR[`GTYE4_COMMON__SDM1INITSEED0_1] = SDM1INITSEED0_1;
  ATTR[`GTYE4_COMMON__SIM_DEVICE] = SIM_DEVICE;
  ATTR[`GTYE4_COMMON__SIM_MODE] = SIM_MODE;
  ATTR[`GTYE4_COMMON__SIM_RESET_SPEEDUP] = SIM_RESET_SPEEDUP;
  ATTR[`GTYE4_COMMON__UB_CFG0] = UB_CFG0;
  ATTR[`GTYE4_COMMON__UB_CFG1] = UB_CFG1;
  ATTR[`GTYE4_COMMON__UB_CFG2] = UB_CFG2;
  ATTR[`GTYE4_COMMON__UB_CFG3] = UB_CFG3;
  ATTR[`GTYE4_COMMON__UB_CFG4] = UB_CFG4;
  ATTR[`GTYE4_COMMON__UB_CFG5] = UB_CFG5;
  ATTR[`GTYE4_COMMON__UB_CFG6] = UB_CFG6;
end

always @(trig_attr) begin
  AEN_QPLL0_FBDIV_REG = ATTR[`GTYE4_COMMON__AEN_QPLL0_FBDIV];
  AEN_QPLL1_FBDIV_REG = ATTR[`GTYE4_COMMON__AEN_QPLL1_FBDIV];
  AEN_SDM0TOGGLE_REG = ATTR[`GTYE4_COMMON__AEN_SDM0TOGGLE];
  AEN_SDM1TOGGLE_REG = ATTR[`GTYE4_COMMON__AEN_SDM1TOGGLE];
  A_SDM0TOGGLE_REG = ATTR[`GTYE4_COMMON__A_SDM0TOGGLE];
  A_SDM1DATA_HIGH_REG = ATTR[`GTYE4_COMMON__A_SDM1DATA_HIGH];
  A_SDM1DATA_LOW_REG = ATTR[`GTYE4_COMMON__A_SDM1DATA_LOW];
  A_SDM1TOGGLE_REG = ATTR[`GTYE4_COMMON__A_SDM1TOGGLE];
  BIAS_CFG0_REG = ATTR[`GTYE4_COMMON__BIAS_CFG0];
  BIAS_CFG1_REG = ATTR[`GTYE4_COMMON__BIAS_CFG1];
  BIAS_CFG2_REG = ATTR[`GTYE4_COMMON__BIAS_CFG2];
  BIAS_CFG3_REG = ATTR[`GTYE4_COMMON__BIAS_CFG3];
  BIAS_CFG4_REG = ATTR[`GTYE4_COMMON__BIAS_CFG4];
  BIAS_CFG_RSVD_REG = ATTR[`GTYE4_COMMON__BIAS_CFG_RSVD];
  COMMON_CFG0_REG = ATTR[`GTYE4_COMMON__COMMON_CFG0];
  COMMON_CFG1_REG = ATTR[`GTYE4_COMMON__COMMON_CFG1];
  POR_CFG_REG = ATTR[`GTYE4_COMMON__POR_CFG];
  PPF0_CFG_REG = ATTR[`GTYE4_COMMON__PPF0_CFG];
  PPF1_CFG_REG = ATTR[`GTYE4_COMMON__PPF1_CFG];
  QPLL0CLKOUT_RATE_REG = ATTR[`GTYE4_COMMON__QPLL0CLKOUT_RATE];
  QPLL0_CFG0_REG = ATTR[`GTYE4_COMMON__QPLL0_CFG0];
  QPLL0_CFG1_G3_REG = ATTR[`GTYE4_COMMON__QPLL0_CFG1_G3];
  QPLL0_CFG1_REG = ATTR[`GTYE4_COMMON__QPLL0_CFG1];
  QPLL0_CFG2_G3_REG = ATTR[`GTYE4_COMMON__QPLL0_CFG2_G3];
  QPLL0_CFG2_REG = ATTR[`GTYE4_COMMON__QPLL0_CFG2];
  QPLL0_CFG3_REG = ATTR[`GTYE4_COMMON__QPLL0_CFG3];
  QPLL0_CFG4_REG = ATTR[`GTYE4_COMMON__QPLL0_CFG4];
  QPLL0_CP_G3_REG = ATTR[`GTYE4_COMMON__QPLL0_CP_G3];
  QPLL0_CP_REG = ATTR[`GTYE4_COMMON__QPLL0_CP];
  QPLL0_FBDIV_G3_REG = ATTR[`GTYE4_COMMON__QPLL0_FBDIV_G3];
  QPLL0_FBDIV_REG = ATTR[`GTYE4_COMMON__QPLL0_FBDIV];
  QPLL0_INIT_CFG0_REG = ATTR[`GTYE4_COMMON__QPLL0_INIT_CFG0];
  QPLL0_INIT_CFG1_REG = ATTR[`GTYE4_COMMON__QPLL0_INIT_CFG1];
  QPLL0_LOCK_CFG_G3_REG = ATTR[`GTYE4_COMMON__QPLL0_LOCK_CFG_G3];
  QPLL0_LOCK_CFG_REG = ATTR[`GTYE4_COMMON__QPLL0_LOCK_CFG];
  QPLL0_LPF_G3_REG = ATTR[`GTYE4_COMMON__QPLL0_LPF_G3];
  QPLL0_LPF_REG = ATTR[`GTYE4_COMMON__QPLL0_LPF];
  QPLL0_PCI_EN_REG = ATTR[`GTYE4_COMMON__QPLL0_PCI_EN];
  QPLL0_RATE_SW_USE_DRP_REG = ATTR[`GTYE4_COMMON__QPLL0_RATE_SW_USE_DRP];
  QPLL0_REFCLK_DIV_REG = ATTR[`GTYE4_COMMON__QPLL0_REFCLK_DIV];
  QPLL0_SDM_CFG0_REG = ATTR[`GTYE4_COMMON__QPLL0_SDM_CFG0];
  QPLL0_SDM_CFG1_REG = ATTR[`GTYE4_COMMON__QPLL0_SDM_CFG1];
  QPLL0_SDM_CFG2_REG = ATTR[`GTYE4_COMMON__QPLL0_SDM_CFG2];
  QPLL1CLKOUT_RATE_REG = ATTR[`GTYE4_COMMON__QPLL1CLKOUT_RATE];
  QPLL1_CFG0_REG = ATTR[`GTYE4_COMMON__QPLL1_CFG0];
  QPLL1_CFG1_G3_REG = ATTR[`GTYE4_COMMON__QPLL1_CFG1_G3];
  QPLL1_CFG1_REG = ATTR[`GTYE4_COMMON__QPLL1_CFG1];
  QPLL1_CFG2_G3_REG = ATTR[`GTYE4_COMMON__QPLL1_CFG2_G3];
  QPLL1_CFG2_REG = ATTR[`GTYE4_COMMON__QPLL1_CFG2];
  QPLL1_CFG3_REG = ATTR[`GTYE4_COMMON__QPLL1_CFG3];
  QPLL1_CFG4_REG = ATTR[`GTYE4_COMMON__QPLL1_CFG4];
  QPLL1_CP_G3_REG = ATTR[`GTYE4_COMMON__QPLL1_CP_G3];
  QPLL1_CP_REG = ATTR[`GTYE4_COMMON__QPLL1_CP];
  QPLL1_FBDIV_G3_REG = ATTR[`GTYE4_COMMON__QPLL1_FBDIV_G3];
  QPLL1_FBDIV_REG = ATTR[`GTYE4_COMMON__QPLL1_FBDIV];
  QPLL1_INIT_CFG0_REG = ATTR[`GTYE4_COMMON__QPLL1_INIT_CFG0];
  QPLL1_INIT_CFG1_REG = ATTR[`GTYE4_COMMON__QPLL1_INIT_CFG1];
  QPLL1_LOCK_CFG_G3_REG = ATTR[`GTYE4_COMMON__QPLL1_LOCK_CFG_G3];
  QPLL1_LOCK_CFG_REG = ATTR[`GTYE4_COMMON__QPLL1_LOCK_CFG];
  QPLL1_LPF_G3_REG = ATTR[`GTYE4_COMMON__QPLL1_LPF_G3];
  QPLL1_LPF_REG = ATTR[`GTYE4_COMMON__QPLL1_LPF];
  QPLL1_PCI_EN_REG = ATTR[`GTYE4_COMMON__QPLL1_PCI_EN];
  QPLL1_RATE_SW_USE_DRP_REG = ATTR[`GTYE4_COMMON__QPLL1_RATE_SW_USE_DRP];
  QPLL1_REFCLK_DIV_REG = ATTR[`GTYE4_COMMON__QPLL1_REFCLK_DIV];
  QPLL1_SDM_CFG0_REG = ATTR[`GTYE4_COMMON__QPLL1_SDM_CFG0];
  QPLL1_SDM_CFG1_REG = ATTR[`GTYE4_COMMON__QPLL1_SDM_CFG1];
  QPLL1_SDM_CFG2_REG = ATTR[`GTYE4_COMMON__QPLL1_SDM_CFG2];
  RSVD_ATTR0_REG = ATTR[`GTYE4_COMMON__RSVD_ATTR0];
  RSVD_ATTR1_REG = ATTR[`GTYE4_COMMON__RSVD_ATTR1];
  RSVD_ATTR2_REG = ATTR[`GTYE4_COMMON__RSVD_ATTR2];
  RSVD_ATTR3_REG = ATTR[`GTYE4_COMMON__RSVD_ATTR3];
  RXRECCLKOUT0_SEL_REG = ATTR[`GTYE4_COMMON__RXRECCLKOUT0_SEL];
  RXRECCLKOUT1_SEL_REG = ATTR[`GTYE4_COMMON__RXRECCLKOUT1_SEL];
  SARC_ENB_REG = ATTR[`GTYE4_COMMON__SARC_ENB];
  SARC_SEL_REG = ATTR[`GTYE4_COMMON__SARC_SEL];
  SDM0INITSEED0_0_REG = ATTR[`GTYE4_COMMON__SDM0INITSEED0_0];
  SDM0INITSEED0_1_REG = ATTR[`GTYE4_COMMON__SDM0INITSEED0_1];
  SDM1INITSEED0_0_REG = ATTR[`GTYE4_COMMON__SDM1INITSEED0_0];
  SDM1INITSEED0_1_REG = ATTR[`GTYE4_COMMON__SDM1INITSEED0_1];
  SIM_DEVICE_REG = ATTR[`GTYE4_COMMON__SIM_DEVICE];
  SIM_MODE_REG = ATTR[`GTYE4_COMMON__SIM_MODE];
  SIM_RESET_SPEEDUP_REG = ATTR[`GTYE4_COMMON__SIM_RESET_SPEEDUP];
  UB_CFG0_REG = ATTR[`GTYE4_COMMON__UB_CFG0];
  UB_CFG1_REG = ATTR[`GTYE4_COMMON__UB_CFG1];
  UB_CFG2_REG = ATTR[`GTYE4_COMMON__UB_CFG2];
  UB_CFG3_REG = ATTR[`GTYE4_COMMON__UB_CFG3];
  UB_CFG4_REG = ATTR[`GTYE4_COMMON__UB_CFG4];
  UB_CFG5_REG = ATTR[`GTYE4_COMMON__UB_CFG5];
  UB_CFG6_REG = ATTR[`GTYE4_COMMON__UB_CFG6];
end

// procedures to override, read attribute values

task write_attr;
  input  [`GTYE4_COMMON_ADDR_SZ-1:0] addr;
  input  [`GTYE4_COMMON_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`GTYE4_COMMON_DATA_SZ-1:0] read_attr;
  input  [`GTYE4_COMMON_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
