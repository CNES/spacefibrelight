// BLH dynamic attribute configuration look-up table addresses
//
// Build Summary:
//    Built By:     mk_defines_vh 3.0001
//    Built On:     Fri May 29 10:10:20 2015
//    Bundle:       URAM288
//    Architecture: diablo
//    Snapshot Dir: /tmp/r_lgSpqCcd
// Environment Variables:
//    XILENV=""
//    MYXILENV=""
//

`ifdef B_URAM288_TEST_DEFINES_VH
`else
`define B_URAM288_TEST_DEFINES_VH

// Look-up table parameters
//

`define URAM288_TEST_ADDR_N  58
`define URAM288_TEST_ADDR_SZ 32
`define URAM288_TEST_DATA_SZ 144

// Attribute addresses
//

`define URAM288_TEST__AUTO_SLEEP_LATENCY   	32'h0000	// Type=DECIMAL; Values=8,3,4,5,6,7,9,10,11,12,13,14,15
`define URAM288_TEST__AUTO_SLEEP_LATENCY_SZ	32

`define URAM288__AVG_CONS_INACTIVE_CYCLES    32'h0039 // Type=DECIMAL; Values=3 to 100000
`define URAM288__AVG_CONS_INACTIVE_CYCLES_SZ 17


`define URAM288_TEST__BWE_MODE_A   	32'h0001	// Type=STRING; Values=PARITY_INTERLEAVED,PARITY_INDEPENDENT
`define URAM288_TEST__BWE_MODE_A_SZ	144

`define URAM288_TEST__BWE_MODE_B   	32'h0002	// Type=STRING; Values=PARITY_INTERLEAVED,PARITY_INDEPENDENT
`define URAM288_TEST__BWE_MODE_B_SZ	144

`define URAM288_TEST__CASCADE_ORDER_A   	32'h0003	// Type=STRING; Values=NONE,FIRST,LAST,MIDDLE
`define URAM288_TEST__CASCADE_ORDER_A_SZ	48

`define URAM288_TEST__CASCADE_ORDER_B   	32'h0004	// Type=STRING; Values=NONE,FIRST,LAST,MIDDLE
`define URAM288_TEST__CASCADE_ORDER_B_SZ	48

`define URAM288_TEST__CAS_CLEAR16   	32'h0005	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__CAS_CLEAR16_SZ	40

`define URAM288_TEST__EN_AUTO_SLEEP_MODE   	32'h0006	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__EN_AUTO_SLEEP_MODE_SZ	40

`define URAM288_TEST__EN_ECC_RD_A   	32'h0007	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__EN_ECC_RD_A_SZ	40

`define URAM288_TEST__EN_ECC_RD_B   	32'h0008	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__EN_ECC_RD_B_SZ	40

`define URAM288_TEST__EN_ECC_WR_A   	32'h0009	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__EN_ECC_WR_A_SZ	40

`define URAM288_TEST__EN_ECC_WR_B   	32'h000a	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__EN_ECC_WR_B_SZ	40

`define URAM288_TEST__EN_PWRGATE   	32'h000b	// Type=STRING; Values=NO,YES
`define URAM288_TEST__EN_PWRGATE_SZ	24

`define URAM288_TEST__IREG_PRE_A   	32'h000c	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__IREG_PRE_A_SZ	40

`define URAM288_TEST__IREG_PRE_B   	32'h000d	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__IREG_PRE_B_SZ	40

`define URAM288_TEST__IS_CLK_INVERTED   	32'h000e	// Type=BINARY; Min=1'b0, Max=1'b1
`define URAM288_TEST__IS_CLK_INVERTED_SZ	1

`define URAM288_TEST__IS_EN_A_INVERTED   	32'h000f	// Type=BINARY; Min=1'b0, Max=1'b1
`define URAM288_TEST__IS_EN_A_INVERTED_SZ	1

`define URAM288_TEST__IS_EN_B_INVERTED   	32'h0010	// Type=BINARY; Min=1'b0, Max=1'b1
`define URAM288_TEST__IS_EN_B_INVERTED_SZ	1

`define URAM288_TEST__IS_RDB_WR_A_INVERTED   	32'h0011	// Type=BINARY; Min=1'b0, Max=1'b1
`define URAM288_TEST__IS_RDB_WR_A_INVERTED_SZ	1

`define URAM288_TEST__IS_RDB_WR_B_INVERTED   	32'h0012	// Type=BINARY; Min=1'b0, Max=1'b1
`define URAM288_TEST__IS_RDB_WR_B_INVERTED_SZ	1

`define URAM288_TEST__IS_RST_A_INVERTED   	32'h0013	// Type=BINARY; Min=1'b0, Max=1'b1
`define URAM288_TEST__IS_RST_A_INVERTED_SZ	1

`define URAM288_TEST__IS_RST_B_INVERTED   	32'h0014	// Type=BINARY; Min=1'b0, Max=1'b1
`define URAM288_TEST__IS_RST_B_INVERTED_SZ	1

`define URAM288_TEST__OREG_A   	32'h0015	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__OREG_A_SZ	40

`define URAM288_TEST__OREG_B   	32'h0016	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__OREG_B_SZ	40

`define URAM288_TEST__OREG_ECC_A   	32'h0017	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__OREG_ECC_A_SZ	40

`define URAM288_TEST__OREG_ECC_B   	32'h0018	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__OREG_ECC_B_SZ	40

`define URAM288_TEST__REG_CAS_A   	32'h0019	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__REG_CAS_A_SZ	40

`define URAM288_TEST__REG_CAS_B   	32'h001a	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__REG_CAS_B_SZ	40

