// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
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
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:ip:gtwiz_versal:1.0
// IP Revision: 0

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module extended_phy_layer_gtwiz_versal_0_0 (
  gtpowergood,
  gtwiz_freerun_clk,
  QUAD0_GTREFCLK0,
  QUAD0_TX3_outclk,
  QUAD0_RX3_outclk,
  QUAD0_rxp,
  QUAD0_rxn,
  QUAD0_txp,
  QUAD0_txn,
  QUAD0_ch3_loopback,
  QUAD0_gpi,
  QUAD0_gpo,
  QUAD0_hsclk0_lcplllock,
  QUAD0_TX3_usrclk,
  QUAD0_RX3_usrclk,
  INTF0_TX0_ch_txdata,
  INTF0_TX0_ch_txbufstatus,
  INTF0_TX0_ch_txdccdone,
  INTF0_TX0_ch_gttxreset,
  INTF0_TX0_ch_txdebugpcsout,
  INTF0_TX0_ch_txprogdivresetdone,
  INTF0_TX0_ch_txresetdone,
  INTF0_TX0_ch_txinhibit,
  INTF0_TX0_ch_txlatclk,
  INTF0_TX0_ch_txmaincursor,
  INTF0_TX0_ch_txpcsresetmask,
  INTF0_TX0_ch_txpd,
  INTF0_TX0_ch_txpisopd,
  INTF0_TX0_ch_txpmaresetmask,
  INTF0_TX0_ch_txpolarity,
  INTF0_TX0_ch_txpostcursor,
  INTF0_TX0_ch_txprbsforceerr,
  INTF0_TX0_ch_txprbssel,
  INTF0_TX0_ch_txprecursor,
  INTF0_TX0_ch_txprogdivreset,
  INTF0_TX0_ch_txrate,
  INTF0_TX0_ch_txresetmode,
  INTF0_TX0_ch_txheader,
  INTF0_TX0_ch_txsequence,
  INTF0_TX0_ch_txphalignresetmask,
  INTF0_TX0_ch_txcominit,
  INTF0_TX0_ch_txcomsas,
  INTF0_TX0_ch_txcomwake,
  INTF0_TX0_ch_txdapicodeovrden,
  INTF0_TX0_ch_txdapicodereset,
  INTF0_TX0_ch_txdetectrx,
  INTF0_TX0_ch_txphdlytstclk,
  INTF0_TX0_ch_txdlyalignreq,
  INTF0_TX0_ch_txelecidle,
  INTF0_TX0_ch_txmldchaindone,
  INTF0_TX0_ch_txmldchainreq,
  INTF0_TX0_ch_txoneszeros,
  INTF0_TX0_ch_txpausedelayalign,
  INTF0_TX0_ch_txphalignreq,
  INTF0_TX0_ch_txphdlypd,
  INTF0_TX0_ch_txphdlyreset,
  INTF0_TX0_ch_txphsetinitreq,
  INTF0_TX0_ch_txphshift180,
  INTF0_TX0_ch_txpicodeovrden,
  INTF0_TX0_ch_txpicodereset,
  INTF0_TX0_ch_txpippmen,
  INTF0_TX0_ch_txswing,
  INTF0_TX0_ch_txsyncallin,
  INTF0_TX0_ch_tx10gstat,
  INTF0_TX0_ch_txcomfinish,
  INTF0_TX0_ch_txdlyalignerr,
  INTF0_TX0_ch_txdlyalignprog,
  INTF0_TX0_ch_txphaligndone,
  INTF0_TX0_ch_txphalignerr,
  INTF0_TX0_ch_txphalignoutrsvd,
  INTF0_TX0_ch_txphdlyresetdone,
  INTF0_TX0_ch_txphsetinitdone,
  INTF0_TX0_ch_txphshift180done,
  INTF0_TX0_ch_txsyncdone,
  INTF0_TX0_ch_txctrl0,
  INTF0_TX0_ch_txctrl1,
  INTF0_TX0_ch_txctrl2,
  INTF0_TX0_ch_txdeemph,
  INTF0_TX0_ch_txmargin,
  INTF0_TX0_ch_txdiffctrl,
  INTF0_TX0_ch_txpippmstepsize,
  INTF0_TX0_ch_txdapiresetdone,
  INTF0_TX0_ch_txqpisenn,
  INTF0_TX0_ch_txqpisenp,
  INTF0_TX0_ch_txswingouthigh,
  INTF0_TX0_ch_txswingoutlow,
  INTF0_TX0_ch_txdapireset,
  INTF0_TX0_ch_txdapiresetmask,
  INTF0_TX0_ch_txqpibiasen,
  INTF0_TX0_ch_txqpiweakpu,
  INTF0_RX0_ch_rxbufstatus,
  INTF0_RX0_ch_rxcdrlock,
  INTF0_RX0_ch_rxdebugpcsout,
  INTF0_RX0_ch_rxprbserr,
  INTF0_RX0_ch_rxprbslocked,
  INTF0_RX0_ch_rxcdrhold,
  INTF0_RX0_ch_rxcdrovrden,
  INTF0_RX0_ch_rxlatclk,
  INTF0_RX0_ch_rxpcsresetmask,
  INTF0_RX0_ch_rxpd,
  INTF0_RX0_ch_rxpmaresetmask,
  INTF0_RX0_ch_rxpolarity,
  INTF0_RX0_ch_rxprbscntreset,
  INTF0_RX0_ch_rxrate,
  INTF0_RX0_ch_rxresetmode,
  INTF0_RX0_ch_rxdata,
  INTF0_RX0_ch_rx10gstat,
  INTF0_RX0_ch_rxdatavalid,
  INTF0_RX0_ch_rxheader,
  INTF0_RX0_ch_rxchanisaligned,
  INTF0_RX0_ch_rxchanrealign,
  INTF0_RX0_ch_rxchbondi,
  INTF0_RX0_ch_rxchbondo,
  INTF0_RX0_ch_rxclkcorcnt,
  INTF0_RX0_ch_rxcominitdet,
  INTF0_RX0_ch_rxcommadet,
  INTF0_RX0_ch_rxbyteisaligned,
  INTF0_RX0_ch_rxbyterealign,
  INTF0_RX0_ch_rxcomsasdet,
  INTF0_RX0_ch_rxcomwakedet,
  INTF0_RX0_ch_rxctrl0,
  INTF0_RX0_ch_rxctrl1,
  INTF0_RX0_ch_rxctrl2,
  INTF0_RX0_ch_rxctrl3,
  INTF0_RX0_ch_rxdapicodeovrden,
  INTF0_RX0_ch_rxdapicodereset,
  INTF0_RX0_ch_rxdlyalignerr,
  INTF0_RX0_ch_rxdlyalignprog,
  INTF0_RX0_ch_rxdlyalignreq,
  INTF0_RX0_ch_rxelecidle,
  INTF0_RX0_ch_rxeqtraining,
  INTF0_RX0_ch_rxfinealigndone,
  INTF0_RX0_ch_rxgearboxslip,
  INTF0_RX0_ch_rxheadervalid,
  INTF0_RX0_ch_rxlpmen,
  INTF0_RX0_ch_rxmldchaindone,
  INTF0_RX0_ch_rxmldchainreq,
  INTF0_RX0_ch_rxmlfinealignreq,
  INTF0_RX0_ch_rxoobreset,
  INTF0_RX0_ch_rxosintdone,
  INTF0_RX0_ch_rxphaligndone,
  INTF0_RX0_ch_rxphalignerr,
  INTF0_RX0_ch_rxphalignreq,
  INTF0_RX0_ch_rxphalignresetmask,
  INTF0_RX0_ch_rxphdlypd,
  INTF0_RX0_ch_rxphdlyreset,
  INTF0_RX0_ch_rxphdlyresetdone,
  INTF0_RX0_ch_rxphsetinitreq,
  INTF0_RX0_ch_rxphshift180,
  INTF0_RX0_ch_rxphshift180done,
  INTF0_RX0_ch_rxphsetinitdone,
  INTF0_RX0_ch_rxslide,
  INTF0_RX0_ch_rxsliderdy,
  INTF0_RX0_ch_rxstartofseq,
  INTF0_RX0_ch_rxstatus,
  INTF0_RX0_ch_rxsyncallin,
  INTF0_RX0_ch_rxsyncdone,
  INTF0_RX0_ch_rxtermination,
  INTF0_RX0_ch_rxvalid,
  INTF0_RX0_ch_rxchanbondseq,
  INTF0_RX0_ch_rxchanbond_busy,
  INTF0_RX0_ch_rxchanbond_en,
  INTF0_RX0_ch_rxchanbond_master,
  INTF0_RX0_ch_rxchanbond_slave,
  INTF0_RX0_ch_rxchanbond_level,
  INTF0_RX0_ch_cdrbmcdrreq,
  INTF0_RX0_ch_cdrfreqos,
  INTF0_RX0_ch_cdrincpctrl,
  INTF0_RX0_ch_cdrstepdir,
  INTF0_RX0_ch_cdrstepsq,
  INTF0_RX0_ch_cdrstepsx,
  INTF0_RX0_ch_eyescanreset,
  INTF0_RX0_ch_eyescantrigger,
  INTF0_RX0_ch_eyescandataerror,
  INTF0_RX0_ch_refdebugout,
  INTF0_RX0_ch_rxdapiresetdone,
  INTF0_RX0_ch_rxpkdet,
  INTF0_RX0_ch_rxqpisenn,
  INTF0_RX0_ch_rxqpisenp,
  INTF0_RX0_ch_rxsimplexphystatus,
  INTF0_RX0_ch_rxslipdone,
  INTF0_RX0_ch_dfehold,
  INTF0_RX0_ch_dfeovrd,
  INTF0_RX0_ch_rxdapireset,
  INTF0_RX0_ch_rxdapiresetmask,
  INTF0_RX0_ch_rxqpien,
  INTF0_RX0_ch_rxcdrphdone,
  INTF0_RX0_ch_gtrxreset,
  INTF0_RX0_ch_rxprogdivresetdone,
  INTF0_RX0_ch_rxresetdone,
  INTF0_RX0_ch_rxcdrreset,
  INTF0_RX0_ch_rxprbssel,
  INTF0_RX0_ch_rxprogdivreset,
  INTF0_TX_clr_out,
  INTF0_TX_clrb_leaf_out,
  INTF0_RX_clr_out,
  INTF0_RX_clrb_leaf_out,
  INTF0_rst_all_in,
  INTF0_rst_tx_pll_and_datapath_in,
  INTF0_rst_tx_datapath_in,
  INTF0_rst_tx_done_out,
  INTF0_rst_rx_pll_and_datapath_in,
  INTF0_rst_rx_datapath_in,
  INTF0_rst_rx_done_out
);

