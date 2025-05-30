`include "B_ILKNE4_defines.vh"

reg [`ILKNE4_DATA_SZ-1:0] ATTR [0:`ILKNE4_ADDR_N-1];
reg [`ILKNE4__BYPASS_SZ:1] BYPASS_REG = BYPASS;
reg [`ILKNE4__CTL_RX_BURSTMAX_SZ-1:0] CTL_RX_BURSTMAX_REG = CTL_RX_BURSTMAX;
reg [`ILKNE4__CTL_RX_CHAN_EXT_SZ-1:0] CTL_RX_CHAN_EXT_REG = CTL_RX_CHAN_EXT;
reg [`ILKNE4__CTL_RX_LAST_LANE_SZ-1:0] CTL_RX_LAST_LANE_REG = CTL_RX_LAST_LANE;
reg [`ILKNE4__CTL_RX_MFRAMELEN_MINUS1_SZ-1:0] CTL_RX_MFRAMELEN_MINUS1_REG = CTL_RX_MFRAMELEN_MINUS1;
reg [`ILKNE4__CTL_RX_PACKET_MODE_SZ:1] CTL_RX_PACKET_MODE_REG = CTL_RX_PACKET_MODE;
reg [`ILKNE4__CTL_RX_RETRANS_MULT_SZ-1:0] CTL_RX_RETRANS_MULT_REG = CTL_RX_RETRANS_MULT;
reg [`ILKNE4__CTL_RX_RETRANS_RETRY_SZ-1:0] CTL_RX_RETRANS_RETRY_REG = CTL_RX_RETRANS_RETRY;
reg [`ILKNE4__CTL_RX_RETRANS_TIMER1_SZ-1:0] CTL_RX_RETRANS_TIMER1_REG = CTL_RX_RETRANS_TIMER1;
reg [`ILKNE4__CTL_RX_RETRANS_TIMER2_SZ-1:0] CTL_RX_RETRANS_TIMER2_REG = CTL_RX_RETRANS_TIMER2;
reg [`ILKNE4__CTL_RX_RETRANS_WDOG_SZ-1:0] CTL_RX_RETRANS_WDOG_REG = CTL_RX_RETRANS_WDOG;
reg [`ILKNE4__CTL_RX_RETRANS_WRAP_TIMER_SZ-1:0] CTL_RX_RETRANS_WRAP_TIMER_REG = CTL_RX_RETRANS_WRAP_TIMER;
reg [`ILKNE4__CTL_TEST_MODE_PIN_CHAR_SZ:1] CTL_TEST_MODE_PIN_CHAR_REG = CTL_TEST_MODE_PIN_CHAR;
reg [`ILKNE4__CTL_TX_BURSTMAX_SZ-1:0] CTL_TX_BURSTMAX_REG = CTL_TX_BURSTMAX;
reg [`ILKNE4__CTL_TX_BURSTSHORT_SZ-1:0] CTL_TX_BURSTSHORT_REG = CTL_TX_BURSTSHORT;
reg [`ILKNE4__CTL_TX_CHAN_EXT_SZ-1:0] CTL_TX_CHAN_EXT_REG = CTL_TX_CHAN_EXT;
reg [`ILKNE4__CTL_TX_DISABLE_SKIPWORD_SZ:1] CTL_TX_DISABLE_SKIPWORD_REG = CTL_TX_DISABLE_SKIPWORD;
reg [`ILKNE4__CTL_TX_FC_CALLEN_SZ-1:0] CTL_TX_FC_CALLEN_REG = CTL_TX_FC_CALLEN;
reg [`ILKNE4__CTL_TX_LAST_LANE_SZ-1:0] CTL_TX_LAST_LANE_REG = CTL_TX_LAST_LANE;
reg [`ILKNE4__CTL_TX_MFRAMELEN_MINUS1_SZ-1:0] CTL_TX_MFRAMELEN_MINUS1_REG = CTL_TX_MFRAMELEN_MINUS1;
reg [`ILKNE4__CTL_TX_RETRANS_DEPTH_SZ-1:0] CTL_TX_RETRANS_DEPTH_REG = CTL_TX_RETRANS_DEPTH;
reg [`ILKNE4__CTL_TX_RETRANS_MULT_SZ-1:0] CTL_TX_RETRANS_MULT_REG = CTL_TX_RETRANS_MULT;
reg [`ILKNE4__CTL_TX_RETRANS_RAM_BANKS_SZ-1:0] CTL_TX_RETRANS_RAM_BANKS_REG = CTL_TX_RETRANS_RAM_BANKS;
reg [`ILKNE4__MODE_SZ:1] MODE_REG = MODE;
reg [`ILKNE4__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;
reg [`ILKNE4__TEST_MODE_PIN_CHAR_SZ:1] TEST_MODE_PIN_CHAR_REG = TEST_MODE_PIN_CHAR;

initial begin
  ATTR[`ILKNE4__BYPASS] = BYPASS;
  ATTR[`ILKNE4__CTL_RX_BURSTMAX] = CTL_RX_BURSTMAX;
  ATTR[`ILKNE4__CTL_RX_CHAN_EXT] = CTL_RX_CHAN_EXT;
  ATTR[`ILKNE4__CTL_RX_LAST_LANE] = CTL_RX_LAST_LANE;
  ATTR[`ILKNE4__CTL_RX_MFRAMELEN_MINUS1] = CTL_RX_MFRAMELEN_MINUS1;
  ATTR[`ILKNE4__CTL_RX_PACKET_MODE] = CTL_RX_PACKET_MODE;
  ATTR[`ILKNE4__CTL_RX_RETRANS_MULT] = CTL_RX_RETRANS_MULT;
  ATTR[`ILKNE4__CTL_RX_RETRANS_RETRY] = CTL_RX_RETRANS_RETRY;
  ATTR[`ILKNE4__CTL_RX_RETRANS_TIMER1] = CTL_RX_RETRANS_TIMER1;
  ATTR[`ILKNE4__CTL_RX_RETRANS_TIMER2] = CTL_RX_RETRANS_TIMER2;
  ATTR[`ILKNE4__CTL_RX_RETRANS_WDOG] = CTL_RX_RETRANS_WDOG;
  ATTR[`ILKNE4__CTL_RX_RETRANS_WRAP_TIMER] = CTL_RX_RETRANS_WRAP_TIMER;
  ATTR[`ILKNE4__CTL_TEST_MODE_PIN_CHAR] = CTL_TEST_MODE_PIN_CHAR;
  ATTR[`ILKNE4__CTL_TX_BURSTMAX] = CTL_TX_BURSTMAX;
  ATTR[`ILKNE4__CTL_TX_BURSTSHORT] = CTL_TX_BURSTSHORT;
  ATTR[`ILKNE4__CTL_TX_CHAN_EXT] = CTL_TX_CHAN_EXT;
  ATTR[`ILKNE4__CTL_TX_DISABLE_SKIPWORD] = CTL_TX_DISABLE_SKIPWORD;
  ATTR[`ILKNE4__CTL_TX_FC_CALLEN] = CTL_TX_FC_CALLEN;
  ATTR[`ILKNE4__CTL_TX_LAST_LANE] = CTL_TX_LAST_LANE;
  ATTR[`ILKNE4__CTL_TX_MFRAMELEN_MINUS1] = CTL_TX_MFRAMELEN_MINUS1;
  ATTR[`ILKNE4__CTL_TX_RETRANS_DEPTH] = CTL_TX_RETRANS_DEPTH;
  ATTR[`ILKNE4__CTL_TX_RETRANS_MULT] = CTL_TX_RETRANS_MULT;
  ATTR[`ILKNE4__CTL_TX_RETRANS_RAM_BANKS] = CTL_TX_RETRANS_RAM_BANKS;
  ATTR[`ILKNE4__MODE] = MODE;
  ATTR[`ILKNE4__SIM_DEVICE] = SIM_DEVICE;
  ATTR[`ILKNE4__TEST_MODE_PIN_CHAR] = TEST_MODE_PIN_CHAR;
end

always @(trig_attr) begin
  BYPASS_REG = ATTR[`ILKNE4__BYPASS];
  CTL_RX_BURSTMAX_REG = ATTR[`ILKNE4__CTL_RX_BURSTMAX];
  CTL_RX_CHAN_EXT_REG = ATTR[`ILKNE4__CTL_RX_CHAN_EXT];
  CTL_RX_LAST_LANE_REG = ATTR[`ILKNE4__CTL_RX_LAST_LANE];
  CTL_RX_MFRAMELEN_MINUS1_REG = ATTR[`ILKNE4__CTL_RX_MFRAMELEN_MINUS1];
  CTL_RX_PACKET_MODE_REG = ATTR[`ILKNE4__CTL_RX_PACKET_MODE];
  CTL_RX_RETRANS_MULT_REG = ATTR[`ILKNE4__CTL_RX_RETRANS_MULT];
  CTL_RX_RETRANS_RETRY_REG = ATTR[`ILKNE4__CTL_RX_RETRANS_RETRY];
  CTL_RX_RETRANS_TIMER1_REG = ATTR[`ILKNE4__CTL_RX_RETRANS_TIMER1];
  CTL_RX_RETRANS_TIMER2_REG = ATTR[`ILKNE4__CTL_RX_RETRANS_TIMER2];
  CTL_RX_RETRANS_WDOG_REG = ATTR[`ILKNE4__CTL_RX_RETRANS_WDOG];
  CTL_RX_RETRANS_WRAP_TIMER_REG = ATTR[`ILKNE4__CTL_RX_RETRANS_WRAP_TIMER];
  CTL_TEST_MODE_PIN_CHAR_REG = ATTR[`ILKNE4__CTL_TEST_MODE_PIN_CHAR];
  CTL_TX_BURSTMAX_REG = ATTR[`ILKNE4__CTL_TX_BURSTMAX];
  CTL_TX_BURSTSHORT_REG = ATTR[`ILKNE4__CTL_TX_BURSTSHORT];
  CTL_TX_CHAN_EXT_REG = ATTR[`ILKNE4__CTL_TX_CHAN_EXT];
  CTL_TX_DISABLE_SKIPWORD_REG = ATTR[`ILKNE4__CTL_TX_DISABLE_SKIPWORD];
  CTL_TX_FC_CALLEN_REG = ATTR[`ILKNE4__CTL_TX_FC_CALLEN];
  CTL_TX_LAST_LANE_REG = ATTR[`ILKNE4__CTL_TX_LAST_LANE];
  CTL_TX_MFRAMELEN_MINUS1_REG = ATTR[`ILKNE4__CTL_TX_MFRAMELEN_MINUS1];
  CTL_TX_RETRANS_DEPTH_REG = ATTR[`ILKNE4__CTL_TX_RETRANS_DEPTH];
  CTL_TX_RETRANS_MULT_REG = ATTR[`ILKNE4__CTL_TX_RETRANS_MULT];
  CTL_TX_RETRANS_RAM_BANKS_REG = ATTR[`ILKNE4__CTL_TX_RETRANS_RAM_BANKS];
  MODE_REG = ATTR[`ILKNE4__MODE];
  SIM_DEVICE_REG = ATTR[`ILKNE4__SIM_DEVICE];
  TEST_MODE_PIN_CHAR_REG = ATTR[`ILKNE4__TEST_MODE_PIN_CHAR];
end

// procedures to override, read attribute values

task write_attr;
  input  [`ILKNE4_ADDR_SZ-1:0] addr;
  input  [`ILKNE4_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`ILKNE4_DATA_SZ-1:0] read_attr;
  input  [`ILKNE4_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
