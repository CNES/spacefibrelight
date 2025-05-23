`include "B_URAM288_defines.vh"

reg [`URAM288_DATA_SZ-1:0] ATTR [0:`URAM288_ADDR_N-1];
reg [`URAM288__AUTO_SLEEP_LATENCY_SZ-1:0] AUTO_SLEEP_LATENCY_REG = AUTO_SLEEP_LATENCY;
reg [`URAM288__AVG_CONS_INACTIVE_CYCLES_SZ-1:0] AVG_CONS_INACTIVE_CYCLES_REG = AVG_CONS_INACTIVE_CYCLES;
reg [`URAM288__BWE_MODE_A_SZ:1] BWE_MODE_A_REG = BWE_MODE_A;
reg [`URAM288__BWE_MODE_B_SZ:1] BWE_MODE_B_REG = BWE_MODE_B;
reg [`URAM288__CASCADE_ORDER_A_SZ:1] CASCADE_ORDER_A_REG = CASCADE_ORDER_A;
reg [`URAM288__CASCADE_ORDER_B_SZ:1] CASCADE_ORDER_B_REG = CASCADE_ORDER_B;
reg [`URAM288__EN_AUTO_SLEEP_MODE_SZ:1] EN_AUTO_SLEEP_MODE_REG = EN_AUTO_SLEEP_MODE;
reg [`URAM288__EN_ECC_RD_A_SZ:1] EN_ECC_RD_A_REG = EN_ECC_RD_A;
reg [`URAM288__EN_ECC_RD_B_SZ:1] EN_ECC_RD_B_REG = EN_ECC_RD_B;
reg [`URAM288__EN_ECC_WR_A_SZ:1] EN_ECC_WR_A_REG = EN_ECC_WR_A;
reg [`URAM288__EN_ECC_WR_B_SZ:1] EN_ECC_WR_B_REG = EN_ECC_WR_B;
reg [`URAM288__IREG_PRE_A_SZ:1] IREG_PRE_A_REG = IREG_PRE_A;
reg [`URAM288__IREG_PRE_B_SZ:1] IREG_PRE_B_REG = IREG_PRE_B;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
reg IS_EN_A_INVERTED_REG = IS_EN_A_INVERTED;
reg IS_EN_B_INVERTED_REG = IS_EN_B_INVERTED;
reg IS_RDB_WR_A_INVERTED_REG = IS_RDB_WR_A_INVERTED;
reg IS_RDB_WR_B_INVERTED_REG = IS_RDB_WR_B_INVERTED;
reg IS_RST_A_INVERTED_REG = IS_RST_A_INVERTED;
reg IS_RST_B_INVERTED_REG = IS_RST_B_INVERTED;
reg [`URAM288__MATRIX_ID_SZ:1] MATRIX_ID_REG = MATRIX_ID;
reg [`URAM288__NUM_UNIQUE_SELF_ADDR_A_SZ-1:0] NUM_UNIQUE_SELF_ADDR_A_REG = NUM_UNIQUE_SELF_ADDR_A;
reg [`URAM288__NUM_UNIQUE_SELF_ADDR_B_SZ-1:0] NUM_UNIQUE_SELF_ADDR_B_REG = NUM_UNIQUE_SELF_ADDR_B;
reg [`URAM288__NUM_URAM_IN_MATRIX_SZ-1:0] NUM_URAM_IN_MATRIX_REG = NUM_URAM_IN_MATRIX;
reg [`URAM288__OREG_A_SZ:1] OREG_A_REG = OREG_A;
reg [`URAM288__OREG_B_SZ:1] OREG_B_REG = OREG_B;
reg [`URAM288__OREG_ECC_A_SZ:1] OREG_ECC_A_REG = OREG_ECC_A;
reg [`URAM288__OREG_ECC_B_SZ:1] OREG_ECC_B_REG = OREG_ECC_B;
reg [`URAM288__REG_CAS_A_SZ:1] REG_CAS_A_REG = REG_CAS_A;
reg [`URAM288__REG_CAS_B_SZ:1] REG_CAS_B_REG = REG_CAS_B;
reg [`URAM288__RST_MODE_A_SZ:1] RST_MODE_A_REG = RST_MODE_A;
reg [`URAM288__RST_MODE_B_SZ:1] RST_MODE_B_REG = RST_MODE_B;
reg [`URAM288__SELF_ADDR_A_SZ-1:0] SELF_ADDR_A_REG = SELF_ADDR_A;
reg [`URAM288__SELF_ADDR_B_SZ-1:0] SELF_ADDR_B_REG = SELF_ADDR_B;
reg [`URAM288__SELF_MASK_A_SZ-1:0] SELF_MASK_A_REG = SELF_MASK_A;
reg [`URAM288__SELF_MASK_B_SZ-1:0] SELF_MASK_B_REG = SELF_MASK_B;
reg [`URAM288__USE_EXT_CE_A_SZ:1] USE_EXT_CE_A_REG = USE_EXT_CE_A;
reg [`URAM288__USE_EXT_CE_B_SZ:1] USE_EXT_CE_B_REG = USE_EXT_CE_B;

