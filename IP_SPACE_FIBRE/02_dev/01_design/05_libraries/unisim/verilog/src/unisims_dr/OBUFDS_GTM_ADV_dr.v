`include "B_OBUFDS_GTM_ADV_defines.vh"

reg [`OBUFDS_GTM_ADV_DATA_SZ-1:0] ATTR [0:`OBUFDS_GTM_ADV_ADDR_N-1];
reg REFCLK_EN_TX_PATH_REG = REFCLK_EN_TX_PATH;
reg [`OBUFDS_GTM_ADV__REFCLK_ICNTL_TX_SZ-1:0] REFCLK_ICNTL_TX_REG = REFCLK_ICNTL_TX;
reg [`OBUFDS_GTM_ADV__RXRECCLK_SEL_SZ-1:0] RXRECCLK_SEL_REG = RXRECCLK_SEL;

initial begin
  ATTR[`OBUFDS_GTM_ADV__REFCLK_EN_TX_PATH] = REFCLK_EN_TX_PATH;
  ATTR[`OBUFDS_GTM_ADV__REFCLK_ICNTL_TX] = REFCLK_ICNTL_TX;
  ATTR[`OBUFDS_GTM_ADV__RXRECCLK_SEL] = RXRECCLK_SEL;
end

always @(trig_attr) begin
  REFCLK_EN_TX_PATH_REG = ATTR[`OBUFDS_GTM_ADV__REFCLK_EN_TX_PATH];
  REFCLK_ICNTL_TX_REG = ATTR[`OBUFDS_GTM_ADV__REFCLK_ICNTL_TX];
  RXRECCLK_SEL_REG = ATTR[`OBUFDS_GTM_ADV__RXRECCLK_SEL];
end

// procedures to override, read attribute values

task write_attr;
  input  [`OBUFDS_GTM_ADV_ADDR_SZ-1:0] addr;
  input  [`OBUFDS_GTM_ADV_DATA_SZ-1:0] data;
  begin
    ATTR[addr] = data;
    trig_attr = ~trig_attr; // to be removed
  end
endtask

function [`OBUFDS_GTM_ADV_DATA_SZ-1:0] read_attr;
  input  [`OBUFDS_GTM_ADV_ADDR_SZ-1:0] addr;
  begin
    read_attr = ATTR[addr];
  end
endfunction

task commit_attr;
  begin
trig_attr = ~trig_attr;
  end
endtask
