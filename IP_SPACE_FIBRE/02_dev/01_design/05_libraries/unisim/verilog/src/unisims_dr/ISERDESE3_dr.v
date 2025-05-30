`include "B_ISERDESE3_defines.vh"

reg [`ISERDESE3_DATA_SZ-1:0] ATTR [0:`ISERDESE3_ADDR_N-1];
reg [`ISERDESE3__DATA_WIDTH_SZ-1:0] DATA_WIDTH_REG = DATA_WIDTH;
reg [`ISERDESE3__DDR_CLK_EDGE_SZ:1] DDR_CLK_EDGE_REG = DDR_CLK_EDGE;
reg [`ISERDESE3__FIFO_ENABLE_SZ:1] FIFO_ENABLE_REG = FIFO_ENABLE;
reg [`ISERDESE3__FIFO_SYNC_MODE_SZ:1] FIFO_SYNC_MODE_REG = FIFO_SYNC_MODE;
reg [`ISERDESE3__IDDR_MODE_SZ:1] IDDR_MODE_REG = IDDR_MODE;
reg IS_CLK_B_INVERTED_REG = IS_CLK_B_INVERTED;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
reg IS_RST_INVERTED_REG = IS_RST_INVERTED;
reg [`ISERDESE3__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;
real SIM_VERSION_REG = SIM_VERSION;

initial begin
  ATTR[`ISERDESE3__DATA_WIDTH] = DATA_WIDTH;
  ATTR[`ISERDESE3__DDR_CLK_EDGE] = DDR_CLK_EDGE;
  ATTR[`ISERDESE3__FIFO_ENABLE] = FIFO_ENABLE;
  ATTR[`ISERDESE3__FIFO_SYNC_MODE] = FIFO_SYNC_MODE;
  ATTR[`ISERDESE3__IDDR_MODE] = IDDR_MODE;
  ATTR[`ISERDESE3__IS_CLK_B_INVERTED] = IS_CLK_B_INVERTED;
  ATTR[`ISERDESE3__IS_CLK_INVERTED] = IS_CLK_INVERTED;
  ATTR[`ISERDESE3__IS_RST_INVERTED] = IS_RST_INVERTED;
  ATTR[`ISERDESE3__SIM_DEVICE] = SIM_DEVICE;
  ATTR[`ISERDESE3__SIM_VERSION] = $realtobits(SIM_VERSION);
end

always @(trig_attr) begin
  DATA_WIDTH_REG = ATTR[`ISERDESE3__DATA_WIDTH];
  DDR_CLK_EDGE_REG = ATTR[`ISERDESE3__DDR_CLK_EDGE];
  FIFO_ENABLE_REG = ATTR[`ISERDESE3__FIFO_ENABLE];
  FIFO_SYNC_MODE_REG = ATTR[`ISERDESE3__FIFO_SYNC_MODE];
  IDDR_MODE_REG = ATTR[`ISERDESE3__IDDR_MODE];
  IS_CLK_B_INVERTED_REG = ATTR[`ISERDESE3__IS_CLK_B_INVERTED];
  IS_CLK_INVERTED_REG = ATTR[`ISERDESE3__IS_CLK_INVERTED];
  IS_RST_INVERTED_REG = ATTR[`ISERDESE3__IS_RST_INVERTED];
  SIM_DEVICE_REG = ATTR[`ISERDESE3__SIM_DEVICE];
  SIM_VERSION_REG = $bitstoreal(ATTR[`ISERDESE3__SIM_VERSION]);
end

// procedures to override, read attribute values

task write_attr;
  input  [`ISERDESE3_ADDR_SZ-1:0] addr;
  input  [`ISERDESE3_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`ISERDESE3_DATA_SZ-1:0] read_attr;
  input  [`ISERDESE3_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
