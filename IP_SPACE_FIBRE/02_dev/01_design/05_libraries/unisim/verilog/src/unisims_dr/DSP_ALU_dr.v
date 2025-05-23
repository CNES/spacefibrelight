`include "B_DSP_ALU_defines.vh"

reg [`DSP_ALU_DATA_SZ-1:0] ATTR [0:`DSP_ALU_ADDR_N-1];
reg [`DSP_ALU__ALUMODEREG_SZ-1:0] ALUMODEREG_REG = ALUMODEREG;
reg [`DSP_ALU__CARRYINREG_SZ-1:0] CARRYINREG_REG = CARRYINREG;
reg [`DSP_ALU__CARRYINSELREG_SZ-1:0] CARRYINSELREG_REG = CARRYINSELREG;
reg [`DSP_ALU__IS_ALUMODE_INVERTED_SZ-1:0] IS_ALUMODE_INVERTED_REG = IS_ALUMODE_INVERTED;
reg IS_CARRYIN_INVERTED_REG = IS_CARRYIN_INVERTED;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
reg [`DSP_ALU__IS_OPMODE_INVERTED_SZ-1:0] IS_OPMODE_INVERTED_REG = IS_OPMODE_INVERTED;
reg IS_RSTALLCARRYIN_INVERTED_REG = IS_RSTALLCARRYIN_INVERTED;
reg IS_RSTALUMODE_INVERTED_REG = IS_RSTALUMODE_INVERTED;
reg IS_RSTCTRL_INVERTED_REG = IS_RSTCTRL_INVERTED;
reg [`DSP_ALU__MREG_SZ-1:0] MREG_REG = MREG;
reg [`DSP_ALU__OPMODEREG_SZ-1:0] OPMODEREG_REG = OPMODEREG;
reg [`DSP_ALU__RND_SZ-1:0] RND_REG = RND;
reg [`DSP_ALU__USE_SIMD_SZ:1] USE_SIMD_REG = USE_SIMD;
reg [`DSP_ALU__USE_WIDEXOR_SZ:1] USE_WIDEXOR_REG = USE_WIDEXOR;
reg [`DSP_ALU__XORSIMD_SZ:1] XORSIMD_REG = XORSIMD;

initial begin
  ATTR[`DSP_ALU__ALUMODEREG] = ALUMODEREG;
  ATTR[`DSP_ALU__CARRYINREG] = CARRYINREG;
  ATTR[`DSP_ALU__CARRYINSELREG] = CARRYINSELREG;
  ATTR[`DSP_ALU__IS_ALUMODE_INVERTED] = IS_ALUMODE_INVERTED;
  ATTR[`DSP_ALU__IS_CARRYIN_INVERTED] = IS_CARRYIN_INVERTED;
  ATTR[`DSP_ALU__IS_CLK_INVERTED] = IS_CLK_INVERTED;
  ATTR[`DSP_ALU__IS_OPMODE_INVERTED] = IS_OPMODE_INVERTED;
  ATTR[`DSP_ALU__IS_RSTALLCARRYIN_INVERTED] = IS_RSTALLCARRYIN_INVERTED;
  ATTR[`DSP_ALU__IS_RSTALUMODE_INVERTED] = IS_RSTALUMODE_INVERTED;
  ATTR[`DSP_ALU__IS_RSTCTRL_INVERTED] = IS_RSTCTRL_INVERTED;
  ATTR[`DSP_ALU__MREG] = MREG;
  ATTR[`DSP_ALU__OPMODEREG] = OPMODEREG;
  ATTR[`DSP_ALU__RND] = RND;
  ATTR[`DSP_ALU__USE_SIMD] = USE_SIMD;
  ATTR[`DSP_ALU__USE_WIDEXOR] = USE_WIDEXOR;
  ATTR[`DSP_ALU__XORSIMD] = XORSIMD;
end

always @(trig_attr) begin
  ALUMODEREG_REG = ATTR[`DSP_ALU__ALUMODEREG];
  CARRYINREG_REG = ATTR[`DSP_ALU__CARRYINREG];
  CARRYINSELREG_REG = ATTR[`DSP_ALU__CARRYINSELREG];
  IS_ALUMODE_INVERTED_REG = ATTR[`DSP_ALU__IS_ALUMODE_INVERTED];
  IS_CARRYIN_INVERTED_REG = ATTR[`DSP_ALU__IS_CARRYIN_INVERTED];
  IS_CLK_INVERTED_REG = ATTR[`DSP_ALU__IS_CLK_INVERTED];
  IS_OPMODE_INVERTED_REG = ATTR[`DSP_ALU__IS_OPMODE_INVERTED];
  IS_RSTALLCARRYIN_INVERTED_REG = ATTR[`DSP_ALU__IS_RSTALLCARRYIN_INVERTED];
  IS_RSTALUMODE_INVERTED_REG = ATTR[`DSP_ALU__IS_RSTALUMODE_INVERTED];
  IS_RSTCTRL_INVERTED_REG = ATTR[`DSP_ALU__IS_RSTCTRL_INVERTED];
  MREG_REG = ATTR[`DSP_ALU__MREG];
  OPMODEREG_REG = ATTR[`DSP_ALU__OPMODEREG];
  RND_REG = ATTR[`DSP_ALU__RND];
  USE_SIMD_REG = ATTR[`DSP_ALU__USE_SIMD];
  USE_WIDEXOR_REG = ATTR[`DSP_ALU__USE_WIDEXOR];
  XORSIMD_REG = ATTR[`DSP_ALU__XORSIMD];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_ALU_ADDR_SZ-1:0] addr;
  input  [`DSP_ALU_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_ALU_DATA_SZ-1:0] read_attr;
  input  [`DSP_ALU_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
