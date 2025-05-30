`include "B_GTHE3_COMMON_defines.vh"

reg [`GTHE3_COMMON_DATA_SZ-1:0] ATTR [0:`GTHE3_COMMON_ADDR_N-1];
reg [15:0] BIAS_CFG0_REG = BIAS_CFG0;
reg [15:0] BIAS_CFG1_REG = BIAS_CFG1;
reg [15:0] BIAS_CFG2_REG = BIAS_CFG2;
reg [15:0] BIAS_CFG3_REG = BIAS_CFG3;
reg [15:0] BIAS_CFG4_REG = BIAS_CFG4;
reg [9:0] BIAS_CFG_RSVD_REG = BIAS_CFG_RSVD;
reg [15:0] COMMON_CFG0_REG = COMMON_CFG0;
reg [15:0] COMMON_CFG1_REG = COMMON_CFG1;
reg [15:0] POR_CFG_REG = POR_CFG;
reg [15:0] QPLL0_CFG0_REG = QPLL0_CFG0;
reg [15:0] QPLL0_CFG1_REG = QPLL0_CFG1;
reg [15:0] QPLL0_CFG1_G3_REG = QPLL0_CFG1_G3;
reg [15:0] QPLL0_CFG2_REG = QPLL0_CFG2;
reg [15:0] QPLL0_CFG2_G3_REG = QPLL0_CFG2_G3;
reg [15:0] QPLL0_CFG3_REG = QPLL0_CFG3;
reg [15:0] QPLL0_CFG4_REG = QPLL0_CFG4;
reg [9:0] QPLL0_CP_REG = QPLL0_CP;
reg [9:0] QPLL0_CP_G3_REG = QPLL0_CP_G3;
reg [7:0] QPLL0_FBDIV_REG = QPLL0_FBDIV;
reg [7:0] QPLL0_FBDIV_G3_REG = QPLL0_FBDIV_G3;
reg [15:0] QPLL0_INIT_CFG0_REG = QPLL0_INIT_CFG0;
reg [7:0] QPLL0_INIT_CFG1_REG = QPLL0_INIT_CFG1;
reg [15:0] QPLL0_LOCK_CFG_REG = QPLL0_LOCK_CFG;
reg [15:0] QPLL0_LOCK_CFG_G3_REG = QPLL0_LOCK_CFG_G3;
reg [9:0] QPLL0_LPF_REG = QPLL0_LPF;
reg [9:0] QPLL0_LPF_G3_REG = QPLL0_LPF_G3;
reg [4:0] QPLL0_REFCLK_DIV_REG = QPLL0_REFCLK_DIV;
reg [15:0] QPLL0_SDM_CFG0_REG = QPLL0_SDM_CFG0;
reg [15:0] QPLL0_SDM_CFG1_REG = QPLL0_SDM_CFG1;
reg [15:0] QPLL0_SDM_CFG2_REG = QPLL0_SDM_CFG2;
reg [15:0] QPLL1_CFG0_REG = QPLL1_CFG0;
reg [15:0] QPLL1_CFG1_REG = QPLL1_CFG1;
reg [15:0] QPLL1_CFG1_G3_REG = QPLL1_CFG1_G3;
reg [15:0] QPLL1_CFG2_REG = QPLL1_CFG2;
reg [15:0] QPLL1_CFG2_G3_REG = QPLL1_CFG2_G3;
reg [15:0] QPLL1_CFG3_REG = QPLL1_CFG3;
reg [15:0] QPLL1_CFG4_REG = QPLL1_CFG4;
reg [9:0] QPLL1_CP_REG = QPLL1_CP;
reg [9:0] QPLL1_CP_G3_REG = QPLL1_CP_G3;
reg [7:0] QPLL1_FBDIV_REG = QPLL1_FBDIV;
reg [7:0] QPLL1_FBDIV_G3_REG = QPLL1_FBDIV_G3;
reg [15:0] QPLL1_INIT_CFG0_REG = QPLL1_INIT_CFG0;
reg [7:0] QPLL1_INIT_CFG1_REG = QPLL1_INIT_CFG1;
reg [15:0] QPLL1_LOCK_CFG_REG = QPLL1_LOCK_CFG;
reg [15:0] QPLL1_LOCK_CFG_G3_REG = QPLL1_LOCK_CFG_G3;
reg [9:0] QPLL1_LPF_REG = QPLL1_LPF;
reg [9:0] QPLL1_LPF_G3_REG = QPLL1_LPF_G3;
reg [4:0] QPLL1_REFCLK_DIV_REG = QPLL1_REFCLK_DIV;
reg [15:0] QPLL1_SDM_CFG0_REG = QPLL1_SDM_CFG0;
reg [15:0] QPLL1_SDM_CFG1_REG = QPLL1_SDM_CFG1;
reg [15:0] QPLL1_SDM_CFG2_REG = QPLL1_SDM_CFG2;
reg [15:0] RSVD_ATTR0_REG = RSVD_ATTR0;
reg [15:0] RSVD_ATTR1_REG = RSVD_ATTR1;
reg [15:0] RSVD_ATTR2_REG = RSVD_ATTR2;
reg [15:0] RSVD_ATTR3_REG = RSVD_ATTR3;
reg [1:0] RXRECCLKOUT0_SEL_REG = RXRECCLKOUT0_SEL;
reg [1:0] RXRECCLKOUT1_SEL_REG = RXRECCLKOUT1_SEL;
reg SARC_EN_REG = SARC_EN;
reg SARC_SEL_REG = SARC_SEL;
reg [15:0] SDM0DATA1_0_REG = SDM0DATA1_0;
reg [8:0] SDM0DATA1_1_REG = SDM0DATA1_1;
reg [15:0] SDM0INITSEED0_0_REG = SDM0INITSEED0_0;
reg [8:0] SDM0INITSEED0_1_REG = SDM0INITSEED0_1;
reg SDM0_DATA_PIN_SEL_REG = SDM0_DATA_PIN_SEL;
reg SDM0_WIDTH_PIN_SEL_REG = SDM0_WIDTH_PIN_SEL;
reg [15:0] SDM1DATA1_0_REG = SDM1DATA1_0;
reg [8:0] SDM1DATA1_1_REG = SDM1DATA1_1;
reg [15:0] SDM1INITSEED0_0_REG = SDM1INITSEED0_0;
reg [8:0] SDM1INITSEED0_1_REG = SDM1INITSEED0_1;
reg SDM1_DATA_PIN_SEL_REG = SDM1_DATA_PIN_SEL;
reg SDM1_WIDTH_PIN_SEL_REG = SDM1_WIDTH_PIN_SEL;
reg [40:1] SIM_RESET_SPEEDUP_REG = SIM_RESET_SPEEDUP;
reg [1:0] SIM_VERSION_REG = SIM_VERSION;

initial begin
  ATTR[`GTHE3_COMMON__BIAS_CFG0] = BIAS_CFG0;
  ATTR[`GTHE3_COMMON__BIAS_CFG1] = BIAS_CFG1;
  ATTR[`GTHE3_COMMON__BIAS_CFG2] = BIAS_CFG2;
  ATTR[`GTHE3_COMMON__BIAS_CFG3] = BIAS_CFG3;
  ATTR[`GTHE3_COMMON__BIAS_CFG4] = BIAS_CFG4;
  ATTR[`GTHE3_COMMON__BIAS_CFG_RSVD] = BIAS_CFG_RSVD;
  ATTR[`GTHE3_COMMON__COMMON_CFG0] = COMMON_CFG0;
  ATTR[`GTHE3_COMMON__COMMON_CFG1] = COMMON_CFG1;
  ATTR[`GTHE3_COMMON__POR_CFG] = POR_CFG;
  ATTR[`GTHE3_COMMON__QPLL0_CFG0] = QPLL0_CFG0;
  ATTR[`GTHE3_COMMON__QPLL0_CFG1] = QPLL0_CFG1;
  ATTR[`GTHE3_COMMON__QPLL0_CFG1_G3] = QPLL0_CFG1_G3;
  ATTR[`GTHE3_COMMON__QPLL0_CFG2] = QPLL0_CFG2;
  ATTR[`GTHE3_COMMON__QPLL0_CFG2_G3] = QPLL0_CFG2_G3;
  ATTR[`GTHE3_COMMON__QPLL0_CFG3] = QPLL0_CFG3;
  ATTR[`GTHE3_COMMON__QPLL0_CFG4] = QPLL0_CFG4;
  ATTR[`GTHE3_COMMON__QPLL0_CP] = QPLL0_CP;
  ATTR[`GTHE3_COMMON__QPLL0_CP_G3] = QPLL0_CP_G3;
  ATTR[`GTHE3_COMMON__QPLL0_FBDIV] = QPLL0_FBDIV;
  ATTR[`GTHE3_COMMON__QPLL0_FBDIV_G3] = QPLL0_FBDIV_G3;
  ATTR[`GTHE3_COMMON__QPLL0_INIT_CFG0] = QPLL0_INIT_CFG0;
  ATTR[`GTHE3_COMMON__QPLL0_INIT_CFG1] = QPLL0_INIT_CFG1;
  ATTR[`GTHE3_COMMON__QPLL0_LOCK_CFG] = QPLL0_LOCK_CFG;
  ATTR[`GTHE3_COMMON__QPLL0_LOCK_CFG_G3] = QPLL0_LOCK_CFG_G3;
  ATTR[`GTHE3_COMMON__QPLL0_LPF] = QPLL0_LPF;
  ATTR[`GTHE3_COMMON__QPLL0_LPF_G3] = QPLL0_LPF_G3;
  ATTR[`GTHE3_COMMON__QPLL0_REFCLK_DIV] = QPLL0_REFCLK_DIV;
  ATTR[`GTHE3_COMMON__QPLL0_SDM_CFG0] = QPLL0_SDM_CFG0;
  ATTR[`GTHE3_COMMON__QPLL0_SDM_CFG1] = QPLL0_SDM_CFG1;
  ATTR[`GTHE3_COMMON__QPLL0_SDM_CFG2] = QPLL0_SDM_CFG2;
  ATTR[`GTHE3_COMMON__QPLL1_CFG0] = QPLL1_CFG0;
  ATTR[`GTHE3_COMMON__QPLL1_CFG1] = QPLL1_CFG1;
  ATTR[`GTHE3_COMMON__QPLL1_CFG1_G3] = QPLL1_CFG1_G3;
  ATTR[`GTHE3_COMMON__QPLL1_CFG2] = QPLL1_CFG2;
  ATTR[`GTHE3_COMMON__QPLL1_CFG2_G3] = QPLL1_CFG2_G3;
  ATTR[`GTHE3_COMMON__QPLL1_CFG3] = QPLL1_CFG3;
  ATTR[`GTHE3_COMMON__QPLL1_CFG4] = QPLL1_CFG4;
  ATTR[`GTHE3_COMMON__QPLL1_CP] = QPLL1_CP;
  ATTR[`GTHE3_COMMON__QPLL1_CP_G3] = QPLL1_CP_G3;
  ATTR[`GTHE3_COMMON__QPLL1_FBDIV] = QPLL1_FBDIV;
  ATTR[`GTHE3_COMMON__QPLL1_FBDIV_G3] = QPLL1_FBDIV_G3;
  ATTR[`GTHE3_COMMON__QPLL1_INIT_CFG0] = QPLL1_INIT_CFG0;
  ATTR[`GTHE3_COMMON__QPLL1_INIT_CFG1] = QPLL1_INIT_CFG1;
  ATTR[`GTHE3_COMMON__QPLL1_LOCK_CFG] = QPLL1_LOCK_CFG;
  ATTR[`GTHE3_COMMON__QPLL1_LOCK_CFG_G3] = QPLL1_LOCK_CFG_G3;
  ATTR[`GTHE3_COMMON__QPLL1_LPF] = QPLL1_LPF;
  ATTR[`GTHE3_COMMON__QPLL1_LPF_G3] = QPLL1_LPF_G3;
  ATTR[`GTHE3_COMMON__QPLL1_REFCLK_DIV] = QPLL1_REFCLK_DIV;
  ATTR[`GTHE3_COMMON__QPLL1_SDM_CFG0] = QPLL1_SDM_CFG0;
  ATTR[`GTHE3_COMMON__QPLL1_SDM_CFG1] = QPLL1_SDM_CFG1;
  ATTR[`GTHE3_COMMON__QPLL1_SDM_CFG2] = QPLL1_SDM_CFG2;
  ATTR[`GTHE3_COMMON__RSVD_ATTR0] = RSVD_ATTR0;
  ATTR[`GTHE3_COMMON__RSVD_ATTR1] = RSVD_ATTR1;
  ATTR[`GTHE3_COMMON__RSVD_ATTR2] = RSVD_ATTR2;
  ATTR[`GTHE3_COMMON__RSVD_ATTR3] = RSVD_ATTR3;
  ATTR[`GTHE3_COMMON__RXRECCLKOUT0_SEL] = RXRECCLKOUT0_SEL;
  ATTR[`GTHE3_COMMON__RXRECCLKOUT1_SEL] = RXRECCLKOUT1_SEL;
  ATTR[`GTHE3_COMMON__SARC_EN] = SARC_EN;
  ATTR[`GTHE3_COMMON__SARC_SEL] = SARC_SEL;
  ATTR[`GTHE3_COMMON__SDM0DATA1_0] = SDM0DATA1_0;
  ATTR[`GTHE3_COMMON__SDM0DATA1_1] = SDM0DATA1_1;
  ATTR[`GTHE3_COMMON__SDM0INITSEED0_0] = SDM0INITSEED0_0;
  ATTR[`GTHE3_COMMON__SDM0INITSEED0_1] = SDM0INITSEED0_1;
  ATTR[`GTHE3_COMMON__SDM0_DATA_PIN_SEL] = SDM0_DATA_PIN_SEL;
  ATTR[`GTHE3_COMMON__SDM0_WIDTH_PIN_SEL] = SDM0_WIDTH_PIN_SEL;
  ATTR[`GTHE3_COMMON__SDM1DATA1_0] = SDM1DATA1_0;
  ATTR[`GTHE3_COMMON__SDM1DATA1_1] = SDM1DATA1_1;
  ATTR[`GTHE3_COMMON__SDM1INITSEED0_0] = SDM1INITSEED0_0;
  ATTR[`GTHE3_COMMON__SDM1INITSEED0_1] = SDM1INITSEED0_1;
  ATTR[`GTHE3_COMMON__SDM1_DATA_PIN_SEL] = SDM1_DATA_PIN_SEL;
  ATTR[`GTHE3_COMMON__SDM1_WIDTH_PIN_SEL] = SDM1_WIDTH_PIN_SEL;
  ATTR[`GTHE3_COMMON__SIM_RESET_SPEEDUP] = SIM_RESET_SPEEDUP;
  ATTR[`GTHE3_COMMON__SIM_VERSION] = SIM_VERSION;
