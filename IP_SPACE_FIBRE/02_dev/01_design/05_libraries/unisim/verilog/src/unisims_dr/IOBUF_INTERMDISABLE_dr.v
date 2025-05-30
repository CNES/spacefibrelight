`include "B_IOBUF_INTERMDISABLE_defines.vh"

reg [`IOBUF_INTERMDISABLE_DATA_SZ-1:0] ATTR [0:`IOBUF_INTERMDISABLE_ADDR_N-1];
reg [`IOBUF_INTERMDISABLE__DRIVE_SZ-1:0] DRIVE_REG = DRIVE;
reg [`IOBUF_INTERMDISABLE__IBUF_LOW_PWR_SZ:1] IBUF_LOW_PWR_REG = IBUF_LOW_PWR;
reg [`IOBUF_INTERMDISABLE__IOSTANDARD_SZ:1] IOSTANDARD_REG = IOSTANDARD;
reg [`IOBUF_INTERMDISABLE__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;
reg [`IOBUF_INTERMDISABLE__SLEW_SZ:1] SLEW_REG = SLEW;
reg [`IOBUF_INTERMDISABLE__USE_IBUFDISABLE_SZ:1] USE_IBUFDISABLE_REG = USE_IBUFDISABLE;

initial begin
  ATTR[`IOBUF_INTERMDISABLE__DRIVE] = DRIVE;
  ATTR[`IOBUF_INTERMDISABLE__IBUF_LOW_PWR] = IBUF_LOW_PWR;
  ATTR[`IOBUF_INTERMDISABLE__IOSTANDARD] = IOSTANDARD;
  ATTR[`IOBUF_INTERMDISABLE__SIM_DEVICE] = SIM_DEVICE;
  ATTR[`IOBUF_INTERMDISABLE__SLEW] = SLEW;
  ATTR[`IOBUF_INTERMDISABLE__USE_IBUFDISABLE] = USE_IBUFDISABLE;
end

always @(trig_attr) begin
  DRIVE_REG = ATTR[`IOBUF_INTERMDISABLE__DRIVE];
  IBUF_LOW_PWR_REG = ATTR[`IOBUF_INTERMDISABLE__IBUF_LOW_PWR];
  IOSTANDARD_REG = ATTR[`IOBUF_INTERMDISABLE__IOSTANDARD];
  SIM_DEVICE_REG = ATTR[`IOBUF_INTERMDISABLE__SIM_DEVICE];
  SLEW_REG = ATTR[`IOBUF_INTERMDISABLE__SLEW];
  USE_IBUFDISABLE_REG = ATTR[`IOBUF_INTERMDISABLE__USE_IBUFDISABLE];
end

// procedures to override, read attribute values

task write_attr;
  input  [`IOBUF_INTERMDISABLE_ADDR_SZ-1:0] addr;
  input  [`IOBUF_INTERMDISABLE_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`IOBUF_INTERMDISABLE_DATA_SZ-1:0] read_attr;
  input  [`IOBUF_INTERMDISABLE_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
