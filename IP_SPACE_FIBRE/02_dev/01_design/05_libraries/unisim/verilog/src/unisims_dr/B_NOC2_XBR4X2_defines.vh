// BLH dynamic attribute configuration look-up table addresses
//

`ifdef B_NOC2_XBR4X2_DEFINES_VH
`else
`define B_NOC2_XBR4X2_DEFINES_VH

// Look-up table parameters
//

`define NOC2_XBR4X2_ADDR_N  39
`define NOC2_XBR4X2_ADDR_SZ 32
`define NOC2_XBR4X2_DATA_SZ 32

// Attribute addresses
//

`define NOC2_XBR4X2__REG_DDR2NOC_DP0_NP0_VCA_RD_TOKEN    32'h00000000
`define NOC2_XBR4X2__REG_DDR2NOC_DP0_NP0_VCA_RD_TOKEN_SZ 24

`define NOC2_XBR4X2__REG_DDR2NOC_DP0_NP0_VCA_WR_TOKEN    32'h00000001
`define NOC2_XBR4X2__REG_DDR2NOC_DP0_NP0_VCA_WR_TOKEN_SZ 16

`define NOC2_XBR4X2__REG_DDR2NOC_DP0_NP1_VCA_RD_TOKEN    32'h00000002
`define NOC2_XBR4X2__REG_DDR2NOC_DP0_NP1_VCA_RD_TOKEN_SZ 24

`define NOC2_XBR4X2__REG_DDR2NOC_DP0_NP1_VCA_WR_TOKEN    32'h00000003
`define NOC2_XBR4X2__REG_DDR2NOC_DP0_NP1_VCA_WR_TOKEN_SZ 16

`define NOC2_XBR4X2__REG_DDR2NOC_DP0_NP2_VCA_RD_TOKEN    32'h00000004
`define NOC2_XBR4X2__REG_DDR2NOC_DP0_NP2_VCA_RD_TOKEN_SZ 24

`define NOC2_XBR4X2__REG_DDR2NOC_DP0_NP2_VCA_WR_TOKEN    32'h00000005
`define NOC2_XBR4X2__REG_DDR2NOC_DP0_NP2_VCA_WR_TOKEN_SZ 16

`define NOC2_XBR4X2__REG_DDR2NOC_DP0_NP3_VCA_RD_TOKEN    32'h00000006
`define NOC2_XBR4X2__REG_DDR2NOC_DP0_NP3_VCA_RD_TOKEN_SZ 24

`define NOC2_XBR4X2__REG_DDR2NOC_DP0_NP3_VCA_WR_TOKEN    32'h00000007
`define NOC2_XBR4X2__REG_DDR2NOC_DP0_NP3_VCA_WR_TOKEN_SZ 16

`define NOC2_XBR4X2__REG_DDR2NOC_DP1_NP0_VCA_RD_TOKEN    32'h00000008
`define NOC2_XBR4X2__REG_DDR2NOC_DP1_NP0_VCA_RD_TOKEN_SZ 24

`define NOC2_XBR4X2__REG_DDR2NOC_DP1_NP0_VCA_WR_TOKEN    32'h00000009
`define NOC2_XBR4X2__REG_DDR2NOC_DP1_NP0_VCA_WR_TOKEN_SZ 16

`define NOC2_XBR4X2__REG_DDR2NOC_DP1_NP1_VCA_RD_TOKEN    32'h0000000a
`define NOC2_XBR4X2__REG_DDR2NOC_DP1_NP1_VCA_RD_TOKEN_SZ 24

`define NOC2_XBR4X2__REG_DDR2NOC_DP1_NP1_VCA_WR_TOKEN    32'h0000000b
`define NOC2_XBR4X2__REG_DDR2NOC_DP1_NP1_VCA_WR_TOKEN_SZ 16

`define NOC2_XBR4X2__REG_DDR2NOC_DP1_NP2_VCA_RD_TOKEN    32'h0000000c
`define NOC2_XBR4X2__REG_DDR2NOC_DP1_NP2_VCA_RD_TOKEN_SZ 24

`define NOC2_XBR4X2__REG_DDR2NOC_DP1_NP2_VCA_WR_TOKEN    32'h0000000d
`define NOC2_XBR4X2__REG_DDR2NOC_DP1_NP2_VCA_WR_TOKEN_SZ 16

`define NOC2_XBR4X2__REG_DDR2NOC_DP1_NP3_VCA_RD_TOKEN    32'h0000000e
`define NOC2_XBR4X2__REG_DDR2NOC_DP1_NP3_VCA_RD_TOKEN_SZ 24

`define NOC2_XBR4X2__REG_DDR2NOC_DP1_NP3_VCA_WR_TOKEN    32'h0000000f
`define NOC2_XBR4X2__REG_DDR2NOC_DP1_NP3_VCA_WR_TOKEN_SZ 16

`define NOC2_XBR4X2__REG_DDR2NOC_PRI_NP0    32'h00000010
`define NOC2_XBR4X2__REG_DDR2NOC_PRI_NP0_SZ 20