end

always @(trig_attr) begin
  BIAS_CFG0_REG = ATTR[`GTHE3_COMMON__BIAS_CFG0];
  BIAS_CFG1_REG = ATTR[`GTHE3_COMMON__BIAS_CFG1];
  BIAS_CFG2_REG = ATTR[`GTHE3_COMMON__BIAS_CFG2];
  BIAS_CFG3_REG = ATTR[`GTHE3_COMMON__BIAS_CFG3];
  BIAS_CFG4_REG = ATTR[`GTHE3_COMMON__BIAS_CFG4];
  BIAS_CFG_RSVD_REG = ATTR[`GTHE3_COMMON__BIAS_CFG_RSVD];
  COMMON_CFG0_REG = ATTR[`GTHE3_COMMON__COMMON_CFG0];
  COMMON_CFG1_REG = ATTR[`GTHE3_COMMON__COMMON_CFG1];
  POR_CFG_REG = ATTR[`GTHE3_COMMON__POR_CFG];
  QPLL0_CFG0_REG = ATTR[`GTHE3_COMMON__QPLL0_CFG0];
  QPLL0_CFG1_G3_REG = ATTR[`GTHE3_COMMON__QPLL0_CFG1_G3];
  QPLL0_CFG1_REG = ATTR[`GTHE3_COMMON__QPLL0_CFG1];
  QPLL0_CFG2_G3_REG = ATTR[`GTHE3_COMMON__QPLL0_CFG2_G3];
  QPLL0_CFG2_REG = ATTR[`GTHE3_COMMON__QPLL0_CFG2];
  QPLL0_CFG3_REG = ATTR[`GTHE3_COMMON__QPLL0_CFG3];
  QPLL0_CFG4_REG = ATTR[`GTHE3_COMMON__QPLL0_CFG4];
  QPLL0_CP_G3_REG = ATTR[`GTHE3_COMMON__QPLL0_CP_G3];
  QPLL0_CP_REG = ATTR[`GTHE3_COMMON__QPLL0_CP];
  QPLL0_FBDIV_G3_REG = ATTR[`GTHE3_COMMON__QPLL0_FBDIV_G3];
  QPLL0_FBDIV_REG = ATTR[`GTHE3_COMMON__QPLL0_FBDIV];
  QPLL0_INIT_CFG0_REG = ATTR[`GTHE3_COMMON__QPLL0_INIT_CFG0];
  QPLL0_INIT_CFG1_REG = ATTR[`GTHE3_COMMON__QPLL0_INIT_CFG1];
  QPLL0_LOCK_CFG_G3_REG = ATTR[`GTHE3_COMMON__QPLL0_LOCK_CFG_G3];
  QPLL0_LOCK_CFG_REG = ATTR[`GTHE3_COMMON__QPLL0_LOCK_CFG];
  QPLL0_LPF_G3_REG = ATTR[`GTHE3_COMMON__QPLL0_LPF_G3];
  QPLL0_LPF_REG = ATTR[`GTHE3_COMMON__QPLL0_LPF];
  QPLL0_REFCLK_DIV_REG = ATTR[`GTHE3_COMMON__QPLL0_REFCLK_DIV];
  QPLL0_SDM_CFG0_REG = ATTR[`GTHE3_COMMON__QPLL0_SDM_CFG0];
  QPLL0_SDM_CFG1_REG = ATTR[`GTHE3_COMMON__QPLL0_SDM_CFG1];
  QPLL0_SDM_CFG2_REG = ATTR[`GTHE3_COMMON__QPLL0_SDM_CFG2];
  QPLL1_CFG0_REG = ATTR[`GTHE3_COMMON__QPLL1_CFG0];
  QPLL1_CFG1_G3_REG = ATTR[`GTHE3_COMMON__QPLL1_CFG1_G3];
  QPLL1_CFG1_REG = ATTR[`GTHE3_COMMON__QPLL1_CFG1];
  QPLL1_CFG2_G3_REG = ATTR[`GTHE3_COMMON__QPLL1_CFG2_G3];
  QPLL1_CFG2_REG = ATTR[`GTHE3_COMMON__QPLL1_CFG2];
  QPLL1_CFG3_REG = ATTR[`GTHE3_COMMON__QPLL1_CFG3];
  QPLL1_CFG4_REG = ATTR[`GTHE3_COMMON__QPLL1_CFG4];
  QPLL1_CP_G3_REG = ATTR[`GTHE3_COMMON__QPLL1_CP_G3];
  QPLL1_CP_REG = ATTR[`GTHE3_COMMON__QPLL1_CP];
  QPLL1_FBDIV_G3_REG = ATTR[`GTHE3_COMMON__QPLL1_FBDIV_G3];
  QPLL1_FBDIV_REG = ATTR[`GTHE3_COMMON__QPLL1_FBDIV];
  QPLL1_INIT_CFG0_REG = ATTR[`GTHE3_COMMON__QPLL1_INIT_CFG0];
  QPLL1_INIT_CFG1_REG = ATTR[`GTHE3_COMMON__QPLL1_INIT_CFG1];
  QPLL1_LOCK_CFG_G3_REG = ATTR[`GTHE3_COMMON__QPLL1_LOCK_CFG_G3];
  QPLL1_LOCK_CFG_REG = ATTR[`GTHE3_COMMON__QPLL1_LOCK_CFG];
  QPLL1_LPF_G3_REG = ATTR[`GTHE3_COMMON__QPLL1_LPF_G3];
  QPLL1_LPF_REG = ATTR[`GTHE3_COMMON__QPLL1_LPF];
  QPLL1_REFCLK_DIV_REG = ATTR[`GTHE3_COMMON__QPLL1_REFCLK_DIV];
  QPLL1_SDM_CFG0_REG = ATTR[`GTHE3_COMMON__QPLL1_SDM_CFG0];
  QPLL1_SDM_CFG1_REG = ATTR[`GTHE3_COMMON__QPLL1_SDM_CFG1];
  QPLL1_SDM_CFG2_REG = ATTR[`GTHE3_COMMON__QPLL1_SDM_CFG2];
  RSVD_ATTR0_REG = ATTR[`GTHE3_COMMON__RSVD_ATTR0];
  RSVD_ATTR1_REG = ATTR[`GTHE3_COMMON__RSVD_ATTR1];
  RSVD_ATTR2_REG = ATTR[`GTHE3_COMMON__RSVD_ATTR2];
  RSVD_ATTR3_REG = ATTR[`GTHE3_COMMON__RSVD_ATTR3];
  RXRECCLKOUT0_SEL_REG = ATTR[`GTHE3_COMMON__RXRECCLKOUT0_SEL];
  RXRECCLKOUT1_SEL_REG = ATTR[`GTHE3_COMMON__RXRECCLKOUT1_SEL];
  SARC_EN_REG = ATTR[`GTHE3_COMMON__SARC_EN];
  SARC_SEL_REG = ATTR[`GTHE3_COMMON__SARC_SEL];
  SDM0DATA1_0_REG = ATTR[`GTHE3_COMMON__SDM0DATA1_0];
  SDM0DATA1_1_REG = ATTR[`GTHE3_COMMON__SDM0DATA1_1];
  SDM0INITSEED0_0_REG = ATTR[`GTHE3_COMMON__SDM0INITSEED0_0];
  SDM0INITSEED0_1_REG = ATTR[`GTHE3_COMMON__SDM0INITSEED0_1];
  SDM0_DATA_PIN_SEL_REG = ATTR[`GTHE3_COMMON__SDM0_DATA_PIN_SEL];
  SDM0_WIDTH_PIN_SEL_REG = ATTR[`GTHE3_COMMON__SDM0_WIDTH_PIN_SEL];
  SDM1DATA1_0_REG = ATTR[`GTHE3_COMMON__SDM1DATA1_0];
  SDM1DATA1_1_REG = ATTR[`GTHE3_COMMON__SDM1DATA1_1];
  SDM1INITSEED0_0_REG = ATTR[`GTHE3_COMMON__SDM1INITSEED0_0];
  SDM1INITSEED0_1_REG = ATTR[`GTHE3_COMMON__SDM1INITSEED0_1];
  SDM1_DATA_PIN_SEL_REG = ATTR[`GTHE3_COMMON__SDM1_DATA_PIN_SEL];
  SDM1_WIDTH_PIN_SEL_REG = ATTR[`GTHE3_COMMON__SDM1_WIDTH_PIN_SEL];
  SIM_RESET_SPEEDUP_REG = ATTR[`GTHE3_COMMON__SIM_RESET_SPEEDUP];
  SIM_VERSION_REG = ATTR[`GTHE3_COMMON__SIM_VERSION];
end

// procedures to override, read attribute values

task write_attr;
  input  [`GTHE3_COMMON_ADDR_SZ-1:0] addr;
  input  [`GTHE3_COMMON_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`GTHE3_COMMON_DATA_SZ-1:0] read_attr;
  input  [`GTHE3_COMMON_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
