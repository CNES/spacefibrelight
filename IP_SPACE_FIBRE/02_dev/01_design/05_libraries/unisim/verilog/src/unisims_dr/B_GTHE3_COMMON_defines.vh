// BLH dynamic attribute configuration look-up table addresses
//
// Build Summary:
//    Built By:     blh_composer 3.0001
//    Built On:     Thu Apr 24 18:27:31 2014
//    Bundle:       GTHE3_COMMON
//    Architecture: olympus
//    Snapshot Dir: /tmp/dcgcPj1zy3
// Environment Variables:
//    XILENV="/build/xfndry/HEAD/env"
//    MYXILENV=""
//

`ifdef B_GTHE3_COMMON_DEFINES_VH
`else
`define B_GTHE3_COMMON_DEFINES_VH

// Look-up table parameters
//

`define GTHE3_COMMON_ADDR_N  73
`define GTHE3_COMMON_ADDR_SZ 32
`define GTHE3_COMMON_DATA_SZ 40

// Attribute addresses
//

`define GTHE3_COMMON__BIAS_CFG0   	32'h0000	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__BIAS_CFG0_SZ	16

`define GTHE3_COMMON__BIAS_CFG1   	32'h0001	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__BIAS_CFG1_SZ	16

`define GTHE3_COMMON__BIAS_CFG2   	32'h0002	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__BIAS_CFG2_SZ	16

`define GTHE3_COMMON__BIAS_CFG3   	32'h0003	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__BIAS_CFG3_SZ	16

`define GTHE3_COMMON__BIAS_CFG4   	32'h0004	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__BIAS_CFG4_SZ	16

`define GTHE3_COMMON__BIAS_CFG_RSVD   	32'h0005	// Type=BINARY; Min=10'b0000000000, Max=10'b1111111111
`define GTHE3_COMMON__BIAS_CFG_RSVD_SZ	10

`define GTHE3_COMMON__COMMON_CFG0   	32'h0006	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__COMMON_CFG0_SZ	16

`define GTHE3_COMMON__COMMON_CFG1   	32'h0007	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__COMMON_CFG1_SZ	16

`define GTHE3_COMMON__POR_CFG   	32'h0008	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__POR_CFG_SZ	16

`define GTHE3_COMMON__QPLL0_CFG0   	32'h0009	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL0_CFG0_SZ	16

`define GTHE3_COMMON__QPLL0_CFG1   	32'h000a	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL0_CFG1_SZ	16

`define GTHE3_COMMON__QPLL0_CFG1_G3   	32'h000b	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL0_CFG1_G3_SZ	16

`define GTHE3_COMMON__QPLL0_CFG2   	32'h000c	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL0_CFG2_SZ	16

`define GTHE3_COMMON__QPLL0_CFG2_G3   	32'h000d	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL0_CFG2_G3_SZ	16

`define GTHE3_COMMON__QPLL0_CFG3   	32'h000e	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL0_CFG3_SZ	16

`define GTHE3_COMMON__QPLL0_CFG4   	32'h000f	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL0_CFG4_SZ	16

`define GTHE3_COMMON__QPLL0_CP   	32'h0010	// Type=BINARY; Min=10'b0000000000, Max=10'b1111111111
`define GTHE3_COMMON__QPLL0_CP_SZ	10

`define GTHE3_COMMON__QPLL0_CP_G3   	32'h0011	// Type=BINARY; Min=10'b0000000000, Max=10'b1111111111
`define GTHE3_COMMON__QPLL0_CP_G3_SZ	10

`define GTHE3_COMMON__QPLL0_FBDIV   	32'h0012	// Type=DECIMAL; Values=66,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160
`define GTHE3_COMMON__QPLL0_FBDIV_SZ	32

`define GTHE3_COMMON__QPLL0_FBDIV_G3   	32'h0013	// Type=DECIMAL; Values=80,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160
`define GTHE3_COMMON__QPLL0_FBDIV_G3_SZ	32

`define GTHE3_COMMON__QPLL0_INIT_CFG0   	32'h0014	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL0_INIT_CFG0_SZ	16

`define GTHE3_COMMON__QPLL0_INIT_CFG1   	32'h0015	// Type=HEX; Min=8'h00, Max=8'hff
`define GTHE3_COMMON__QPLL0_INIT_CFG1_SZ	8

`define GTHE3_COMMON__QPLL0_LOCK_CFG   	32'h0016	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL0_LOCK_CFG_SZ	16

`define GTHE3_COMMON__QPLL0_LOCK_CFG_G3   	32'h0017	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL0_LOCK_CFG_G3_SZ	16

`define GTHE3_COMMON__QPLL0_LPF   	32'h0018	// Type=BINARY; Min=10'b0000000000, Max=10'b1111111111
`define GTHE3_COMMON__QPLL0_LPF_SZ	10

`define GTHE3_COMMON__QPLL0_LPF_G3   	32'h0019	// Type=BINARY; Min=10'b0000000000, Max=10'b1111111111
`define GTHE3_COMMON__QPLL0_LPF_G3_SZ	10

