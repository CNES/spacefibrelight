`include "B_BUFG_PS_defines.vh"

reg [`BUFG_PS_DATA_SZ-1:0] ATTR [0:`BUFG_PS_ADDR_N-1];
reg [`BUFG_PS__SIM_DEVICE_SZ:1] SIM_DEVICE_REG = SIM_DEVICE;
reg [`BUFG_PS__STARTUP_SYNC_SZ:1] STARTUP_SYNC_REG = STARTUP_SYNC;

initial begin
  ATTR[`BUFG_PS__SIM_DEVICE] = SIM_DEVICE;
  ATTR[`BUFG_PS__STARTUP_SYNC] = STARTUP_SYNC;
end

always @(trig_attr) begin
  SIM_DEVICE_REG = ATTR[`BUFG_PS__SIM_DEVICE];
  STARTUP_SYNC_REG = ATTR[`BUFG_PS__STARTUP_SYNC];
end

// procedures to override, read attribute values

task write_attr;
  input  [`BUFG_PS_ADDR_SZ-1:0] addr;
  input  [`BUFG_PS_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`BUFG_PS_DATA_SZ-1:0] read_attr;
  input  [`BUFG_PS_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
