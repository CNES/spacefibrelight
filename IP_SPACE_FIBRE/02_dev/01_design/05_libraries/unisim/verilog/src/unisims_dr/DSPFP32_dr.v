`include "B_DSPFP32_defines.vh"

reg [`DSPFP32_DATA_SZ-1:0] ATTR [0:`DSPFP32_ADDR_N-1];
reg [`DSPFP32__ACASCREG_SZ-1:0] ACASCREG_REG = ACASCREG;
reg [`DSPFP32__AREG_SZ-1:0] AREG_REG = AREG;
reg [`DSPFP32__A_FPTYPE_SZ:1] A_FPTYPE_REG = A_FPTYPE;
reg [`DSPFP32__A_INPUT_SZ:1] A_INPUT_REG = A_INPUT;
reg [`DSPFP32__BCASCSEL_SZ:1] BCASCSEL_REG = BCASCSEL;
reg [`DSPFP32__B_D_FPTYPE_SZ:1] B_D_FPTYPE_REG = B_D_FPTYPE;
reg [`DSPFP32__B_INPUT_SZ:1] B_INPUT_REG = B_INPUT;
reg [`DSPFP32__FPA_PREG_SZ-1:0] FPA_PREG_REG = FPA_PREG;
reg [`DSPFP32__FPBREG_SZ-1:0] FPBREG_REG = FPBREG;
reg [`DSPFP32__FPCREG_SZ-1:0] FPCREG_REG = FPCREG;
reg [`DSPFP32__FPDREG_SZ-1:0] FPDREG_REG = FPDREG;
reg [`DSPFP32__FPMPIPEREG_SZ-1:0] FPMPIPEREG_REG = FPMPIPEREG;
reg [`DSPFP32__FPM_PREG_SZ-1:0] FPM_PREG_REG = FPM_PREG;
reg [`DSPFP32__FPOPMREG_SZ-1:0] FPOPMREG_REG = FPOPMREG;
reg [`DSPFP32__INMODEREG_SZ-1:0] INMODEREG_REG = INMODEREG;
reg IS_ASYNC_RST_INVERTED_REG = IS_ASYNC_RST_INVERTED;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
reg IS_FPINMODE_INVERTED_REG = IS_FPINMODE_INVERTED;
reg [`DSPFP32__IS_FPOPMODE_INVERTED_SZ-1:0] IS_FPOPMODE_INVERTED_REG = IS_FPOPMODE_INVERTED;
reg IS_RSTA_INVERTED_REG = IS_RSTA_INVERTED;
reg IS_RSTB_INVERTED_REG = IS_RSTB_INVERTED;
reg IS_RSTC_INVERTED_REG = IS_RSTC_INVERTED;
reg IS_RSTD_INVERTED_REG = IS_RSTD_INVERTED;
reg IS_RSTFPA_INVERTED_REG = IS_RSTFPA_INVERTED;
reg IS_RSTFPINMODE_INVERTED_REG = IS_RSTFPINMODE_INVERTED;
reg IS_RSTFPMPIPE_INVERTED_REG = IS_RSTFPMPIPE_INVERTED;
reg IS_RSTFPM_INVERTED_REG = IS_RSTFPM_INVERTED;
reg IS_RSTFPOPMODE_INVERTED_REG = IS_RSTFPOPMODE_INVERTED;
reg [`DSPFP32__PCOUTSEL_SZ:1] PCOUTSEL_REG = PCOUTSEL;
reg [`DSPFP32__RESET_MODE_SZ:1] RESET_MODE_REG = RESET_MODE;
reg [`DSPFP32__USE_MULT_SZ:1] USE_MULT_REG = USE_MULT;

