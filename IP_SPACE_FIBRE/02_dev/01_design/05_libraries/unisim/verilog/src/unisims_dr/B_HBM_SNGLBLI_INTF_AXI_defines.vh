// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_HBM_SNGLBLI_INTF_AXI_DEFINES_VH
`else
`define B_HBM_SNGLBLI_INTF_AXI_DEFINES_VH

// Look-up table parameters
//

`define HBM_SNGLBLI_INTF_AXI_ADDR_N  10
`define HBM_SNGLBLI_INTF_AXI_ADDR_SZ 32
`define HBM_SNGLBLI_INTF_AXI_DATA_SZ 40

// Attribute addresses
//

`define HBM_SNGLBLI_INTF_AXI__CLK_SEL    32'h00000000
`define HBM_SNGLBLI_INTF_AXI__CLK_SEL_SZ 40

`define HBM_SNGLBLI_INTF_AXI__DATARATE    32'h00000001
`define HBM_SNGLBLI_INTF_AXI__DATARATE_SZ 32

`define HBM_SNGLBLI_INTF_AXI__IS_ACLK_INVERTED    32'h00000002
`define HBM_SNGLBLI_INTF_AXI__IS_ACLK_INVERTED_SZ 1

`define HBM_SNGLBLI_INTF_AXI__IS_ARESET_N_INVERTED    32'h00000003
`define HBM_SNGLBLI_INTF_AXI__IS_ARESET_N_INVERTED_SZ 1

`define HBM_SNGLBLI_INTF_AXI__MC_ENABLE    32'h00000004
`define HBM_SNGLBLI_INTF_AXI__MC_ENABLE_SZ 40

`define HBM_SNGLBLI_INTF_AXI__PAGEHIT_PERCENT    32'h00000005
`define HBM_SNGLBLI_INTF_AXI__PAGEHIT_PERCENT_SZ 32

`define HBM_SNGLBLI_INTF_AXI__PHY_ENABLE    32'h00000006
`define HBM_SNGLBLI_INTF_AXI__PHY_ENABLE_SZ 40

`define HBM_SNGLBLI_INTF_AXI__READ_PERCENT    32'h00000007
`define HBM_SNGLBLI_INTF_AXI__READ_PERCENT_SZ 32

`define HBM_SNGLBLI_INTF_AXI__SWITCH_ENABLE    32'h00000008
`define HBM_SNGLBLI_INTF_AXI__SWITCH_ENABLE_SZ 40

`define HBM_SNGLBLI_INTF_AXI__WRITE_PERCENT    32'h00000009
`define HBM_SNGLBLI_INTF_AXI__WRITE_PERCENT_SZ 32

`endif  // B_HBM_SNGLBLI_INTF_AXI_DEFINES_VH