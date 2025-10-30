// (c) Copyright 2023 Advanced Micro Devices, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//-----------------------------------------------------------------


`timescale 1ns / 1fs
(* keep_hierarchy = "soft" *)
module extended_phy_layer_gtwiz_versal_0_0_inst  # (
parameter C_Component_Name = "extended_phy_layer_gtwiz_versal_0_0 ",
parameter QUAD0_PACK       = " ",
parameter QUAD1_PACK       = " ",
parameter QUAD2_PACK       = " ",
parameter QUAD3_PACK       = " ",
parameter QUAD4_PACK       = " ",
parameter INTF_QUAD_MAP_CKECK = " ",
parameter IS_KSB           = " ",
parameter QUAD0_TX0_LANE_SEL = " ",
parameter QUAD1_TX0_LANE_SEL = " ",
parameter QUAD2_TX0_LANE_SEL = " ",
parameter QUAD3_TX0_LANE_SEL = " ",
parameter QUAD4_TX0_LANE_SEL = " ",
parameter QUAD0_TX1_LANE_SEL = " ",
parameter QUAD1_TX1_LANE_SEL = " ",
parameter QUAD2_TX1_LANE_SEL = " ",
parameter QUAD3_TX1_LANE_SEL = " ",
parameter QUAD4_TX1_LANE_SEL = " ",
parameter QUAD0_TX2_LANE_SEL = " ",
parameter QUAD1_TX2_LANE_SEL = " ",
parameter QUAD2_TX2_LANE_SEL = " ",
parameter QUAD3_TX2_LANE_SEL = " ",
parameter QUAD4_TX2_LANE_SEL = " ",
parameter QUAD0_TX3_LANE_SEL = " ",
parameter QUAD1_TX3_LANE_SEL = " ",
parameter QUAD2_TX3_LANE_SEL = " ",
parameter QUAD3_TX3_LANE_SEL = " ",
parameter QUAD4_TX3_LANE_SEL = " ",
parameter QUAD0_RX0_LANE_SEL = " ",
parameter QUAD1_RX0_LANE_SEL = " ",
parameter QUAD2_RX0_LANE_SEL = " ",
parameter QUAD3_RX0_LANE_SEL = " ",
parameter QUAD4_RX0_LANE_SEL = " ",
parameter QUAD0_RX1_LANE_SEL = " ",
parameter QUAD1_RX1_LANE_SEL = " ",
parameter QUAD2_RX1_LANE_SEL = " ",
parameter QUAD3_RX1_LANE_SEL = " ",
parameter QUAD4_RX1_LANE_SEL = " ",
parameter QUAD0_RX2_LANE_SEL = " ",
parameter QUAD1_RX2_LANE_SEL = " ",
parameter QUAD2_RX2_LANE_SEL = " ",
parameter QUAD3_RX2_LANE_SEL = " ",
parameter QUAD4_RX2_LANE_SEL = " ",
parameter QUAD0_RX3_LANE_SEL = " ",
parameter QUAD1_RX3_LANE_SEL = " ",
parameter QUAD2_RX3_LANE_SEL = " ",
parameter QUAD3_RX3_LANE_SEL = " ",
parameter QUAD4_RX3_LANE_SEL = " ",
parameter INTF_CHANNEL_NUMBERING = " ",
parameter QUAD0_LANE_SATISFIED = " ",
parameter QUAD1_LANE_SATISFIED = " ",
parameter QUAD2_LANE_SATISFIED = " ",
parameter QUAD3_LANE_SATISFIED = " ",
parameter QUAD4_LANE_SATISFIED = " ",
parameter QUAD0_COMMON_SETTINGS = " ",
parameter QUAD1_COMMON_SETTINGS = " ",
parameter QUAD2_COMMON_SETTINGS = " ",
parameter QUAD3_COMMON_SETTINGS = " ",
parameter QUAD4_COMMON_SETTINGS = " ",
parameter QUAD0_LANE_SEL_DICT = " ",
parameter QUAD1_LANE_SEL_DICT = " ",
parameter QUAD2_LANE_SEL_DICT = " ",
parameter QUAD3_LANE_SEL_DICT = " ",
parameter QUAD4_LANE_SEL_DICT = " ",
parameter QUAD0_INTF_LANESEL_DICT = " ",
parameter QUAD1_INTF_LANESEL_DICT = " ",
parameter QUAD2_INTF_LANESEL_DICT = " ",
parameter QUAD3_INTF_LANESEL_DICT = " ",
parameter QUAD4_INTF_LANESEL_DICT = " ",
parameter QUAD0_MSTCLK_SRC_DICT = " ",
parameter QUAD1_MSTCLK_SRC_DICT = " ",
parameter QUAD2_MSTCLK_SRC_DICT = " ",
parameter QUAD3_MSTCLK_SRC_DICT = " ",
parameter QUAD4_MSTCLK_SRC_DICT = " ",
parameter INTF0_LANE_MAPING = " ",
parameter INTF1_LANE_MAPING = " ",
parameter INTF2_LANE_MAPING = " ",
parameter INTF3_LANE_MAPING = " ",
parameter INTF4_LANE_MAPING = " ",
parameter INTF5_LANE_MAPING = " ",
parameter INTF6_LANE_MAPING = " ",
parameter INTF7_LANE_MAPING = " ",
parameter INTF0_CHANNEL_MAPING = " ",
parameter INTF1_CHANNEL_MAPING = " ",
parameter INTF2_CHANNEL_MAPING = " ",
parameter INTF3_CHANNEL_MAPING = " ",
parameter INTF4_CHANNEL_MAPING = " ",
parameter INTF5_CHANNEL_MAPING = " ",
parameter INTF6_CHANNEL_MAPING = " ",
parameter INTF7_CHANNEL_MAPING = " ",
parameter INTF_LANE_MAP_LIST = " ",
parameter QUAD0_LANEUSAGE = " ",
parameter QUAD1_LANEUSAGE = " ",
parameter QUAD2_LANEUSAGE = " ",
parameter QUAD3_LANEUSAGE = " ",
parameter QUAD4_LANEUSAGE = " ",
parameter QUAD0_REFCLK_SEL = " ",
parameter QUAD1_REFCLK_SEL = " ",
parameter QUAD2_REFCLK_SEL = " ",
parameter QUAD3_REFCLK_SEL = " ",
parameter QUAD4_REFCLK_SEL = " ",
parameter INTF_PARENT_PIN_LIST = " ",
parameter QUAD0_PROT0_SETTINGS = " ",
parameter QUAD0_PROT1_SETTINGS = " ",
parameter QUAD0_PROT2_SETTINGS = " ",
parameter QUAD0_PROT3_SETTINGS = " ",
parameter QUAD0_PROT4_SETTINGS = " ",
parameter QUAD0_PROT5_SETTINGS = " ",
parameter QUAD0_PROT6_SETTINGS = " ",
parameter QUAD0_PROT7_SETTINGS = " ",
parameter QUAD1_PROT0_SETTINGS = " ",
parameter QUAD1_PROT1_SETTINGS = " ",
parameter QUAD1_PROT2_SETTINGS = " ",
parameter QUAD1_PROT3_SETTINGS = " ",
parameter QUAD1_PROT4_SETTINGS = " ",
parameter QUAD1_PROT5_SETTINGS = " ",
parameter QUAD1_PROT6_SETTINGS = " ",
parameter QUAD1_PROT7_SETTINGS = " ",
parameter QUAD2_PROT0_SETTINGS = " ",
parameter QUAD2_PROT1_SETTINGS = " ",
parameter QUAD2_PROT2_SETTINGS = " ",
parameter QUAD2_PROT3_SETTINGS = " ",
parameter QUAD2_PROT4_SETTINGS = " ",
parameter QUAD2_PROT5_SETTINGS = " ",
parameter QUAD2_PROT6_SETTINGS = " ",
parameter QUAD2_PROT7_SETTINGS = " ",
parameter QUAD3_PROT0_SETTINGS = " ",
parameter QUAD3_PROT1_SETTINGS = " ",
parameter QUAD3_PROT2_SETTINGS = " ",
parameter QUAD3_PROT3_SETTINGS = " ",
parameter QUAD3_PROT4_SETTINGS = " ",
parameter QUAD3_PROT5_SETTINGS = " ",
parameter QUAD3_PROT6_SETTINGS = " ",
parameter QUAD3_PROT7_SETTINGS = " ",
parameter QUAD4_PROT0_SETTINGS = " ",
parameter QUAD4_PROT1_SETTINGS = " ",
parameter QUAD4_PROT2_SETTINGS = " ",
parameter QUAD4_PROT3_SETTINGS = " ",
parameter QUAD4_PROT4_SETTINGS = " ",
parameter QUAD4_PROT5_SETTINGS = " ",
parameter QUAD4_PROT6_SETTINGS = " ",
parameter QUAD4_PROT7_SETTINGS = " "
 ) (
       input              QUAD0_GTREFCLK0,

       input  [127:0]     INTF0_TX0_ch_txdata ,
       output [1:0]       INTF0_TX0_ch_txbufstatus ,
       output             INTF0_TX0_ch_txdccdone ,
       input              INTF0_TX0_ch_gttxreset ,
       output             INTF0_TX0_ch_txdebugpcsout ,
       output             INTF0_TX0_ch_txprogdivresetdone ,
       output             INTF0_TX0_ch_txresetdone ,
       input              INTF0_TX0_ch_txinhibit ,
       input              INTF0_TX0_ch_txlatclk ,
       input  [6:0]       INTF0_TX0_ch_txmaincursor ,
       input              INTF0_TX0_ch_txpcsresetmask ,
       input  [1:0]       INTF0_TX0_ch_txpd ,
       input              INTF0_TX0_ch_txpisopd ,
       input  [2:0]       INTF0_TX0_ch_txpmaresetmask ,
       input              INTF0_TX0_ch_txpolarity ,
       input  [4:0]       INTF0_TX0_ch_txpostcursor ,
       input              INTF0_TX0_ch_txprbsforceerr ,
       input  [3:0]       INTF0_TX0_ch_txprbssel ,
       input  [4:0]       INTF0_TX0_ch_txprecursor ,
       input              INTF0_TX0_ch_txprogdivreset ,
       input  [7:0]       INTF0_TX0_ch_txrate ,
       input  [1:0]       INTF0_TX0_ch_txresetmode ,
       input  [5:0]       INTF0_TX0_ch_txheader ,
       input  [6:0]       INTF0_TX0_ch_txsequence ,
       input  [1:0]       INTF0_TX0_ch_txphalignresetmask ,
       input              INTF0_TX0_ch_txcominit ,
       input              INTF0_TX0_ch_txcomsas ,
       input              INTF0_TX0_ch_txcomwake ,
       input              INTF0_TX0_ch_txdapicodeovrden ,
       input              INTF0_TX0_ch_txdapicodereset ,
       input              INTF0_TX0_ch_txdetectrx ,
       input              INTF0_TX0_ch_txphdlytstclk ,
       input              INTF0_TX0_ch_txdlyalignreq ,
       input              INTF0_TX0_ch_txelecidle ,
       input              INTF0_TX0_ch_txmldchaindone ,
       input              INTF0_TX0_ch_txmldchainreq ,
       input              INTF0_TX0_ch_txoneszeros ,
       input              INTF0_TX0_ch_txpausedelayalign ,
       input              INTF0_TX0_ch_txphalignreq ,
       input              INTF0_TX0_ch_txphdlypd ,
       input              INTF0_TX0_ch_txphdlyreset ,
       input              INTF0_TX0_ch_txphsetinitreq ,
       input              INTF0_TX0_ch_txphshift180 ,
       input              INTF0_TX0_ch_txpicodeovrden ,
       input              INTF0_TX0_ch_txpicodereset ,
       input              INTF0_TX0_ch_txpippmen ,
       input              INTF0_TX0_ch_txswing ,
       input              INTF0_TX0_ch_txsyncallin ,
       output             INTF0_TX0_ch_tx10gstat ,
       output             INTF0_TX0_ch_txcomfinish ,
       output             INTF0_TX0_ch_txdlyalignerr ,
       output             INTF0_TX0_ch_txdlyalignprog ,
       output             INTF0_TX0_ch_txphaligndone ,
       output             INTF0_TX0_ch_txphalignerr ,
       output             INTF0_TX0_ch_txphalignoutrsvd ,
       output             INTF0_TX0_ch_txphdlyresetdone ,
       output             INTF0_TX0_ch_txphsetinitdone ,
       output             INTF0_TX0_ch_txphshift180done ,
       output             INTF0_TX0_ch_txsyncdone ,
       input  [15:0]      INTF0_TX0_ch_txctrl0 ,
       input  [15:0]      INTF0_TX0_ch_txctrl1 ,
       input  [7:0]       INTF0_TX0_ch_txctrl2 ,
       input  [1:0]       INTF0_TX0_ch_txdeemph ,
       input  [2:0]       INTF0_TX0_ch_txmargin ,
       input  [4:0]       INTF0_TX0_ch_txdiffctrl ,
       input  [4:0]       INTF0_TX0_ch_txpippmstepsize ,
       output             INTF0_TX0_ch_txdapiresetdone ,
       output             INTF0_TX0_ch_txqpisenn ,
       output             INTF0_TX0_ch_txqpisenp ,
       output             INTF0_TX0_ch_txswingouthigh ,
       output             INTF0_TX0_ch_txswingoutlow ,
       input              INTF0_TX0_ch_txdapireset ,
       input  [1:0]       INTF0_TX0_ch_txdapiresetmask ,
       input              INTF0_TX0_ch_txqpibiasen ,
       input              INTF0_TX0_ch_txqpiweakpu ,

       output [2:0]       INTF0_RX0_ch_rxbufstatus ,
       output             INTF0_RX0_ch_rxcdrlock ,
       output             INTF0_RX0_ch_rxdebugpcsout ,
       output             INTF0_RX0_ch_rxprbserr ,
       output             INTF0_RX0_ch_rxprbslocked ,
       input              INTF0_RX0_ch_rxcdrhold ,
       input              INTF0_RX0_ch_rxcdrovrden ,
       input              INTF0_RX0_ch_rxlatclk ,
       input  [4:0]       INTF0_RX0_ch_rxpcsresetmask ,
       input  [1:0]       INTF0_RX0_ch_rxpd ,
       input  [6:0]       INTF0_RX0_ch_rxpmaresetmask ,
       input              INTF0_RX0_ch_rxpolarity ,
       input              INTF0_RX0_ch_rxprbscntreset ,
       input  [7:0]       INTF0_RX0_ch_rxrate ,
       input  [1:0]       INTF0_RX0_ch_rxresetmode ,
       output [127:0]     INTF0_RX0_ch_rxdata ,
       output [7:0]       INTF0_RX0_ch_rx10gstat ,
       output [1:0]       INTF0_RX0_ch_rxdatavalid ,
       output [5:0]       INTF0_RX0_ch_rxheader ,
       output             INTF0_RX0_ch_rxchanisaligned ,
       output             INTF0_RX0_ch_rxchanrealign ,
       input  [4:0]       INTF0_RX0_ch_rxchbondi ,
       output [4:0]       INTF0_RX0_ch_rxchbondo ,
       output [1:0]       INTF0_RX0_ch_rxclkcorcnt ,
       output             INTF0_RX0_ch_rxcominitdet ,
       output             INTF0_RX0_ch_rxcommadet ,
       output             INTF0_RX0_ch_rxbyteisaligned ,
       output             INTF0_RX0_ch_rxbyterealign ,
       output             INTF0_RX0_ch_rxcomsasdet ,
       output             INTF0_RX0_ch_rxcomwakedet ,
       output [15:0]      INTF0_RX0_ch_rxctrl0 ,
       output [15:0]      INTF0_RX0_ch_rxctrl1 ,
       output [7:0]       INTF0_RX0_ch_rxctrl2 ,
       output [7:0]       INTF0_RX0_ch_rxctrl3 ,
       input              INTF0_RX0_ch_rxdapicodeovrden ,
       input              INTF0_RX0_ch_rxdapicodereset ,
       output             INTF0_RX0_ch_rxdlyalignerr ,
       output             INTF0_RX0_ch_rxdlyalignprog ,
       input              INTF0_RX0_ch_rxdlyalignreq ,
       output             INTF0_RX0_ch_rxelecidle ,
       input              INTF0_RX0_ch_rxeqtraining ,
       output             INTF0_RX0_ch_rxfinealigndone ,
       input              INTF0_RX0_ch_rxgearboxslip ,
       output [1:0]       INTF0_RX0_ch_rxheadervalid ,
       input              INTF0_RX0_ch_rxlpmen ,
       input              INTF0_RX0_ch_rxmldchaindone ,
       input              INTF0_RX0_ch_rxmldchainreq ,
       input              INTF0_RX0_ch_rxmlfinealignreq ,
       input              INTF0_RX0_ch_rxoobreset ,
       output             INTF0_RX0_ch_rxosintdone ,
       output             INTF0_RX0_ch_rxphaligndone ,
       output             INTF0_RX0_ch_rxphalignerr ,
       input              INTF0_RX0_ch_rxphalignreq ,
       input  [1:0]       INTF0_RX0_ch_rxphalignresetmask ,
       input              INTF0_RX0_ch_rxphdlypd ,
       input              INTF0_RX0_ch_rxphdlyreset ,
       output             INTF0_RX0_ch_rxphdlyresetdone ,
       input              INTF0_RX0_ch_rxphsetinitreq ,
       input              INTF0_RX0_ch_rxphshift180 ,
       output             INTF0_RX0_ch_rxphshift180done ,
       output             INTF0_RX0_ch_rxphsetinitdone ,
       input              INTF0_RX0_ch_rxslide ,
       output             INTF0_RX0_ch_rxsliderdy ,
       output [1:0]       INTF0_RX0_ch_rxstartofseq ,
       output [2:0]       INTF0_RX0_ch_rxstatus ,
       input              INTF0_RX0_ch_rxsyncallin ,
       output             INTF0_RX0_ch_rxsyncdone ,
       input              INTF0_RX0_ch_rxtermination ,
       output             INTF0_RX0_ch_rxvalid ,
       output             INTF0_RX0_ch_rxchanbondseq ,
       output             INTF0_RX0_ch_rxchanbond_busy ,
       input              INTF0_RX0_ch_rxchanbond_en ,
       input              INTF0_RX0_ch_rxchanbond_master ,
       input              INTF0_RX0_ch_rxchanbond_slave ,
       input  [2:0]       INTF0_RX0_ch_rxchanbond_level ,
       input              INTF0_RX0_ch_cdrbmcdrreq ,
       input              INTF0_RX0_ch_cdrfreqos ,
       input              INTF0_RX0_ch_cdrincpctrl ,
       input              INTF0_RX0_ch_cdrstepdir ,
       input              INTF0_RX0_ch_cdrstepsq ,
       input              INTF0_RX0_ch_cdrstepsx ,
       input              INTF0_RX0_ch_eyescanreset ,
       input              INTF0_RX0_ch_eyescantrigger ,
       output             INTF0_RX0_ch_eyescandataerror ,
       output [1:0]       INTF0_RX0_ch_refdebugout ,
       output             INTF0_RX0_ch_rxdapiresetdone ,
       output             INTF0_RX0_ch_rxpkdet ,
       output             INTF0_RX0_ch_rxqpisenn ,
       output             INTF0_RX0_ch_rxqpisenp ,
       output             INTF0_RX0_ch_rxsimplexphystatus ,
       output             INTF0_RX0_ch_rxslipdone ,
       input              INTF0_RX0_ch_dfehold ,
       input              INTF0_RX0_ch_dfeovrd ,
       input              INTF0_RX0_ch_rxdapireset ,
       input  [1:0]       INTF0_RX0_ch_rxdapiresetmask ,
       input              INTF0_RX0_ch_rxqpien ,
       output             INTF0_RX0_ch_rxcdrphdone ,
       input              INTF0_RX0_ch_gtrxreset ,
       output             INTF0_RX0_ch_rxprogdivresetdone ,
       output             INTF0_RX0_ch_rxresetdone ,
       input              INTF0_RX0_ch_rxcdrreset ,
       input  [3:0]       INTF0_RX0_ch_rxprbssel ,
       input              INTF0_RX0_ch_rxprogdivreset ,

       input              gtwiz_freerun_clk,
       // GPIO
       input  [31:0]      QUAD0_gpi ,
       output [31:0]      QUAD0_gpo ,
 
 
 
       // Loopback
       input  [2:0]       QUAD0_ch3_loopback ,
 
 
       // HSCLK LCPLL lock
       output             QUAD0_hsclk0_lcplllock ,
 
       // APB3 Interface
       input  [3:0]       QUAD0_rxp ,
       input  [3:0]       QUAD0_rxn ,
       output [3:0]       QUAD0_txp ,
       output [3:0]       QUAD0_txn ,


       output             QUAD0_TX3_outclk ,
       output             QUAD0_RX3_outclk ,
       output             INTF0_TX_clr_out,
       output             INTF0_TX_clrb_leaf_out,
       output             INTF0_RX_clr_out,
       output             INTF0_RX_clrb_leaf_out,

//reset IP connections
       input              INTF0_rst_all_in,
       input              INTF0_rst_tx_pll_and_datapath_in,
       input              INTF0_rst_tx_datapath_in,
       output             INTF0_rst_tx_done_out,
       input              INTF0_rst_rx_pll_and_datapath_in,
       input              INTF0_rst_rx_datapath_in,
       output             INTF0_rst_rx_done_out,

       input              QUAD0_TX3_usrclk,
       input              QUAD0_RX3_usrclk,

       output             gtpowergood

);
// wire declarations
wire QUAD0_gtpowergood; 


wire INTF0_gtpowergood_in;
wire INTF0_rst_userclk_tx_active;
wire INTF0_mst_tx_resetdone;
wire INTF0_rst_txuserrdy;
wire INTF0_mst_tx_reset;
wire INTF0_mst_tx_dp_reset;
wire [1-1:0] INTF0_rst_userclk_tx_active_int;
wire [1-1:0] INTF0_mst_tx_resetdone_int;
wire INTF0_rst_userclk_rx_active;
wire INTF0_mst_rx_resetdone;
wire INTF0_rst_rxuserrdy;
wire INTF0_mst_rx_reset;
wire INTF0_mst_rx_dp_reset;
wire [1-1:0] INTF0_rst_userclk_rx_active_int;
wire [1-1:0] INTF0_mst_rx_resetdone_int;

assign INTF0_rst_userclk_tx_active = &INTF0_rst_userclk_tx_active_int;
assign INTF0_mst_tx_resetdone      = &INTF0_mst_tx_resetdone_int;
assign INTF0_rst_userclk_rx_active = &INTF0_rst_userclk_rx_active_int;
assign INTF0_mst_rx_resetdone      = &INTF0_mst_rx_resetdone_int;


  extended_phy_layer_gtwiz_versal_0_0_reset_ip   #(
          .MASTER_RESET_EN (1) ) extended_phy_layer_gtwiz_versal_0_0_gtreset_inst_0 (
          //Inputs to Reset IP from Parent IP
          .gtwiz_reset_clk_freerun_in         (gtwiz_freerun_clk),
          .gtwiz_reset_all_in                 (INTF0_rst_all_in),
          .gtwiz_reset_tx_pll_and_datapath_in (INTF0_rst_tx_pll_and_datapath_in),
          .gtwiz_reset_tx_datapath_in         (INTF0_rst_tx_datapath_in),
          .gtwiz_reset_rx_pll_and_datapath_in (INTF0_rst_rx_pll_and_datapath_in),
          .gtwiz_reset_rx_datapath_in         (INTF0_rst_rx_datapath_in),

	  //Inputs to Reset IP from Quad
          .gtwiz_reset_userclk_tx_active_in   (INTF0_rst_userclk_tx_active),
          .gtwiz_reset_userclk_rx_active_in   (INTF0_rst_userclk_rx_active),
          .gtpowergood_in                     (INTF0_gtpowergood_in),
          .mst_tx_resetdone                   (INTF0_mst_tx_resetdone),
          .mst_rx_resetdone                   (INTF0_mst_rx_resetdone),

          //Outputs from Reset IP to Parent IP
          .gtwiz_reset_tx_done_out            (INTF0_rst_tx_done_out),
          .gtwiz_reset_rx_done_out            (INTF0_rst_rx_done_out),

	  //Outputs from Reset IP to Quad
          .txuserrdy_out                      (INTF0_rst_txuserrdy),
          .rxuserrdy_out                      (INTF0_rst_rxuserrdy),
          .mst_tx_reset                       (INTF0_mst_tx_reset),
          .mst_rx_reset                       (INTF0_mst_rx_reset),
          .mst_tx_dp_reset                    (INTF0_mst_tx_dp_reset),
          .mst_rx_dp_reset                    (INTF0_mst_rx_dp_reset),

	  //Inputs unused in Master mode
          .tx_enabled_tie_in                  (1'b0),
          .rx_enabled_tie_in                  (1'b0),
          .shared_pll_tie_in                  (1'b0),
          .txusrclk2_in                       (1'b0),
          .ilo_reset_done                     (1'b0),
          .plllock_tx_in                      (1'b0),
          .txresetdone_in                     (1'b0),
          .rxusrclk2_in                       (1'b0),
          .plllock_rx_in                      (1'b0),
          .rxcdrlock_in                       (1'b0),
          .rxresetdone_in                     (1'b0),
          .pcie_enable                        (1'b0),

	  //Outputs unused in Master mode
          .pllreset_tx_out                    (),
          .txprogdivreset_out                 (),
          .iloreset_out                       (),
          .gttxreset_out                      (),
          .pllreset_rx_out                    (),
          .rxprogdivreset_out                 (),
          .gtrxreset_out                      (),
          .gtwiz_reset_rx_cdr_stable_out      (),

          //.iloreset_out                       (),
          .pcie_rstb_out                      (),//Quad0_pcie_rstb_out,
          .rx_clr_out                         (INTF0_RX_clr_out),
          .rx_clrb_leaf_out                   (INTF0_RX_clrb_leaf_out),//Quad0_rx_clrb_leaf_out,
          .tx_clr_out                         (INTF0_TX_clr_out),
          .tx_clrb_leaf_out                   (INTF0_TX_clrb_leaf_out)//Quad0_tx_clrb_leaf_out
        );



wire QUAD0_TX0_usrclk = 1'b0;
wire QUAD0_RX0_usrclk = 1'b0;
wire QUAD0_TX1_usrclk = 1'b0;
wire QUAD0_RX1_usrclk = 1'b0;
wire QUAD0_TX2_usrclk = 1'b0;
wire QUAD0_RX2_usrclk = 1'b0;

extended_phy_layer_gtwiz_versal_0_0_intf_quad_map  # (
   .C_NO_OF_QUADS ( 1 ),
   .C_NO_OF_INTFS ( 1 )
) intf_quad_map_inst (


       // INTF0_TX ports
       .INTF0_TX0_ch_txdata ( INTF0_TX0_ch_txdata ),
       .INTF0_TX0_ch_txbufstatus ( INTF0_TX0_ch_txbufstatus ),
       .INTF0_TX0_ch_txdccdone ( INTF0_TX0_ch_txdccdone ),
       .INTF0_TX0_ch_gttxreset ( INTF0_TX0_ch_gttxreset ),
       .INTF0_TX0_ch_txdebugpcsout ( INTF0_TX0_ch_txdebugpcsout ),
       .INTF0_TX0_ch_txprogdivresetdone ( INTF0_TX0_ch_txprogdivresetdone ),
       .INTF0_TX0_ch_txresetdone ( INTF0_TX0_ch_txresetdone ),
       .INTF0_TX0_ch_txinhibit ( INTF0_TX0_ch_txinhibit ),
       .INTF0_TX0_ch_txlatclk ( INTF0_TX0_ch_txlatclk ),
       .INTF0_TX0_ch_txmaincursor ( INTF0_TX0_ch_txmaincursor ),
       .INTF0_TX0_ch_txpcsresetmask ( INTF0_TX0_ch_txpcsresetmask ),
       .INTF0_TX0_ch_txpd ( INTF0_TX0_ch_txpd ),
       .INTF0_TX0_ch_txpisopd ( INTF0_TX0_ch_txpisopd ),
       .INTF0_TX0_ch_txpmaresetmask ( INTF0_TX0_ch_txpmaresetmask ),
       .INTF0_TX0_ch_txpolarity ( INTF0_TX0_ch_txpolarity ),
       .INTF0_TX0_ch_txpostcursor ( INTF0_TX0_ch_txpostcursor ),
       .INTF0_TX0_ch_txprbsforceerr ( INTF0_TX0_ch_txprbsforceerr ),
       .INTF0_TX0_ch_txprbssel ( INTF0_TX0_ch_txprbssel ),
       .INTF0_TX0_ch_txprecursor ( INTF0_TX0_ch_txprecursor ),
       .INTF0_TX0_ch_txprogdivreset ( INTF0_TX0_ch_txprogdivreset ),
       .INTF0_TX0_ch_txrate ( INTF0_TX0_ch_txrate ),
       .INTF0_TX0_ch_txresetmode ( INTF0_TX0_ch_txresetmode ),
       .INTF0_TX0_ch_txheader ( INTF0_TX0_ch_txheader ),
       .INTF0_TX0_ch_txsequence ( INTF0_TX0_ch_txsequence ),
       .INTF0_TX0_ch_txphalignresetmask ( INTF0_TX0_ch_txphalignresetmask ),
       .INTF0_TX0_ch_txcominit ( INTF0_TX0_ch_txcominit ),
       .INTF0_TX0_ch_txcomsas ( INTF0_TX0_ch_txcomsas ),
       .INTF0_TX0_ch_txcomwake ( INTF0_TX0_ch_txcomwake ),
       .INTF0_TX0_ch_txdapicodeovrden ( INTF0_TX0_ch_txdapicodeovrden ),
       .INTF0_TX0_ch_txdapicodereset ( INTF0_TX0_ch_txdapicodereset ),
       .INTF0_TX0_ch_txdetectrx ( INTF0_TX0_ch_txdetectrx ),
       .INTF0_TX0_ch_txphdlytstclk ( INTF0_TX0_ch_txphdlytstclk ),
       .INTF0_TX0_ch_txdlyalignreq ( INTF0_TX0_ch_txdlyalignreq ),
       .INTF0_TX0_ch_txelecidle ( INTF0_TX0_ch_txelecidle ),
       .INTF0_TX0_ch_txmldchaindone ( INTF0_TX0_ch_txmldchaindone ),
       .INTF0_TX0_ch_txmldchainreq ( INTF0_TX0_ch_txmldchainreq ),
       .INTF0_TX0_ch_txoneszeros ( INTF0_TX0_ch_txoneszeros ),
       .INTF0_TX0_ch_txpausedelayalign ( INTF0_TX0_ch_txpausedelayalign ),
       .INTF0_TX0_ch_txphalignreq ( INTF0_TX0_ch_txphalignreq ),
       .INTF0_TX0_ch_txphdlypd ( INTF0_TX0_ch_txphdlypd ),
       .INTF0_TX0_ch_txphdlyreset ( INTF0_TX0_ch_txphdlyreset ),
       .INTF0_TX0_ch_txphsetinitreq ( INTF0_TX0_ch_txphsetinitreq ),
       .INTF0_TX0_ch_txphshift180 ( INTF0_TX0_ch_txphshift180 ),
       .INTF0_TX0_ch_txpicodeovrden ( INTF0_TX0_ch_txpicodeovrden ),
       .INTF0_TX0_ch_txpicodereset ( INTF0_TX0_ch_txpicodereset ),
       .INTF0_TX0_ch_txpippmen ( INTF0_TX0_ch_txpippmen ),
       .INTF0_TX0_ch_txswing ( INTF0_TX0_ch_txswing ),
       .INTF0_TX0_ch_txsyncallin ( INTF0_TX0_ch_txsyncallin ),
       .INTF0_TX0_ch_tx10gstat ( INTF0_TX0_ch_tx10gstat ),
       .INTF0_TX0_ch_txcomfinish ( INTF0_TX0_ch_txcomfinish ),
       .INTF0_TX0_ch_txdlyalignerr ( INTF0_TX0_ch_txdlyalignerr ),
       .INTF0_TX0_ch_txdlyalignprog ( INTF0_TX0_ch_txdlyalignprog ),
       .INTF0_TX0_ch_txphaligndone ( INTF0_TX0_ch_txphaligndone ),
       .INTF0_TX0_ch_txphalignerr ( INTF0_TX0_ch_txphalignerr ),
       .INTF0_TX0_ch_txphalignoutrsvd ( INTF0_TX0_ch_txphalignoutrsvd ),
       .INTF0_TX0_ch_txphdlyresetdone ( INTF0_TX0_ch_txphdlyresetdone ),
       .INTF0_TX0_ch_txphsetinitdone ( INTF0_TX0_ch_txphsetinitdone ),
       .INTF0_TX0_ch_txphshift180done ( INTF0_TX0_ch_txphshift180done ),
       .INTF0_TX0_ch_txsyncdone ( INTF0_TX0_ch_txsyncdone ),
       .INTF0_TX0_ch_txctrl0 ( INTF0_TX0_ch_txctrl0 ),
       .INTF0_TX0_ch_txctrl1 ( INTF0_TX0_ch_txctrl1 ),
       .INTF0_TX0_ch_txctrl2 ( INTF0_TX0_ch_txctrl2 ),
       .INTF0_TX0_ch_txdeemph ( INTF0_TX0_ch_txdeemph ),
       .INTF0_TX0_ch_txmargin ( INTF0_TX0_ch_txmargin ),
       .INTF0_TX0_ch_txdiffctrl ( INTF0_TX0_ch_txdiffctrl ),
       .INTF0_TX0_ch_txpippmstepsize ( INTF0_TX0_ch_txpippmstepsize ),
       .INTF0_TX0_ch_txdapiresetdone ( INTF0_TX0_ch_txdapiresetdone ),
       .INTF0_TX0_ch_txqpisenn ( INTF0_TX0_ch_txqpisenn ),
       .INTF0_TX0_ch_txqpisenp ( INTF0_TX0_ch_txqpisenp ),
       .INTF0_TX0_ch_txswingouthigh ( INTF0_TX0_ch_txswingouthigh ),
       .INTF0_TX0_ch_txswingoutlow ( INTF0_TX0_ch_txswingoutlow ),
       .INTF0_TX0_ch_txdapireset ( INTF0_TX0_ch_txdapireset ),
       .INTF0_TX0_ch_txdapiresetmask ( INTF0_TX0_ch_txdapiresetmask ),
       .INTF0_TX0_ch_txqpibiasen ( INTF0_TX0_ch_txqpibiasen ),
       .INTF0_TX0_ch_txqpiweakpu ( INTF0_TX0_ch_txqpiweakpu ),

       // INTF0_RX ports
       .INTF0_RX0_ch_rxbufstatus ( INTF0_RX0_ch_rxbufstatus ),
       .INTF0_RX0_ch_rxcdrlock ( INTF0_RX0_ch_rxcdrlock ),
       .INTF0_RX0_ch_rxdebugpcsout ( INTF0_RX0_ch_rxdebugpcsout ),
       .INTF0_RX0_ch_rxprbserr ( INTF0_RX0_ch_rxprbserr ),
       .INTF0_RX0_ch_rxprbslocked ( INTF0_RX0_ch_rxprbslocked ),
       .INTF0_RX0_ch_rxcdrhold ( INTF0_RX0_ch_rxcdrhold ),
       .INTF0_RX0_ch_rxcdrovrden ( INTF0_RX0_ch_rxcdrovrden ),
       .INTF0_RX0_ch_rxlatclk ( INTF0_RX0_ch_rxlatclk ),
       .INTF0_RX0_ch_rxpcsresetmask ( INTF0_RX0_ch_rxpcsresetmask ),
       .INTF0_RX0_ch_rxpd ( INTF0_RX0_ch_rxpd ),
       .INTF0_RX0_ch_rxpmaresetmask ( INTF0_RX0_ch_rxpmaresetmask ),
       .INTF0_RX0_ch_rxpolarity ( INTF0_RX0_ch_rxpolarity ),
       .INTF0_RX0_ch_rxprbscntreset ( INTF0_RX0_ch_rxprbscntreset ),
       .INTF0_RX0_ch_rxrate ( INTF0_RX0_ch_rxrate ),
       .INTF0_RX0_ch_rxresetmode ( INTF0_RX0_ch_rxresetmode ),
       .INTF0_RX0_ch_rxdata ( INTF0_RX0_ch_rxdata ),
       .INTF0_RX0_ch_rx10gstat ( INTF0_RX0_ch_rx10gstat ),
       .INTF0_RX0_ch_rxdatavalid ( INTF0_RX0_ch_rxdatavalid ),
       .INTF0_RX0_ch_rxheader ( INTF0_RX0_ch_rxheader ),
       .INTF0_RX0_ch_rxchanisaligned ( INTF0_RX0_ch_rxchanisaligned ),
       .INTF0_RX0_ch_rxchanrealign ( INTF0_RX0_ch_rxchanrealign ),
       .INTF0_RX0_ch_rxchbondi ( INTF0_RX0_ch_rxchbondi ),
       .INTF0_RX0_ch_rxchbondo ( INTF0_RX0_ch_rxchbondo ),
       .INTF0_RX0_ch_rxclkcorcnt ( INTF0_RX0_ch_rxclkcorcnt ),
       .INTF0_RX0_ch_rxcominitdet ( INTF0_RX0_ch_rxcominitdet ),
       .INTF0_RX0_ch_rxcommadet ( INTF0_RX0_ch_rxcommadet ),
       .INTF0_RX0_ch_rxbyteisaligned ( INTF0_RX0_ch_rxbyteisaligned ),
       .INTF0_RX0_ch_rxbyterealign ( INTF0_RX0_ch_rxbyterealign ),
       .INTF0_RX0_ch_rxcomsasdet ( INTF0_RX0_ch_rxcomsasdet ),
       .INTF0_RX0_ch_rxcomwakedet ( INTF0_RX0_ch_rxcomwakedet ),
       .INTF0_RX0_ch_rxctrl0 ( INTF0_RX0_ch_rxctrl0 ),
       .INTF0_RX0_ch_rxctrl1 ( INTF0_RX0_ch_rxctrl1 ),
       .INTF0_RX0_ch_rxctrl2 ( INTF0_RX0_ch_rxctrl2 ),
       .INTF0_RX0_ch_rxctrl3 ( INTF0_RX0_ch_rxctrl3 ),
       .INTF0_RX0_ch_rxdapicodeovrden ( INTF0_RX0_ch_rxdapicodeovrden ),
       .INTF0_RX0_ch_rxdapicodereset ( INTF0_RX0_ch_rxdapicodereset ),
       .INTF0_RX0_ch_rxdlyalignerr ( INTF0_RX0_ch_rxdlyalignerr ),
       .INTF0_RX0_ch_rxdlyalignprog ( INTF0_RX0_ch_rxdlyalignprog ),
       .INTF0_RX0_ch_rxdlyalignreq ( INTF0_RX0_ch_rxdlyalignreq ),
       .INTF0_RX0_ch_rxelecidle ( INTF0_RX0_ch_rxelecidle ),
       .INTF0_RX0_ch_rxeqtraining ( INTF0_RX0_ch_rxeqtraining ),
       .INTF0_RX0_ch_rxfinealigndone ( INTF0_RX0_ch_rxfinealigndone ),
       .INTF0_RX0_ch_rxgearboxslip ( INTF0_RX0_ch_rxgearboxslip ),
       .INTF0_RX0_ch_rxheadervalid ( INTF0_RX0_ch_rxheadervalid ),
       .INTF0_RX0_ch_rxlpmen ( INTF0_RX0_ch_rxlpmen ),
       .INTF0_RX0_ch_rxmldchaindone ( INTF0_RX0_ch_rxmldchaindone ),
       .INTF0_RX0_ch_rxmldchainreq ( INTF0_RX0_ch_rxmldchainreq ),
       .INTF0_RX0_ch_rxmlfinealignreq ( INTF0_RX0_ch_rxmlfinealignreq ),
       .INTF0_RX0_ch_rxoobreset ( INTF0_RX0_ch_rxoobreset ),
       .INTF0_RX0_ch_rxosintdone ( INTF0_RX0_ch_rxosintdone ),
       .INTF0_RX0_ch_rxphaligndone ( INTF0_RX0_ch_rxphaligndone ),
       .INTF0_RX0_ch_rxphalignerr ( INTF0_RX0_ch_rxphalignerr ),
       .INTF0_RX0_ch_rxphalignreq ( INTF0_RX0_ch_rxphalignreq ),
       .INTF0_RX0_ch_rxphalignresetmask ( INTF0_RX0_ch_rxphalignresetmask ),
       .INTF0_RX0_ch_rxphdlypd ( INTF0_RX0_ch_rxphdlypd ),
       .INTF0_RX0_ch_rxphdlyreset ( INTF0_RX0_ch_rxphdlyreset ),
       .INTF0_RX0_ch_rxphdlyresetdone ( INTF0_RX0_ch_rxphdlyresetdone ),
       .INTF0_RX0_ch_rxphsetinitreq ( INTF0_RX0_ch_rxphsetinitreq ),
       .INTF0_RX0_ch_rxphshift180 ( INTF0_RX0_ch_rxphshift180 ),
       .INTF0_RX0_ch_rxphshift180done ( INTF0_RX0_ch_rxphshift180done ),
       .INTF0_RX0_ch_rxphsetinitdone ( INTF0_RX0_ch_rxphsetinitdone ),
       .INTF0_RX0_ch_rxslide ( INTF0_RX0_ch_rxslide ),
       .INTF0_RX0_ch_rxsliderdy ( INTF0_RX0_ch_rxsliderdy ),
       .INTF0_RX0_ch_rxstartofseq ( INTF0_RX0_ch_rxstartofseq ),
       .INTF0_RX0_ch_rxstatus ( INTF0_RX0_ch_rxstatus ),
       .INTF0_RX0_ch_rxsyncallin ( INTF0_RX0_ch_rxsyncallin ),
       .INTF0_RX0_ch_rxsyncdone ( INTF0_RX0_ch_rxsyncdone ),
       .INTF0_RX0_ch_rxtermination ( INTF0_RX0_ch_rxtermination ),
       .INTF0_RX0_ch_rxvalid ( INTF0_RX0_ch_rxvalid ),
       .INTF0_RX0_ch_rxchanbondseq ( INTF0_RX0_ch_rxchanbondseq ),
       .INTF0_RX0_ch_rxchanbond_busy ( INTF0_RX0_ch_rxchanbond_busy ),
       .INTF0_RX0_ch_rxchanbond_en ( INTF0_RX0_ch_rxchanbond_en ),
       .INTF0_RX0_ch_rxchanbond_master ( INTF0_RX0_ch_rxchanbond_master ),
       .INTF0_RX0_ch_rxchanbond_slave ( INTF0_RX0_ch_rxchanbond_slave ),
       .INTF0_RX0_ch_rxchanbond_level ( INTF0_RX0_ch_rxchanbond_level ),
       .INTF0_RX0_ch_cdrbmcdrreq ( INTF0_RX0_ch_cdrbmcdrreq ),
       .INTF0_RX0_ch_cdrfreqos ( INTF0_RX0_ch_cdrfreqos ),
       .INTF0_RX0_ch_cdrincpctrl ( INTF0_RX0_ch_cdrincpctrl ),
       .INTF0_RX0_ch_cdrstepdir ( INTF0_RX0_ch_cdrstepdir ),
       .INTF0_RX0_ch_cdrstepsq ( INTF0_RX0_ch_cdrstepsq ),
       .INTF0_RX0_ch_cdrstepsx ( INTF0_RX0_ch_cdrstepsx ),
       .INTF0_RX0_ch_eyescanreset ( INTF0_RX0_ch_eyescanreset ),
       .INTF0_RX0_ch_eyescantrigger ( INTF0_RX0_ch_eyescantrigger ),
       .INTF0_RX0_ch_eyescandataerror ( INTF0_RX0_ch_eyescandataerror ),
       .INTF0_RX0_ch_refdebugout ( INTF0_RX0_ch_refdebugout ),
       .INTF0_RX0_ch_rxdapiresetdone ( INTF0_RX0_ch_rxdapiresetdone ),
       .INTF0_RX0_ch_rxpkdet ( INTF0_RX0_ch_rxpkdet ),
       .INTF0_RX0_ch_rxqpisenn ( INTF0_RX0_ch_rxqpisenn ),
       .INTF0_RX0_ch_rxqpisenp ( INTF0_RX0_ch_rxqpisenp ),
       .INTF0_RX0_ch_rxsimplexphystatus ( INTF0_RX0_ch_rxsimplexphystatus ),
       .INTF0_RX0_ch_rxslipdone ( INTF0_RX0_ch_rxslipdone ),
       .INTF0_RX0_ch_dfehold ( INTF0_RX0_ch_dfehold ),
       .INTF0_RX0_ch_dfeovrd ( INTF0_RX0_ch_dfeovrd ),
       .INTF0_RX0_ch_rxdapireset ( INTF0_RX0_ch_rxdapireset ),
       .INTF0_RX0_ch_rxdapiresetmask ( INTF0_RX0_ch_rxdapiresetmask ),
       .INTF0_RX0_ch_rxqpien ( INTF0_RX0_ch_rxqpien ),
       .INTF0_RX0_ch_rxcdrphdone ( INTF0_RX0_ch_rxcdrphdone ),
       .INTF0_RX0_ch_gtrxreset ( INTF0_RX0_ch_gtrxreset ),
       .INTF0_RX0_ch_rxprogdivresetdone ( INTF0_RX0_ch_rxprogdivresetdone ),
       .INTF0_RX0_ch_rxresetdone ( INTF0_RX0_ch_rxresetdone ),
       .INTF0_RX0_ch_rxcdrreset ( INTF0_RX0_ch_rxcdrreset ),
       .INTF0_RX0_ch_rxprbssel ( INTF0_RX0_ch_rxprbssel ),
       .INTF0_RX0_ch_rxprogdivreset ( INTF0_RX0_ch_rxprogdivreset ),

       .gtwiz_freerun_clk                 ( gtwiz_freerun_clk),
       // GPIO
       .QUAD0_gpi                   ( QUAD0_gpi),
       .QUAD0_gpo                   ( QUAD0_gpo),
       // Outclk interface
       .QUAD0_TX0_outclk                ( QUAD0_TX0_outclk),
       .QUAD0_RX0_outclk                ( QUAD0_RX0_outclk),
       // phyready en
       // Outclk interface
       .QUAD0_TX1_outclk                ( QUAD0_TX1_outclk),
       .QUAD0_RX1_outclk                ( QUAD0_RX1_outclk),
       // phyready en
       // Outclk interface
       .QUAD0_TX2_outclk                ( QUAD0_TX2_outclk),
       .QUAD0_RX2_outclk                ( QUAD0_RX2_outclk),
       // phyready en
       // Outclk interface
       .QUAD0_TX3_outclk                ( QUAD0_TX3_outclk),
       .QUAD0_RX3_outclk                ( QUAD0_RX3_outclk),
       // Loopback
       .QUAD0_ch3_loopback        ( QUAD0_ch3_loopback) ,
       // phyready en
       // HSCLK LCPLL lock 
       .QUAD0_hsclk0_lcplllock              ( QUAD0_hsclk0_lcplllock),

       // APB3 Interface

       .QUAD0_rxp                       ( QUAD0_rxp),
       .QUAD0_rxn                       ( QUAD0_rxn),
       .QUAD0_txp                       ( QUAD0_txp),
       .QUAD0_txn                       ( QUAD0_txn),

       // signals from Quad to reset IP for INTF0
       .INTF0_gtpowergood_int           ( INTF0_gtpowergood_in),
       .INTF0_rst_userclk_tx_active_int ( INTF0_rst_userclk_tx_active_int),
       .INTF0_mst_tx_resetdone_int      ( INTF0_mst_tx_resetdone_int),
       .INTF0_gtwiz_reset_txuserrdy_int ( INTF0_rst_txuserrdy),
       .INTF0_mst_tx_reset_int          ( INTF0_mst_tx_reset),
       .INTF0_mst_tx_dp_reset_int       ( INTF0_mst_tx_dp_reset),
       .INTF0_rst_userclk_rx_active_int ( INTF0_rst_userclk_rx_active_int),
       .INTF0_mst_rx_resetdone_int      ( INTF0_mst_rx_resetdone_int),
       .INTF0_gtwiz_reset_rxuserrdy_int ( INTF0_rst_rxuserrdy),
       .INTF0_mst_rx_reset_int          ( INTF0_mst_rx_reset),
       .INTF0_mst_rx_dp_reset_int       ( INTF0_mst_rx_dp_reset),
       // usrclk signals
       .QUAD0_TX0_usrclk                ( QUAD0_TX0_usrclk),
       .QUAD0_RX0_usrclk                ( QUAD0_RX0_usrclk),
       .QUAD0_TX1_usrclk                ( QUAD0_TX1_usrclk),
       .QUAD0_RX1_usrclk                ( QUAD0_RX1_usrclk),
       .QUAD0_TX2_usrclk                ( QUAD0_TX2_usrclk),
       .QUAD0_RX2_usrclk                ( QUAD0_RX2_usrclk),
       .QUAD0_TX3_usrclk                ( QUAD0_TX3_usrclk),
       .QUAD0_RX3_usrclk                ( QUAD0_RX3_usrclk),
       // refclk signals
       .QUAD0_GTREFCLK0                 ( QUAD0_GTREFCLK0),
       // powergood signal
       .QUAD0_gtpowergood               ( QUAD0_gtpowergood)
);

//-------gt power good logic
extended_phy_layer_gtwiz_versal_0_0_powergood_logic #(
.N_QUADS (1)
) extended_phy_layer_gtwiz_versal_0_0_powergood_inst (
.Quad0_gtpowergood (QUAD0_gtpowergood),
.o_powergood       (gtpowergood)
);

endmodule