initial begin
  ATTR[`DSPFP32__ACASCREG] = ACASCREG;
  ATTR[`DSPFP32__AREG] = AREG;
  ATTR[`DSPFP32__A_FPTYPE] = A_FPTYPE;
  ATTR[`DSPFP32__A_INPUT] = A_INPUT;
  ATTR[`DSPFP32__BCASCSEL] = BCASCSEL;
  ATTR[`DSPFP32__B_D_FPTYPE] = B_D_FPTYPE;
  ATTR[`DSPFP32__B_INPUT] = B_INPUT;
  ATTR[`DSPFP32__FPA_PREG] = FPA_PREG;
  ATTR[`DSPFP32__FPBREG] = FPBREG;
  ATTR[`DSPFP32__FPCREG] = FPCREG;
  ATTR[`DSPFP32__FPDREG] = FPDREG;
  ATTR[`DSPFP32__FPMPIPEREG] = FPMPIPEREG;
  ATTR[`DSPFP32__FPM_PREG] = FPM_PREG;
  ATTR[`DSPFP32__FPOPMREG] = FPOPMREG;
  ATTR[`DSPFP32__INMODEREG] = INMODEREG;
  ATTR[`DSPFP32__IS_ASYNC_RST_INVERTED] = IS_ASYNC_RST_INVERTED;
  ATTR[`DSPFP32__IS_CLK_INVERTED] = IS_CLK_INVERTED;
  ATTR[`DSPFP32__IS_FPINMODE_INVERTED] = IS_FPINMODE_INVERTED;
  ATTR[`DSPFP32__IS_FPOPMODE_INVERTED] = IS_FPOPMODE_INVERTED;
  ATTR[`DSPFP32__IS_RSTA_INVERTED] = IS_RSTA_INVERTED;
  ATTR[`DSPFP32__IS_RSTB_INVERTED] = IS_RSTB_INVERTED;
  ATTR[`DSPFP32__IS_RSTC_INVERTED] = IS_RSTC_INVERTED;
  ATTR[`DSPFP32__IS_RSTD_INVERTED] = IS_RSTD_INVERTED;
  ATTR[`DSPFP32__IS_RSTFPA_INVERTED] = IS_RSTFPA_INVERTED;
  ATTR[`DSPFP32__IS_RSTFPINMODE_INVERTED] = IS_RSTFPINMODE_INVERTED;
  ATTR[`DSPFP32__IS_RSTFPMPIPE_INVERTED] = IS_RSTFPMPIPE_INVERTED;
  ATTR[`DSPFP32__IS_RSTFPM_INVERTED] = IS_RSTFPM_INVERTED;
  ATTR[`DSPFP32__IS_RSTFPOPMODE_INVERTED] = IS_RSTFPOPMODE_INVERTED;
  ATTR[`DSPFP32__PCOUTSEL] = PCOUTSEL;
  ATTR[`DSPFP32__RESET_MODE] = RESET_MODE;
  ATTR[`DSPFP32__USE_MULT] = USE_MULT;
end

always @(trig_attr) begin
  ACASCREG_REG = ATTR[`DSPFP32__ACASCREG];
  AREG_REG = ATTR[`DSPFP32__AREG];
  A_FPTYPE_REG = ATTR[`DSPFP32__A_FPTYPE];
  A_INPUT_REG = ATTR[`DSPFP32__A_INPUT];
  BCASCSEL_REG = ATTR[`DSPFP32__BCASCSEL];
  B_D_FPTYPE_REG = ATTR[`DSPFP32__B_D_FPTYPE];
  B_INPUT_REG = ATTR[`DSPFP32__B_INPUT];
  FPA_PREG_REG = ATTR[`DSPFP32__FPA_PREG];
  FPBREG_REG = ATTR[`DSPFP32__FPBREG];
  FPCREG_REG = ATTR[`DSPFP32__FPCREG];
  FPDREG_REG = ATTR[`DSPFP32__FPDREG];
  FPMPIPEREG_REG = ATTR[`DSPFP32__FPMPIPEREG];
  FPM_PREG_REG = ATTR[`DSPFP32__FPM_PREG];
  FPOPMREG_REG = ATTR[`DSPFP32__FPOPMREG];
  INMODEREG_REG = ATTR[`DSPFP32__INMODEREG];
  IS_ASYNC_RST_INVERTED_REG = ATTR[`DSPFP32__IS_ASYNC_RST_INVERTED];
  IS_CLK_INVERTED_REG = ATTR[`DSPFP32__IS_CLK_INVERTED];
  IS_FPINMODE_INVERTED_REG = ATTR[`DSPFP32__IS_FPINMODE_INVERTED];
  IS_FPOPMODE_INVERTED_REG = ATTR[`DSPFP32__IS_FPOPMODE_INVERTED];
  IS_RSTA_INVERTED_REG = ATTR[`DSPFP32__IS_RSTA_INVERTED];
  IS_RSTB_INVERTED_REG = ATTR[`DSPFP32__IS_RSTB_INVERTED];
  IS_RSTC_INVERTED_REG = ATTR[`DSPFP32__IS_RSTC_INVERTED];
  IS_RSTD_INVERTED_REG = ATTR[`DSPFP32__IS_RSTD_INVERTED];
  IS_RSTFPA_INVERTED_REG = ATTR[`DSPFP32__IS_RSTFPA_INVERTED];
  IS_RSTFPINMODE_INVERTED_REG = ATTR[`DSPFP32__IS_RSTFPINMODE_INVERTED];
  IS_RSTFPMPIPE_INVERTED_REG = ATTR[`DSPFP32__IS_RSTFPMPIPE_INVERTED];
  IS_RSTFPM_INVERTED_REG = ATTR[`DSPFP32__IS_RSTFPM_INVERTED];
  IS_RSTFPOPMODE_INVERTED_REG = ATTR[`DSPFP32__IS_RSTFPOPMODE_INVERTED];
  PCOUTSEL_REG = ATTR[`DSPFP32__PCOUTSEL];
  RESET_MODE_REG = ATTR[`DSPFP32__RESET_MODE];
  USE_MULT_REG = ATTR[`DSPFP32__USE_MULT];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSPFP32_ADDR_SZ-1:0] addr;
  input  [`DSPFP32_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSPFP32_DATA_SZ-1:0] read_attr;
  input  [`DSPFP32_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