`define GTHE3_COMMON__QPLL0_REFCLK_DIV   	32'h001a	// Type=DECIMAL; Values=2,1,3,4,5,6,8,10,12,16,20
`define GTHE3_COMMON__QPLL0_REFCLK_DIV_SZ	32

`define GTHE3_COMMON__QPLL0_SDM_CFG0   	32'h001b	// Type=BINARY; Min=16'b0000000000000000, Max=16'b1111111111111111
`define GTHE3_COMMON__QPLL0_SDM_CFG0_SZ	16

`define GTHE3_COMMON__QPLL0_SDM_CFG1   	32'h001c	// Type=BINARY; Min=16'b0000000000000000, Max=16'b1111111111111111
`define GTHE3_COMMON__QPLL0_SDM_CFG1_SZ	16

`define GTHE3_COMMON__QPLL0_SDM_CFG2   	32'h001d	// Type=BINARY; Min=16'b0000000000000000, Max=16'b1111111111111111
`define GTHE3_COMMON__QPLL0_SDM_CFG2_SZ	16

`define GTHE3_COMMON__QPLL1_CFG0   	32'h001e	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL1_CFG0_SZ	16

`define GTHE3_COMMON__QPLL1_CFG1   	32'h001f	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL1_CFG1_SZ	16

`define GTHE3_COMMON__QPLL1_CFG1_G3   	32'h0020	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL1_CFG1_G3_SZ	16

`define GTHE3_COMMON__QPLL1_CFG2   	32'h0021	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL1_CFG2_SZ	16

`define GTHE3_COMMON__QPLL1_CFG2_G3   	32'h0022	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL1_CFG2_G3_SZ	16

`define GTHE3_COMMON__QPLL1_CFG3   	32'h0023	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL1_CFG3_SZ	16

`define GTHE3_COMMON__QPLL1_CFG4   	32'h0024	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL1_CFG4_SZ	16

`define GTHE3_COMMON__QPLL1_CP   	32'h0025	// Type=BINARY; Min=10'b0000000000, Max=10'b1111111111
`define GTHE3_COMMON__QPLL1_CP_SZ	10

`define GTHE3_COMMON__QPLL1_CP_G3   	32'h0026	// Type=BINARY; Min=10'b0000000000, Max=10'b1111111111
`define GTHE3_COMMON__QPLL1_CP_G3_SZ	10

`define GTHE3_COMMON__QPLL1_FBDIV   	32'h0027	// Type=DECIMAL; Values=66,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160
`define GTHE3_COMMON__QPLL1_FBDIV_SZ	32

`define GTHE3_COMMON__QPLL1_FBDIV_G3   	32'h0028	// Type=DECIMAL; Values=80,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160
`define GTHE3_COMMON__QPLL1_FBDIV_G3_SZ	32

`define GTHE3_COMMON__QPLL1_INIT_CFG0   	32'h0029	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL1_INIT_CFG0_SZ	16

`define GTHE3_COMMON__QPLL1_INIT_CFG1   	32'h002a	// Type=HEX; Min=8'h00, Max=8'hff
`define GTHE3_COMMON__QPLL1_INIT_CFG1_SZ	8

`define GTHE3_COMMON__QPLL1_LOCK_CFG   	32'h002b	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL1_LOCK_CFG_SZ	16

`define GTHE3_COMMON__QPLL1_LOCK_CFG_G3   	32'h002c	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__QPLL1_LOCK_CFG_G3_SZ	16

`define GTHE3_COMMON__QPLL1_LPF   	32'h002d	// Type=BINARY; Min=10'b0000000000, Max=10'b1111111111
`define GTHE3_COMMON__QPLL1_LPF_SZ	10

`define GTHE3_COMMON__QPLL1_LPF_G3   	32'h002e	// Type=BINARY; Min=10'b0000000000, Max=10'b1111111111
`define GTHE3_COMMON__QPLL1_LPF_G3_SZ	10

`define GTHE3_COMMON__QPLL1_REFCLK_DIV   	32'h002f	// Type=DECIMAL; Values=2,1,3,4,5,6,8,10,12,16,20
`define GTHE3_COMMON__QPLL1_REFCLK_DIV_SZ	32

`define GTHE3_COMMON__QPLL1_SDM_CFG0   	32'h0030	// Type=BINARY; Min=16'b0000000000000000, Max=16'b1111111111111111
`define GTHE3_COMMON__QPLL1_SDM_CFG0_SZ	16

`define GTHE3_COMMON__QPLL1_SDM_CFG1   	32'h0031	// Type=BINARY; Min=16'b0000000000000000, Max=16'b1111111111111111
`define GTHE3_COMMON__QPLL1_SDM_CFG1_SZ	16

`define GTHE3_COMMON__QPLL1_SDM_CFG2   	32'h0032	// Type=BINARY; Min=16'b0000000000000000, Max=16'b1111111111111111
`define GTHE3_COMMON__QPLL1_SDM_CFG2_SZ	16

