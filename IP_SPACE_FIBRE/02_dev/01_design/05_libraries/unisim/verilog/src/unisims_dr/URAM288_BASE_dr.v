`include "B_URAM288_BASE_defines.vh"

reg [`URAM288_BASE_DATA_SZ-1:0] ATTR [0:`URAM288_BASE_ADDR_N-1];
reg [`URAM288_BASE__AUTO_SLEEP_LATENCY_SZ-1:0] AUTO_SLEEP_LATENCY_REG = AUTO_SLEEP_LATENCY;
reg [`URAM288_BASE__AVG_CONS_INACTIVE_CYCLES_SZ-1:0] AVG_CONS_INACTIVE_CYCLES_REG = AVG_CONS_INACTIVE_CYCLES;
reg [`URAM288_BASE__BWE_MODE_A_SZ:1] BWE_MODE_A_REG = BWE_MODE_A;
reg [`URAM288_BASE__BWE_MODE_B_SZ:1] BWE_MODE_B_REG = BWE_MODE_B;
reg [`URAM288_BASE__EN_AUTO_SLEEP_MODE_SZ:1] EN_AUTO_SLEEP_MODE_REG = EN_AUTO_SLEEP_MODE;
reg [`URAM288_BASE__EN_ECC_RD_A_SZ:1] EN_ECC_RD_A_REG = EN_ECC_RD_A;
reg [`URAM288_BASE__EN_ECC_RD_B_SZ:1] EN_ECC_RD_B_REG = EN_ECC_RD_B;
reg [`URAM288_BASE__EN_ECC_WR_A_SZ:1] EN_ECC_WR_A_REG = EN_ECC_WR_A;
reg [`URAM288_BASE__EN_ECC_WR_B_SZ:1] EN_ECC_WR_B_REG = EN_ECC_WR_B;
reg [`URAM288_BASE__IREG_PRE_A_SZ:1] IREG_PRE_A_REG = IREG_PRE_A;
reg [`URAM288_BASE__IREG_PRE_B_SZ:1] IREG_PRE_B_REG = IREG_PRE_B;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
reg IS_EN_A_INVERTED_REG = IS_EN_A_INVERTED;
reg IS_EN_B_INVERTED_REG = IS_EN_B_INVERTED;
reg IS_RDB_WR_A_INVERTED_REG = IS_RDB_WR_A_INVERTED;
reg IS_RDB_WR_B_INVERTED_REG = IS_RDB_WR_B_INVERTED;
reg IS_RST_A_INVERTED_REG = IS_RST_A_INVERTED;
reg IS_RST_B_INVERTED_REG = IS_RST_B_INVERTED;
reg [`URAM288_BASE__OREG_A_SZ:1] OREG_A_REG = OREG_A;
reg [`URAM288_BASE__OREG_B_SZ:1] OREG_B_REG = OREG_B;
reg [`URAM288_BASE__OREG_ECC_A_SZ:1] OREG_ECC_A_REG = OREG_ECC_A;
reg [`URAM288_BASE__OREG_ECC_B_SZ:1] OREG_ECC_B_REG = OREG_ECC_B;
reg [`URAM288_BASE__RST_MODE_A_SZ:1] RST_MODE_A_REG = RST_MODE_A;
reg [`URAM288_BASE__RST_MODE_B_SZ:1] RST_MODE_B_REG = RST_MODE_B;
reg [`URAM288_BASE__USE_EXT_CE_A_SZ:1] USE_EXT_CE_A_REG = USE_EXT_CE_A;
reg [`URAM288_BASE__USE_EXT_CE_B_SZ:1] USE_EXT_CE_B_REG = USE_EXT_CE_B;