initial begin
  ATTR[`URAM288__AUTO_SLEEP_LATENCY] = AUTO_SLEEP_LATENCY;
  ATTR[`URAM288__AVG_CONS_INACTIVE_CYCLES] = AVG_CONS_INACTIVE_CYCLES;
  ATTR[`URAM288__BWE_MODE_A] = BWE_MODE_A;
  ATTR[`URAM288__BWE_MODE_B] = BWE_MODE_B;
  ATTR[`URAM288__CASCADE_ORDER_A] = CASCADE_ORDER_A;
  ATTR[`URAM288__CASCADE_ORDER_B] = CASCADE_ORDER_B;
  ATTR[`URAM288__EN_AUTO_SLEEP_MODE] = EN_AUTO_SLEEP_MODE;
  ATTR[`URAM288__EN_ECC_RD_A] = EN_ECC_RD_A;
  ATTR[`URAM288__EN_ECC_RD_B] = EN_ECC_RD_B;
  ATTR[`URAM288__EN_ECC_WR_A] = EN_ECC_WR_A;
  ATTR[`URAM288__EN_ECC_WR_B] = EN_ECC_WR_B;
  ATTR[`URAM288__IREG_PRE_A] = IREG_PRE_A;
  ATTR[`URAM288__IREG_PRE_B] = IREG_PRE_B;
  ATTR[`URAM288__IS_CLK_INVERTED] = IS_CLK_INVERTED;
  ATTR[`URAM288__IS_EN_A_INVERTED] = IS_EN_A_INVERTED;
  ATTR[`URAM288__IS_EN_B_INVERTED] = IS_EN_B_INVERTED;
  ATTR[`URAM288__IS_RDB_WR_A_INVERTED] = IS_RDB_WR_A_INVERTED;
  ATTR[`URAM288__IS_RDB_WR_B_INVERTED] = IS_RDB_WR_B_INVERTED;
  ATTR[`URAM288__IS_RST_A_INVERTED] = IS_RST_A_INVERTED;
  ATTR[`URAM288__IS_RST_B_INVERTED] = IS_RST_B_INVERTED;
  ATTR[`URAM288__MATRIX_ID] = MATRIX_ID;
  ATTR[`URAM288__NUM_UNIQUE_SELF_ADDR_A] = NUM_UNIQUE_SELF_ADDR_A;
  ATTR[`URAM288__NUM_UNIQUE_SELF_ADDR_B] = NUM_UNIQUE_SELF_ADDR_B;
  ATTR[`URAM288__NUM_URAM_IN_MATRIX] = NUM_URAM_IN_MATRIX;
  ATTR[`URAM288__OREG_A] = OREG_A;
  ATTR[`URAM288__OREG_B] = OREG_B;
  ATTR[`URAM288__OREG_ECC_A] = OREG_ECC_A;
  ATTR[`URAM288__OREG_ECC_B] = OREG_ECC_B;
  ATTR[`URAM288__REG_CAS_A] = REG_CAS_A;
  ATTR[`URAM288__REG_CAS_B] = REG_CAS_B;
  ATTR[`URAM288__RST_MODE_A] = RST_MODE_A;
  ATTR[`URAM288__RST_MODE_B] = RST_MODE_B;
  ATTR[`URAM288__SELF_ADDR_A] = SELF_ADDR_A;
  ATTR[`URAM288__SELF_ADDR_B] = SELF_ADDR_B;
  ATTR[`URAM288__SELF_MASK_A] = SELF_MASK_A;
  ATTR[`URAM288__SELF_MASK_B] = SELF_MASK_B;
  ATTR[`URAM288__USE_EXT_CE_A] = USE_EXT_CE_A;
  ATTR[`URAM288__USE_EXT_CE_B] = USE_EXT_CE_B;