output wire gtpowergood;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME GTWIZ_FREERUN_CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 GTWIZ_FREERUN_CLK CLK" *)
input wire gtwiz_freerun_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME Quad0_GTREFCLK0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 Quad0_GTREFCLK0 CLK" *)
input wire QUAD0_GTREFCLK0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME Quad0_TX3_OUTCLK, FREQ_HZ 156250000, IS_MASTER false, PARENT_ID undef, PHASE 0.0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:gt_outclk:1.0 Quad0_TX3_OUTCLK CLK" *)
output wire QUAD0_TX3_outclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME Quad0_RX3_OUTCLK, FREQ_HZ 156250000, IS_MASTER false, PARENT_ID undef, PHASE 0.0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:gt_outclk:1.0 Quad0_RX3_OUTCLK CLK" *)
output wire QUAD0_RX3_outclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 Quad0_GT_Serial GRX_P" *)
input wire [3 : 0] QUAD0_rxp;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 Quad0_GT_Serial GRX_N" *)
input wire [3 : 0] QUAD0_rxn;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 Quad0_GT_Serial GTX_P" *)
output wire [3 : 0] QUAD0_txp;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME Quad0_GT_Serial, CAN_DEBUG false" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 Quad0_GT_Serial GTX_N" *)
output wire [3 : 0] QUAD0_txn;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 Quad0_CH3_DEBUG ch_loopback" *)
input wire [2 : 0] QUAD0_ch3_loopback;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 QUAD0_GT_DEBUG gpi" *)
input wire [31 : 0] QUAD0_gpi;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 QUAD0_GT_DEBUG gpo" *)
output wire [31 : 0] QUAD0_gpo;
output wire QUAD0_hsclk0_lcplllock;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME Quad0_TX3_USRCLK, FREQ_HZ 156250000, PARENT_ID undef, PHASE 0.0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:gt_usrclk:1.0 Quad0_TX3_USRCLK CLK" *)
input wire QUAD0_TX3_usrclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME Quad0_RX3_USRCLK, FREQ_HZ 156250000, PARENT_ID undef, PHASE 0.0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:gt_usrclk:1.0 Quad0_RX3_USRCLK CLK" *)
input wire QUAD0_RX3_usrclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txdata" *)
input wire [127 : 0] INTF0_TX0_ch_txdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txbufstatus" *)
output wire [1 : 0] INTF0_TX0_ch_txbufstatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txdccdone" *)
output wire [0 : 0] INTF0_TX0_ch_txdccdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_gttxreset" *)
input wire [0 : 0] INTF0_TX0_ch_gttxreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txdebugpcsout" *)
output wire [0 : 0] INTF0_TX0_ch_txdebugpcsout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txprogdivresetdone" *)
output wire [0 : 0] INTF0_TX0_ch_txprogdivresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txresetdone" *)
output wire [0 : 0] INTF0_TX0_ch_txresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txinhibit" *)
input wire [0 : 0] INTF0_TX0_ch_txinhibit;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txlatclk" *)
input wire [0 : 0] INTF0_TX0_ch_txlatclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txmaincursor" *)
input wire [6 : 0] INTF0_TX0_ch_txmaincursor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txpcsresetmask" *)
input wire [0 : 0] INTF0_TX0_ch_txpcsresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txpd" *)
input wire [1 : 0] INTF0_TX0_ch_txpd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txpisopd" *)
input wire [0 : 0] INTF0_TX0_ch_txpisopd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txpmaresetmask" *)
input wire [2 : 0] INTF0_TX0_ch_txpmaresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txpolarity" *)
input wire [0 : 0] INTF0_TX0_ch_txpolarity;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txpostcursor" *)
input wire [4 : 0] INTF0_TX0_ch_txpostcursor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txprbsforceerr" *)
input wire [0 : 0] INTF0_TX0_ch_txprbsforceerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txprbssel" *)
input wire [3 : 0] INTF0_TX0_ch_txprbssel;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txprecursor" *)
input wire [4 : 0] INTF0_TX0_ch_txprecursor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txprogdivreset" *)
input wire [0 : 0] INTF0_TX0_ch_txprogdivreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txrate" *)
input wire [7 : 0] INTF0_TX0_ch_txrate;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txresetmode" *)
input wire [1 : 0] INTF0_TX0_ch_txresetmode;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txheader" *)
input wire [5 : 0] INTF0_TX0_ch_txheader;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txsequence" *)
input wire [6 : 0] INTF0_TX0_ch_txsequence;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txphalignresetmask" *)
input wire [1 : 0] INTF0_TX0_ch_txphalignresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txcominit" *)
input wire [0 : 0] INTF0_TX0_ch_txcominit;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txcomsas" *)
input wire [0 : 0] INTF0_TX0_ch_txcomsas;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txcomwake" *)
input wire [0 : 0] INTF0_TX0_ch_txcomwake;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txdapicodeovrden" *)
input wire [0 : 0] INTF0_TX0_ch_txdapicodeovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txdapicodereset" *)
input wire [0 : 0] INTF0_TX0_ch_txdapicodereset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txdetectrx" *)
input wire [0 : 0] INTF0_TX0_ch_txdetectrx;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txphdlytstclk" *)
input wire [0 : 0] INTF0_TX0_ch_txphdlytstclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txdlyalignreq" *)
input wire [0 : 0] INTF0_TX0_ch_txdlyalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txelecidle" *)
input wire [0 : 0] INTF0_TX0_ch_txelecidle;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txmldchaindone" *)
input wire [0 : 0] INTF0_TX0_ch_txmldchaindone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txmldchainreq" *)
input wire [0 : 0] INTF0_TX0_ch_txmldchainreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txoneszeros" *)
input wire [0 : 0] INTF0_TX0_ch_txoneszeros;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txpausedelayalign" *)
input wire [0 : 0] INTF0_TX0_ch_txpausedelayalign;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txphalignreq" *)
input wire [0 : 0] INTF0_TX0_ch_txphalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txphdlypd" *)
input wire [0 : 0] INTF0_TX0_ch_txphdlypd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txphdlyreset" *)
input wire [0 : 0] INTF0_TX0_ch_txphdlyreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txphsetinitreq" *)
input wire [0 : 0] INTF0_TX0_ch_txphsetinitreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txphshift180" *)
input wire [0 : 0] INTF0_TX0_ch_txphshift180;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txpicodeovrden" *)
input wire [0 : 0] INTF0_TX0_ch_txpicodeovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txpicodereset" *)
input wire [0 : 0] INTF0_TX0_ch_txpicodereset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txpippmen" *)
input wire [0 : 0] INTF0_TX0_ch_txpippmen;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txswing" *)
input wire [0 : 0] INTF0_TX0_ch_txswing;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txsyncallin" *)
input wire [0 : 0] INTF0_TX0_ch_txsyncallin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_tx10gstat" *)
output wire [0 : 0] INTF0_TX0_ch_tx10gstat;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txcomfinish" *)
output wire [0 : 0] INTF0_TX0_ch_txcomfinish;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txdlyalignerr" *)
output wire [0 : 0] INTF0_TX0_ch_txdlyalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txdlyalignprog" *)
output wire [0 : 0] INTF0_TX0_ch_txdlyalignprog;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txphaligndone" *)
output wire [0 : 0] INTF0_TX0_ch_txphaligndone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txphalignerr" *)
output wire [0 : 0] INTF0_TX0_ch_txphalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txphalignoutrsvd" *)
output wire [0 : 0] INTF0_TX0_ch_txphalignoutrsvd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txphdlyresetdone" *)
output wire [0 : 0] INTF0_TX0_ch_txphdlyresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txphsetinitdone" *)
output wire [0 : 0] INTF0_TX0_ch_txphsetinitdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txphshift180done" *)
output wire [0 : 0] INTF0_TX0_ch_txphshift180done;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txsyncdone" *)
output wire [0 : 0] INTF0_TX0_ch_txsyncdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txctrl0" *)
input wire [15 : 0] INTF0_TX0_ch_txctrl0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txctrl1" *)
input wire [15 : 0] INTF0_TX0_ch_txctrl1;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txctrl2" *)
input wire [7 : 0] INTF0_TX0_ch_txctrl2;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txdeemph" *)
input wire [1 : 0] INTF0_TX0_ch_txdeemph;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txmargin" *)
input wire [2 : 0] INTF0_TX0_ch_txmargin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txdiffctrl" *)
input wire [4 : 0] INTF0_TX0_ch_txdiffctrl;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txpippmstepsize" *)
input wire [4 : 0] INTF0_TX0_ch_txpippmstepsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txdapiresetdone" *)
output wire [0 : 0] INTF0_TX0_ch_txdapiresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txqpisenn" *)
output wire [0 : 0] INTF0_TX0_ch_txqpisenn;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txqpisenp" *)
output wire [0 : 0] INTF0_TX0_ch_txqpisenp;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txswingouthigh" *)
output wire [0 : 0] INTF0_TX0_ch_txswingouthigh;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txswingoutlow" *)
output wire [0 : 0] INTF0_TX0_ch_txswingoutlow;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txdapireset" *)
input wire [0 : 0] INTF0_TX0_ch_txdapireset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txdapiresetmask" *)
input wire [1 : 0] INTF0_TX0_ch_txdapiresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txqpibiasen" *)
input wire [0 : 0] INTF0_TX0_ch_txqpibiasen;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTF0_TX0_GT_IP_Interface, PARENT_ID undef, CHNL_NUMBER undef, MASTERCLK_SRC undef, GT_DIRECTION undef, TX_SETTINGS undef, ADDITIONAL_QUAD_SETTINGS undef, ADDITIONAL_CONFIG_FILE undef, ADDITIONAL_CONFIG_ENABLE undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 INTF0_TX0_GT_IP_Interface ch_txqpiweakpu" *)
input wire [0 : 0] INTF0_TX0_ch_txqpiweakpu;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxbufstatus" *)
output wire [2 : 0] INTF0_RX0_ch_rxbufstatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxcdrlock" *)
output wire [0 : 0] INTF0_RX0_ch_rxcdrlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxdebugpcsout" *)
output wire [0 : 0] INTF0_RX0_ch_rxdebugpcsout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxprbserr" *)
output wire [0 : 0] INTF0_RX0_ch_rxprbserr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxprbslocked" *)
output wire [0 : 0] INTF0_RX0_ch_rxprbslocked;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxcdrhold" *)
input wire [0 : 0] INTF0_RX0_ch_rxcdrhold;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxcdrovrden" *)
input wire [0 : 0] INTF0_RX0_ch_rxcdrovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxlatclk" *)
input wire [0 : 0] INTF0_RX0_ch_rxlatclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxpcsresetmask" *)
input wire [4 : 0] INTF0_RX0_ch_rxpcsresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxpd" *)
input wire [1 : 0] INTF0_RX0_ch_rxpd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxpmaresetmask" *)
input wire [6 : 0] INTF0_RX0_ch_rxpmaresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxpolarity" *)
input wire [0 : 0] INTF0_RX0_ch_rxpolarity;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxprbscntreset" *)
input wire [0 : 0] INTF0_RX0_ch_rxprbscntreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxrate" *)
input wire [7 : 0] INTF0_RX0_ch_rxrate;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxresetmode" *)
input wire [1 : 0] INTF0_RX0_ch_rxresetmode;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxdata" *)
output wire [127 : 0] INTF0_RX0_ch_rxdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rx10gstat" *)
output wire [7 : 0] INTF0_RX0_ch_rx10gstat;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxdatavalid" *)
output wire [1 : 0] INTF0_RX0_ch_rxdatavalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxheader" *)
output wire [5 : 0] INTF0_RX0_ch_rxheader;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxchanisaligned" *)
output wire [0 : 0] INTF0_RX0_ch_rxchanisaligned;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxchanrealign" *)
output wire [0 : 0] INTF0_RX0_ch_rxchanrealign;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxchbondi" *)
input wire [4 : 0] INTF0_RX0_ch_rxchbondi;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxchbondo" *)
output wire [4 : 0] INTF0_RX0_ch_rxchbondo;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxclkcorcnt" *)
output wire [1 : 0] INTF0_RX0_ch_rxclkcorcnt;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxcominitdet" *)
output wire [0 : 0] INTF0_RX0_ch_rxcominitdet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxcommadet" *)
output wire [0 : 0] INTF0_RX0_ch_rxcommadet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxbyteisaligned" *)
output wire [0 : 0] INTF0_RX0_ch_rxbyteisaligned;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxbyterealign" *)
output wire [0 : 0] INTF0_RX0_ch_rxbyterealign;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxcomsasdet" *)
output wire [0 : 0] INTF0_RX0_ch_rxcomsasdet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxcomwakedet" *)
output wire [0 : 0] INTF0_RX0_ch_rxcomwakedet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxctrl0" *)
output wire [15 : 0] INTF0_RX0_ch_rxctrl0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxctrl1" *)
output wire [15 : 0] INTF0_RX0_ch_rxctrl1;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxctrl2" *)
output wire [7 : 0] INTF0_RX0_ch_rxctrl2;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxctrl3" *)
output wire [7 : 0] INTF0_RX0_ch_rxctrl3;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxdapicodeovrden" *)
input wire [0 : 0] INTF0_RX0_ch_rxdapicodeovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxdapicodereset" *)
input wire [0 : 0] INTF0_RX0_ch_rxdapicodereset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxdlyalignerr" *)
output wire [0 : 0] INTF0_RX0_ch_rxdlyalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxdlyalignprog" *)
output wire [0 : 0] INTF0_RX0_ch_rxdlyalignprog;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxdlyalignreq" *)
input wire [0 : 0] INTF0_RX0_ch_rxdlyalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxelecidle" *)
output wire [0 : 0] INTF0_RX0_ch_rxelecidle;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxeqtraining" *)
input wire [0 : 0] INTF0_RX0_ch_rxeqtraining;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxfinealigndone" *)
output wire [0 : 0] INTF0_RX0_ch_rxfinealigndone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxgearboxslip" *)
input wire [0 : 0] INTF0_RX0_ch_rxgearboxslip;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxheadervalid" *)
output wire [1 : 0] INTF0_RX0_ch_rxheadervalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxlpmen" *)
input wire [0 : 0] INTF0_RX0_ch_rxlpmen;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxmldchaindone" *)
input wire [0 : 0] INTF0_RX0_ch_rxmldchaindone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxmldchainreq" *)
input wire [0 : 0] INTF0_RX0_ch_rxmldchainreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxmlfinealignreq" *)
input wire [0 : 0] INTF0_RX0_ch_rxmlfinealignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxoobreset" *)
input wire [0 : 0] INTF0_RX0_ch_rxoobreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxosintdone" *)
output wire [0 : 0] INTF0_RX0_ch_rxosintdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxphaligndone" *)
output wire [0 : 0] INTF0_RX0_ch_rxphaligndone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxphalignerr" *)
output wire [0 : 0] INTF0_RX0_ch_rxphalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxphalignreq" *)
input wire [0 : 0] INTF0_RX0_ch_rxphalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxphalignresetmask" *)
input wire [1 : 0] INTF0_RX0_ch_rxphalignresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxphdlypd" *)
input wire [0 : 0] INTF0_RX0_ch_rxphdlypd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxphdlyreset" *)
input wire [0 : 0] INTF0_RX0_ch_rxphdlyreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxphdlyresetdone" *)
output wire [0 : 0] INTF0_RX0_ch_rxphdlyresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxphsetinitreq" *)
input wire [0 : 0] INTF0_RX0_ch_rxphsetinitreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxphshift180" *)
input wire [0 : 0] INTF0_RX0_ch_rxphshift180;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxphshift180done" *)
output wire [0 : 0] INTF0_RX0_ch_rxphshift180done;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxphsetinitdone" *)
output wire [0 : 0] INTF0_RX0_ch_rxphsetinitdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxslide" *)
input wire [0 : 0] INTF0_RX0_ch_rxslide;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxsliderdy" *)
output wire [0 : 0] INTF0_RX0_ch_rxsliderdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxstartofseq" *)
output wire [1 : 0] INTF0_RX0_ch_rxstartofseq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxstatus" *)
output wire [2 : 0] INTF0_RX0_ch_rxstatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxsyncallin" *)
input wire [0 : 0] INTF0_RX0_ch_rxsyncallin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxsyncdone" *)
output wire [0 : 0] INTF0_RX0_ch_rxsyncdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxtermination" *)
input wire [0 : 0] INTF0_RX0_ch_rxtermination;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxvalid" *)
output wire [0 : 0] INTF0_RX0_ch_rxvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxchanbondseq" *)
output wire [0 : 0] INTF0_RX0_ch_rxchanbondseq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxchanbond_busy" *)
output wire [0 : 0] INTF0_RX0_ch_rxchanbond_busy;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxchanbond_en" *)
input wire [0 : 0] INTF0_RX0_ch_rxchanbond_en;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxchanbond_master" *)
input wire [0 : 0] INTF0_RX0_ch_rxchanbond_master;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxchanbond_slave" *)
input wire [0 : 0] INTF0_RX0_ch_rxchanbond_slave;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxchanbond_level" *)
input wire [2 : 0] INTF0_RX0_ch_rxchanbond_level;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_cdrbmcdrreq" *)
input wire [0 : 0] INTF0_RX0_ch_cdrbmcdrreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_cdrfreqos" *)
input wire [0 : 0] INTF0_RX0_ch_cdrfreqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_cdrincpctrl" *)
input wire [0 : 0] INTF0_RX0_ch_cdrincpctrl;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_cdrstepdir" *)
input wire [0 : 0] INTF0_RX0_ch_cdrstepdir;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_cdrstepsq" *)
input wire [0 : 0] INTF0_RX0_ch_cdrstepsq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_cdrstepsx" *)
input wire [0 : 0] INTF0_RX0_ch_cdrstepsx;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_eyescanreset" *)
input wire [0 : 0] INTF0_RX0_ch_eyescanreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_eyescantrigger" *)
input wire [0 : 0] INTF0_RX0_ch_eyescantrigger;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_eyescandataerror" *)
output wire [0 : 0] INTF0_RX0_ch_eyescandataerror;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_refdebugout" *)
output wire [1 : 0] INTF0_RX0_ch_refdebugout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxdapiresetdone" *)
output wire [0 : 0] INTF0_RX0_ch_rxdapiresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxpkdet" *)
output wire [0 : 0] INTF0_RX0_ch_rxpkdet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxqpisenn" *)
output wire [0 : 0] INTF0_RX0_ch_rxqpisenn;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxqpisenp" *)
output wire [0 : 0] INTF0_RX0_ch_rxqpisenp;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxsimplexphystatus" *)
output wire [0 : 0] INTF0_RX0_ch_rxsimplexphystatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxslipdone" *)
output wire [0 : 0] INTF0_RX0_ch_rxslipdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_dfehold" *)
input wire [0 : 0] INTF0_RX0_ch_dfehold;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_dfeovrd" *)
input wire [0 : 0] INTF0_RX0_ch_dfeovrd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxdapireset" *)
input wire [0 : 0] INTF0_RX0_ch_rxdapireset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxdapiresetmask" *)
input wire [1 : 0] INTF0_RX0_ch_rxdapiresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxqpien" *)
input wire [0 : 0] INTF0_RX0_ch_rxqpien;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxcdrphdone" *)
output wire [0 : 0] INTF0_RX0_ch_rxcdrphdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_gtrxreset" *)
input wire [0 : 0] INTF0_RX0_ch_gtrxreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxprogdivresetdone" *)
output wire [0 : 0] INTF0_RX0_ch_rxprogdivresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxresetdone" *)
output wire [0 : 0] INTF0_RX0_ch_rxresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxcdrreset" *)
input wire [0 : 0] INTF0_RX0_ch_rxcdrreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxprbssel" *)
input wire [3 : 0] INTF0_RX0_ch_rxprbssel;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME INTF0_RX0_GT_IP_Interface, PARENT_ID undef, CHNL_NUMBER undef, MASTERCLK_SRC undef, GT_DIRECTION undef, RX_SETTINGS undef, ADDITIONAL_QUAD_SETTINGS undef, ADDITIONAL_CONFIG_FILE undef, ADDITIONAL_CONFIG_ENABLE undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 INTF0_RX0_GT_IP_Interface ch_rxprogdivreset" *)
input wire [0 : 0] INTF0_RX0_ch_rxprogdivreset;
output wire INTF0_TX_clr_out;
output wire INTF0_TX_clrb_leaf_out;
output wire INTF0_RX_clr_out;
output wire INTF0_RX_clrb_leaf_out;
input wire INTF0_rst_all_in;
input wire INTF0_rst_tx_pll_and_datapath_in;
input wire INTF0_rst_tx_datapath_in;
output wire INTF0_rst_tx_done_out;
input wire INTF0_rst_rx_pll_and_datapath_in;
input wire INTF0_rst_rx_datapath_in;
output wire INTF0_rst_rx_done_out;

  extended_phy_layer_gtwiz_versal_0_0_inst #(
    .C_Component_Name("extended_phy_layer_gtwiz_versal_0_0"),
    .QUAD0_PACK(""),
    .QUAD1_PACK(""),
    .QUAD2_PACK(""),
    .QUAD3_PACK(""),
    .QUAD4_PACK(""),
    .INTF_QUAD_MAP_CKECK(""),
    .IS_KSB(1'B0),
    .QUAD0_TX0_LANE_SEL("unconnected"),
    .QUAD1_TX0_LANE_SEL("PROT0"),
    .QUAD2_TX0_LANE_SEL("PROT0"),
    .QUAD3_TX0_LANE_SEL("PROT0"),
    .QUAD4_TX0_LANE_SEL("PROT0"),
    .QUAD0_TX1_LANE_SEL("unconnected"),
    .QUAD1_TX1_LANE_SEL("PROT0"),
    .QUAD2_TX1_LANE_SEL("PROT0"),
    .QUAD3_TX1_LANE_SEL("PROT0"),
    .QUAD4_TX1_LANE_SEL("PROT0"),
    .QUAD0_TX2_LANE_SEL("unconnected"),
    .QUAD1_TX2_LANE_SEL("PROT0"),
    .QUAD2_TX2_LANE_SEL("PROT0"),
    .QUAD3_TX2_LANE_SEL("PROT0"),
    .QUAD4_TX2_LANE_SEL("PROT0"),
    .QUAD0_TX3_LANE_SEL("PROT0"),
    .QUAD1_TX3_LANE_SEL("PROT0"),
    .QUAD2_TX3_LANE_SEL("PROT0"),
    .QUAD3_TX3_LANE_SEL("PROT0"),
    .QUAD4_TX3_LANE_SEL("PROT0"),
    .QUAD0_RX0_LANE_SEL("unconnected"),
    .QUAD1_RX0_LANE_SEL("PROT0"),
    .QUAD2_RX0_LANE_SEL("PROT0"),
    .QUAD3_RX0_LANE_SEL("PROT0"),
    .QUAD4_RX0_LANE_SEL("PROT0"),
    .QUAD0_RX1_LANE_SEL("unconnected"),
    .QUAD1_RX1_LANE_SEL("PROT0"),
    .QUAD2_RX1_LANE_SEL("PROT0"),
    .QUAD3_RX1_LANE_SEL("PROT0"),
    .QUAD4_RX1_LANE_SEL("PROT0"),
    .QUAD0_RX2_LANE_SEL("unconnected"),
    .QUAD1_RX2_LANE_SEL("PROT0"),
    .QUAD2_RX2_LANE_SEL("PROT0"),
    .QUAD3_RX2_LANE_SEL("PROT0"),
    .QUAD4_RX2_LANE_SEL("PROT0"),
    .QUAD0_RX3_LANE_SEL("PROT0"),
    .QUAD1_RX3_LANE_SEL("PROT0"),
    .QUAD2_RX3_LANE_SEL("PROT0"),
    .QUAD3_RX3_LANE_SEL("PROT0"),
    .QUAD4_RX3_LANE_SEL("PROT0"),
    .INTF_CHANNEL_NUMBERING("QUAD0_RX3 0 QUAD0_TX3 0"),
    .QUAD0_LANE_SATISFIED("1 {}"),
    .QUAD1_LANE_SATISFIED("1 {}"),
    .QUAD2_LANE_SATISFIED("1 {}"),
    .QUAD3_LANE_SATISFIED("1 {}"),
    .QUAD4_LANE_SATISFIED("1 {}"),
    .QUAD0_COMMON_SETTINGS("mode full bonded true LANEUSAGE {PROT0 {group A rates 0 txrate PROT0.D1 tx 3 rxrate PROT0.D1 rx 3}}"),
    .QUAD1_COMMON_SETTINGS("mode full bonded true LANEUSAGE {PROT0 {group A rates 0 txrate PROT0.D1,PROT0.D1,PROT0.D1,PROT0.D1 tx 0,1,2,3 rxrate PROT0.D1,PROT0.D1,PROT0.D1,PROT0.D1 rx 0,1,2,3}}"),
    .QUAD2_COMMON_SETTINGS("mode full bonded true LANEUSAGE {PROT0 {group A rates 0 txrate PROT0.D1,PROT0.D1,PROT0.D1,PROT0.D1 tx 0,1,2,3 rxrate PROT0.D1,PROT0.D1,PROT0.D1,PROT0.D1 rx 0,1,2,3}}"),
    .QUAD3_COMMON_SETTINGS("mode full bonded true LANEUSAGE {PROT0 {group A rates 0 txrate PROT0.D1,PROT0.D1,PROT0.D1,PROT0.D1 tx 0,1,2,3 rxrate PROT0.D1,PROT0.D1,PROT0.D1,PROT0.D1 rx 0,1,2,3}}"),
    .QUAD4_COMMON_SETTINGS("mode full bonded true LANEUSAGE {PROT0 {group A rates 0 txrate PROT0.D1,PROT0.D1,PROT0.D1,PROT0.D1 tx 0,1,2,3 rxrate PROT0.D1,PROT0.D1,PROT0.D1,PROT0.D1 rx 0,1,2,3}}"),
    .QUAD0_LANE_SEL_DICT("unconnected {RX0 RX1 RX2 TX0 TX1 TX2} PROT0 {RX3 TX3}"),
    .QUAD1_LANE_SEL_DICT("PROT0 {RX0 RX1 RX2 RX3 TX0 TX1 TX2 TX3}"),
    .QUAD2_LANE_SEL_DICT("PROT0 {RX0 RX1 RX2 RX3 TX0 TX1 TX2 TX3}"),
    .QUAD3_LANE_SEL_DICT("PROT0 {RX0 RX1 RX2 RX3 TX0 TX1 TX2 TX3}"),
    .QUAD4_LANE_SEL_DICT("PROT0 {RX0 RX1 RX2 RX3 TX0 TX1 TX2 TX3}"),
    .QUAD0_INTF_LANESEL_DICT("INTF0 {{RX3 TX3}} unconnected {{RX0 RX1 RX2 TX0 TX1 TX2}}"),
    .QUAD1_INTF_LANESEL_DICT("INTF0 {RX0 RX1 RX2 RX3 TX0 TX1 TX2 TX3}"),
    .QUAD2_INTF_LANESEL_DICT("INTF0 {RX0 RX1 RX2 RX3 TX0 TX1 TX2 TX3}"),
    .QUAD3_INTF_LANESEL_DICT("INTF0 {RX0 RX1 RX2 RX3 TX0 TX1 TX2 TX3}"),
    .QUAD4_INTF_LANESEL_DICT("INTF0 {RX0 RX1 RX2 RX3 TX0 TX1 TX2 TX3}"),
    .QUAD0_MSTCLK_SRC_DICT("TX 0,0,0,1 RX 0,0,0,1"),
    .QUAD1_MSTCLK_SRC_DICT("TX {1,0,0,0,} RX {1,0,0,0,} "),
    .QUAD2_MSTCLK_SRC_DICT("TX {1,0,0,0,} RX {1,0,0,0,} "),
    .QUAD3_MSTCLK_SRC_DICT("TX {1,0,0,0,} RX {1,0,0,0,} "),
    .QUAD4_MSTCLK_SRC_DICT("TX {1,0,0,0,} RX {1,0,0,0,} "),
    .INTF0_LANE_MAPING("INTF0 {QUAD0_RX3 QUAD0_TX3}"),
    .INTF1_LANE_MAPING("INTF1 {QUAD0_RX0 QUAD0_RX1 QUAD0_RX2 QUAD0_RX3 QUAD0_TX0 QUAD0_TX1 QUAD0_TX2 QUAD0_TX3}"),
    .INTF2_LANE_MAPING("INTF2 {QUAD0_RX0 QUAD0_RX1 QUAD0_RX2 QUAD0_RX3 QUAD0_TX0 QUAD0_TX1 QUAD0_TX2 QUAD0_TX3}"),
    .INTF3_LANE_MAPING("INTF3 {QUAD0_RX0 QUAD0_RX1 QUAD0_RX2 QUAD0_RX3 QUAD0_TX0 QUAD0_TX1 QUAD0_TX2 QUAD0_TX3}"),
    .INTF4_LANE_MAPING("INTF4 {QUAD0_RX0 QUAD0_RX1 QUAD0_RX2 QUAD0_RX3 QUAD0_TX0 QUAD0_TX1 QUAD0_TX2 QUAD0_TX3}"),
    .INTF5_LANE_MAPING("INTF5 {QUAD0_RX0 QUAD0_RX1 QUAD0_RX2 QUAD0_RX3 QUAD0_TX0 QUAD0_TX1 QUAD0_TX2 QUAD0_TX3}"),
    .INTF6_LANE_MAPING("INTF6 {QUAD0_RX0 QUAD0_RX1 QUAD0_RX2 QUAD0_RX3 QUAD0_TX0 QUAD0_TX1 QUAD0_TX2 QUAD0_TX3}"),
    .INTF7_LANE_MAPING("INTF7 {QUAD0_RX0 QUAD0_RX1 QUAD0_RX2 QUAD0_RX3 QUAD0_TX0 QUAD0_TX1 QUAD0_TX2 QUAD0_TX3}"),
    .INTF0_CHANNEL_MAPING("INTF0_RX0 QUAD0_RX3 INTF0_TX0 QUAD0_TX3"),
    .INTF1_CHANNEL_MAPING("INTF1_RX0 QUAD0_RX0 INTF1_RX1 QUAD0_RX1 INTF1_RX2 QUAD0_RX2 INTF1_RX3 QUAD0_RX3 INTF1_TX0 QUAD0_TX0 INTF1_TX1 QUAD0_TX1 INTF1_TX2 QUAD0_TX2 INTF1_TX3 QUAD0_TX3"),
    .INTF2_CHANNEL_MAPING("INTF2_RX0 QUAD0_RX0 INTF2_RX1 QUAD0_RX1 INTF2_RX2 QUAD0_RX2 INTF2_RX3 QUAD0_RX3 INTF2_TX0 QUAD0_TX0 INTF2_TX1 QUAD0_TX1 INTF2_TX2 QUAD0_TX2 INTF2_TX3 QUAD0_TX3"),
    .INTF3_CHANNEL_MAPING("INTF3_RX0 QUAD0_RX0 INTF3_RX1 QUAD0_RX1 INTF3_RX2 QUAD0_RX2 INTF3_RX3 QUAD0_RX3 INTF3_TX0 QUAD0_TX0 INTF3_TX1 QUAD0_TX1 INTF3_TX2 QUAD0_TX2 INTF3_TX3 QUAD0_TX3"),
    .INTF4_CHANNEL_MAPING("INTF4_RX0 QUAD0_RX0 INTF4_RX1 QUAD0_RX1 INTF4_RX2 QUAD0_RX2 INTF4_RX3 QUAD0_RX3 INTF4_TX0 QUAD0_TX0 INTF4_TX1 QUAD0_TX1 INTF4_TX2 QUAD0_TX2 INTF4_TX3 QUAD0_TX3"),
    .INTF5_CHANNEL_MAPING("INTF5_RX0 QUAD0_RX0 INTF5_RX1 QUAD0_RX1 INTF5_RX2 QUAD0_RX2 INTF5_RX3 QUAD0_RX3 INTF5_TX0 QUAD0_TX0 INTF5_TX1 QUAD0_TX1 INTF5_TX2 QUAD0_TX2 INTF5_TX3 QUAD0_TX3"),
    .INTF6_CHANNEL_MAPING("INTF6_RX0 QUAD0_RX0 INTF6_RX1 QUAD0_RX1 INTF6_RX2 QUAD0_RX2 INTF6_RX3 QUAD0_RX3 INTF6_TX0 QUAD0_TX0 INTF6_TX1 QUAD0_TX1 INTF6_TX2 QUAD0_TX2 INTF6_TX3 QUAD0_TX3"),
    .INTF7_CHANNEL_MAPING("INTF7_RX0 QUAD0_RX0 INTF7_RX1 QUAD0_RX1 INTF7_RX2 QUAD0_RX2 INTF7_RX3 QUAD0_RX3 INTF7_TX0 QUAD0_TX0 INTF7_TX1 QUAD0_TX1 INTF7_TX2 QUAD0_TX2 INTF7_TX3 QUAD0_TX3"),
    .INTF_LANE_MAP_LIST("QUAD0_RX3 QUAD0_TX3"),
    .QUAD0_LANEUSAGE("PROT0 {group A rates 0 txrate PROT0.D1 tx 3 rxrate PROT0.D1 rx 3}"),
    .QUAD1_LANEUSAGE("PROT0 {group A rates 0 txrate PROT0.D1,PROT0.D1,PROT0.D1,PROT0.D1 tx 0,1,2,3 rxrate PROT0.D1,PROT0.D1,PROT0.D1,PROT0.D1 rx 0,1,2,3}"),
    .QUAD2_LANEUSAGE("PROT0 {group A rates 0 txrate PROT0.D1,PROT0.D1,PROT0.D1,PROT0.D1 tx 0,1,2,3 rxrate PROT0.D1,PROT0.D1,PROT0.D1,PROT0.D1 rx 0,1,2,3}"),
    .QUAD3_LANEUSAGE("PROT0 {group A rates 0 txrate PROT0.D1,PROT0.D1,PROT0.D1,PROT0.D1 tx 0,1,2,3 rxrate PROT0.D1,PROT0.D1,PROT0.D1,PROT0.D1 rx 0,1,2,3}"),
    .QUAD4_LANEUSAGE("PROT0 {group A rates 0 txrate PROT0.D1,PROT0.D1,PROT0.D1,PROT0.D1 tx 0,1,2,3 rxrate PROT0.D1,PROT0.D1,PROT0.D1,PROT0.D1 rx 0,1,2,3}"),
    .QUAD0_REFCLK_SEL("HSCLK1_LCPLLGTREFCLK0 refclk_PROT0_R0_100_MHz_unique1"),
    .QUAD1_REFCLK_SEL("HSCLK0_LCPLLGTREFCLK0 refclk_PROT0_156.250000_MHz_unique1 HSCLK1_LCPLLGTREFCLK0 refclk_PROT0_156.250000_MHz_unique1"),
    .QUAD2_REFCLK_SEL("HSCLK0_LCPLLGTREFCLK0 refclk_PROT0_156.250000_MHz_unique1 HSCLK1_LCPLLGTREFCLK0 refclk_PROT0_156.250000_MHz_unique1"),
    .QUAD3_REFCLK_SEL("HSCLK0_LCPLLGTREFCLK0 refclk_PROT0_156.250000_MHz_unique1 HSCLK1_LCPLLGTREFCLK0 refclk_PROT0_156.250000_MHz_unique1"),
    .QUAD4_REFCLK_SEL("HSCLK0_LCPLLGTREFCLK0 refclk_PROT0_156.250000_MHz_unique1 HSCLK1_LCPLLGTREFCLK0 refclk_PROT0_156.250000_MHz_unique1"),
    .INTF_PARENT_PIN_LIST("QUAD0_RX3 undef QUAD0_TX3 undef"),
    .QUAD0_PROT0_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD0_PROT1_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD0_PROT2_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD0_PROT3_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD0_PROT4_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD0_PROT5_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD0_PROT6_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD0_PROT7_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD1_PROT0_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD1_PROT1_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD1_PROT2_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD1_PROT3_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD1_PROT4_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD1_PROT5_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD1_PROT6_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD1_PROT7_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD2_PROT0_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD2_PROT1_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD2_PROT2_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD2_PROT3_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD2_PROT4_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD2_PROT5_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD2_PROT6_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD2_PROT7_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD3_PROT0_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD3_PROT1_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD3_PROT2_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD3_PROT3_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD3_PROT4_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD3_PROT5_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD3_PROT6_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD3_PROT7_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD4_PROT0_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD4_PROT1_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD4_PROT2_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD4_PROT3_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD4_PROT4_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD4_PROT5_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD4_PROT6_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .QUAD4_PROT7_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }")
  ) inst (
    .gtpowergood(gtpowergood),
    .gtwiz_freerun_clk(gtwiz_freerun_clk),
    .QUAD0_GTREFCLK0(QUAD0_GTREFCLK0),
    .QUAD0_TX3_outclk(QUAD0_TX3_outclk),
    .QUAD0_RX3_outclk(QUAD0_RX3_outclk),
    .QUAD0_rxp(QUAD0_rxp),
    .QUAD0_rxn(QUAD0_rxn),
    .QUAD0_txp(QUAD0_txp),
    .QUAD0_txn(QUAD0_txn),
    .QUAD0_ch3_loopback(QUAD0_ch3_loopback),
    .QUAD0_gpi(QUAD0_gpi),
    .QUAD0_gpo(QUAD0_gpo),
    .QUAD0_hsclk0_lcplllock(QUAD0_hsclk0_lcplllock),
    .QUAD0_TX3_usrclk(QUAD0_TX3_usrclk),
    .QUAD0_RX3_usrclk(QUAD0_RX3_usrclk),
    .INTF0_TX0_ch_txdata(INTF0_TX0_ch_txdata),
    .INTF0_TX0_ch_txbufstatus(INTF0_TX0_ch_txbufstatus),
    .INTF0_TX0_ch_txdccdone(INTF0_TX0_ch_txdccdone),
    .INTF0_TX0_ch_gttxreset(INTF0_TX0_ch_gttxreset),
    .INTF0_TX0_ch_txdebugpcsout(INTF0_TX0_ch_txdebugpcsout),
    .INTF0_TX0_ch_txprogdivresetdone(INTF0_TX0_ch_txprogdivresetdone),
    .INTF0_TX0_ch_txresetdone(INTF0_TX0_ch_txresetdone),
    .INTF0_TX0_ch_txinhibit(INTF0_TX0_ch_txinhibit),
    .INTF0_TX0_ch_txlatclk(INTF0_TX0_ch_txlatclk),
    .INTF0_TX0_ch_txmaincursor(INTF0_TX0_ch_txmaincursor),
    .INTF0_TX0_ch_txpcsresetmask(INTF0_TX0_ch_txpcsresetmask),
    .INTF0_TX0_ch_txpd(INTF0_TX0_ch_txpd),
    .INTF0_TX0_ch_txpisopd(INTF0_TX0_ch_txpisopd),
    .INTF0_TX0_ch_txpmaresetmask(INTF0_TX0_ch_txpmaresetmask),
    .INTF0_TX0_ch_txpolarity(INTF0_TX0_ch_txpolarity),
    .INTF0_TX0_ch_txpostcursor(INTF0_TX0_ch_txpostcursor),
    .INTF0_TX0_ch_txprbsforceerr(INTF0_TX0_ch_txprbsforceerr),
    .INTF0_TX0_ch_txprbssel(INTF0_TX0_ch_txprbssel),
    .INTF0_TX0_ch_txprecursor(INTF0_TX0_ch_txprecursor),
    .INTF0_TX0_ch_txprogdivreset(INTF0_TX0_ch_txprogdivreset),
    .INTF0_TX0_ch_txrate(INTF0_TX0_ch_txrate),
    .INTF0_TX0_ch_txresetmode(INTF0_TX0_ch_txresetmode),
    .INTF0_TX0_ch_txheader(INTF0_TX0_ch_txheader),
    .INTF0_TX0_ch_txsequence(INTF0_TX0_ch_txsequence),
    .INTF0_TX0_ch_txphalignresetmask(INTF0_TX0_ch_txphalignresetmask),
    .INTF0_TX0_ch_txcominit(INTF0_TX0_ch_txcominit),
    .INTF0_TX0_ch_txcomsas(INTF0_TX0_ch_txcomsas),
    .INTF0_TX0_ch_txcomwake(INTF0_TX0_ch_txcomwake),
    .INTF0_TX0_ch_txdapicodeovrden(INTF0_TX0_ch_txdapicodeovrden),
    .INTF0_TX0_ch_txdapicodereset(INTF0_TX0_ch_txdapicodereset),
    .INTF0_TX0_ch_txdetectrx(INTF0_TX0_ch_txdetectrx),
    .INTF0_TX0_ch_txphdlytstclk(INTF0_TX0_ch_txphdlytstclk),
    .INTF0_TX0_ch_txdlyalignreq(INTF0_TX0_ch_txdlyalignreq),
    .INTF0_TX0_ch_txelecidle(INTF0_TX0_ch_txelecidle),
    .INTF0_TX0_ch_txmldchaindone(INTF0_TX0_ch_txmldchaindone),
    .INTF0_TX0_ch_txmldchainreq(INTF0_TX0_ch_txmldchainreq),
    .INTF0_TX0_ch_txoneszeros(INTF0_TX0_ch_txoneszeros),
    .INTF0_TX0_ch_txpausedelayalign(INTF0_TX0_ch_txpausedelayalign),
    .INTF0_TX0_ch_txphalignreq(INTF0_TX0_ch_txphalignreq),
    .INTF0_TX0_ch_txphdlypd(INTF0_TX0_ch_txphdlypd),
    .INTF0_TX0_ch_txphdlyreset(INTF0_TX0_ch_txphdlyreset),
    .INTF0_TX0_ch_txphsetinitreq(INTF0_TX0_ch_txphsetinitreq),
    .INTF0_TX0_ch_txphshift180(INTF0_TX0_ch_txphshift180),
    .INTF0_TX0_ch_txpicodeovrden(INTF0_TX0_ch_txpicodeovrden),
    .INTF0_TX0_ch_txpicodereset(INTF0_TX0_ch_txpicodereset),
    .INTF0_TX0_ch_txpippmen(INTF0_TX0_ch_txpippmen),
    .INTF0_TX0_ch_txswing(INTF0_TX0_ch_txswing),
    .INTF0_TX0_ch_txsyncallin(INTF0_TX0_ch_txsyncallin),
    .INTF0_TX0_ch_tx10gstat(INTF0_TX0_ch_tx10gstat),
    .INTF0_TX0_ch_txcomfinish(INTF0_TX0_ch_txcomfinish),
    .INTF0_TX0_ch_txdlyalignerr(INTF0_TX0_ch_txdlyalignerr),
    .INTF0_TX0_ch_txdlyalignprog(INTF0_TX0_ch_txdlyalignprog),
    .INTF0_TX0_ch_txphaligndone(INTF0_TX0_ch_txphaligndone),
    .INTF0_TX0_ch_txphalignerr(INTF0_TX0_ch_txphalignerr),
    .INTF0_TX0_ch_txphalignoutrsvd(INTF0_TX0_ch_txphalignoutrsvd),
    .INTF0_TX0_ch_txphdlyresetdone(INTF0_TX0_ch_txphdlyresetdone),
    .INTF0_TX0_ch_txphsetinitdone(INTF0_TX0_ch_txphsetinitdone),
    .INTF0_TX0_ch_txphshift180done(INTF0_TX0_ch_txphshift180done),
    .INTF0_TX0_ch_txsyncdone(INTF0_TX0_ch_txsyncdone),
    .INTF0_TX0_ch_txctrl0(INTF0_TX0_ch_txctrl0),
    .INTF0_TX0_ch_txctrl1(INTF0_TX0_ch_txctrl1),
    .INTF0_TX0_ch_txctrl2(INTF0_TX0_ch_txctrl2),
    .INTF0_TX0_ch_txdeemph(INTF0_TX0_ch_txdeemph),
    .INTF0_TX0_ch_txmargin(INTF0_TX0_ch_txmargin),
    .INTF0_TX0_ch_txdiffctrl(INTF0_TX0_ch_txdiffctrl),
    .INTF0_TX0_ch_txpippmstepsize(INTF0_TX0_ch_txpippmstepsize),
    .INTF0_TX0_ch_txdapiresetdone(INTF0_TX0_ch_txdapiresetdone),
    .INTF0_TX0_ch_txqpisenn(INTF0_TX0_ch_txqpisenn),
    .INTF0_TX0_ch_txqpisenp(INTF0_TX0_ch_txqpisenp),
    .INTF0_TX0_ch_txswingouthigh(INTF0_TX0_ch_txswingouthigh),
    .INTF0_TX0_ch_txswingoutlow(INTF0_TX0_ch_txswingoutlow),
    .INTF0_TX0_ch_txdapireset(INTF0_TX0_ch_txdapireset),
    .INTF0_TX0_ch_txdapiresetmask(INTF0_TX0_ch_txdapiresetmask),
    .INTF0_TX0_ch_txqpibiasen(INTF0_TX0_ch_txqpibiasen),
    .INTF0_TX0_ch_txqpiweakpu(INTF0_TX0_ch_txqpiweakpu),
    .INTF0_RX0_ch_rxbufstatus(INTF0_RX0_ch_rxbufstatus),
    .INTF0_RX0_ch_rxcdrlock(INTF0_RX0_ch_rxcdrlock),
    .INTF0_RX0_ch_rxdebugpcsout(INTF0_RX0_ch_rxdebugpcsout),
    .INTF0_RX0_ch_rxprbserr(INTF0_RX0_ch_rxprbserr),
    .INTF0_RX0_ch_rxprbslocked(INTF0_RX0_ch_rxprbslocked),
    .INTF0_RX0_ch_rxcdrhold(INTF0_RX0_ch_rxcdrhold),
    .INTF0_RX0_ch_rxcdrovrden(INTF0_RX0_ch_rxcdrovrden),
    .INTF0_RX0_ch_rxlatclk(INTF0_RX0_ch_rxlatclk),
    .INTF0_RX0_ch_rxpcsresetmask(INTF0_RX0_ch_rxpcsresetmask),
    .INTF0_RX0_ch_rxpd(INTF0_RX0_ch_rxpd),
    .INTF0_RX0_ch_rxpmaresetmask(INTF0_RX0_ch_rxpmaresetmask),
    .INTF0_RX0_ch_rxpolarity(INTF0_RX0_ch_rxpolarity),
    .INTF0_RX0_ch_rxprbscntreset(INTF0_RX0_ch_rxprbscntreset),
    .INTF0_RX0_ch_rxrate(INTF0_RX0_ch_rxrate),
    .INTF0_RX0_ch_rxresetmode(INTF0_RX0_ch_rxresetmode),
    .INTF0_RX0_ch_rxdata(INTF0_RX0_ch_rxdata),
    .INTF0_RX0_ch_rx10gstat(INTF0_RX0_ch_rx10gstat),
    .INTF0_RX0_ch_rxdatavalid(INTF0_RX0_ch_rxdatavalid),
    .INTF0_RX0_ch_rxheader(INTF0_RX0_ch_rxheader),
    .INTF0_RX0_ch_rxchanisaligned(INTF0_RX0_ch_rxchanisaligned),
    .INTF0_RX0_ch_rxchanrealign(INTF0_RX0_ch_rxchanrealign),
    .INTF0_RX0_ch_rxchbondi(INTF0_RX0_ch_rxchbondi),
    .INTF0_RX0_ch_rxchbondo(INTF0_RX0_ch_rxchbondo),
    .INTF0_RX0_ch_rxclkcorcnt(INTF0_RX0_ch_rxclkcorcnt),
    .INTF0_RX0_ch_rxcominitdet(INTF0_RX0_ch_rxcominitdet),
    .INTF0_RX0_ch_rxcommadet(INTF0_RX0_ch_rxcommadet),
    .INTF0_RX0_ch_rxbyteisaligned(INTF0_RX0_ch_rxbyteisaligned),
    .INTF0_RX0_ch_rxbyterealign(INTF0_RX0_ch_rxbyterealign),
    .INTF0_RX0_ch_rxcomsasdet(INTF0_RX0_ch_rxcomsasdet),
    .INTF0_RX0_ch_rxcomwakedet(INTF0_RX0_ch_rxcomwakedet),
    .INTF0_RX0_ch_rxctrl0(INTF0_RX0_ch_rxctrl0),
    .INTF0_RX0_ch_rxctrl1(INTF0_RX0_ch_rxctrl1),
    .INTF0_RX0_ch_rxctrl2(INTF0_RX0_ch_rxctrl2),
    .INTF0_RX0_ch_rxctrl3(INTF0_RX0_ch_rxctrl3),
    .INTF0_RX0_ch_rxdapicodeovrden(INTF0_RX0_ch_rxdapicodeovrden),
    .INTF0_RX0_ch_rxdapicodereset(INTF0_RX0_ch_rxdapicodereset),
    .INTF0_RX0_ch_rxdlyalignerr(INTF0_RX0_ch_rxdlyalignerr),
    .INTF0_RX0_ch_rxdlyalignprog(INTF0_RX0_ch_rxdlyalignprog),
    .INTF0_RX0_ch_rxdlyalignreq(INTF0_RX0_ch_rxdlyalignreq),
    .INTF0_RX0_ch_rxelecidle(INTF0_RX0_ch_rxelecidle),
    .INTF0_RX0_ch_rxeqtraining(INTF0_RX0_ch_rxeqtraining),
    .INTF0_RX0_ch_rxfinealigndone(INTF0_RX0_ch_rxfinealigndone),
    .INTF0_RX0_ch_rxgearboxslip(INTF0_RX0_ch_rxgearboxslip),
    .INTF0_RX0_ch_rxheadervalid(INTF0_RX0_ch_rxheadervalid),
    .INTF0_RX0_ch_rxlpmen(INTF0_RX0_ch_rxlpmen),
    .INTF0_RX0_ch_rxmldchaindone(INTF0_RX0_ch_rxmldchaindone),
    .INTF0_RX0_ch_rxmldchainreq(INTF0_RX0_ch_rxmldchainreq),
    .INTF0_RX0_ch_rxmlfinealignreq(INTF0_RX0_ch_rxmlfinealignreq),
    .INTF0_RX0_ch_rxoobreset(INTF0_RX0_ch_rxoobreset),
    .INTF0_RX0_ch_rxosintdone(INTF0_RX0_ch_rxosintdone),
    .INTF0_RX0_ch_rxphaligndone(INTF0_RX0_ch_rxphaligndone),
    .INTF0_RX0_ch_rxphalignerr(INTF0_RX0_ch_rxphalignerr),
    .INTF0_RX0_ch_rxphalignreq(INTF0_RX0_ch_rxphalignreq),
    .INTF0_RX0_ch_rxphalignresetmask(INTF0_RX0_ch_rxphalignresetmask),
    .INTF0_RX0_ch_rxphdlypd(INTF0_RX0_ch_rxphdlypd),
    .INTF0_RX0_ch_rxphdlyreset(INTF0_RX0_ch_rxphdlyreset),
    .INTF0_RX0_ch_rxphdlyresetdone(INTF0_RX0_ch_rxphdlyresetdone),
    .INTF0_RX0_ch_rxphsetinitreq(INTF0_RX0_ch_rxphsetinitreq),
    .INTF0_RX0_ch_rxphshift180(INTF0_RX0_ch_rxphshift180),
    .INTF0_RX0_ch_rxphshift180done(INTF0_RX0_ch_rxphshift180done),
    .INTF0_RX0_ch_rxphsetinitdone(INTF0_RX0_ch_rxphsetinitdone),
    .INTF0_RX0_ch_rxslide(INTF0_RX0_ch_rxslide),
    .INTF0_RX0_ch_rxsliderdy(INTF0_RX0_ch_rxsliderdy),
    .INTF0_RX0_ch_rxstartofseq(INTF0_RX0_ch_rxstartofseq),
    .INTF0_RX0_ch_rxstatus(INTF0_RX0_ch_rxstatus),
    .INTF0_RX0_ch_rxsyncallin(INTF0_RX0_ch_rxsyncallin),
    .INTF0_RX0_ch_rxsyncdone(INTF0_RX0_ch_rxsyncdone),
    .INTF0_RX0_ch_rxtermination(INTF0_RX0_ch_rxtermination),
    .INTF0_RX0_ch_rxvalid(INTF0_RX0_ch_rxvalid),
    .INTF0_RX0_ch_rxchanbondseq(INTF0_RX0_ch_rxchanbondseq),
    .INTF0_RX0_ch_rxchanbond_busy(INTF0_RX0_ch_rxchanbond_busy),
    .INTF0_RX0_ch_rxchanbond_en(INTF0_RX0_ch_rxchanbond_en),
    .INTF0_RX0_ch_rxchanbond_master(INTF0_RX0_ch_rxchanbond_master),
    .INTF0_RX0_ch_rxchanbond_slave(INTF0_RX0_ch_rxchanbond_slave),
    .INTF0_RX0_ch_rxchanbond_level(INTF0_RX0_ch_rxchanbond_level),
    .INTF0_RX0_ch_cdrbmcdrreq(INTF0_RX0_ch_cdrbmcdrreq),
    .INTF0_RX0_ch_cdrfreqos(INTF0_RX0_ch_cdrfreqos),
    .INTF0_RX0_ch_cdrincpctrl(INTF0_RX0_ch_cdrincpctrl),
    .INTF0_RX0_ch_cdrstepdir(INTF0_RX0_ch_cdrstepdir),
    .INTF0_RX0_ch_cdrstepsq(INTF0_RX0_ch_cdrstepsq),
    .INTF0_RX0_ch_cdrstepsx(INTF0_RX0_ch_cdrstepsx),
    .INTF0_RX0_ch_eyescanreset(INTF0_RX0_ch_eyescanreset),
    .INTF0_RX0_ch_eyescantrigger(INTF0_RX0_ch_eyescantrigger),
    .INTF0_RX0_ch_eyescandataerror(INTF0_RX0_ch_eyescandataerror),
    .INTF0_RX0_ch_refdebugout(INTF0_RX0_ch_refdebugout),
    .INTF0_RX0_ch_rxdapiresetdone(INTF0_RX0_ch_rxdapiresetdone),
    .INTF0_RX0_ch_rxpkdet(INTF0_RX0_ch_rxpkdet),
    .INTF0_RX0_ch_rxqpisenn(INTF0_RX0_ch_rxqpisenn),
    .INTF0_RX0_ch_rxqpisenp(INTF0_RX0_ch_rxqpisenp),
    .INTF0_RX0_ch_rxsimplexphystatus(INTF0_RX0_ch_rxsimplexphystatus),
    .INTF0_RX0_ch_rxslipdone(INTF0_RX0_ch_rxslipdone),
    .INTF0_RX0_ch_dfehold(INTF0_RX0_ch_dfehold),
    .INTF0_RX0_ch_dfeovrd(INTF0_RX0_ch_dfeovrd),
    .INTF0_RX0_ch_rxdapireset(INTF0_RX0_ch_rxdapireset),
    .INTF0_RX0_ch_rxdapiresetmask(INTF0_RX0_ch_rxdapiresetmask),
    .INTF0_RX0_ch_rxqpien(INTF0_RX0_ch_rxqpien),
    .INTF0_RX0_ch_rxcdrphdone(INTF0_RX0_ch_rxcdrphdone),
    .INTF0_RX0_ch_gtrxreset(INTF0_RX0_ch_gtrxreset),
    .INTF0_RX0_ch_rxprogdivresetdone(INTF0_RX0_ch_rxprogdivresetdone),
    .INTF0_RX0_ch_rxresetdone(INTF0_RX0_ch_rxresetdone),
    .INTF0_RX0_ch_rxcdrreset(INTF0_RX0_ch_rxcdrreset),
    .INTF0_RX0_ch_rxprbssel(INTF0_RX0_ch_rxprbssel),
    .INTF0_RX0_ch_rxprogdivreset(INTF0_RX0_ch_rxprogdivreset),
    .INTF0_TX_clr_out(INTF0_TX_clr_out),
    .INTF0_TX_clrb_leaf_out(INTF0_TX_clrb_leaf_out),
    .INTF0_RX_clr_out(INTF0_RX_clr_out),
    .INTF0_RX_clrb_leaf_out(INTF0_RX_clrb_leaf_out),
    .INTF0_rst_all_in(INTF0_rst_all_in),
    .INTF0_rst_tx_pll_and_datapath_in(INTF0_rst_tx_pll_and_datapath_in),
    .INTF0_rst_tx_datapath_in(INTF0_rst_tx_datapath_in),
    .INTF0_rst_tx_done_out(INTF0_rst_tx_done_out),
    .INTF0_rst_rx_pll_and_datapath_in(INTF0_rst_rx_pll_and_datapath_in),
    .INTF0_rst_rx_datapath_in(INTF0_rst_rx_datapath_in),
    .INTF0_rst_rx_done_out(INTF0_rst_rx_done_out)
  );
endmodule