`define URAM288_TEST__RST_MODE_A   	32'h001b	// Type=STRING; Values=SYNC,ASYNC
`define URAM288_TEST__RST_MODE_A_SZ	40

`define URAM288_TEST__RST_MODE_B   	32'h001c	// Type=STRING; Values=SYNC,ASYNC
`define URAM288_TEST__RST_MODE_B_SZ	40

`define URAM288_TEST__SELF_ADDR_A   	32'h001d	// Type=HEX; Min=11'h000, Max=11'h7ff
`define URAM288_TEST__SELF_ADDR_A_SZ	11

`define URAM288_TEST__SELF_ADDR_B   	32'h001e	// Type=HEX; Min=11'h000, Max=11'h7ff
`define URAM288_TEST__SELF_ADDR_B_SZ	11

`define URAM288_TEST__SELF_MASK_A   	32'h001f	// Type=HEX; Min=11'h000, Max=11'h7ff
`define URAM288_TEST__SELF_MASK_A_SZ	11

`define URAM288_TEST__SELF_MASK_B   	32'h0020	// Type=HEX; Min=11'h000, Max=11'h7ff
`define URAM288_TEST__SELF_MASK_B_SZ	11

`define URAM288_TEST__TRM_CAS_CLEAR16   	32'h0021	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__TRM_CAS_CLEAR16_SZ	40

`define URAM288_TEST__TRM_TST_CKP2HSEL   	32'h0022	// Type=BINARY; Min=3'b000, Max=3'b111
`define URAM288_TEST__TRM_TST_CKP2HSEL_SZ	3

`define URAM288_TEST__TRM_TST_CKP2SEL   	32'h0023	// Type=BINARY; Min=2'b00, Max=2'b11
`define URAM288_TEST__TRM_TST_CKP2SEL_SZ	2

`define URAM288_TEST__TRM_TST_DIS_CLEAR   	32'h0024	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__TRM_TST_DIS_CLEAR_SZ	40

`define URAM288_TEST__TRM_TST_DSLPSEL   	32'h0025	// Type=BINARY; Min=4'b0000, Max=4'b1111
`define URAM288_TEST__TRM_TST_DSLPSEL_SZ	4

`define URAM288_TEST__TRM_TST_FADIOL   	32'h0026	// Type=BINARY; Min=6'b000000, Max=6'b100011
`define URAM288_TEST__TRM_TST_FADIOL_SZ	6

`define URAM288_TEST__TRM_TST_FADIOR   	32'h0027	// Type=BINARY; Min=6'b000000, Max=6'b100011
`define URAM288_TEST__TRM_TST_FADIOR_SZ	6

`define URAM288_TEST__TRM_TST_REDENIOL   	32'h0028	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__TRM_TST_REDENIOL_SZ	40

`define URAM288_TEST__TRM_TST_REDENIOR   	32'h0029	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__TRM_TST_REDENIOR_SZ	40

`define URAM288_TEST__TRM_TST_RTSEL   	32'h002a	// Type=BINARY; Min=3'b000, Max=3'b111
`define URAM288_TEST__TRM_TST_RTSEL_SZ	3

`define URAM288_TEST__TRM_TST_SAPW_OPT   	32'h002b	// Type=BINARY; Min=2'b00, Max=2'b11
`define URAM288_TEST__TRM_TST_SAPW_OPT_SZ	2

`define URAM288_TEST__TRM_TST_TM   	32'h002c	// Type=STRING; Values=DPSRAM,SPSRAM
`define URAM288_TEST__TRM_TST_TM_SZ	48

`define URAM288_TEST__TRM_TST_WTSEL   	32'h002d	// Type=BINARY; Min=3'b000, Max=3'b111
`define URAM288_TEST__TRM_TST_WTSEL_SZ	3

`define URAM288_TEST__TST_CKP2HSEL   	32'h002e	// Type=BINARY; Min=3'b000, Max=3'b111
`define URAM288_TEST__TST_CKP2HSEL_SZ	3

`define URAM288_TEST__TST_CKP2SEL   	32'h002f	// Type=BINARY; Min=3'b000, Max=3'b111
`define URAM288_TEST__TST_CKP2SEL_SZ	3

`define URAM288_TEST__TST_DIS_CLEAR   	32'h0030	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__TST_DIS_CLEAR_SZ	40

`define URAM288_TEST__TST_DSLPSEL   	32'h0031	// Type=BINARY; Min=4'b0000, Max=4'b1111
`define URAM288_TEST__TST_DSLPSEL_SZ	4

`define URAM288_TEST__TST_RING_EN   	32'h0032	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__TST_RING_EN_SZ	40

`define URAM288_TEST__TST_RTSEL   	32'h0033	// Type=BINARY; Min=3'b000, Max=3'b111
`define URAM288_TEST__TST_RTSEL_SZ	3

`define URAM288_TEST__TST_SAPW_OPT   	32'h0034	// Type=BINARY; Min=2'b00, Max=2'b11
`define URAM288_TEST__TST_SAPW_OPT_SZ	2

`define URAM288_TEST__TST_TM   	32'h0035	// Type=STRING; Values=DPSRAM,SPSRAM
`define URAM288_TEST__TST_TM_SZ	48

`define URAM288_TEST__TST_WTSEL   	32'h0036	// Type=BINARY; Min=3'b000, Max=3'b111
`define URAM288_TEST__TST_WTSEL_SZ	3

`define URAM288_TEST__USE_EXT_CE_A   	32'h0037	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__USE_EXT_CE_A_SZ	40

`define URAM288_TEST__USE_EXT_CE_B   	32'h0038	// Type=STRING; Values=FALSE,TRUE
`define URAM288_TEST__USE_EXT_CE_B_SZ	40

`endif  // B_URAM288_TEST_DEFINES_VH
