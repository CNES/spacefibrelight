`include "B_TX_BITSLICE_defines.vh"

reg [`TX_BITSLICE_DATA_SZ-1:0] ATTR [0:`TX_BITSLICE_ADDR_N-1];
reg [`TX_BITSLICE__DATA_WIDTH_SZ-1:0] DATA_WIDTH_REG = DATA_WIDTH;
reg [`TX_BITSLICE__DELAY_FORMAT_SZ:1] DELAY_FORMAT_REG = DELAY_FORMAT;
reg [`TX_BITSLICE__DELAY_TYPE_SZ:1] DELAY_TYPE_REG = DELAY_TYPE;
reg [`TX_BITSLICE__DELAY_VALUE_SZ-1:0] DELAY_VALUE_REG = DELAY_VALUE;
reg [`TX_BITSLICE__ENABLE_PRE_EMPHASIS_SZ:1] ENABLE_PRE_EMPHASIS_REG = ENABLE_PRE_EMPHASIS;
reg INIT_REG = INIT;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
reg IS_RST_DLY_INVERTED_REG = IS_RST_DLY_INVERTED;
reg IS_RST_INVERTED_REG = IS_RST_INVERTED;
reg [`TX_BITSLICE__NATIVE_ODELAY_BYPASS_SZ:1] NATIVE_ODELAY_BYPASS_REG = NATIVE_ODELAY_BYPASS;
reg [`TX_BITSLICE__OUTPUT_PHASE_90_SZ:1] OUTPUT_PHASE_90_REG = OUTPUT_PHASE_90;
real REFCLK_FREQUENCY_REG = REFCLK_FREQUENCY;
reg [`TX_BITSLICE__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;
real SIM_VERSION_REG = SIM_VERSION;
reg [`TX_BITSLICE__TBYTE_CTL_SZ:1] TBYTE_CTL_REG = TBYTE_CTL;
reg [`TX_BITSLICE__UPDATE_MODE_SZ:1] UPDATE_MODE_REG = UPDATE_MODE;

initial begin
  ATTR[`TX_BITSLICE__DATA_WIDTH] = DATA_WIDTH;
  ATTR[`TX_BITSLICE__DELAY_FORMAT] = DELAY_FORMAT;
  ATTR[`TX_BITSLICE__DELAY_TYPE] = DELAY_TYPE;
  ATTR[`TX_BITSLICE__DELAY_VALUE] = DELAY_VALUE;
  ATTR[`TX_BITSLICE__ENABLE_PRE_EMPHASIS] = ENABLE_PRE_EMPHASIS;
  ATTR[`TX_BITSLICE__INIT] = INIT;
  ATTR[`TX_BITSLICE__IS_CLK_INVERTED] = IS_CLK_INVERTED;
  ATTR[`TX_BITSLICE__IS_RST_DLY_INVERTED] = IS_RST_DLY_INVERTED;
  ATTR[`TX_BITSLICE__IS_RST_INVERTED] = IS_RST_INVERTED;
  ATTR[`TX_BITSLICE__NATIVE_ODELAY_BYPASS] = NATIVE_ODELAY_BYPASS;
  ATTR[`TX_BITSLICE__OUTPUT_PHASE_90] = OUTPUT_PHASE_90;
  ATTR[`TX_BITSLICE__REFCLK_FREQUENCY] = $realtobits(REFCLK_FREQUENCY);
  ATTR[`TX_BITSLICE__SIM_DEVICE] = SIM_DEVICE;
  ATTR[`TX_BITSLICE__SIM_VERSION] = $realtobits(SIM_VERSION);
  ATTR[`TX_BITSLICE__TBYTE_CTL] = TBYTE_CTL;
  ATTR[`TX_BITSLICE__UPDATE_MODE] = UPDATE_MODE;
end

always @(trig_attr) begin
  DATA_WIDTH_REG = ATTR[`TX_BITSLICE__DATA_WIDTH];
  DELAY_FORMAT_REG = ATTR[`TX_BITSLICE__DELAY_FORMAT];
  DELAY_TYPE_REG = ATTR[`TX_BITSLICE__DELAY_TYPE];
  DELAY_VALUE_REG = ATTR[`TX_BITSLICE__DELAY_VALUE];
  ENABLE_PRE_EMPHASIS_REG = ATTR[`TX_BITSLICE__ENABLE_PRE_EMPHASIS];
  INIT_REG = ATTR[`TX_BITSLICE__INIT];
  IS_CLK_INVERTED_REG = ATTR[`TX_BITSLICE__IS_CLK_INVERTED];
  IS_RST_DLY_INVERTED_REG = ATTR[`TX_BITSLICE__IS_RST_DLY_INVERTED];
  IS_RST_INVERTED_REG = ATTR[`TX_BITSLICE__IS_RST_INVERTED];
  NATIVE_ODELAY_BYPASS_REG = ATTR[`TX_BITSLICE__NATIVE_ODELAY_BYPASS];
  OUTPUT_PHASE_90_REG = ATTR[`TX_BITSLICE__OUTPUT_PHASE_90];
  REFCLK_FREQUENCY_REG = $bitstoreal(ATTR[`TX_BITSLICE__REFCLK_FREQUENCY]);
  SIM_DEVICE_REG = ATTR[`TX_BITSLICE__SIM_DEVICE];
  SIM_VERSION_REG = $bitstoreal(ATTR[`TX_BITSLICE__SIM_VERSION]);
  TBYTE_CTL_REG = ATTR[`TX_BITSLICE__TBYTE_CTL];
  UPDATE_MODE_REG = ATTR[`TX_BITSLICE__UPDATE_MODE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`TX_BITSLICE_ADDR_SZ-1:0] addr;
  input  [`TX_BITSLICE_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`TX_BITSLICE_DATA_SZ-1:0] read_attr;
  input  [`TX_BITSLICE_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