end

always @(trig_attr) begin
  AUTO_SLEEP_LATENCY_REG = ATTR[`URAM288__AUTO_SLEEP_LATENCY];
  AVG_CONS_INACTIVE_CYCLES_REG = ATTR[`URAM288__AVG_CONS_INACTIVE_CYCLES];
  BWE_MODE_A_REG = ATTR[`URAM288__BWE_MODE_A];
  BWE_MODE_B_REG = ATTR[`URAM288__BWE_MODE_B];
  CASCADE_ORDER_A_REG = ATTR[`URAM288__CASCADE_ORDER_A];
  CASCADE_ORDER_B_REG = ATTR[`URAM288__CASCADE_ORDER_B];
  EN_AUTO_SLEEP_MODE_REG = ATTR[`URAM288__EN_AUTO_SLEEP_MODE];
  EN_ECC_RD_A_REG = ATTR[`URAM288__EN_ECC_RD_A];
  EN_ECC_RD_B_REG = ATTR[`URAM288__EN_ECC_RD_B];
  EN_ECC_WR_A_REG = ATTR[`URAM288__EN_ECC_WR_A];
  EN_ECC_WR_B_REG = ATTR[`URAM288__EN_ECC_WR_B];
  IREG_PRE_A_REG = ATTR[`URAM288__IREG_PRE_A];
  IREG_PRE_B_REG = ATTR[`URAM288__IREG_PRE_B];
  IS_CLK_INVERTED_REG = ATTR[`URAM288__IS_CLK_INVERTED];
  IS_EN_A_INVERTED_REG = ATTR[`URAM288__IS_EN_A_INVERTED];
  IS_EN_B_INVERTED_REG = ATTR[`URAM288__IS_EN_B_INVERTED];
  IS_RDB_WR_A_INVERTED_REG = ATTR[`URAM288__IS_RDB_WR_A_INVERTED];
  IS_RDB_WR_B_INVERTED_REG = ATTR[`URAM288__IS_RDB_WR_B_INVERTED];
  IS_RST_A_INVERTED_REG = ATTR[`URAM288__IS_RST_A_INVERTED];
  IS_RST_B_INVERTED_REG = ATTR[`URAM288__IS_RST_B_INVERTED];
  MATRIX_ID_REG = ATTR[`URAM288__MATRIX_ID];
  NUM_UNIQUE_SELF_ADDR_A_REG = ATTR[`URAM288__NUM_UNIQUE_SELF_ADDR_A];
  NUM_UNIQUE_SELF_ADDR_B_REG = ATTR[`URAM288__NUM_UNIQUE_SELF_ADDR_B];
  NUM_URAM_IN_MATRIX_REG = ATTR[`URAM288__NUM_URAM_IN_MATRIX];
  OREG_A_REG = ATTR[`URAM288__OREG_A];
  OREG_B_REG = ATTR[`URAM288__OREG_B];
  OREG_ECC_A_REG = ATTR[`URAM288__OREG_ECC_A];
  OREG_ECC_B_REG = ATTR[`URAM288__OREG_ECC_B];
  REG_CAS_A_REG = ATTR[`URAM288__REG_CAS_A];
  REG_CAS_B_REG = ATTR[`URAM288__REG_CAS_B];
  RST_MODE_A_REG = ATTR[`URAM288__RST_MODE_A];
  RST_MODE_B_REG = ATTR[`URAM288__RST_MODE_B];
  SELF_ADDR_A_REG = ATTR[`URAM288__SELF_ADDR_A];
  SELF_ADDR_B_REG = ATTR[`URAM288__SELF_ADDR_B];
  SELF_MASK_A_REG = ATTR[`URAM288__SELF_MASK_A];
  SELF_MASK_B_REG = ATTR[`URAM288__SELF_MASK_B];
  USE_EXT_CE_A_REG = ATTR[`URAM288__USE_EXT_CE_A];
  USE_EXT_CE_B_REG = ATTR[`URAM288__USE_EXT_CE_B];
end

// procedures to override, read attribute values

task write_attr;
  input  [`URAM288_ADDR_SZ-1:0] addr;
  input  [`URAM288_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`URAM288_DATA_SZ-1:0] read_attr;
  input  [`URAM288_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
