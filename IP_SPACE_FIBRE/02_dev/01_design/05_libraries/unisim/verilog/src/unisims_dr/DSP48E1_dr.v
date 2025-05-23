`include "B_DSP48E1_defines.vh"

reg [`DSP48E1_DATA_SZ-1:0] ATTR [0:`DSP48E1_ADDR_N-1];
reg [`DSP48E1__ACASCREG_SZ-1:0] ACASCREG_REG = ACASCREG;
reg [`DSP48E1__ADREG_SZ-1:0] ADREG_REG = ADREG;
reg [`DSP48E1__ALUMODEREG_SZ-1:0] ALUMODEREG_REG = ALUMODEREG;
reg [`DSP48E1__AREG_SZ-1:0] AREG_REG = AREG;
reg [`DSP48E1__AUTORESET_PATDET_SZ:1] AUTORESET_PATDET_REG = AUTORESET_PATDET;
reg [`DSP48E1__A_INPUT_SZ:1] A_INPUT_REG = A_INPUT;
reg [`DSP48E1__BCASCREG_SZ-1:0] BCASCREG_REG = BCASCREG;
reg [`DSP48E1__BREG_SZ-1:0] BREG_REG = BREG;
reg [`DSP48E1__B_INPUT_SZ:1] B_INPUT_REG = B_INPUT;
reg [`DSP48E1__CARRYINREG_SZ-1:0] CARRYINREG_REG = CARRYINREG;
reg [`DSP48E1__CARRYINSELREG_SZ-1:0] CARRYINSELREG_REG = CARRYINSELREG;
reg [`DSP48E1__CREG_SZ-1:0] CREG_REG = CREG;
reg [`DSP48E1__DREG_SZ-1:0] DREG_REG = DREG;
reg [`DSP48E1__INMODEREG_SZ-1:0] INMODEREG_REG = INMODEREG;
reg [`DSP48E1__IS_ALUMODE_INVERTED_SZ-1:0] IS_ALUMODE_INVERTED_REG = IS_ALUMODE_INVERTED;
reg IS_CARRYIN_INVERTED_REG = IS_CARRYIN_INVERTED;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
reg [`DSP48E1__IS_INMODE_INVERTED_SZ-1:0] IS_INMODE_INVERTED_REG = IS_INMODE_INVERTED;
reg [`DSP48E1__IS_OPMODE_INVERTED_SZ-1:0] IS_OPMODE_INVERTED_REG = IS_OPMODE_INVERTED;
reg [`DSP48E1__MASK_SZ-1:0] MASK_REG = MASK;
reg [`DSP48E1__MREG_SZ-1:0] MREG_REG = MREG;
reg [`DSP48E1__OPMODEREG_SZ-1:0] OPMODEREG_REG = OPMODEREG;
reg [`DSP48E1__PATTERN_SZ-1:0] PATTERN_REG = PATTERN;
reg [`DSP48E1__PREG_SZ-1:0] PREG_REG = PREG;
reg [`DSP48E1__SEL_MASK_SZ:1] SEL_MASK_REG = SEL_MASK;
reg [`DSP48E1__SEL_PATTERN_SZ:1] SEL_PATTERN_REG = SEL_PATTERN;
reg [`DSP48E1__USE_DPORT_SZ:1] USE_DPORT_REG = USE_DPORT;
reg [`DSP48E1__USE_MULT_SZ:1] USE_MULT_REG = USE_MULT;
reg [`DSP48E1__USE_PATTERN_DETECT_SZ:1] USE_PATTERN_DETECT_REG = USE_PATTERN_DETECT;
reg [`DSP48E1__USE_SIMD_SZ:1] USE_SIMD_REG = USE_SIMD;

initial begin
  ATTR[`DSP48E1__ACASCREG] = ACASCREG;
  ATTR[`DSP48E1__ADREG] = ADREG;
  ATTR[`DSP48E1__ALUMODEREG] = ALUMODEREG;
  ATTR[`DSP48E1__AREG] = AREG;
  ATTR[`DSP48E1__AUTORESET_PATDET] = AUTORESET_PATDET;
  ATTR[`DSP48E1__A_INPUT] = A_INPUT;
  ATTR[`DSP48E1__BCASCREG] = BCASCREG;
  ATTR[`DSP48E1__BREG] = BREG;
  ATTR[`DSP48E1__B_INPUT] = B_INPUT;
  ATTR[`DSP48E1__CARRYINREG] = CARRYINREG;
  ATTR[`DSP48E1__CARRYINSELREG] = CARRYINSELREG;
  ATTR[`DSP48E1__CREG] = CREG;
  ATTR[`DSP48E1__DREG] = DREG;
  ATTR[`DSP48E1__INMODEREG] = INMODEREG;
  ATTR[`DSP48E1__IS_ALUMODE_INVERTED] = IS_ALUMODE_INVERTED;
  ATTR[`DSP48E1__IS_CARRYIN_INVERTED] = IS_CARRYIN_INVERTED;
  ATTR[`DSP48E1__IS_CLK_INVERTED] = IS_CLK_INVERTED;
  ATTR[`DSP48E1__IS_INMODE_INVERTED] = IS_INMODE_INVERTED;
  ATTR[`DSP48E1__IS_OPMODE_INVERTED] = IS_OPMODE_INVERTED;
  ATTR[`DSP48E1__MASK] = MASK;
  ATTR[`DSP48E1__MREG] = MREG;
  ATTR[`DSP48E1__OPMODEREG] = OPMODEREG;
  ATTR[`DSP48E1__PATTERN] = PATTERN;
  ATTR[`DSP48E1__PREG] = PREG;
  ATTR[`DSP48E1__SEL_MASK] = SEL_MASK;
  ATTR[`DSP48E1__SEL_PATTERN] = SEL_PATTERN;
  ATTR[`DSP48E1__USE_DPORT] = USE_DPORT;
  ATTR[`DSP48E1__USE_MULT] = USE_MULT;
  ATTR[`DSP48E1__USE_PATTERN_DETECT] = USE_PATTERN_DETECT;
  ATTR[`DSP48E1__USE_SIMD] = USE_SIMD;
end

always @(trig_attr) begin
  ACASCREG_REG = ATTR[`DSP48E1__ACASCREG];
  ADREG_REG = ATTR[`DSP48E1__ADREG];
  ALUMODEREG_REG = ATTR[`DSP48E1__ALUMODEREG];
  AREG_REG = ATTR[`DSP48E1__AREG];
  AUTORESET_PATDET_REG = ATTR[`DSP48E1__AUTORESET_PATDET];
  A_INPUT_REG = ATTR[`DSP48E1__A_INPUT];
  BCASCREG_REG = ATTR[`DSP48E1__BCASCREG];
  BREG_REG = ATTR[`DSP48E1__BREG];
  B_INPUT_REG = ATTR[`DSP48E1__B_INPUT];
  CARRYINREG_REG = ATTR[`DSP48E1__CARRYINREG];
  CARRYINSELREG_REG = ATTR[`DSP48E1__CARRYINSELREG];
  CREG_REG = ATTR[`DSP48E1__CREG];
  DREG_REG = ATTR[`DSP48E1__DREG];
  INMODEREG_REG = ATTR[`DSP48E1__INMODEREG];
  IS_ALUMODE_INVERTED_REG = ATTR[`DSP48E1__IS_ALUMODE_INVERTED];
  IS_CARRYIN_INVERTED_REG = ATTR[`DSP48E1__IS_CARRYIN_INVERTED];
  IS_CLK_INVERTED_REG = ATTR[`DSP48E1__IS_CLK_INVERTED];
  IS_INMODE_INVERTED_REG = ATTR[`DSP48E1__IS_INMODE_INVERTED];
  IS_OPMODE_INVERTED_REG = ATTR[`DSP48E1__IS_OPMODE_INVERTED];
  MASK_REG = ATTR[`DSP48E1__MASK];
  MREG_REG = ATTR[`DSP48E1__MREG];
  OPMODEREG_REG = ATTR[`DSP48E1__OPMODEREG];
  PATTERN_REG = ATTR[`DSP48E1__PATTERN];
  PREG_REG = ATTR[`DSP48E1__PREG];
  SEL_MASK_REG = ATTR[`DSP48E1__SEL_MASK];
  SEL_PATTERN_REG = ATTR[`DSP48E1__SEL_PATTERN];
  USE_DPORT_REG = ATTR[`DSP48E1__USE_DPORT];
  USE_MULT_REG = ATTR[`DSP48E1__USE_MULT];
  USE_PATTERN_DETECT_REG = ATTR[`DSP48E1__USE_PATTERN_DETECT];
  USE_SIMD_REG = ATTR[`DSP48E1__USE_SIMD];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP48E1_ADDR_SZ-1:0] addr;
  input  [`DSP48E1_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP48E1_DATA_SZ-1:0] read_attr;
  input  [`DSP48E1_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
