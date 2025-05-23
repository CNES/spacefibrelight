// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_IOBUFDS_DIFF_OUT_DEFINES_VH
`else
`define B_IOBUFDS_DIFF_OUT_DEFINES_VH

// Look-up table parameters
//

`define IOBUFDS_DIFF_OUT_ADDR_N  4
`define IOBUFDS_DIFF_OUT_ADDR_SZ 32
`define IOBUFDS_DIFF_OUT_DATA_SZ 56

// Attribute addresses
//

`define IOBUFDS_DIFF_OUT__DIFF_TERM    32'h00000000
`define IOBUFDS_DIFF_OUT__DIFF_TERM_SZ 40

`define IOBUFDS_DIFF_OUT__DQS_BIAS    32'h00000001
`define IOBUFDS_DIFF_OUT__DQS_BIAS_SZ 40

`define IOBUFDS_DIFF_OUT__IBUF_LOW_PWR    32'h00000002
`define IOBUFDS_DIFF_OUT__IBUF_LOW_PWR_SZ 40

`define IOBUFDS_DIFF_OUT__IOSTANDARD    32'h00000003
`define IOBUFDS_DIFF_OUT__IOSTANDARD_SZ 56

`endif  // B_IOBUFDS_DIFF_OUT_DEFINES_VH