`include "B_IOBUFDS_DIFF_OUT_INTERMDISABLE_defines.vh"

reg [`IOBUFDS_DIFF_OUT_INTERMDISABLE_DATA_SZ-1:0] ATTR [0:`IOBUFDS_DIFF_OUT_INTERMDISABLE_ADDR_N-1];
reg [`IOBUFDS_DIFF_OUT_INTERMDISABLE__DIFF_TERM_SZ:1] DIFF_TERM_REG = DIFF_TERM;
reg [`IOBUFDS_DIFF_OUT_INTERMDISABLE__DQS_BIAS_SZ:1] DQS_BIAS_REG = DQS_BIAS;
reg [`IOBUFDS_DIFF_OUT_INTERMDISABLE__IBUF_LOW_PWR_SZ:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
reg [`IOBUFDS_DIFF_OUT_INTERMDISABLE__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;
reg [`IOBUFDS_DIFF_OUT_INTERMDISABLE__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;
reg [`IOBUFDS_DIFF_OUT_INTERMDISABLE__USE_IBUFDISABLE_SZ:1] USE_IBUFDISABLE_REG = USE_IBUFDISABLE;

initial begin
  ATTR[`IOBUFDS_DIFF_OUT_INTERMDISABLE__DIFF_TERM] = DIFF_TERM;
  ATTR[`IOBUFDS_DIFF_OUT_INTERMDISABLE__DQS_BIAS] = DQS_BIAS;
  ATTR[`IOBUFDS_DIFF_OUT_INTERMDISABLE__IBUF_LOW_PWR] = IBUF_LOW_PWR;
  ATTR[`IOBUFDS_DIFF_OUT_INTERMDISABLE__IOSTANDARD] = IOSTANDARD;
  ATTR[`IOBUFDS_DIFF_OUT_INTERMDISABLE__SIM_DEVICE] = SIM_DEVICE;
  ATTR[`IOBUFDS_DIFF_OUT_INTERMDISABLE__USE_IBUFDISABLE] = USE_IBUFDISABLE;
end

always @(trig_attr) begin
  DIFF_TERM_REG = ATTR[`IOBUFDS_DIFF_OUT_INTERMDISABLE__DIFF_TERM];
  DQS_BIAS_REG = ATTR[`IOBUFDS_DIFF_OUT_INTERMDISABLE__DQS_BIAS];
  IBUF_LOW_PWR_REG = ATTR[`IOBUFDS_DIFF_OUT_INTERMDISABLE__IBUF_LOW_PWR];
  IOSTANDARD_REG = ATTR[`IOBUFDS_DIFF_OUT_INTERMDISABLE__IOSTANDARD];
  SIM_DEVICE_REG = ATTR[`IOBUFDS_DIFF_OUT_INTERMDISABLE__SIM_DEVICE];
  USE_IBUFDISABLE_REG = ATTR[`IOBUFDS_DIFF_OUT_INTERMDISABLE__USE_IBUFDISABLE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IOBUFDS_DIFF_OUT_INTERMDISABLE_ADDR_SZ-1:0] addr;
  input  [`IOBUFDS_DIFF_OUT_INTERMDISABLE_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IOBUFDS_DIFF_OUT_INTERMDISABLE_DATA_SZ-1:0] read_attr;
  input  [`IOBUFDS_DIFF_OUT_INTERMDISABLE_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
