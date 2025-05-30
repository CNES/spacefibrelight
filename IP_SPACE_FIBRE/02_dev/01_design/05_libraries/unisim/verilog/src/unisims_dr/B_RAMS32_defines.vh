// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_RAMS32_DEFINES_VH
`else
`define B_RAMS32_DEFINES_VH

// Look-up table parameters
//

`define RAMS32_ADDR_N  2
`define RAMS32_ADDR_SZ 32
`define RAMS32_DATA_SZ 32

// Attribute addresses
//

`define RAMS32__INIT    32'h00000000
`define RAMS32__INIT_SZ 32

`define RAMS32__IS_CLK_INVERTED    32'h00000001
`define RAMS32__IS_CLK_INVERTED_SZ 1

`endif  // B_RAMS32_DEFINES_VH