`define NOC2_XBR4X2__REG_DDR2NOC_PRI_NP1    32'h00000011
`define NOC2_XBR4X2__REG_DDR2NOC_PRI_NP1_SZ 20

`define NOC2_XBR4X2__REG_DDR2NOC_PRI_NP2    32'h00000012
`define NOC2_XBR4X2__REG_DDR2NOC_PRI_NP2_SZ 20

`define NOC2_XBR4X2__REG_DDR2NOC_PRI_NP3    32'h00000013
`define NOC2_XBR4X2__REG_DDR2NOC_PRI_NP3_SZ 20

`define NOC2_XBR4X2__REG_DDR2NOC_RD_VC_MAP_NP0    32'h00000014
`define NOC2_XBR4X2__REG_DDR2NOC_RD_VC_MAP_NP0_SZ 12

`define NOC2_XBR4X2__REG_DDR2NOC_RD_VC_MAP_NP1    32'h00000015
`define NOC2_XBR4X2__REG_DDR2NOC_RD_VC_MAP_NP1_SZ 12

`define NOC2_XBR4X2__REG_DDR2NOC_RD_VC_MAP_NP2    32'h00000016
`define NOC2_XBR4X2__REG_DDR2NOC_RD_VC_MAP_NP2_SZ 12

`define NOC2_XBR4X2__REG_DDR2NOC_RD_VC_MAP_NP3    32'h00000017
`define NOC2_XBR4X2__REG_DDR2NOC_RD_VC_MAP_NP3_SZ 12

`define NOC2_XBR4X2__REG_DST_ID_P0    32'h00000018
`define NOC2_XBR4X2__REG_DST_ID_P0_SZ 12

`define NOC2_XBR4X2__REG_DST_ID_P1    32'h00000019
`define NOC2_XBR4X2__REG_DST_ID_P1_SZ 12

`define NOC2_XBR4X2__REG_NOC2DDR_NP0_DP0_VCA_TOKEN    32'h0000001a
`define NOC2_XBR4X2__REG_NOC2DDR_NP0_DP0_VCA_TOKEN_SZ 32

`define NOC2_XBR4X2__REG_NOC2DDR_NP0_DP1_VCA_TOKEN    32'h0000001b
`define NOC2_XBR4X2__REG_NOC2DDR_NP0_DP1_VCA_TOKEN_SZ 32

`define NOC2_XBR4X2__REG_NOC2DDR_NP1_DP0_VCA_TOKEN    32'h0000001c
`define NOC2_XBR4X2__REG_NOC2DDR_NP1_DP0_VCA_TOKEN_SZ 32

`define NOC2_XBR4X2__REG_NOC2DDR_NP1_DP1_VCA_TOKEN    32'h0000001d
`define NOC2_XBR4X2__REG_NOC2DDR_NP1_DP1_VCA_TOKEN_SZ 32

`define NOC2_XBR4X2__REG_NOC2DDR_NP2_DP0_VCA_TOKEN    32'h0000001e
`define NOC2_XBR4X2__REG_NOC2DDR_NP2_DP0_VCA_TOKEN_SZ 32

`define NOC2_XBR4X2__REG_NOC2DDR_NP2_DP1_VCA_TOKEN    32'h0000001f
`define NOC2_XBR4X2__REG_NOC2DDR_NP2_DP1_VCA_TOKEN_SZ 32

`define NOC2_XBR4X2__REG_NOC2DDR_NP3_DP0_VCA_TOKEN    32'h00000020
`define NOC2_XBR4X2__REG_NOC2DDR_NP3_DP0_VCA_TOKEN_SZ 32

`define NOC2_XBR4X2__REG_NOC2DDR_NP3_DP1_VCA_TOKEN    32'h00000021
`define NOC2_XBR4X2__REG_NOC2DDR_NP3_DP1_VCA_TOKEN_SZ 32

`define NOC2_XBR4X2__REG_NOC2DDR_PRI_DP0    32'h00000022
`define NOC2_XBR4X2__REG_NOC2DDR_PRI_DP0_SZ 32

`define NOC2_XBR4X2__REG_NOC2DDR_PRI_DP1    32'h00000023
`define NOC2_XBR4X2__REG_NOC2DDR_PRI_DP1_SZ 32

`define NOC2_XBR4X2__REG_NOC2DDR_RD_CH_IDX_MAP_DP0    32'h00000024
`define NOC2_XBR4X2__REG_NOC2DDR_RD_CH_IDX_MAP_DP0_SZ 16

`define NOC2_XBR4X2__REG_NOC2DDR_RD_CH_IDX_MAP_DP1    32'h00000025
`define NOC2_XBR4X2__REG_NOC2DDR_RD_CH_IDX_MAP_DP1_SZ 16

`define NOC2_XBR4X2__REG_NOC_CTL    32'h00000026
`define NOC2_XBR4X2__REG_NOC_CTL_SZ 1

`endif  // B_NOC2_XBR4X2_DEFINES_VH