initial begin
  ATTR[`URAM288_BASE__AUTO_SLEEP_LATENCY] = AUTO_SLEEP_LATENCY;
  ATTR[`URAM288_BASE__AVG_CONS_INACTIVE_CYCLES] = AVG_CONS_INACTIVE_CYCLES;
  ATTR[`URAM288_BASE__BWE_MODE_A] = BWE_MODE_A;
  ATTR[`URAM288_BASE__BWE_MODE_B] = BWE_MODE_B;
  ATTR[`URAM288_BASE__EN_AUTO_SLEEP_MODE] = EN_AUTO_SLEEP_MODE;
  ATTR[`URAM288_BASE__EN_ECC_RD_A] = EN_ECC_RD_A;
  ATTR[`URAM288_BASE__EN_ECC_RD_B] = EN_ECC_RD_B;
  ATTR[`URAM288_BASE__EN_ECC_WR_A] = EN_ECC_WR_A;
  ATTR[`URAM288_BASE__EN_ECC_WR_B] = EN_ECC_WR_B;
  ATTR[`URAM288_BASE__IREG_PRE_A] = IREG_PRE_A;
  ATTR[`URAM288_BASE__IREG_PRE_B] = IREG_PRE_B;
  ATTR[`URAM288_BASE__IS_CLK_INVERTED] = IS_CLK_INVERTED;
  ATTR[`URAM288_BASE__IS_EN_A_INVERTED] = IS_EN_A_INVERTED;
  ATTR[`URAM288_BASE__IS_EN_B_INVERTED] = IS_EN_B_INVERTED;
  ATTR[`URAM288_BASE__IS_RDB_WR_A_INVERTED] = IS_RDB_WR_A_INVERTED;
  ATTR[`URAM288_BASE__IS_RDB_WR_B_INVERTED] = IS_RDB_WR_B_INVERTED;
  ATTR[`URAM288_BASE__IS_RST_A_INVERTED] = IS_RST_A_INVERTED;
  ATTR[`URAM288_BASE__IS_RST_B_INVERTED] = IS_RST_B_INVERTED;
  ATTR[`URAM288_BASE__OREG_A] = OREG_A;
  ATTR[`URAM288_BASE__OREG_B] = OREG_B;
  ATTR[`URAM288_BASE__OREG_ECC_A] = OREG_ECC_A;
  ATTR[`URAM288_BASE__OREG_ECC_B] = OREG_ECC_B;
  ATTR[`URAM288_BASE__RST_MODE_A] = RST_MODE_A;
  ATTR[`URAM288_BASE__RST_MODE_B] = RST_MODE_B;
  ATTR[`URAM288_BASE__USE_EXT_CE_A] = USE_EXT_CE_A;
  ATTR[`URAM288_BASE__USE_EXT_CE_B] = USE_EXT_CE_B;
end

always @(trig_attr) begin
  AUTO_SLEEP_LATENCY_REG = ATTR[`URAM288_BASE__AUTO_SLEEP_LATENCY];
  AVG_CONS_INACTIVE_CYCLES_REG = ATTR[`URAM288_BASE__AVG_CONS_INACTIVE_CYCLES];
  BWE_MODE_A_REG = ATTR[`URAM288_BASE__BWE_MODE_A];
  BWE_MODE_B_REG = ATTR[`URAM288_BASE__BWE_MODE_B];
  EN_AUTO_SLEEP_MODE_REG = ATTR[`URAM288_BASE__EN_AUTO_SLEEP_MODE];
  EN_ECC_RD_A_REG = ATTR[`URAM288_BASE__EN_ECC_RD_A];
  EN_ECC_RD_B_REG = ATTR[`URAM288_BASE__EN_ECC_RD_B];
  EN_ECC_WR_A_REG = ATTR[`URAM288_BASE__EN_ECC_WR_A];
  EN_ECC_WR_B_REG = ATTR[`URAM288_BASE__EN_ECC_WR_B];
  IREG_PRE_A_REG = ATTR[`URAM288_BASE__IREG_PRE_A];
  IREG_PRE_B_REG = ATTR[`URAM288_BASE__IREG_PRE_B];
  IS_CLK_INVERTED_REG = ATTR[`URAM288_BASE__IS_CLK_INVERTED];
  IS_EN_A_INVERTED_REG = ATTR[`URAM288_BASE__IS_EN_A_INVERTED];
  IS_EN_B_INVERTED_REG = ATTR[`URAM288_BASE__IS_EN_B_INVERTED];
  IS_RDB_WR_A_INVERTED_REG = ATTR[`URAM288_BASE__IS_RDB_WR_A_INVERTED];
  IS_RDB_WR_B_INVERTED_REG = ATTR[`URAM288_BASE__IS_RDB_WR_B_INVERTED];
  IS_RST_A_INVERTED_REG = ATTR[`URAM288_BASE__IS_RST_A_INVERTED];
  IS_RST_B_INVERTED_REG = ATTR[`URAM288_BASE__IS_RST_B_INVERTED];
  OREG_A_REG = ATTR[`URAM288_BASE__OREG_A];
  OREG_B_REG = ATTR[`URAM288_BASE__OREG_B];
  OREG_ECC_A_REG = ATTR[`URAM288_BASE__OREG_ECC_A];
  OREG_ECC_B_REG = ATTR[`URAM288_BASE__OREG_ECC_B];
  RST_MODE_A_REG = ATTR[`URAM288_BASE__RST_MODE_A];
  RST_MODE_B_REG = ATTR[`URAM288_BASE__RST_MODE_B];
  USE_EXT_CE_A_REG = ATTR[`URAM288_BASE__USE_EXT_CE_A];
  USE_EXT_CE_B_REG = ATTR[`URAM288_BASE__USE_EXT_CE_B];
end

// procedures to override, read attribute values

task write_attr;
  input  [`URAM288_BASE_ADDR_SZ-1:0] addr;
  input  [`URAM288_BASE_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`URAM288_BASE_DATA_SZ-1:0] read_attr;
  input  [`URAM288_BASE_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