`define GTHE3_COMMON__RSVD_ATTR0   	32'h0033	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__RSVD_ATTR0_SZ	16

`define GTHE3_COMMON__RSVD_ATTR1   	32'h0034	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__RSVD_ATTR1_SZ	16

`define GTHE3_COMMON__RSVD_ATTR2   	32'h0035	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__RSVD_ATTR2_SZ	16

`define GTHE3_COMMON__RSVD_ATTR3   	32'h0036	// Type=HEX; Min=16'h0000, Max=16'hffff
`define GTHE3_COMMON__RSVD_ATTR3_SZ	16

`define GTHE3_COMMON__RXRECCLKOUT0_SEL   	32'h0037	// Type=BINARY; Min=2'b00, Max=2'b11
`define GTHE3_COMMON__RXRECCLKOUT0_SEL_SZ	2

`define GTHE3_COMMON__RXRECCLKOUT1_SEL   	32'h0038	// Type=BINARY; Min=2'b00, Max=2'b11
`define GTHE3_COMMON__RXRECCLKOUT1_SEL_SZ	2

`define GTHE3_COMMON__SARC_EN   	32'h0039	// Type=BINARY; Min=1'b0, Max=1'b1
`define GTHE3_COMMON__SARC_EN_SZ	1

`define GTHE3_COMMON__SARC_SEL   	32'h003a	// Type=BINARY; Min=1'b0, Max=1'b1
`define GTHE3_COMMON__SARC_SEL_SZ	1

`define GTHE3_COMMON__SDM0DATA1_0   	32'h003b	// Type=BINARY; Min=16'b0000000000000000, Max=16'b1111111111111111
`define GTHE3_COMMON__SDM0DATA1_0_SZ	16

`define GTHE3_COMMON__SDM0DATA1_1   	32'h003c	// Type=BINARY; Min=9'b000000000, Max=9'b111111111
`define GTHE3_COMMON__SDM0DATA1_1_SZ	9

`define GTHE3_COMMON__SDM0INITSEED0_0   	32'h003d	// Type=BINARY; Min=16'b0000000000000000, Max=16'b1111111111111111
`define GTHE3_COMMON__SDM0INITSEED0_0_SZ	16

`define GTHE3_COMMON__SDM0INITSEED0_1   	32'h003e	// Type=BINARY; Min=9'b000000000, Max=9'b111111111
`define GTHE3_COMMON__SDM0INITSEED0_1_SZ	9

`define GTHE3_COMMON__SDM0_DATA_PIN_SEL   	32'h003f	// Type=BINARY; Min=1'b0, Max=1'b1
`define GTHE3_COMMON__SDM0_DATA_PIN_SEL_SZ	1

`define GTHE3_COMMON__SDM0_WIDTH_PIN_SEL   	32'h0040	// Type=BINARY; Min=1'b0, Max=1'b1
`define GTHE3_COMMON__SDM0_WIDTH_PIN_SEL_SZ	1

`define GTHE3_COMMON__SDM1DATA1_0   	32'h0041	// Type=BINARY; Min=16'b0000000000000000, Max=16'b1111111111111111
`define GTHE3_COMMON__SDM1DATA1_0_SZ	16

`define GTHE3_COMMON__SDM1DATA1_1   	32'h0042	// Type=BINARY; Min=9'b000000000, Max=9'b111111111
`define GTHE3_COMMON__SDM1DATA1_1_SZ	9

`define GTHE3_COMMON__SDM1INITSEED0_0   	32'h0043	// Type=BINARY; Min=16'b0000000000000000, Max=16'b1111111111111111
`define GTHE3_COMMON__SDM1INITSEED0_0_SZ	16

`define GTHE3_COMMON__SDM1INITSEED0_1   	32'h0044	// Type=BINARY; Min=9'b000000000, Max=9'b111111111
`define GTHE3_COMMON__SDM1INITSEED0_1_SZ	9

`define GTHE3_COMMON__SDM1_DATA_PIN_SEL   	32'h0045	// Type=BINARY; Min=1'b0, Max=1'b1
`define GTHE3_COMMON__SDM1_DATA_PIN_SEL_SZ	1

`define GTHE3_COMMON__SDM1_WIDTH_PIN_SEL   	32'h0046	// Type=BINARY; Min=1'b0, Max=1'b1
`define GTHE3_COMMON__SDM1_WIDTH_PIN_SEL_SZ	1

`define GTHE3_COMMON__SIM_RESET_SPEEDUP   	32'h0047	// Type=STRING; Values=TRUE,FALSE
`define GTHE3_COMMON__SIM_RESET_SPEEDUP_SZ	40

`define GTHE3_COMMON__SIM_VERSION   	32'h0048	// Type=DECIMAL; Values=2,1,3
`define GTHE3_COMMON__SIM_VERSION_SZ	32

`endif  // B_GTHE3_COMMON_DEFINES_VH
