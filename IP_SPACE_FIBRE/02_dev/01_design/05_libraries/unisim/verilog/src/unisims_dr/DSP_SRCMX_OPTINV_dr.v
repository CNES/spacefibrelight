`include "B_DSP_SRCMX_OPTINV_defines.vh"

reg [`DSP_SRCMX_OPTINV_DATA_SZ-1:0] ATTR [0:`DSP_SRCMX_OPTINV_ADDR_N-1];
reg [`DSP_SRCMX_OPTINV__DSP_MODE_SZ:1] DSP_MODE_REG = DSP_MODE;
reg IS_ASYNC_RST_INVERTED_REG = IS_ASYNC_RST_INVERTED;
reg IS_CLK_INVERTED_REG = IS_CLK_INVERTED;
reg IS_RSTAD_INVERTED_REG = IS_RSTAD_INVERTED;
reg IS_RSTD_INVERTED_REG = IS_RSTD_INVERTED;

initial begin
  ATTR[`DSP_SRCMX_OPTINV__DSP_MODE] = DSP_MODE;
  ATTR[`DSP_SRCMX_OPTINV__IS_ASYNC_RST_INVERTED] = IS_ASYNC_RST_INVERTED;
  ATTR[`DSP_SRCMX_OPTINV__IS_CLK_INVERTED] = IS_CLK_INVERTED;
  ATTR[`DSP_SRCMX_OPTINV__IS_RSTAD_INVERTED] = IS_RSTAD_INVERTED;
  ATTR[`DSP_SRCMX_OPTINV__IS_RSTD_INVERTED] = IS_RSTD_INVERTED;
end

always @(*) begin
  DSP_MODE_REG = ATTR[`DSP_SRCMX_OPTINV__DSP_MODE];
  IS_ASYNC_RST_INVERTED_REG = ATTR[`DSP_SRCMX_OPTINV__IS_ASYNC_RST_INVERTED];
  IS_CLK_INVERTED_REG = ATTR[`DSP_SRCMX_OPTINV__IS_CLK_INVERTED];
  IS_RSTAD_INVERTED_REG = ATTR[`DSP_SRCMX_OPTINV__IS_RSTAD_INVERTED];
  IS_RSTD_INVERTED_REG = ATTR[`DSP_SRCMX_OPTINV__IS_RSTD_INVERTED];
end

// procedures to override, read attribute values

task write_attr;
  input  [`DSP_SRCMX_OPTINV_ADDR_SZ-1:0] addr;
  input  [`DSP_SRCMX_OPTINV_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`DSP_SRCMX_OPTINV_DATA_SZ-1:0] read_attr;
  input  [`DSP_SRCMX_OPTINV_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
