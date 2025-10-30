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

`timescale 1ns/1fs

module extended_phy_layer_gtwiz_versal_0_0_intf_quad_map  # (
   parameter C_NO_OF_QUADS        = 1,
   parameter C_NO_OF_INTFS        = 1,
   parameter C_GT_TYPE            = " "
) (


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
       output             QUAD0_TX0_outclk ,
       output             QUAD0_RX0_outclk ,
       output             QUAD0_TX1_outclk ,
       output             QUAD0_RX1_outclk ,
       output             QUAD0_TX2_outclk ,
       output             QUAD0_RX2_outclk ,
       output             QUAD0_TX3_outclk ,
       output             QUAD0_RX3_outclk ,
       output             INTF0_gtpowergood_int,
       output [1-1:0]     INTF0_rst_userclk_tx_active_int,
       output [1-1:0]     INTF0_mst_tx_resetdone_int,
       input              INTF0_gtwiz_reset_txuserrdy_int,
       input              INTF0_mst_tx_reset_int,
       input              INTF0_mst_tx_dp_reset_int,
       output [1-1:0]     INTF0_rst_userclk_rx_active_int,
       output [1-1:0]     INTF0_mst_rx_resetdone_int,
       input              INTF0_gtwiz_reset_rxuserrdy_int,
       input              INTF0_mst_rx_reset_int,
       input              INTF0_mst_rx_dp_reset_int,

       input              QUAD0_TX0_usrclk,
       input              QUAD0_RX0_usrclk,
       input              QUAD0_TX1_usrclk,
       input              QUAD0_RX1_usrclk,
       input              QUAD0_TX2_usrclk,
       input              QUAD0_RX2_usrclk,
       input              QUAD0_TX3_usrclk,
       input              QUAD0_RX3_usrclk,

       input              QUAD0_GTREFCLK0,
       output             QUAD0_gtpowergood
);


wire [1:0]   QUAD0_RX0_ch_refdebugout;
wire         QUAD0_RX0_ch_rxdapiresetdone;
wire         QUAD0_RX0_ch_rxdebugpcsout;
wire         QUAD0_RX0_ch_rxpkdet;
wire         QUAD0_RX0_ch_rxqpisenn;
wire         QUAD0_RX0_ch_rxqpisenp;
wire         QUAD0_RX0_ch_rxsimplexphystatus;
wire         QUAD0_RX0_ch_rxslipdone;
wire         QUAD0_RX0_ch_dfehold;
wire         QUAD0_RX0_ch_dfeovrd;
wire         QUAD0_RX0_ch_rxdapireset;
wire [1:0]   QUAD0_RX0_ch_rxdapiresetmask;
wire         QUAD0_RX0_ch_rxqpien;
wire         QUAD0_TX0_ch_txdapiresetdone;
wire         QUAD0_TX0_ch_txdebugpcsout;
wire         QUAD0_TX0_ch_txqpisenn;
wire         QUAD0_TX0_ch_txqpisenp;
wire         QUAD0_TX0_ch_txsimplexphystatus;
wire         QUAD0_TX0_ch_txswingouthigh;
wire         QUAD0_TX0_ch_txswingoutlow;
wire         QUAD0_TX0_ch_txdapireset;
wire [1:0]   QUAD0_TX0_ch_txdapiresetmask;
wire         QUAD0_TX0_ch_txqpibiasen;
wire         QUAD0_TX0_ch_txqpiweakpu;
wire         QUAD0_RX0_ch_cdrfreqos;
wire         QUAD0_RX0_ch_cdrincpctrl;
wire         QUAD0_RX0_ch_cdrstepdir;
wire         QUAD0_RX0_ch_cdrstepsq;
wire         QUAD0_RX0_ch_cdrstepsx;
wire         QUAD0_RX0_ch_eyescanreset;
wire         QUAD0_RX0_ch_eyescantrigger;
wire         QUAD0_RX0_ch_eyescandataerror;
wire [7:0]   QUAD0_RX0_ch_rx10gstat;
wire         QUAD0_RX0_ch_rxbyteisaligned;
wire         QUAD0_RX0_ch_rxbyterealign;
wire         QUAD0_RX0_ch_rxchanbondseq;
wire         QUAD0_RX0_ch_rxchanisaligned;
wire         QUAD0_RX0_ch_rxchanrealign;
wire [4:0]   QUAD0_RX0_ch_rxchbondo;
wire [1:0]   QUAD0_RX0_ch_rxclkcorcnt;
wire         QUAD0_RX0_ch_rxcominitdet;
wire         QUAD0_RX0_ch_rxcommadet;
wire         QUAD0_RX0_ch_rxcomsasdet;
wire         QUAD0_RX0_ch_rxcomwakedet;
wire [15:0]  QUAD0_RX0_ch_rxctrl0;
wire [15:0]  QUAD0_RX0_ch_rxctrl1;
wire [7:0]   QUAD0_RX0_ch_rxctrl2;
wire [7:0]   QUAD0_RX0_ch_rxctrl3;
wire [1:0]   QUAD0_RX0_ch_rxdatavalid;
wire         QUAD0_RX0_ch_rxdlyalignerr;
wire         QUAD0_RX0_ch_rxdlyalignprog;
wire         QUAD0_RX0_ch_rxelecidle;
wire         QUAD0_RX0_ch_rxfinealigndone;
wire [5:0]   QUAD0_RX0_ch_rxheader;
wire [1:0]   QUAD0_RX0_ch_rxheadervalid;
wire         QUAD0_RX0_ch_rxosintdone;
wire         QUAD0_RX0_ch_rxphaligndone;
wire         QUAD0_RX0_ch_rxphalignerr;
wire         QUAD0_RX0_ch_rxphdlyresetdone;
wire         QUAD0_RX0_ch_rxphsetinitdone;
wire         QUAD0_RX0_ch_rxphshift180done;
wire         QUAD0_RX0_ch_rxsliderdy;
wire [1:0]   QUAD0_RX0_ch_rxstartofseq;
wire [2:0]   QUAD0_RX0_ch_rxstatus;
wire         QUAD0_RX0_ch_rxsyncdone;
wire         QUAD0_RX0_ch_rxvalid;
wire [4:0]   QUAD0_RX0_ch_rxpcsresetmask;
wire         QUAD0_RX0_ch_cdrbmcdrreq;
wire [4:0]   QUAD0_RX0_ch_rxchbondi;
wire         QUAD0_RX0_ch_rxdapicodeovrden;
wire         QUAD0_RX0_ch_rxdapicodereset;
wire         QUAD0_RX0_ch_rxdlyalignreq;
wire         QUAD0_RX0_ch_rxeqtraining;
wire         QUAD0_RX0_ch_rxgearboxslip;
wire         QUAD0_RX0_ch_rxlpmen;
wire         QUAD0_RX0_ch_rxmldchaindone;
wire         QUAD0_RX0_ch_rxmldchainreq;
wire         QUAD0_RX0_ch_rxmlfinealignreq;
wire         QUAD0_RX0_ch_rxoobreset;
wire         QUAD0_RX0_ch_rxphalignreq;
wire [1:0]   QUAD0_RX0_ch_rxphalignresetmask;
wire         QUAD0_RX0_ch_rxphdlypd;
wire         QUAD0_RX0_ch_rxphdlyreset;
wire         QUAD0_RX0_ch_rxphsetinitreq;
wire         QUAD0_RX0_ch_rxphshift180;
wire         QUAD0_RX0_ch_rxslide;
wire         QUAD0_RX0_ch_rxsyncallin;
wire         QUAD0_RX0_ch_rxtermination;
wire [6:0]   QUAD0_RX0_ch_rxpmaresetmask;
wire [2:0]   QUAD0_RX0_ch_rxbufstatus;
wire         QUAD0_RX0_ch_rxcdrlock;
wire         QUAD0_RX0_ch_rxcdrphdone;
wire         QUAD0_RX0_ch_rxchanbond_busy;
wire         QUAD0_RX0_ch_rxchanbond_en;
wire         QUAD0_RX0_ch_rxchanbond_master;
wire         QUAD0_RX0_ch_rxchanbond_slave;
wire [2:0]   QUAD0_RX0_ch_rxchanbond_level;
wire [127:0] QUAD0_RX0_ch_rxdata;
wire         QUAD0_RX0_ch_rxpmaresetdone;
wire         QUAD0_RX0_ch_rxprbserr;
wire         QUAD0_RX0_ch_rxprbslocked;
wire         QUAD0_RX0_ch_rxprogdivresetdone;
wire         QUAD0_RX0_ch_rxresetdone;
wire         QUAD0_RX0_ch_rxmstresetdone;
wire         QUAD0_RX0_ch_rxmstreset;
wire         QUAD0_RX0_ch_rxmstdatapathreset;
wire         QUAD0_RX0_ch_gtrxreset;
wire         QUAD0_RX0_ch_rxcdrhold;
wire         QUAD0_RX0_ch_rxcdrovrden;
wire         QUAD0_RX0_ch_rxcdrreset;
wire         QUAD0_RX0_ch_rxlatclk;
wire [1:0]   QUAD0_RX0_ch_rxpd;
wire         QUAD0_RX0_ch_rxpolarity;
wire         QUAD0_RX0_ch_rxprbscntreset;
wire [3:0]   QUAD0_RX0_ch_rxprbssel;
wire         QUAD0_RX0_ch_rxprogdivreset;
wire [7:0]   QUAD0_RX0_ch_rxrate;
wire [1:0]   QUAD0_RX0_ch_rxresetmode;
wire         QUAD0_RX0_ch_rxuserrdy;

wire         QUAD0_TX0_ch_tx10gstat;
wire [1:0]   QUAD0_TX0_ch_txbufstatus;
wire         QUAD0_TX0_ch_txcomfinish;
wire         QUAD0_TX0_ch_txdlyalignerr;
wire         QUAD0_TX0_ch_txdlyalignprog;
wire         QUAD0_TX0_ch_txphaligndone;
wire         QUAD0_TX0_ch_txphalignerr;
wire         QUAD0_TX0_ch_txphalignoutrsvd;
wire         QUAD0_TX0_ch_txphdlyresetdone;
wire         QUAD0_TX0_ch_txphsetinitdone;
wire         QUAD0_TX0_ch_txphshift180done;
wire         QUAD0_TX0_ch_txsyncdone;
wire         QUAD0_TX0_ch_txdccdone;
wire         QUAD0_TX0_ch_txpmaresetdone;
wire         QUAD0_TX0_ch_txprogdivresetdone;
wire         QUAD0_TX0_ch_txresetdone;
wire         QUAD0_TX0_ch_txmstresetdone;
wire         QUAD0_TX0_ch_txmstreset;
wire         QUAD0_TX0_ch_txmstdatapathreset;
wire         QUAD0_TX0_ch_gttxreset;
wire [127:0] QUAD0_TX0_ch_txdata;
wire [2:0]   QUAD0_TX0_ch_txpmaresetmask;
wire         QUAD0_TX0_ch_txcominit;
wire         QUAD0_TX0_ch_txcomsas;
wire         QUAD0_TX0_ch_txcomwake;
wire [15:0]  QUAD0_TX0_ch_txctrl0;
wire [15:0]  QUAD0_TX0_ch_txctrl1;
wire [7:0]   QUAD0_TX0_ch_txctrl2;
wire         QUAD0_TX0_ch_txdapicodeovrden;
wire         QUAD0_TX0_ch_txdapicodereset;
wire [1:0]   QUAD0_TX0_ch_txdeemph;
wire         QUAD0_TX0_ch_txdetectrx;
wire [4:0]   QUAD0_TX0_ch_txdiffctrl;
wire         QUAD0_TX0_ch_txdlyalignreq;
wire         QUAD0_TX0_ch_txelecidle;
wire [5:0]   QUAD0_TX0_ch_txheader;
wire [2:0]   QUAD0_TX0_ch_txmargin;
wire         QUAD0_TX0_ch_txmldchaindone;
wire         QUAD0_TX0_ch_txmldchainreq;
wire         QUAD0_TX0_ch_txoneszeros;
wire         QUAD0_TX0_ch_txpausedelayalign;
wire         QUAD0_TX0_ch_txphalignreq;
wire [1:0]   QUAD0_TX0_ch_txphalignresetmask;
wire         QUAD0_TX0_ch_txphdlypd;
wire         QUAD0_TX0_ch_txphdlyreset;
wire         QUAD0_TX0_ch_txphdlytstclk;
wire         QUAD0_TX0_ch_txphsetinitreq;
wire         QUAD0_TX0_ch_txphshift180;
wire         QUAD0_TX0_ch_txpicodeovrden;
wire         QUAD0_TX0_ch_txpicodereset;
wire         QUAD0_TX0_ch_txpippmen;
wire [4:0]   QUAD0_TX0_ch_txpippmstepsize;
wire [6:0]   QUAD0_TX0_ch_txsequence;
wire         QUAD0_TX0_ch_txswing;
wire         QUAD0_TX0_ch_txsyncallin;
wire [4:0]   QUAD0_TX0_ch_txprecursor;
wire [4:0]   QUAD0_TX0_ch_txpostcursor;
wire         QUAD0_TX0_ch_txinhibit;
wire         QUAD0_TX0_ch_txlatclk;
wire [6:0]   QUAD0_TX0_ch_txmaincursor;
wire         QUAD0_TX0_ch_txpcsresetmask;
wire [1:0]   QUAD0_TX0_ch_txpd;
wire         QUAD0_TX0_ch_txpisopd;
wire         QUAD0_TX0_ch_txpolarity;
wire         QUAD0_TX0_ch_txprbsforceerr;
wire [3:0]   QUAD0_TX0_ch_txprbssel;
wire         QUAD0_TX0_ch_txprogdivreset;
wire [7:0]   QUAD0_TX0_ch_txrate;
wire [1:0]   QUAD0_TX0_ch_txresetmode;
wire         QUAD0_TX0_ch_txuserrdy;
wire [1:0]   QUAD0_RX1_ch_refdebugout;
wire         QUAD0_RX1_ch_rxdapiresetdone;
wire         QUAD0_RX1_ch_rxdebugpcsout;
wire         QUAD0_RX1_ch_rxpkdet;
wire         QUAD0_RX1_ch_rxqpisenn;
wire         QUAD0_RX1_ch_rxqpisenp;
wire         QUAD0_RX1_ch_rxsimplexphystatus;
wire         QUAD0_RX1_ch_rxslipdone;
wire         QUAD0_RX1_ch_dfehold;
wire         QUAD0_RX1_ch_dfeovrd;
wire         QUAD0_RX1_ch_rxdapireset;
wire [1:0]   QUAD0_RX1_ch_rxdapiresetmask;
wire         QUAD0_RX1_ch_rxqpien;
wire         QUAD0_TX1_ch_txdapiresetdone;
wire         QUAD0_TX1_ch_txdebugpcsout;
wire         QUAD0_TX1_ch_txqpisenn;
wire         QUAD0_TX1_ch_txqpisenp;
wire         QUAD0_TX1_ch_txsimplexphystatus;
wire         QUAD0_TX1_ch_txswingouthigh;
wire         QUAD0_TX1_ch_txswingoutlow;
wire         QUAD0_TX1_ch_txdapireset;
wire [1:0]   QUAD0_TX1_ch_txdapiresetmask;
wire         QUAD0_TX1_ch_txqpibiasen;
wire         QUAD0_TX1_ch_txqpiweakpu;
wire         QUAD0_RX1_ch_cdrfreqos;
wire         QUAD0_RX1_ch_cdrincpctrl;
wire         QUAD0_RX1_ch_cdrstepdir;
wire         QUAD0_RX1_ch_cdrstepsq;
wire         QUAD0_RX1_ch_cdrstepsx;
wire         QUAD0_RX1_ch_eyescanreset;
wire         QUAD0_RX1_ch_eyescantrigger;
wire         QUAD0_RX1_ch_eyescandataerror;
wire [7:0]   QUAD0_RX1_ch_rx10gstat;
wire         QUAD0_RX1_ch_rxbyteisaligned;
wire         QUAD0_RX1_ch_rxbyterealign;
wire         QUAD0_RX1_ch_rxchanbondseq;
wire         QUAD0_RX1_ch_rxchanisaligned;
wire         QUAD0_RX1_ch_rxchanrealign;
wire [4:0]   QUAD0_RX1_ch_rxchbondo;
wire [1:0]   QUAD0_RX1_ch_rxclkcorcnt;
wire         QUAD0_RX1_ch_rxcominitdet;
wire         QUAD0_RX1_ch_rxcommadet;
wire         QUAD0_RX1_ch_rxcomsasdet;
wire         QUAD0_RX1_ch_rxcomwakedet;
wire [15:0]  QUAD0_RX1_ch_rxctrl0;
wire [15:0]  QUAD0_RX1_ch_rxctrl1;
wire [7:0]   QUAD0_RX1_ch_rxctrl2;
wire [7:0]   QUAD0_RX1_ch_rxctrl3;
wire [1:0]   QUAD0_RX1_ch_rxdatavalid;
wire         QUAD0_RX1_ch_rxdlyalignerr;
wire         QUAD0_RX1_ch_rxdlyalignprog;
wire         QUAD0_RX1_ch_rxelecidle;
wire         QUAD0_RX1_ch_rxfinealigndone;
wire [5:0]   QUAD0_RX1_ch_rxheader;
wire [1:0]   QUAD0_RX1_ch_rxheadervalid;
wire         QUAD0_RX1_ch_rxosintdone;
wire         QUAD0_RX1_ch_rxphaligndone;
wire         QUAD0_RX1_ch_rxphalignerr;
wire         QUAD0_RX1_ch_rxphdlyresetdone;
wire         QUAD0_RX1_ch_rxphsetinitdone;
wire         QUAD0_RX1_ch_rxphshift180done;
wire         QUAD0_RX1_ch_rxsliderdy;
wire [1:0]   QUAD0_RX1_ch_rxstartofseq;
wire [2:0]   QUAD0_RX1_ch_rxstatus;
wire         QUAD0_RX1_ch_rxsyncdone;
wire         QUAD0_RX1_ch_rxvalid;
wire [4:0]   QUAD0_RX1_ch_rxpcsresetmask;
wire         QUAD0_RX1_ch_cdrbmcdrreq;
wire [4:0]   QUAD0_RX1_ch_rxchbondi;
wire         QUAD0_RX1_ch_rxdapicodeovrden;
wire         QUAD0_RX1_ch_rxdapicodereset;
wire         QUAD0_RX1_ch_rxdlyalignreq;
wire         QUAD0_RX1_ch_rxeqtraining;
wire         QUAD0_RX1_ch_rxgearboxslip;
wire         QUAD0_RX1_ch_rxlpmen;
wire         QUAD0_RX1_ch_rxmldchaindone;
wire         QUAD0_RX1_ch_rxmldchainreq;
wire         QUAD0_RX1_ch_rxmlfinealignreq;
wire         QUAD0_RX1_ch_rxoobreset;
wire         QUAD0_RX1_ch_rxphalignreq;
wire [1:0]   QUAD0_RX1_ch_rxphalignresetmask;
wire         QUAD0_RX1_ch_rxphdlypd;
wire         QUAD0_RX1_ch_rxphdlyreset;
wire         QUAD0_RX1_ch_rxphsetinitreq;
wire         QUAD0_RX1_ch_rxphshift180;
wire         QUAD0_RX1_ch_rxslide;
wire         QUAD0_RX1_ch_rxsyncallin;
wire         QUAD0_RX1_ch_rxtermination;
wire [6:0]   QUAD0_RX1_ch_rxpmaresetmask;
wire [2:0]   QUAD0_RX1_ch_rxbufstatus;
wire         QUAD0_RX1_ch_rxcdrlock;
wire         QUAD0_RX1_ch_rxcdrphdone;
wire         QUAD0_RX1_ch_rxchanbond_busy;
wire         QUAD0_RX1_ch_rxchanbond_en;
wire         QUAD0_RX1_ch_rxchanbond_master;
wire         QUAD0_RX1_ch_rxchanbond_slave;
wire [2:0]   QUAD0_RX1_ch_rxchanbond_level;
wire [127:0] QUAD0_RX1_ch_rxdata;
wire         QUAD0_RX1_ch_rxpmaresetdone;
wire         QUAD0_RX1_ch_rxprbserr;
wire         QUAD0_RX1_ch_rxprbslocked;
wire         QUAD0_RX1_ch_rxprogdivresetdone;
wire         QUAD0_RX1_ch_rxresetdone;
wire         QUAD0_RX1_ch_rxmstresetdone;
wire         QUAD0_RX1_ch_rxmstreset;
wire         QUAD0_RX1_ch_rxmstdatapathreset;
wire         QUAD0_RX1_ch_gtrxreset;
wire         QUAD0_RX1_ch_rxcdrhold;
wire         QUAD0_RX1_ch_rxcdrovrden;
wire         QUAD0_RX1_ch_rxcdrreset;
wire         QUAD0_RX1_ch_rxlatclk;
wire [1:0]   QUAD0_RX1_ch_rxpd;
wire         QUAD0_RX1_ch_rxpolarity;
wire         QUAD0_RX1_ch_rxprbscntreset;
wire [3:0]   QUAD0_RX1_ch_rxprbssel;
wire         QUAD0_RX1_ch_rxprogdivreset;
wire [7:0]   QUAD0_RX1_ch_rxrate;
wire [1:0]   QUAD0_RX1_ch_rxresetmode;
wire         QUAD0_RX1_ch_rxuserrdy;

wire         QUAD0_TX1_ch_tx10gstat;
wire [1:0]   QUAD0_TX1_ch_txbufstatus;
wire         QUAD0_TX1_ch_txcomfinish;
wire         QUAD0_TX1_ch_txdlyalignerr;
wire         QUAD0_TX1_ch_txdlyalignprog;
wire         QUAD0_TX1_ch_txphaligndone;
wire         QUAD0_TX1_ch_txphalignerr;
wire         QUAD0_TX1_ch_txphalignoutrsvd;
wire         QUAD0_TX1_ch_txphdlyresetdone;
wire         QUAD0_TX1_ch_txphsetinitdone;
wire         QUAD0_TX1_ch_txphshift180done;
wire         QUAD0_TX1_ch_txsyncdone;
wire         QUAD0_TX1_ch_txdccdone;
wire         QUAD0_TX1_ch_txpmaresetdone;
wire         QUAD0_TX1_ch_txprogdivresetdone;
wire         QUAD0_TX1_ch_txresetdone;
wire         QUAD0_TX1_ch_txmstresetdone;
wire         QUAD0_TX1_ch_txmstreset;
wire         QUAD0_TX1_ch_txmstdatapathreset;
wire         QUAD0_TX1_ch_gttxreset;
wire [127:0] QUAD0_TX1_ch_txdata;
wire [2:0]   QUAD0_TX1_ch_txpmaresetmask;
wire         QUAD0_TX1_ch_txcominit;
wire         QUAD0_TX1_ch_txcomsas;
wire         QUAD0_TX1_ch_txcomwake;
wire [15:0]  QUAD0_TX1_ch_txctrl0;
wire [15:0]  QUAD0_TX1_ch_txctrl1;
wire [7:0]   QUAD0_TX1_ch_txctrl2;
wire         QUAD0_TX1_ch_txdapicodeovrden;
wire         QUAD0_TX1_ch_txdapicodereset;
wire [1:0]   QUAD0_TX1_ch_txdeemph;
wire         QUAD0_TX1_ch_txdetectrx;
wire [4:0]   QUAD0_TX1_ch_txdiffctrl;
wire         QUAD0_TX1_ch_txdlyalignreq;
wire         QUAD0_TX1_ch_txelecidle;
wire [5:0]   QUAD0_TX1_ch_txheader;
wire [2:0]   QUAD0_TX1_ch_txmargin;
wire         QUAD0_TX1_ch_txmldchaindone;
wire         QUAD0_TX1_ch_txmldchainreq;
wire         QUAD0_TX1_ch_txoneszeros;
wire         QUAD0_TX1_ch_txpausedelayalign;
wire         QUAD0_TX1_ch_txphalignreq;
wire [1:0]   QUAD0_TX1_ch_txphalignresetmask;
wire         QUAD0_TX1_ch_txphdlypd;
wire         QUAD0_TX1_ch_txphdlyreset;
wire         QUAD0_TX1_ch_txphdlytstclk;
wire         QUAD0_TX1_ch_txphsetinitreq;
wire         QUAD0_TX1_ch_txphshift180;
wire         QUAD0_TX1_ch_txpicodeovrden;
wire         QUAD0_TX1_ch_txpicodereset;
wire         QUAD0_TX1_ch_txpippmen;
wire [4:0]   QUAD0_TX1_ch_txpippmstepsize;
wire [6:0]   QUAD0_TX1_ch_txsequence;
wire         QUAD0_TX1_ch_txswing;
wire         QUAD0_TX1_ch_txsyncallin;
wire [4:0]   QUAD0_TX1_ch_txprecursor;
wire [4:0]   QUAD0_TX1_ch_txpostcursor;
wire         QUAD0_TX1_ch_txinhibit;
wire         QUAD0_TX1_ch_txlatclk;
wire [6:0]   QUAD0_TX1_ch_txmaincursor;
wire         QUAD0_TX1_ch_txpcsresetmask;
wire [1:0]   QUAD0_TX1_ch_txpd;
wire         QUAD0_TX1_ch_txpisopd;
wire         QUAD0_TX1_ch_txpolarity;
wire         QUAD0_TX1_ch_txprbsforceerr;
wire [3:0]   QUAD0_TX1_ch_txprbssel;
wire         QUAD0_TX1_ch_txprogdivreset;
wire [7:0]   QUAD0_TX1_ch_txrate;
wire [1:0]   QUAD0_TX1_ch_txresetmode;
wire         QUAD0_TX1_ch_txuserrdy;
wire [1:0]   QUAD0_RX2_ch_refdebugout;
wire         QUAD0_RX2_ch_rxdapiresetdone;
wire         QUAD0_RX2_ch_rxdebugpcsout;
wire         QUAD0_RX2_ch_rxpkdet;
wire         QUAD0_RX2_ch_rxqpisenn;
wire         QUAD0_RX2_ch_rxqpisenp;
wire         QUAD0_RX2_ch_rxsimplexphystatus;
wire         QUAD0_RX2_ch_rxslipdone;
wire         QUAD0_RX2_ch_dfehold;
wire         QUAD0_RX2_ch_dfeovrd;
wire         QUAD0_RX2_ch_rxdapireset;
wire [1:0]   QUAD0_RX2_ch_rxdapiresetmask;
wire         QUAD0_RX2_ch_rxqpien;
wire         QUAD0_TX2_ch_txdapiresetdone;
wire         QUAD0_TX2_ch_txdebugpcsout;
wire         QUAD0_TX2_ch_txqpisenn;
wire         QUAD0_TX2_ch_txqpisenp;
wire         QUAD0_TX2_ch_txsimplexphystatus;
wire         QUAD0_TX2_ch_txswingouthigh;
wire         QUAD0_TX2_ch_txswingoutlow;
wire         QUAD0_TX2_ch_txdapireset;
wire [1:0]   QUAD0_TX2_ch_txdapiresetmask;
wire         QUAD0_TX2_ch_txqpibiasen;
wire         QUAD0_TX2_ch_txqpiweakpu;
wire         QUAD0_RX2_ch_cdrfreqos;
wire         QUAD0_RX2_ch_cdrincpctrl;
wire         QUAD0_RX2_ch_cdrstepdir;
wire         QUAD0_RX2_ch_cdrstepsq;
wire         QUAD0_RX2_ch_cdrstepsx;
wire         QUAD0_RX2_ch_eyescanreset;
wire         QUAD0_RX2_ch_eyescantrigger;
wire         QUAD0_RX2_ch_eyescandataerror;
wire [7:0]   QUAD0_RX2_ch_rx10gstat;
wire         QUAD0_RX2_ch_rxbyteisaligned;
wire         QUAD0_RX2_ch_rxbyterealign;
wire         QUAD0_RX2_ch_rxchanbondseq;
wire         QUAD0_RX2_ch_rxchanisaligned;
wire         QUAD0_RX2_ch_rxchanrealign;
wire [4:0]   QUAD0_RX2_ch_rxchbondo;
wire [1:0]   QUAD0_RX2_ch_rxclkcorcnt;
wire         QUAD0_RX2_ch_rxcominitdet;
wire         QUAD0_RX2_ch_rxcommadet;
wire         QUAD0_RX2_ch_rxcomsasdet;
wire         QUAD0_RX2_ch_rxcomwakedet;
wire [15:0]  QUAD0_RX2_ch_rxctrl0;
wire [15:0]  QUAD0_RX2_ch_rxctrl1;
wire [7:0]   QUAD0_RX2_ch_rxctrl2;
wire [7:0]   QUAD0_RX2_ch_rxctrl3;
wire [1:0]   QUAD0_RX2_ch_rxdatavalid;
wire         QUAD0_RX2_ch_rxdlyalignerr;
wire         QUAD0_RX2_ch_rxdlyalignprog;
wire         QUAD0_RX2_ch_rxelecidle;
wire         QUAD0_RX2_ch_rxfinealigndone;
wire [5:0]   QUAD0_RX2_ch_rxheader;
wire [1:0]   QUAD0_RX2_ch_rxheadervalid;
wire         QUAD0_RX2_ch_rxosintdone;
wire         QUAD0_RX2_ch_rxphaligndone;
wire         QUAD0_RX2_ch_rxphalignerr;
wire         QUAD0_RX2_ch_rxphdlyresetdone;
wire         QUAD0_RX2_ch_rxphsetinitdone;
wire         QUAD0_RX2_ch_rxphshift180done;
wire         QUAD0_RX2_ch_rxsliderdy;
wire [1:0]   QUAD0_RX2_ch_rxstartofseq;
wire [2:0]   QUAD0_RX2_ch_rxstatus;
wire         QUAD0_RX2_ch_rxsyncdone;
wire         QUAD0_RX2_ch_rxvalid;
wire [4:0]   QUAD0_RX2_ch_rxpcsresetmask;
wire         QUAD0_RX2_ch_cdrbmcdrreq;
wire [4:0]   QUAD0_RX2_ch_rxchbondi;
wire         QUAD0_RX2_ch_rxdapicodeovrden;
wire         QUAD0_RX2_ch_rxdapicodereset;
wire         QUAD0_RX2_ch_rxdlyalignreq;
wire         QUAD0_RX2_ch_rxeqtraining;
wire         QUAD0_RX2_ch_rxgearboxslip;
wire         QUAD0_RX2_ch_rxlpmen;
wire         QUAD0_RX2_ch_rxmldchaindone;
wire         QUAD0_RX2_ch_rxmldchainreq;
wire         QUAD0_RX2_ch_rxmlfinealignreq;
wire         QUAD0_RX2_ch_rxoobreset;
wire         QUAD0_RX2_ch_rxphalignreq;
wire [1:0]   QUAD0_RX2_ch_rxphalignresetmask;
wire         QUAD0_RX2_ch_rxphdlypd;
wire         QUAD0_RX2_ch_rxphdlyreset;
wire         QUAD0_RX2_ch_rxphsetinitreq;
wire         QUAD0_RX2_ch_rxphshift180;
wire         QUAD0_RX2_ch_rxslide;
wire         QUAD0_RX2_ch_rxsyncallin;
wire         QUAD0_RX2_ch_rxtermination;
wire [6:0]   QUAD0_RX2_ch_rxpmaresetmask;
wire [2:0]   QUAD0_RX2_ch_rxbufstatus;
wire         QUAD0_RX2_ch_rxcdrlock;
wire         QUAD0_RX2_ch_rxcdrphdone;
wire         QUAD0_RX2_ch_rxchanbond_busy;
wire         QUAD0_RX2_ch_rxchanbond_en;
wire         QUAD0_RX2_ch_rxchanbond_master;
wire         QUAD0_RX2_ch_rxchanbond_slave;
wire [2:0]   QUAD0_RX2_ch_rxchanbond_level;
wire [127:0] QUAD0_RX2_ch_rxdata;
wire         QUAD0_RX2_ch_rxpmaresetdone;
wire         QUAD0_RX2_ch_rxprbserr;
wire         QUAD0_RX2_ch_rxprbslocked;
wire         QUAD0_RX2_ch_rxprogdivresetdone;
wire         QUAD0_RX2_ch_rxresetdone;
wire         QUAD0_RX2_ch_rxmstresetdone;
wire         QUAD0_RX2_ch_rxmstreset;
wire         QUAD0_RX2_ch_rxmstdatapathreset;
wire         QUAD0_RX2_ch_gtrxreset;
wire         QUAD0_RX2_ch_rxcdrhold;
wire         QUAD0_RX2_ch_rxcdrovrden;
wire         QUAD0_RX2_ch_rxcdrreset;
wire         QUAD0_RX2_ch_rxlatclk;
wire [1:0]   QUAD0_RX2_ch_rxpd;
wire         QUAD0_RX2_ch_rxpolarity;
wire         QUAD0_RX2_ch_rxprbscntreset;
wire [3:0]   QUAD0_RX2_ch_rxprbssel;
wire         QUAD0_RX2_ch_rxprogdivreset;
wire [7:0]   QUAD0_RX2_ch_rxrate;
wire [1:0]   QUAD0_RX2_ch_rxresetmode;
wire         QUAD0_RX2_ch_rxuserrdy;

wire         QUAD0_TX2_ch_tx10gstat;
wire [1:0]   QUAD0_TX2_ch_txbufstatus;
wire         QUAD0_TX2_ch_txcomfinish;
wire         QUAD0_TX2_ch_txdlyalignerr;
wire         QUAD0_TX2_ch_txdlyalignprog;
wire         QUAD0_TX2_ch_txphaligndone;
wire         QUAD0_TX2_ch_txphalignerr;
wire         QUAD0_TX2_ch_txphalignoutrsvd;
wire         QUAD0_TX2_ch_txphdlyresetdone;
wire         QUAD0_TX2_ch_txphsetinitdone;
wire         QUAD0_TX2_ch_txphshift180done;
wire         QUAD0_TX2_ch_txsyncdone;
wire         QUAD0_TX2_ch_txdccdone;
wire         QUAD0_TX2_ch_txpmaresetdone;
wire         QUAD0_TX2_ch_txprogdivresetdone;
wire         QUAD0_TX2_ch_txresetdone;
wire         QUAD0_TX2_ch_txmstresetdone;
wire         QUAD0_TX2_ch_txmstreset;
wire         QUAD0_TX2_ch_txmstdatapathreset;
wire         QUAD0_TX2_ch_gttxreset;
wire [127:0] QUAD0_TX2_ch_txdata;
wire [2:0]   QUAD0_TX2_ch_txpmaresetmask;
wire         QUAD0_TX2_ch_txcominit;
wire         QUAD0_TX2_ch_txcomsas;
wire         QUAD0_TX2_ch_txcomwake;
wire [15:0]  QUAD0_TX2_ch_txctrl0;
wire [15:0]  QUAD0_TX2_ch_txctrl1;
wire [7:0]   QUAD0_TX2_ch_txctrl2;
wire         QUAD0_TX2_ch_txdapicodeovrden;
wire         QUAD0_TX2_ch_txdapicodereset;
wire [1:0]   QUAD0_TX2_ch_txdeemph;
wire         QUAD0_TX2_ch_txdetectrx;
wire [4:0]   QUAD0_TX2_ch_txdiffctrl;
wire         QUAD0_TX2_ch_txdlyalignreq;
wire         QUAD0_TX2_ch_txelecidle;
wire [5:0]   QUAD0_TX2_ch_txheader;
wire [2:0]   QUAD0_TX2_ch_txmargin;
wire         QUAD0_TX2_ch_txmldchaindone;
wire         QUAD0_TX2_ch_txmldchainreq;
wire         QUAD0_TX2_ch_txoneszeros;
wire         QUAD0_TX2_ch_txpausedelayalign;
wire         QUAD0_TX2_ch_txphalignreq;
wire [1:0]   QUAD0_TX2_ch_txphalignresetmask;
wire         QUAD0_TX2_ch_txphdlypd;
wire         QUAD0_TX2_ch_txphdlyreset;
wire         QUAD0_TX2_ch_txphdlytstclk;
wire         QUAD0_TX2_ch_txphsetinitreq;
wire         QUAD0_TX2_ch_txphshift180;
wire         QUAD0_TX2_ch_txpicodeovrden;
wire         QUAD0_TX2_ch_txpicodereset;
wire         QUAD0_TX2_ch_txpippmen;
wire [4:0]   QUAD0_TX2_ch_txpippmstepsize;
wire [6:0]   QUAD0_TX2_ch_txsequence;
wire         QUAD0_TX2_ch_txswing;
wire         QUAD0_TX2_ch_txsyncallin;
wire [4:0]   QUAD0_TX2_ch_txprecursor;
wire [4:0]   QUAD0_TX2_ch_txpostcursor;
wire         QUAD0_TX2_ch_txinhibit;
wire         QUAD0_TX2_ch_txlatclk;
wire [6:0]   QUAD0_TX2_ch_txmaincursor;
wire         QUAD0_TX2_ch_txpcsresetmask;
wire [1:0]   QUAD0_TX2_ch_txpd;
wire         QUAD0_TX2_ch_txpisopd;
wire         QUAD0_TX2_ch_txpolarity;
wire         QUAD0_TX2_ch_txprbsforceerr;
wire [3:0]   QUAD0_TX2_ch_txprbssel;
wire         QUAD0_TX2_ch_txprogdivreset;
wire [7:0]   QUAD0_TX2_ch_txrate;
wire [1:0]   QUAD0_TX2_ch_txresetmode;
wire         QUAD0_TX2_ch_txuserrdy;
wire [1:0]   QUAD0_RX3_ch_refdebugout;
wire         QUAD0_RX3_ch_rxdapiresetdone;
wire         QUAD0_RX3_ch_rxdebugpcsout;
wire         QUAD0_RX3_ch_rxpkdet;
wire         QUAD0_RX3_ch_rxqpisenn;
wire         QUAD0_RX3_ch_rxqpisenp;
wire         QUAD0_RX3_ch_rxsimplexphystatus;
wire         QUAD0_RX3_ch_rxslipdone;
wire         QUAD0_RX3_ch_dfehold;
wire         QUAD0_RX3_ch_dfeovrd;
wire         QUAD0_RX3_ch_rxdapireset;
wire [1:0]   QUAD0_RX3_ch_rxdapiresetmask;
wire         QUAD0_RX3_ch_rxqpien;
wire         QUAD0_TX3_ch_txdapiresetdone;
wire         QUAD0_TX3_ch_txdebugpcsout;
wire         QUAD0_TX3_ch_txqpisenn;
wire         QUAD0_TX3_ch_txqpisenp;
wire         QUAD0_TX3_ch_txsimplexphystatus;
wire         QUAD0_TX3_ch_txswingouthigh;
wire         QUAD0_TX3_ch_txswingoutlow;
wire         QUAD0_TX3_ch_txdapireset;
wire [1:0]   QUAD0_TX3_ch_txdapiresetmask;
wire         QUAD0_TX3_ch_txqpibiasen;
wire         QUAD0_TX3_ch_txqpiweakpu;
wire         QUAD0_RX3_ch_cdrfreqos;
wire         QUAD0_RX3_ch_cdrincpctrl;
wire         QUAD0_RX3_ch_cdrstepdir;
wire         QUAD0_RX3_ch_cdrstepsq;
wire         QUAD0_RX3_ch_cdrstepsx;
wire         QUAD0_RX3_ch_eyescanreset;
wire         QUAD0_RX3_ch_eyescantrigger;
wire         QUAD0_RX3_ch_eyescandataerror;
wire [7:0]   QUAD0_RX3_ch_rx10gstat;
wire         QUAD0_RX3_ch_rxbyteisaligned;
wire         QUAD0_RX3_ch_rxbyterealign;
wire         QUAD0_RX3_ch_rxchanbondseq;
wire         QUAD0_RX3_ch_rxchanisaligned;
wire         QUAD0_RX3_ch_rxchanrealign;
wire [4:0]   QUAD0_RX3_ch_rxchbondo;
wire [1:0]   QUAD0_RX3_ch_rxclkcorcnt;
wire         QUAD0_RX3_ch_rxcominitdet;
wire         QUAD0_RX3_ch_rxcommadet;
wire         QUAD0_RX3_ch_rxcomsasdet;
wire         QUAD0_RX3_ch_rxcomwakedet;
wire [15:0]  QUAD0_RX3_ch_rxctrl0;
wire [15:0]  QUAD0_RX3_ch_rxctrl1;
wire [7:0]   QUAD0_RX3_ch_rxctrl2;
wire [7:0]   QUAD0_RX3_ch_rxctrl3;
wire [1:0]   QUAD0_RX3_ch_rxdatavalid;
wire         QUAD0_RX3_ch_rxdlyalignerr;
wire         QUAD0_RX3_ch_rxdlyalignprog;
wire         QUAD0_RX3_ch_rxelecidle;
wire         QUAD0_RX3_ch_rxfinealigndone;
wire [5:0]   QUAD0_RX3_ch_rxheader;
wire [1:0]   QUAD0_RX3_ch_rxheadervalid;
wire         QUAD0_RX3_ch_rxosintdone;
wire         QUAD0_RX3_ch_rxphaligndone;
wire         QUAD0_RX3_ch_rxphalignerr;
wire         QUAD0_RX3_ch_rxphdlyresetdone;
wire         QUAD0_RX3_ch_rxphsetinitdone;
wire         QUAD0_RX3_ch_rxphshift180done;
wire         QUAD0_RX3_ch_rxsliderdy;
wire [1:0]   QUAD0_RX3_ch_rxstartofseq;
wire [2:0]   QUAD0_RX3_ch_rxstatus;
wire         QUAD0_RX3_ch_rxsyncdone;
wire         QUAD0_RX3_ch_rxvalid;
wire [4:0]   QUAD0_RX3_ch_rxpcsresetmask;
wire         QUAD0_RX3_ch_cdrbmcdrreq;
wire [4:0]   QUAD0_RX3_ch_rxchbondi;
wire         QUAD0_RX3_ch_rxdapicodeovrden;
wire         QUAD0_RX3_ch_rxdapicodereset;
wire         QUAD0_RX3_ch_rxdlyalignreq;
wire         QUAD0_RX3_ch_rxeqtraining;
wire         QUAD0_RX3_ch_rxgearboxslip;
wire         QUAD0_RX3_ch_rxlpmen;
wire         QUAD0_RX3_ch_rxmldchaindone;
wire         QUAD0_RX3_ch_rxmldchainreq;
wire         QUAD0_RX3_ch_rxmlfinealignreq;
wire         QUAD0_RX3_ch_rxoobreset;
wire         QUAD0_RX3_ch_rxphalignreq;
wire [1:0]   QUAD0_RX3_ch_rxphalignresetmask;
wire         QUAD0_RX3_ch_rxphdlypd;
wire         QUAD0_RX3_ch_rxphdlyreset;
wire         QUAD0_RX3_ch_rxphsetinitreq;
wire         QUAD0_RX3_ch_rxphshift180;
wire         QUAD0_RX3_ch_rxslide;
wire         QUAD0_RX3_ch_rxsyncallin;
wire         QUAD0_RX3_ch_rxtermination;
wire [6:0]   QUAD0_RX3_ch_rxpmaresetmask;
wire [2:0]   QUAD0_RX3_ch_rxbufstatus;
wire         QUAD0_RX3_ch_rxcdrlock;
wire         QUAD0_RX3_ch_rxcdrphdone;
wire         QUAD0_RX3_ch_rxchanbond_busy;
wire         QUAD0_RX3_ch_rxchanbond_en;
wire         QUAD0_RX3_ch_rxchanbond_master;
wire         QUAD0_RX3_ch_rxchanbond_slave;
wire [2:0]   QUAD0_RX3_ch_rxchanbond_level;
wire [127:0] QUAD0_RX3_ch_rxdata;
wire         QUAD0_RX3_ch_rxpmaresetdone;
wire         QUAD0_RX3_ch_rxprbserr;
wire         QUAD0_RX3_ch_rxprbslocked;
wire         QUAD0_RX3_ch_rxprogdivresetdone;
wire         QUAD0_RX3_ch_rxresetdone;
wire         QUAD0_RX3_ch_rxmstresetdone;
wire         QUAD0_RX3_ch_rxmstreset;
wire         QUAD0_RX3_ch_rxmstdatapathreset;
wire         QUAD0_RX3_ch_gtrxreset;
wire         QUAD0_RX3_ch_rxcdrhold;
wire         QUAD0_RX3_ch_rxcdrovrden;
wire         QUAD0_RX3_ch_rxcdrreset;
wire         QUAD0_RX3_ch_rxlatclk;
wire [1:0]   QUAD0_RX3_ch_rxpd;
wire         QUAD0_RX3_ch_rxpolarity;
wire         QUAD0_RX3_ch_rxprbscntreset;
wire [3:0]   QUAD0_RX3_ch_rxprbssel;
wire         QUAD0_RX3_ch_rxprogdivreset;
wire [7:0]   QUAD0_RX3_ch_rxrate;
wire [1:0]   QUAD0_RX3_ch_rxresetmode;
wire         QUAD0_RX3_ch_rxuserrdy;

wire         QUAD0_TX3_ch_tx10gstat;
wire [1:0]   QUAD0_TX3_ch_txbufstatus;
wire         QUAD0_TX3_ch_txcomfinish;
wire         QUAD0_TX3_ch_txdlyalignerr;
wire         QUAD0_TX3_ch_txdlyalignprog;
wire         QUAD0_TX3_ch_txphaligndone;
wire         QUAD0_TX3_ch_txphalignerr;
wire         QUAD0_TX3_ch_txphalignoutrsvd;
wire         QUAD0_TX3_ch_txphdlyresetdone;
wire         QUAD0_TX3_ch_txphsetinitdone;
wire         QUAD0_TX3_ch_txphshift180done;
wire         QUAD0_TX3_ch_txsyncdone;
wire         QUAD0_TX3_ch_txdccdone;
wire         QUAD0_TX3_ch_txpmaresetdone;
wire         QUAD0_TX3_ch_txprogdivresetdone;
wire         QUAD0_TX3_ch_txresetdone;
wire         QUAD0_TX3_ch_txmstresetdone;
wire         QUAD0_TX3_ch_txmstreset;
wire         QUAD0_TX3_ch_txmstdatapathreset;
wire         QUAD0_TX3_ch_gttxreset;
wire [127:0] QUAD0_TX3_ch_txdata;
wire [2:0]   QUAD0_TX3_ch_txpmaresetmask;
wire         QUAD0_TX3_ch_txcominit;
wire         QUAD0_TX3_ch_txcomsas;
wire         QUAD0_TX3_ch_txcomwake;
wire [15:0]  QUAD0_TX3_ch_txctrl0;
wire [15:0]  QUAD0_TX3_ch_txctrl1;
wire [7:0]   QUAD0_TX3_ch_txctrl2;
wire         QUAD0_TX3_ch_txdapicodeovrden;
wire         QUAD0_TX3_ch_txdapicodereset;
wire [1:0]   QUAD0_TX3_ch_txdeemph;
wire         QUAD0_TX3_ch_txdetectrx;
wire [4:0]   QUAD0_TX3_ch_txdiffctrl;
wire         QUAD0_TX3_ch_txdlyalignreq;
wire         QUAD0_TX3_ch_txelecidle;
wire [5:0]   QUAD0_TX3_ch_txheader;
wire [2:0]   QUAD0_TX3_ch_txmargin;
wire         QUAD0_TX3_ch_txmldchaindone;
wire         QUAD0_TX3_ch_txmldchainreq;
wire         QUAD0_TX3_ch_txoneszeros;
wire         QUAD0_TX3_ch_txpausedelayalign;
wire         QUAD0_TX3_ch_txphalignreq;
wire [1:0]   QUAD0_TX3_ch_txphalignresetmask;
wire         QUAD0_TX3_ch_txphdlypd;
wire         QUAD0_TX3_ch_txphdlyreset;
wire         QUAD0_TX3_ch_txphdlytstclk;
wire         QUAD0_TX3_ch_txphsetinitreq;
wire         QUAD0_TX3_ch_txphshift180;
wire         QUAD0_TX3_ch_txpicodeovrden;
wire         QUAD0_TX3_ch_txpicodereset;
wire         QUAD0_TX3_ch_txpippmen;
wire [4:0]   QUAD0_TX3_ch_txpippmstepsize;
wire [6:0]   QUAD0_TX3_ch_txsequence;
wire         QUAD0_TX3_ch_txswing;
wire         QUAD0_TX3_ch_txsyncallin;
wire [4:0]   QUAD0_TX3_ch_txprecursor;
wire [4:0]   QUAD0_TX3_ch_txpostcursor;
wire         QUAD0_TX3_ch_txinhibit;
wire         QUAD0_TX3_ch_txlatclk;
wire [6:0]   QUAD0_TX3_ch_txmaincursor;
wire         QUAD0_TX3_ch_txpcsresetmask;
wire [1:0]   QUAD0_TX3_ch_txpd;
wire         QUAD0_TX3_ch_txpisopd;
wire         QUAD0_TX3_ch_txpolarity;
wire         QUAD0_TX3_ch_txprbsforceerr;
wire [3:0]   QUAD0_TX3_ch_txprbssel;
wire         QUAD0_TX3_ch_txprogdivreset;
wire [7:0]   QUAD0_TX3_ch_txrate;
wire [1:0]   QUAD0_TX3_ch_txresetmode;
wire         QUAD0_TX3_ch_txuserrdy;

	
wire [1 -1:0] concat_list_0;
assign concat_list_0[0] = QUAD0_gtpowergood ;
	
assign INTF0_gtpowergood_int = &concat_list_0;

assign INTF0_rst_userclk_tx_active_int[0] = QUAD0_TX3_ch_txpmaresetdone;
assign INTF0_mst_tx_resetdone_int[0]      = QUAD0_TX3_ch_txmstresetdone;
assign QUAD0_TX3_ch_txmstreset         = INTF0_mst_tx_reset_int;
assign QUAD0_TX3_ch_txmstdatapathreset = INTF0_mst_tx_dp_reset_int;
assign QUAD0_TX3_ch_txuserrdy          = INTF0_gtwiz_reset_txuserrdy_int;
assign QUAD0_TX3_ch_txdata = INTF0_TX0_ch_txdata ;
assign INTF0_TX0_ch_txbufstatus = QUAD0_TX3_ch_txbufstatus ;
assign INTF0_TX0_ch_txdccdone = QUAD0_TX3_ch_txdccdone ;
assign QUAD0_TX3_ch_gttxreset = INTF0_TX0_ch_gttxreset ;
assign INTF0_TX0_ch_txdebugpcsout = QUAD0_TX3_ch_txdebugpcsout ;
assign INTF0_TX0_ch_txprogdivresetdone = QUAD0_TX3_ch_txprogdivresetdone ;
assign INTF0_TX0_ch_txresetdone = QUAD0_TX3_ch_txresetdone ;
assign QUAD0_TX3_ch_txinhibit = INTF0_TX0_ch_txinhibit ;
assign QUAD0_TX3_ch_txlatclk = INTF0_TX0_ch_txlatclk ;
assign QUAD0_TX3_ch_txmaincursor = INTF0_TX0_ch_txmaincursor ;
assign QUAD0_TX3_ch_txpcsresetmask = INTF0_TX0_ch_txpcsresetmask ;
assign QUAD0_TX3_ch_txpd = INTF0_TX0_ch_txpd ;
assign QUAD0_TX3_ch_txpisopd = INTF0_TX0_ch_txpisopd ;
assign QUAD0_TX3_ch_txpmaresetmask = INTF0_TX0_ch_txpmaresetmask ;
assign QUAD0_TX3_ch_txpolarity = INTF0_TX0_ch_txpolarity ;
assign QUAD0_TX3_ch_txpostcursor = INTF0_TX0_ch_txpostcursor ;
assign QUAD0_TX3_ch_txprbsforceerr = INTF0_TX0_ch_txprbsforceerr ;
assign QUAD0_TX3_ch_txprbssel = INTF0_TX0_ch_txprbssel ;
assign QUAD0_TX3_ch_txprecursor = INTF0_TX0_ch_txprecursor ;
assign QUAD0_TX3_ch_txprogdivreset = INTF0_TX0_ch_txprogdivreset ;
assign QUAD0_TX3_ch_txrate = INTF0_TX0_ch_txrate ;
assign QUAD0_TX3_ch_txresetmode = INTF0_TX0_ch_txresetmode ;
assign QUAD0_TX3_ch_txheader = INTF0_TX0_ch_txheader ;
assign QUAD0_TX3_ch_txsequence = INTF0_TX0_ch_txsequence ;
assign QUAD0_TX3_ch_txphalignresetmask = INTF0_TX0_ch_txphalignresetmask ;
assign QUAD0_TX3_ch_txcominit = INTF0_TX0_ch_txcominit ;
assign QUAD0_TX3_ch_txcomsas = INTF0_TX0_ch_txcomsas ;
assign QUAD0_TX3_ch_txcomwake = INTF0_TX0_ch_txcomwake ;
assign QUAD0_TX3_ch_txdapicodeovrden = INTF0_TX0_ch_txdapicodeovrden ;
assign QUAD0_TX3_ch_txdapicodereset = INTF0_TX0_ch_txdapicodereset ;
assign QUAD0_TX3_ch_txdetectrx = INTF0_TX0_ch_txdetectrx ;
assign QUAD0_TX3_ch_txphdlytstclk = INTF0_TX0_ch_txphdlytstclk ;
assign QUAD0_TX3_ch_txdlyalignreq = INTF0_TX0_ch_txdlyalignreq ;
assign QUAD0_TX3_ch_txelecidle = INTF0_TX0_ch_txelecidle ;
assign QUAD0_TX3_ch_txmldchaindone = INTF0_TX0_ch_txmldchaindone ;
assign QUAD0_TX3_ch_txmldchainreq = INTF0_TX0_ch_txmldchainreq ;
assign QUAD0_TX3_ch_txoneszeros = INTF0_TX0_ch_txoneszeros ;
assign QUAD0_TX3_ch_txpausedelayalign = INTF0_TX0_ch_txpausedelayalign ;
assign QUAD0_TX3_ch_txphalignreq = INTF0_TX0_ch_txphalignreq ;
assign QUAD0_TX3_ch_txphdlypd = INTF0_TX0_ch_txphdlypd ;
assign QUAD0_TX3_ch_txphdlyreset = INTF0_TX0_ch_txphdlyreset ;
assign QUAD0_TX3_ch_txphsetinitreq = INTF0_TX0_ch_txphsetinitreq ;
assign QUAD0_TX3_ch_txphshift180 = INTF0_TX0_ch_txphshift180 ;
assign QUAD0_TX3_ch_txpicodeovrden = INTF0_TX0_ch_txpicodeovrden ;
assign QUAD0_TX3_ch_txpicodereset = INTF0_TX0_ch_txpicodereset ;
assign QUAD0_TX3_ch_txpippmen = INTF0_TX0_ch_txpippmen ;
assign QUAD0_TX3_ch_txswing = INTF0_TX0_ch_txswing ;
assign QUAD0_TX3_ch_txsyncallin = INTF0_TX0_ch_txsyncallin ;
assign INTF0_TX0_ch_tx10gstat = QUAD0_TX3_ch_tx10gstat ;
assign INTF0_TX0_ch_txcomfinish = QUAD0_TX3_ch_txcomfinish ;
assign INTF0_TX0_ch_txdlyalignerr = QUAD0_TX3_ch_txdlyalignerr ;
assign INTF0_TX0_ch_txdlyalignprog = QUAD0_TX3_ch_txdlyalignprog ;
assign INTF0_TX0_ch_txphaligndone = QUAD0_TX3_ch_txphaligndone ;
assign INTF0_TX0_ch_txphalignerr = QUAD0_TX3_ch_txphalignerr ;
assign INTF0_TX0_ch_txphalignoutrsvd = QUAD0_TX3_ch_txphalignoutrsvd ;
assign INTF0_TX0_ch_txphdlyresetdone = QUAD0_TX3_ch_txphdlyresetdone ;
assign INTF0_TX0_ch_txphsetinitdone = QUAD0_TX3_ch_txphsetinitdone ;
assign INTF0_TX0_ch_txphshift180done = QUAD0_TX3_ch_txphshift180done ;
assign INTF0_TX0_ch_txsyncdone = QUAD0_TX3_ch_txsyncdone ;
assign QUAD0_TX3_ch_txctrl0 = INTF0_TX0_ch_txctrl0 ;
assign QUAD0_TX3_ch_txctrl1 = INTF0_TX0_ch_txctrl1 ;
assign QUAD0_TX3_ch_txctrl2 = INTF0_TX0_ch_txctrl2 ;
assign QUAD0_TX3_ch_txdeemph = INTF0_TX0_ch_txdeemph ;
assign QUAD0_TX3_ch_txmargin = INTF0_TX0_ch_txmargin ;
assign QUAD0_TX3_ch_txdiffctrl = INTF0_TX0_ch_txdiffctrl ;
assign QUAD0_TX3_ch_txpippmstepsize = INTF0_TX0_ch_txpippmstepsize ;
assign INTF0_TX0_ch_txdapiresetdone = QUAD0_TX3_ch_txdapiresetdone ;
assign INTF0_TX0_ch_txqpisenn = QUAD0_TX3_ch_txqpisenn ;
assign INTF0_TX0_ch_txqpisenp = QUAD0_TX3_ch_txqpisenp ;
assign INTF0_TX0_ch_txswingouthigh = QUAD0_TX3_ch_txswingouthigh ;
assign INTF0_TX0_ch_txswingoutlow = QUAD0_TX3_ch_txswingoutlow ;
assign QUAD0_TX3_ch_txdapireset = INTF0_TX0_ch_txdapireset ;
assign QUAD0_TX3_ch_txdapiresetmask = INTF0_TX0_ch_txdapiresetmask ;
assign QUAD0_TX3_ch_txqpibiasen = INTF0_TX0_ch_txqpibiasen ;
assign QUAD0_TX3_ch_txqpiweakpu = INTF0_TX0_ch_txqpiweakpu ;
assign INTF0_rst_userclk_rx_active_int[0] = QUAD0_RX3_ch_rxpmaresetdone;
assign INTF0_mst_rx_resetdone_int[0]      = QUAD0_RX3_ch_rxmstresetdone;
assign QUAD0_RX3_ch_rxmstreset         = INTF0_mst_rx_reset_int;
assign QUAD0_RX3_ch_rxmstdatapathreset = INTF0_mst_rx_dp_reset_int;
assign QUAD0_RX3_ch_rxuserrdy          = INTF0_gtwiz_reset_rxuserrdy_int;
assign INTF0_RX0_ch_rxbufstatus = QUAD0_RX3_ch_rxbufstatus ;
assign INTF0_RX0_ch_rxcdrlock = QUAD0_RX3_ch_rxcdrlock ;
assign INTF0_RX0_ch_rxdebugpcsout = QUAD0_RX3_ch_rxdebugpcsout ;
assign INTF0_RX0_ch_rxprbserr = QUAD0_RX3_ch_rxprbserr ;
assign INTF0_RX0_ch_rxprbslocked = QUAD0_RX3_ch_rxprbslocked ;
assign QUAD0_RX3_ch_rxcdrhold = INTF0_RX0_ch_rxcdrhold ;
assign QUAD0_RX3_ch_rxcdrovrden = INTF0_RX0_ch_rxcdrovrden ;
assign QUAD0_RX3_ch_rxlatclk = INTF0_RX0_ch_rxlatclk ;
assign QUAD0_RX3_ch_rxpcsresetmask = INTF0_RX0_ch_rxpcsresetmask ;
assign QUAD0_RX3_ch_rxpd = INTF0_RX0_ch_rxpd ;
assign QUAD0_RX3_ch_rxpmaresetmask = INTF0_RX0_ch_rxpmaresetmask ;
assign QUAD0_RX3_ch_rxpolarity = INTF0_RX0_ch_rxpolarity ;
assign QUAD0_RX3_ch_rxprbscntreset = INTF0_RX0_ch_rxprbscntreset ;
assign QUAD0_RX3_ch_rxrate = INTF0_RX0_ch_rxrate ;
assign QUAD0_RX3_ch_rxresetmode = INTF0_RX0_ch_rxresetmode ;
assign INTF0_RX0_ch_rxdata = QUAD0_RX3_ch_rxdata ;
assign INTF0_RX0_ch_rx10gstat = QUAD0_RX3_ch_rx10gstat ;
assign INTF0_RX0_ch_rxdatavalid = QUAD0_RX3_ch_rxdatavalid ;
assign INTF0_RX0_ch_rxheader = QUAD0_RX3_ch_rxheader ;
assign INTF0_RX0_ch_rxchanisaligned = QUAD0_RX3_ch_rxchanisaligned ;
assign INTF0_RX0_ch_rxchanrealign = QUAD0_RX3_ch_rxchanrealign ;
assign QUAD0_RX3_ch_rxchbondi = INTF0_RX0_ch_rxchbondi ;
assign INTF0_RX0_ch_rxchbondo = QUAD0_RX3_ch_rxchbondo ;
assign INTF0_RX0_ch_rxclkcorcnt = QUAD0_RX3_ch_rxclkcorcnt ;
assign INTF0_RX0_ch_rxcominitdet = QUAD0_RX3_ch_rxcominitdet ;
assign INTF0_RX0_ch_rxcommadet = QUAD0_RX3_ch_rxcommadet ;
assign INTF0_RX0_ch_rxbyteisaligned = QUAD0_RX3_ch_rxbyteisaligned ;
assign INTF0_RX0_ch_rxbyterealign = QUAD0_RX3_ch_rxbyterealign ;
assign INTF0_RX0_ch_rxcomsasdet = QUAD0_RX3_ch_rxcomsasdet ;
assign INTF0_RX0_ch_rxcomwakedet = QUAD0_RX3_ch_rxcomwakedet ;
assign INTF0_RX0_ch_rxctrl0 = QUAD0_RX3_ch_rxctrl0 ;
assign INTF0_RX0_ch_rxctrl1 = QUAD0_RX3_ch_rxctrl1 ;
assign INTF0_RX0_ch_rxctrl2 = QUAD0_RX3_ch_rxctrl2 ;
assign INTF0_RX0_ch_rxctrl3 = QUAD0_RX3_ch_rxctrl3 ;
assign QUAD0_RX3_ch_rxdapicodeovrden = INTF0_RX0_ch_rxdapicodeovrden ;
assign QUAD0_RX3_ch_rxdapicodereset = INTF0_RX0_ch_rxdapicodereset ;
assign INTF0_RX0_ch_rxdlyalignerr = QUAD0_RX3_ch_rxdlyalignerr ;
assign INTF0_RX0_ch_rxdlyalignprog = QUAD0_RX3_ch_rxdlyalignprog ;
assign QUAD0_RX3_ch_rxdlyalignreq = INTF0_RX0_ch_rxdlyalignreq ;
assign INTF0_RX0_ch_rxelecidle = QUAD0_RX3_ch_rxelecidle ;
assign QUAD0_RX3_ch_rxeqtraining = INTF0_RX0_ch_rxeqtraining ;
assign INTF0_RX0_ch_rxfinealigndone = QUAD0_RX3_ch_rxfinealigndone ;
assign QUAD0_RX3_ch_rxgearboxslip = INTF0_RX0_ch_rxgearboxslip ;
assign INTF0_RX0_ch_rxheadervalid = QUAD0_RX3_ch_rxheadervalid ;
assign QUAD0_RX3_ch_rxlpmen = INTF0_RX0_ch_rxlpmen ;
assign QUAD0_RX3_ch_rxmldchaindone = INTF0_RX0_ch_rxmldchaindone ;
assign QUAD0_RX3_ch_rxmldchainreq = INTF0_RX0_ch_rxmldchainreq ;
assign QUAD0_RX3_ch_rxmlfinealignreq = INTF0_RX0_ch_rxmlfinealignreq ;
assign QUAD0_RX3_ch_rxoobreset = INTF0_RX0_ch_rxoobreset ;
assign INTF0_RX0_ch_rxosintdone = QUAD0_RX3_ch_rxosintdone ;
assign INTF0_RX0_ch_rxphaligndone = QUAD0_RX3_ch_rxphaligndone ;
assign INTF0_RX0_ch_rxphalignerr = QUAD0_RX3_ch_rxphalignerr ;
assign QUAD0_RX3_ch_rxphalignreq = INTF0_RX0_ch_rxphalignreq ;
assign QUAD0_RX3_ch_rxphalignresetmask = INTF0_RX0_ch_rxphalignresetmask ;
assign QUAD0_RX3_ch_rxphdlypd = INTF0_RX0_ch_rxphdlypd ;
assign QUAD0_RX3_ch_rxphdlyreset = INTF0_RX0_ch_rxphdlyreset ;
assign INTF0_RX0_ch_rxphdlyresetdone = QUAD0_RX3_ch_rxphdlyresetdone ;
assign QUAD0_RX3_ch_rxphsetinitreq = INTF0_RX0_ch_rxphsetinitreq ;
assign QUAD0_RX3_ch_rxphshift180 = INTF0_RX0_ch_rxphshift180 ;
assign INTF0_RX0_ch_rxphshift180done = QUAD0_RX3_ch_rxphshift180done ;
assign INTF0_RX0_ch_rxphsetinitdone = QUAD0_RX3_ch_rxphsetinitdone ;
assign QUAD0_RX3_ch_rxslide = INTF0_RX0_ch_rxslide ;
assign INTF0_RX0_ch_rxsliderdy = QUAD0_RX3_ch_rxsliderdy ;
assign INTF0_RX0_ch_rxstartofseq = QUAD0_RX3_ch_rxstartofseq ;
assign INTF0_RX0_ch_rxstatus = QUAD0_RX3_ch_rxstatus ;
assign QUAD0_RX3_ch_rxsyncallin = INTF0_RX0_ch_rxsyncallin ;
assign INTF0_RX0_ch_rxsyncdone = QUAD0_RX3_ch_rxsyncdone ;
assign QUAD0_RX3_ch_rxtermination = INTF0_RX0_ch_rxtermination ;
assign INTF0_RX0_ch_rxvalid = QUAD0_RX3_ch_rxvalid ;
assign INTF0_RX0_ch_rxchanbondseq = QUAD0_RX3_ch_rxchanbondseq ;
assign INTF0_RX0_ch_rxchanbond_busy = QUAD0_RX3_ch_rxchanbond_busy ;
assign QUAD0_RX3_ch_rxchanbond_en = INTF0_RX0_ch_rxchanbond_en ;
assign QUAD0_RX3_ch_rxchanbond_master = INTF0_RX0_ch_rxchanbond_master ;
assign QUAD0_RX3_ch_rxchanbond_slave = INTF0_RX0_ch_rxchanbond_slave ;
assign QUAD0_RX3_ch_rxchanbond_level = INTF0_RX0_ch_rxchanbond_level ;
assign QUAD0_RX3_ch_cdrbmcdrreq = INTF0_RX0_ch_cdrbmcdrreq ;
assign QUAD0_RX3_ch_cdrfreqos = INTF0_RX0_ch_cdrfreqos ;
assign QUAD0_RX3_ch_cdrincpctrl = INTF0_RX0_ch_cdrincpctrl ;
assign QUAD0_RX3_ch_cdrstepdir = INTF0_RX0_ch_cdrstepdir ;
assign QUAD0_RX3_ch_cdrstepsq = INTF0_RX0_ch_cdrstepsq ;
assign QUAD0_RX3_ch_cdrstepsx = INTF0_RX0_ch_cdrstepsx ;
assign QUAD0_RX3_ch_eyescanreset = INTF0_RX0_ch_eyescanreset ;
assign QUAD0_RX3_ch_eyescantrigger = INTF0_RX0_ch_eyescantrigger ;
assign INTF0_RX0_ch_eyescandataerror = QUAD0_RX3_ch_eyescandataerror ;
assign INTF0_RX0_ch_refdebugout = QUAD0_RX3_ch_refdebugout ;
assign INTF0_RX0_ch_rxdapiresetdone = QUAD0_RX3_ch_rxdapiresetdone ;
assign INTF0_RX0_ch_rxpkdet = QUAD0_RX3_ch_rxpkdet ;
assign INTF0_RX0_ch_rxqpisenn = QUAD0_RX3_ch_rxqpisenn ;
assign INTF0_RX0_ch_rxqpisenp = QUAD0_RX3_ch_rxqpisenp ;
assign INTF0_RX0_ch_rxsimplexphystatus = QUAD0_RX3_ch_rxsimplexphystatus ;
assign INTF0_RX0_ch_rxslipdone = QUAD0_RX3_ch_rxslipdone ;
assign QUAD0_RX3_ch_dfehold = INTF0_RX0_ch_dfehold ;
assign QUAD0_RX3_ch_dfeovrd = INTF0_RX0_ch_dfeovrd ;
assign QUAD0_RX3_ch_rxdapireset = INTF0_RX0_ch_rxdapireset ;
assign QUAD0_RX3_ch_rxdapiresetmask = INTF0_RX0_ch_rxdapiresetmask ;
assign QUAD0_RX3_ch_rxqpien = INTF0_RX0_ch_rxqpien ;
assign INTF0_RX0_ch_rxcdrphdone = QUAD0_RX3_ch_rxcdrphdone ;
assign QUAD0_RX3_ch_gtrxreset = INTF0_RX0_ch_gtrxreset ;
assign INTF0_RX0_ch_rxprogdivresetdone = QUAD0_RX3_ch_rxprogdivresetdone ;
assign INTF0_RX0_ch_rxresetdone = QUAD0_RX3_ch_rxresetdone ;
assign QUAD0_RX3_ch_rxcdrreset = INTF0_RX0_ch_rxcdrreset ;
assign QUAD0_RX3_ch_rxprbssel = INTF0_RX0_ch_rxprbssel ;
assign QUAD0_RX3_ch_rxprogdivreset = INTF0_RX0_ch_rxprogdivreset ;

// unmapped quad lanes tie off
assign QUAD0_RX0_ch_rxpd = 2'd0;
assign QUAD0_RX0_ch_rxresetmode = 2'd0;
assign QUAD0_RX0_ch_rxpcsresetmask = 5'd31;
assign QUAD0_RX0_ch_rxprbssel = 4'd0;
assign QUAD0_RX0_ch_rxpmaresetmask = 7'd127;
assign QUAD0_RX0_ch_rxrate = 8'd0;
assign QUAD0_RX0_ch_rxcdrhold = 1'd0;
assign QUAD0_RX0_ch_rxcdrovrden = 1'd0;
assign QUAD0_RX0_ch_rxcdrreset = 1'd0;
assign QUAD0_RX0_ch_rxlatclk = 1'd0;
assign QUAD0_RX0_ch_rxpolarity = 1'd0;
assign QUAD0_RX0_ch_rxprbscntreset = 1'd0;
assign QUAD0_RX0_ch_rxprogdivreset = 1'd0;
assign QUAD0_RX0_ch_rxuserrdy = 1'd0;
assign QUAD0_RX0_ch_rxmstreset = 1'd0;
assign QUAD0_RX0_ch_rxmstdatapathreset = 1'd0;
assign QUAD0_RX0_ch_dfehold = 1'd0;
assign QUAD0_RX0_ch_dfeovrd = 1'd0;
assign QUAD0_RX0_ch_rxdapireset = 1'd0;
assign QUAD0_RX0_ch_rxdapiresetmask = 2'd0;
assign QUAD0_RX0_ch_rxqpien = 1'd0;
assign QUAD0_RX0_ch_rxgearboxslip = 1'd0;
assign QUAD0_RX0_ch_gtrxreset = 1'd0;
assign QUAD0_RX0_ch_rxchanbond_en = 1'd0;
assign QUAD0_RX0_ch_rxchanbond_master = 1'd0;
assign QUAD0_RX0_ch_rxchanbond_slave = 1'd0;
assign QUAD0_RX0_ch_rxchanbond_level = 3'd0;
assign QUAD0_RX0_ch_rxdapicodeovrden = 1'd0;
assign QUAD0_RX0_ch_rxdapicodereset = 1'd0;
assign QUAD0_RX0_ch_rxdlyalignreq = 1'd0;
assign QUAD0_RX0_ch_rxeqtraining = 1'd0;
assign QUAD0_RX0_ch_rxlpmen = 1'd0;
assign QUAD0_RX0_ch_rxmldchaindone = 1'd0;
assign QUAD0_RX0_ch_rxmldchainreq = 1'd0;
assign QUAD0_RX0_ch_rxmlfinealignreq = 1'd0;
assign QUAD0_RX0_ch_rxoobreset = 1'd0;
assign QUAD0_RX0_ch_rxphalignreq = 1'd0;
assign QUAD0_RX0_ch_rxphdlypd = 1'd0;
assign QUAD0_RX0_ch_rxphdlyreset = 1'd0;
assign QUAD0_RX0_ch_rxphsetinitreq = 1'd0;
assign QUAD0_RX0_ch_rxphshift180 = 1'd0;
assign QUAD0_RX0_ch_rxslide = 1'd0;
assign QUAD0_RX0_ch_rxsyncallin = 1'd0;
assign QUAD0_RX0_ch_rxtermination = 1'd0;
assign QUAD0_RX0_ch_rxphalignresetmask = 2'd3;
assign QUAD0_RX0_ch_rxchbondi = 5'd0;
assign QUAD0_RX0_ch_cdrbmcdrreq = 1'd0;
assign QUAD0_RX0_ch_cdrfreqos = 1'd0;
assign QUAD0_RX0_ch_cdrincpctrl = 1'd0;
assign QUAD0_RX0_ch_cdrstepdir = 1'd0;
assign QUAD0_RX0_ch_cdrstepsq = 1'd0;
assign QUAD0_RX0_ch_cdrstepsx = 1'd0;
assign QUAD0_RX0_ch_eyescanreset = 1'd0;
assign QUAD0_RX0_ch_eyescantrigger = 1'd0;
assign QUAD0_RX1_ch_rxpd = 2'd0;
assign QUAD0_RX1_ch_rxresetmode = 2'd0;
assign QUAD0_RX1_ch_rxpcsresetmask = 5'd31;
assign QUAD0_RX1_ch_rxprbssel = 4'd0;
assign QUAD0_RX1_ch_rxpmaresetmask = 7'd127;
assign QUAD0_RX1_ch_rxrate = 8'd0;
assign QUAD0_RX1_ch_rxcdrhold = 1'd0;
assign QUAD0_RX1_ch_rxcdrovrden = 1'd0;
assign QUAD0_RX1_ch_rxcdrreset = 1'd0;
assign QUAD0_RX1_ch_rxlatclk = 1'd0;
assign QUAD0_RX1_ch_rxpolarity = 1'd0;
assign QUAD0_RX1_ch_rxprbscntreset = 1'd0;
assign QUAD0_RX1_ch_rxprogdivreset = 1'd0;
assign QUAD0_RX1_ch_rxuserrdy = 1'd0;
assign QUAD0_RX1_ch_rxmstreset = 1'd0;
assign QUAD0_RX1_ch_rxmstdatapathreset = 1'd0;
assign QUAD0_RX1_ch_dfehold = 1'd0;
assign QUAD0_RX1_ch_dfeovrd = 1'd0;
assign QUAD0_RX1_ch_rxdapireset = 1'd0;
assign QUAD0_RX1_ch_rxdapiresetmask = 2'd0;
assign QUAD0_RX1_ch_rxqpien = 1'd0;
assign QUAD0_RX1_ch_rxgearboxslip = 1'd0;
assign QUAD0_RX1_ch_gtrxreset = 1'd0;
assign QUAD0_RX1_ch_rxchanbond_en = 1'd0;
assign QUAD0_RX1_ch_rxchanbond_master = 1'd0;
assign QUAD0_RX1_ch_rxchanbond_slave = 1'd0;
assign QUAD0_RX1_ch_rxchanbond_level = 3'd0;
assign QUAD0_RX1_ch_rxdapicodeovrden = 1'd0;
assign QUAD0_RX1_ch_rxdapicodereset = 1'd0;
assign QUAD0_RX1_ch_rxdlyalignreq = 1'd0;
assign QUAD0_RX1_ch_rxeqtraining = 1'd0;
assign QUAD0_RX1_ch_rxlpmen = 1'd0;
assign QUAD0_RX1_ch_rxmldchaindone = 1'd0;
assign QUAD0_RX1_ch_rxmldchainreq = 1'd0;
assign QUAD0_RX1_ch_rxmlfinealignreq = 1'd0;
assign QUAD0_RX1_ch_rxoobreset = 1'd0;
assign QUAD0_RX1_ch_rxphalignreq = 1'd0;
assign QUAD0_RX1_ch_rxphdlypd = 1'd0;
assign QUAD0_RX1_ch_rxphdlyreset = 1'd0;
assign QUAD0_RX1_ch_rxphsetinitreq = 1'd0;
assign QUAD0_RX1_ch_rxphshift180 = 1'd0;
assign QUAD0_RX1_ch_rxslide = 1'd0;
assign QUAD0_RX1_ch_rxsyncallin = 1'd0;
assign QUAD0_RX1_ch_rxtermination = 1'd0;
assign QUAD0_RX1_ch_rxphalignresetmask = 2'd3;
assign QUAD0_RX1_ch_rxchbondi = 5'd0;
assign QUAD0_RX1_ch_cdrbmcdrreq = 1'd0;
assign QUAD0_RX1_ch_cdrfreqos = 1'd0;
assign QUAD0_RX1_ch_cdrincpctrl = 1'd0;
assign QUAD0_RX1_ch_cdrstepdir = 1'd0;
assign QUAD0_RX1_ch_cdrstepsq = 1'd0;
assign QUAD0_RX1_ch_cdrstepsx = 1'd0;
assign QUAD0_RX1_ch_eyescanreset = 1'd0;
assign QUAD0_RX1_ch_eyescantrigger = 1'd0;
assign QUAD0_RX2_ch_rxpd = 2'd0;
assign QUAD0_RX2_ch_rxresetmode = 2'd0;
assign QUAD0_RX2_ch_rxpcsresetmask = 5'd31;
assign QUAD0_RX2_ch_rxprbssel = 4'd0;
assign QUAD0_RX2_ch_rxpmaresetmask = 7'd127;
assign QUAD0_RX2_ch_rxrate = 8'd0;
assign QUAD0_RX2_ch_rxcdrhold = 1'd0;
assign QUAD0_RX2_ch_rxcdrovrden = 1'd0;
assign QUAD0_RX2_ch_rxcdrreset = 1'd0;
assign QUAD0_RX2_ch_rxlatclk = 1'd0;
assign QUAD0_RX2_ch_rxpolarity = 1'd0;
assign QUAD0_RX2_ch_rxprbscntreset = 1'd0;
assign QUAD0_RX2_ch_rxprogdivreset = 1'd0;
assign QUAD0_RX2_ch_rxuserrdy = 1'd0;
assign QUAD0_RX2_ch_rxmstreset = 1'd0;
assign QUAD0_RX2_ch_rxmstdatapathreset = 1'd0;
assign QUAD0_RX2_ch_dfehold = 1'd0;
assign QUAD0_RX2_ch_dfeovrd = 1'd0;
assign QUAD0_RX2_ch_rxdapireset = 1'd0;
assign QUAD0_RX2_ch_rxdapiresetmask = 2'd0;
assign QUAD0_RX2_ch_rxqpien = 1'd0;
assign QUAD0_RX2_ch_rxgearboxslip = 1'd0;
assign QUAD0_RX2_ch_gtrxreset = 1'd0;
assign QUAD0_RX2_ch_rxchanbond_en = 1'd0;
assign QUAD0_RX2_ch_rxchanbond_master = 1'd0;
assign QUAD0_RX2_ch_rxchanbond_slave = 1'd0;
assign QUAD0_RX2_ch_rxchanbond_level = 3'd0;
assign QUAD0_RX2_ch_rxdapicodeovrden = 1'd0;
assign QUAD0_RX2_ch_rxdapicodereset = 1'd0;
assign QUAD0_RX2_ch_rxdlyalignreq = 1'd0;
assign QUAD0_RX2_ch_rxeqtraining = 1'd0;
assign QUAD0_RX2_ch_rxlpmen = 1'd0;
assign QUAD0_RX2_ch_rxmldchaindone = 1'd0;
assign QUAD0_RX2_ch_rxmldchainreq = 1'd0;
assign QUAD0_RX2_ch_rxmlfinealignreq = 1'd0;
assign QUAD0_RX2_ch_rxoobreset = 1'd0;
assign QUAD0_RX2_ch_rxphalignreq = 1'd0;
assign QUAD0_RX2_ch_rxphdlypd = 1'd0;
assign QUAD0_RX2_ch_rxphdlyreset = 1'd0;
assign QUAD0_RX2_ch_rxphsetinitreq = 1'd0;
assign QUAD0_RX2_ch_rxphshift180 = 1'd0;
assign QUAD0_RX2_ch_rxslide = 1'd0;
assign QUAD0_RX2_ch_rxsyncallin = 1'd0;
assign QUAD0_RX2_ch_rxtermination = 1'd0;
assign QUAD0_RX2_ch_rxphalignresetmask = 2'd3;
assign QUAD0_RX2_ch_rxchbondi = 5'd0;
assign QUAD0_RX2_ch_cdrbmcdrreq = 1'd0;
assign QUAD0_RX2_ch_cdrfreqos = 1'd0;
assign QUAD0_RX2_ch_cdrincpctrl = 1'd0;
assign QUAD0_RX2_ch_cdrstepdir = 1'd0;
assign QUAD0_RX2_ch_cdrstepsq = 1'd0;
assign QUAD0_RX2_ch_cdrstepsx = 1'd0;
assign QUAD0_RX2_ch_eyescanreset = 1'd0;
assign QUAD0_RX2_ch_eyescantrigger = 1'd0;

assign QUAD0_TX0_ch_txdata = 128'd0;
assign QUAD0_TX0_ch_gttxreset = 1'd0;
assign QUAD0_TX0_ch_txinhibit = 1'd0;
assign QUAD0_TX0_ch_txlatclk = 1'd0;
assign QUAD0_TX0_ch_txmaincursor = 7'd77;
assign QUAD0_TX0_ch_txpcsresetmask = 1'd1;
assign QUAD0_TX0_ch_txpd = 2'd0;
assign QUAD0_TX0_ch_txpisopd = 1'd0;
assign QUAD0_TX0_ch_txpmaresetmask = 3'd7;
assign QUAD0_TX0_ch_txpolarity = 1'd0;
assign QUAD0_TX0_ch_txpostcursor = 5'd0;
assign QUAD0_TX0_ch_txprbsforceerr = 1'd0;
assign QUAD0_TX0_ch_txprbssel = 4'd0;
assign QUAD0_TX0_ch_txprecursor = 5'd0;
assign QUAD0_TX0_ch_txprogdivreset = 1'd0;
assign QUAD0_TX0_ch_txrate = 8'd0;
assign QUAD0_TX0_ch_txresetmode = 2'd0;
assign QUAD0_TX0_ch_txmstreset = 1'd0;
assign QUAD0_TX0_ch_txmstdatapathreset = 1'd0;
assign QUAD0_TX0_ch_txuserrdy = 1'd0;
assign QUAD0_TX0_ch_txheader = 6'd0;
assign QUAD0_TX0_ch_txsequence = 7'd0;
assign QUAD0_TX0_ch_txphalignresetmask = 2'd3;
assign QUAD0_TX0_ch_txcominit = 1'd0;
assign QUAD0_TX0_ch_txcomsas = 1'd0;
assign QUAD0_TX0_ch_txcomwake = 1'd0;
assign QUAD0_TX0_ch_txdapicodeovrden = 1'd0;
assign QUAD0_TX0_ch_txdapicodereset = 1'd0;
assign QUAD0_TX0_ch_txdetectrx = 1'd0;
assign QUAD0_TX0_ch_txphdlytstclk = 1'd0;
assign QUAD0_TX0_ch_txdlyalignreq = 1'd0;
assign QUAD0_TX0_ch_txelecidle = 1'd0;
assign QUAD0_TX0_ch_txmldchaindone = 1'd0;
assign QUAD0_TX0_ch_txmldchainreq = 1'd0;
assign QUAD0_TX0_ch_txoneszeros = 1'd0;
assign QUAD0_TX0_ch_txpausedelayalign = 1'd0;
assign QUAD0_TX0_ch_txphalignreq = 1'd0;
assign QUAD0_TX0_ch_txphdlypd = 1'd0;
assign QUAD0_TX0_ch_txphdlyreset = 1'd0;
assign QUAD0_TX0_ch_txphsetinitreq = 1'd0;
assign QUAD0_TX0_ch_txphshift180 = 1'd0;
assign QUAD0_TX0_ch_txpicodeovrden = 1'd0;
assign QUAD0_TX0_ch_txpicodereset = 1'd0;
assign QUAD0_TX0_ch_txpippmen = 1'd0;
assign QUAD0_TX0_ch_txswing = 1'd0;
assign QUAD0_TX0_ch_txsyncallin = 1'd0;
assign QUAD0_TX0_ch_txctrl0 = 16'd0;
assign QUAD0_TX0_ch_txctrl1 = 16'd0;
assign QUAD0_TX0_ch_txctrl2 = 8'd0;
assign QUAD0_TX0_ch_txdeemph = 2'd0;
assign QUAD0_TX0_ch_txmargin = 3'd0;
assign QUAD0_TX0_ch_txdiffctrl = 5'd25;
assign QUAD0_TX0_ch_txpippmstepsize = 5'd0;
assign QUAD0_TX0_ch_txdapireset = 1'd0;
assign QUAD0_TX0_ch_txdapiresetmask = 2'd0;
assign QUAD0_TX0_ch_txqpibiasen = 1'd0;
assign QUAD0_TX0_ch_txqpiweakpu = 1'd0;
assign QUAD0_TX1_ch_txdata = 128'd0;
assign QUAD0_TX1_ch_gttxreset = 1'd0;
assign QUAD0_TX1_ch_txinhibit = 1'd0;
assign QUAD0_TX1_ch_txlatclk = 1'd0;
assign QUAD0_TX1_ch_txmaincursor = 7'd77;
assign QUAD0_TX1_ch_txpcsresetmask = 1'd1;
assign QUAD0_TX1_ch_txpd = 2'd0;
assign QUAD0_TX1_ch_txpisopd = 1'd0;
assign QUAD0_TX1_ch_txpmaresetmask = 3'd7;
assign QUAD0_TX1_ch_txpolarity = 1'd0;
assign QUAD0_TX1_ch_txpostcursor = 5'd0;
assign QUAD0_TX1_ch_txprbsforceerr = 1'd0;
assign QUAD0_TX1_ch_txprbssel = 4'd0;
assign QUAD0_TX1_ch_txprecursor = 5'd0;
assign QUAD0_TX1_ch_txprogdivreset = 1'd0;
assign QUAD0_TX1_ch_txrate = 8'd0;
assign QUAD0_TX1_ch_txresetmode = 2'd0;
assign QUAD0_TX1_ch_txmstreset = 1'd0;
assign QUAD0_TX1_ch_txmstdatapathreset = 1'd0;
assign QUAD0_TX1_ch_txuserrdy = 1'd0;
assign QUAD0_TX1_ch_txheader = 6'd0;
assign QUAD0_TX1_ch_txsequence = 7'd0;
assign QUAD0_TX1_ch_txphalignresetmask = 2'd3;
assign QUAD0_TX1_ch_txcominit = 1'd0;
assign QUAD0_TX1_ch_txcomsas = 1'd0;
assign QUAD0_TX1_ch_txcomwake = 1'd0;
assign QUAD0_TX1_ch_txdapicodeovrden = 1'd0;
assign QUAD0_TX1_ch_txdapicodereset = 1'd0;
assign QUAD0_TX1_ch_txdetectrx = 1'd0;
assign QUAD0_TX1_ch_txphdlytstclk = 1'd0;
assign QUAD0_TX1_ch_txdlyalignreq = 1'd0;
assign QUAD0_TX1_ch_txelecidle = 1'd0;
assign QUAD0_TX1_ch_txmldchaindone = 1'd0;
assign QUAD0_TX1_ch_txmldchainreq = 1'd0;
assign QUAD0_TX1_ch_txoneszeros = 1'd0;
assign QUAD0_TX1_ch_txpausedelayalign = 1'd0;
assign QUAD0_TX1_ch_txphalignreq = 1'd0;
assign QUAD0_TX1_ch_txphdlypd = 1'd0;
assign QUAD0_TX1_ch_txphdlyreset = 1'd0;
assign QUAD0_TX1_ch_txphsetinitreq = 1'd0;
assign QUAD0_TX1_ch_txphshift180 = 1'd0;
assign QUAD0_TX1_ch_txpicodeovrden = 1'd0;
assign QUAD0_TX1_ch_txpicodereset = 1'd0;
assign QUAD0_TX1_ch_txpippmen = 1'd0;
assign QUAD0_TX1_ch_txswing = 1'd0;
assign QUAD0_TX1_ch_txsyncallin = 1'd0;
assign QUAD0_TX1_ch_txctrl0 = 16'd0;
assign QUAD0_TX1_ch_txctrl1 = 16'd0;
assign QUAD0_TX1_ch_txctrl2 = 8'd0;
assign QUAD0_TX1_ch_txdeemph = 2'd0;
assign QUAD0_TX1_ch_txmargin = 3'd0;
assign QUAD0_TX1_ch_txdiffctrl = 5'd25;
assign QUAD0_TX1_ch_txpippmstepsize = 5'd0;
assign QUAD0_TX1_ch_txdapireset = 1'd0;
assign QUAD0_TX1_ch_txdapiresetmask = 2'd0;
assign QUAD0_TX1_ch_txqpibiasen = 1'd0;
assign QUAD0_TX1_ch_txqpiweakpu = 1'd0;
assign QUAD0_TX2_ch_txdata = 128'd0;
assign QUAD0_TX2_ch_gttxreset = 1'd0;
assign QUAD0_TX2_ch_txinhibit = 1'd0;
assign QUAD0_TX2_ch_txlatclk = 1'd0;
assign QUAD0_TX2_ch_txmaincursor = 7'd77;
assign QUAD0_TX2_ch_txpcsresetmask = 1'd1;
assign QUAD0_TX2_ch_txpd = 2'd0;
assign QUAD0_TX2_ch_txpisopd = 1'd0;
assign QUAD0_TX2_ch_txpmaresetmask = 3'd7;
assign QUAD0_TX2_ch_txpolarity = 1'd0;
assign QUAD0_TX2_ch_txpostcursor = 5'd0;
assign QUAD0_TX2_ch_txprbsforceerr = 1'd0;
assign QUAD0_TX2_ch_txprbssel = 4'd0;
assign QUAD0_TX2_ch_txprecursor = 5'd0;
assign QUAD0_TX2_ch_txprogdivreset = 1'd0;
assign QUAD0_TX2_ch_txrate = 8'd0;
assign QUAD0_TX2_ch_txresetmode = 2'd0;
assign QUAD0_TX2_ch_txmstreset = 1'd0;
assign QUAD0_TX2_ch_txmstdatapathreset = 1'd0;
assign QUAD0_TX2_ch_txuserrdy = 1'd0;
assign QUAD0_TX2_ch_txheader = 6'd0;
assign QUAD0_TX2_ch_txsequence = 7'd0;
assign QUAD0_TX2_ch_txphalignresetmask = 2'd3;
assign QUAD0_TX2_ch_txcominit = 1'd0;
assign QUAD0_TX2_ch_txcomsas = 1'd0;
assign QUAD0_TX2_ch_txcomwake = 1'd0;
assign QUAD0_TX2_ch_txdapicodeovrden = 1'd0;
assign QUAD0_TX2_ch_txdapicodereset = 1'd0;
assign QUAD0_TX2_ch_txdetectrx = 1'd0;
assign QUAD0_TX2_ch_txphdlytstclk = 1'd0;
assign QUAD0_TX2_ch_txdlyalignreq = 1'd0;
assign QUAD0_TX2_ch_txelecidle = 1'd0;
assign QUAD0_TX2_ch_txmldchaindone = 1'd0;
assign QUAD0_TX2_ch_txmldchainreq = 1'd0;
assign QUAD0_TX2_ch_txoneszeros = 1'd0;
assign QUAD0_TX2_ch_txpausedelayalign = 1'd0;
assign QUAD0_TX2_ch_txphalignreq = 1'd0;
assign QUAD0_TX2_ch_txphdlypd = 1'd0;
assign QUAD0_TX2_ch_txphdlyreset = 1'd0;
assign QUAD0_TX2_ch_txphsetinitreq = 1'd0;
assign QUAD0_TX2_ch_txphshift180 = 1'd0;
assign QUAD0_TX2_ch_txpicodeovrden = 1'd0;
assign QUAD0_TX2_ch_txpicodereset = 1'd0;
assign QUAD0_TX2_ch_txpippmen = 1'd0;
assign QUAD0_TX2_ch_txswing = 1'd0;
assign QUAD0_TX2_ch_txsyncallin = 1'd0;
assign QUAD0_TX2_ch_txctrl0 = 16'd0;
assign QUAD0_TX2_ch_txctrl1 = 16'd0;
assign QUAD0_TX2_ch_txctrl2 = 8'd0;
assign QUAD0_TX2_ch_txdeemph = 2'd0;
assign QUAD0_TX2_ch_txmargin = 3'd0;
assign QUAD0_TX2_ch_txdiffctrl = 5'd25;
assign QUAD0_TX2_ch_txpippmstepsize = 5'd0;
assign QUAD0_TX2_ch_txdapireset = 1'd0;
assign QUAD0_TX2_ch_txdapiresetmask = 2'd0;
assign QUAD0_TX2_ch_txqpibiasen = 1'd0;
assign QUAD0_TX2_ch_txqpiweakpu = 1'd0;


extended_phy_layer_gtwiz_versal_0_0_quad_top  # (
   .C_NO_OF_QUADS ( 1 )
) quad_top_inst (

       .QUAD0_GTREFCLK0                    ( QUAD0_GTREFCLK0),
       .gtwiz_freerun_clk                                  ( gtwiz_freerun_clk),
       // RX margin interface
       .QUAD0_rxmarginreqack                       ( ),
       .QUAD0_rxmarginrescmd                       ( ),
       .QUAD0_rxmarginreslanenum                   ( ),
       .QUAD0_rxmarginrespayld                     ( ),
       .QUAD0_rxmarginresreq                       ( ),
       .QUAD0_rxmarginreqcmd                       ( 4'd0),
       .QUAD0_rxmarginreqlanenum                   ( 2'd0),
       .QUAD0_rxmarginreqpayld                     ( 8'd0),
       .QUAD0_rxmarginreqreq                       ( 1'd0),
       .QUAD0_rxmarginclk                          ( 1'd0),
       .QUAD0_rxmarginresack                       ( 1'd0),
       // PCIe link target
       .QUAD0_pcielinkreachtarget                  ( 1'd0),
       // PCIe ssm
       .QUAD0_pcieltssm                            ( 6'd0),
       // GPIO
       .QUAD0_gpi                                  ( QUAD0_gpi),
       .QUAD0_gpo                                  ( QUAD0_gpo),
       // GT Debug interface
       .QUAD0_bgbypassb                            ( 1'd0),
       .QUAD0_bgmonitorenb                         ( 1'd0),
       .QUAD0_bgpdb                                ( 1'd0),
       .QUAD0_bgrcalovrdenb                        ( 1'd0),
       .QUAD0_bgrcalovrd                           ( 5'd0),
       .QUAD0_debugtraceready                      ( 1'd0),
       .QUAD0_debugtraceclk                        ( 1'd0),
       .QUAD0_rcalenb                              ( 1'd0),
       .QUAD0_trigackout0                          ( 1'd0),
       .QUAD0_trigin0                              ( 1'd0),
       .QUAD0_ubenable                             ( 1'd1),
       .QUAD0_ubiolmbrst                           ( 1'd0),
       .QUAD0_ubmbrst                              ( 1'd0),
       .QUAD0_ubintr                               ( 12'd0),
       .QUAD0_ubrxuart                             ( 1'd0),
       .QUAD0_ctrlrsvdin                           ( 8'd0),
       .QUAD0_coestatusdebug                       ( 1'd0),
       .QUAD0_refclk0_clktestsig                   ( 1'd0),
       .QUAD0_refclk1_clktestsig                   ( 1'd0),
       .QUAD0_correcterr                           ( ),
       .QUAD0_debugtracetvalid                     ( ),
       .QUAD0_debugtracetdata                      ( ),
       .QUAD0_refclk0_gtrefclkpdint                ( ),
       .QUAD0_refclk0_clktestsigint                ( ),
       .QUAD0_refclk1_gtrefclkpdint                ( ),
       .QUAD0_refclk1_clktestsigint                ( ),
       .QUAD0_trigackin0                           ( ),
       .QUAD0_trigout0                             ( ),
       .QUAD0_ubinterrupt                          ( ),
       .QUAD0_ubtxuart                             ( ),
       .QUAD0_uncorrecterr                         ( ),
       .QUAD0_ctrlrsvdout                          ( ),
       .QUAD0_hsclk0_rxrecclksel                   ( ),
       .QUAD0_hsclk1_rxrecclksel                   ( ),
       // BUFGT interface
       .QUAD0_ch0_bufgtce                  ( ),
       .QUAD0_ch0_bufgtrst                 ( ),
       .QUAD0_ch0_bufgtcemask              ( ),
       .QUAD0_ch0_bufgtrstmask             ( ),
       .QUAD0_ch0_bufgtdiv                 ( ),
       // Outclk interface
       .QUAD0_TX0_outclk                   ( QUAD0_TX0_outclk),
       .QUAD0_RX0_outclk                   ( QUAD0_RX0_outclk),
       // Iloreset
       .QUAD0_ch0_iloreset                 ( 1'd0),
       // Iloreset done
       .QUAD0_ch0_iloresetdone             ( ),
       // Phystatus enable
       .QUAD0_ch0_phystatus                ( ),
       // Loopback
       .QUAD0_ch0_loopback                 ( 3'd0),
       // Debug enable interface
       .QUAD0_ch0_clkrsvd0                 ( 1'd0),
       .QUAD0_ch0_clkrsvd1                 ( 1'd0),
       .QUAD0_ch0_dmonitorclk              ( 1'd0),
       .QUAD0_ch0_iloresetmask             ( 1'd1),
       .QUAD0_ch0_dmonfiforeset            ( 1'd0),
       .QUAD0_ch0_pcsrsvdin                ( 16'd576),
       .QUAD0_ch0_gtrsvd                   ( 16'd0),
       .QUAD0_ch0_pcsrsvdout               ( ),
       .QUAD0_ch0_pinrsvdas                ( ),
       .QUAD0_ch0_dmonitoroutclk           ( ),
       .QUAD0_ch0_resetexception           ( ),
       .QUAD0_ch0_dmonitorout              ( ),
       .QUAD0_ch0_phyesmadaptsave          ( 1'd0),
       .QUAD0_ch0_hsdppcsreset             ( 1'd0),
       // phyready en
       .QUAD0_ch0_phyready                 ( ),
       // PCIe resetb
       .QUAD0_ch0_pcierstb                 ( 1'd1),
       // BUFGT interface
       .QUAD0_ch1_bufgtce                  ( ),
       .QUAD0_ch1_bufgtrst                 ( ),
       .QUAD0_ch1_bufgtcemask              ( ),
       .QUAD0_ch1_bufgtrstmask             ( ),
       .QUAD0_ch1_bufgtdiv                 ( ),
       // Outclk interface
       .QUAD0_TX1_outclk                   ( QUAD0_TX1_outclk),
       .QUAD0_RX1_outclk                   ( QUAD0_RX1_outclk),
       // Iloreset
       .QUAD0_ch1_iloreset                 ( 1'd0),
       // Iloreset done
       .QUAD0_ch1_iloresetdone             ( ),
       // Phystatus enable
       .QUAD0_ch1_phystatus                ( ),
       // Loopback
       .QUAD0_ch1_loopback                 ( 3'd0),
       // Debug enable interface
       .QUAD0_ch1_clkrsvd0                 ( 1'd0),
       .QUAD0_ch1_clkrsvd1                 ( 1'd0),
       .QUAD0_ch1_dmonitorclk              ( 1'd0),
       .QUAD0_ch1_iloresetmask             ( 1'd1),
       .QUAD0_ch1_dmonfiforeset            ( 1'd0),
       .QUAD0_ch1_pcsrsvdin                ( 16'd576),
       .QUAD0_ch1_gtrsvd                   ( 16'd0),
       .QUAD0_ch1_pcsrsvdout               ( ),
       .QUAD0_ch1_pinrsvdas                ( ),
       .QUAD0_ch1_dmonitoroutclk           ( ),
       .QUAD0_ch1_resetexception           ( ),
       .QUAD0_ch1_dmonitorout              ( ),
       .QUAD0_ch1_phyesmadaptsave          ( 1'd0),
       .QUAD0_ch1_hsdppcsreset             ( 1'd0),
       // phyready en
       .QUAD0_ch1_phyready                 ( ),
       // PCIe resetb
       .QUAD0_ch1_pcierstb                 ( 1'd1),
       // BUFGT interface
       .QUAD0_ch2_bufgtce                  ( ),
       .QUAD0_ch2_bufgtrst                 ( ),
       .QUAD0_ch2_bufgtcemask              ( ),
       .QUAD0_ch2_bufgtrstmask             ( ),
       .QUAD0_ch2_bufgtdiv                 ( ),
       // Outclk interface
       .QUAD0_TX2_outclk                   ( QUAD0_TX2_outclk),
       .QUAD0_RX2_outclk                   ( QUAD0_RX2_outclk),
       // Iloreset
       .QUAD0_ch2_iloreset                 ( 1'd0),
       // Iloreset done
       .QUAD0_ch2_iloresetdone             ( ),
       // Phystatus enable
       .QUAD0_ch2_phystatus                ( ),
       // Loopback
       .QUAD0_ch2_loopback                 ( 3'd0),
       // Debug enable interface
       .QUAD0_ch2_clkrsvd0                 ( 1'd0),
       .QUAD0_ch2_clkrsvd1                 ( 1'd0),
       .QUAD0_ch2_dmonitorclk              ( 1'd0),
       .QUAD0_ch2_iloresetmask             ( 1'd1),
       .QUAD0_ch2_dmonfiforeset            ( 1'd0),
       .QUAD0_ch2_pcsrsvdin                ( 16'd576),
       .QUAD0_ch2_gtrsvd                   ( 16'd0),
       .QUAD0_ch2_pcsrsvdout               ( ),
       .QUAD0_ch2_pinrsvdas                ( ),
       .QUAD0_ch2_dmonitoroutclk           ( ),
       .QUAD0_ch2_resetexception           ( ),
       .QUAD0_ch2_dmonitorout              ( ),
       .QUAD0_ch2_phyesmadaptsave          ( 1'd0),
       .QUAD0_ch2_hsdppcsreset             ( 1'd0),
       // phyready en
       .QUAD0_ch2_phyready                 ( ),
       // PCIe resetb
       .QUAD0_ch2_pcierstb                 ( 1'd1),
       // BUFGT interface
       .QUAD0_ch3_bufgtce                  ( ),
       .QUAD0_ch3_bufgtrst                 ( ),
       .QUAD0_ch3_bufgtcemask              ( ),
       .QUAD0_ch3_bufgtrstmask             ( ),
       .QUAD0_ch3_bufgtdiv                 ( ),
       // Outclk interface
       .QUAD0_TX3_outclk                   ( QUAD0_TX3_outclk),
       .QUAD0_RX3_outclk                   ( QUAD0_RX3_outclk),
       // Iloreset
       .QUAD0_ch3_iloreset                 ( 1'd0),
       // Iloreset done
       .QUAD0_ch3_iloresetdone             ( ),
       // Phystatus enable
       .QUAD0_ch3_phystatus                ( ),
       // Loopback
       .QUAD0_ch3_loopback                 ( QUAD0_ch3_loopback) ,
       // Debug enable interface
       .QUAD0_ch3_clkrsvd0                 ( 1'd0),
       .QUAD0_ch3_clkrsvd1                 ( 1'd0),
       .QUAD0_ch3_dmonitorclk              ( 1'd0),
       .QUAD0_ch3_iloresetmask             ( 1'd1),
       .QUAD0_ch3_dmonfiforeset            ( 1'd0),
       .QUAD0_ch3_pcsrsvdin                ( 16'd576),
       .QUAD0_ch3_gtrsvd                   ( 16'd0),
       .QUAD0_ch3_pcsrsvdout               ( ),
       .QUAD0_ch3_pinrsvdas                ( ),
       .QUAD0_ch3_dmonitoroutclk           ( ),
       .QUAD0_ch3_resetexception           ( ),
       .QUAD0_ch3_dmonitorout              ( ),
       .QUAD0_ch3_phyesmadaptsave          ( 1'd0),
       .QUAD0_ch3_hsdppcsreset             ( 1'd0),
       // phyready en
       .QUAD0_ch3_phyready                 ( ),
       // PCIe resetb
       .QUAD0_ch3_pcierstb                 ( 1'd1),
       // REFCLK PD
       .QUAD0_refclk0_gtrefclkpd           ( 1'd0),
       // HSCLK RPLL reset
       .QUAD0_hsclk0_rpllreset             ( 1'd0),
       // HSCLK LCPLL reset
       .QUAD0_hsclk0_lcpllreset            ( 1'd0),
       .QUAD0_hsclk0_rplllock              ( ),
 
       .QUAD0_hsclk0_lcplllock             ( QUAD0_hsclk0_lcplllock) ,
       // HSCLK debug interface 
       .QUAD0_hsclk0_lcpllpd               ( 1'd0),
       .QUAD0_hsclk0_lcpllresetbypassmode  ( 1'd0),
       .QUAD0_hsclk0_lcpllresetmask        ( 2'd3),
       .QUAD0_hsclk0_lcpllsdmtoggle        ( 1'd0),
       .QUAD0_hsclk0_lcpllrefclksel        ( 3'd1),
       .QUAD0_hsclk0_lcpllfbdiv            ( 8'd0),
       .QUAD0_hsclk0_lcpllfbclklost        ( ),
       .QUAD0_hsclk0_lcpllrefclklost       ( ),
       .QUAD0_hsclk0_lcpllrefclkmonitor    ( ),
//       .QUAD0_hsclk0_lcpllgtgrefclk        ( 1'b0),
       .QUAD0_hsclk0_rpllpd                ( 1'd0),
       .QUAD0_hsclk0_rpllresetbypassmode   ( 1'd0),
       .QUAD0_hsclk0_rpllresetmask         ( 2'd3),
       .QUAD0_hsclk0_rpllsdmtoggle         ( 1'd0),
       .QUAD0_hsclk0_rpllrefclksel         ( 3'd1),
       .QUAD0_hsclk0_rpllfbdiv             ( 8'd0),
       .QUAD0_hsclk0_rpllfbclklost         ( ),
       .QUAD0_hsclk0_rpllrefclklost        ( ),
       .QUAD0_hsclk0_rpllrefclkmonitor     ( ),
//       .QUAD0_hsclk0_rpllgtgrefclk         ( 1'b0),
       .QUAD0_hsclk0_rxrecclkout0          ( ),
       .QUAD0_hsclk0_rxrecclkout1          ( ),
       // REFCLK PD
       .QUAD0_refclk1_gtrefclkpd           ( 1'd0),
       // HSCLK RPLL reset
       .QUAD0_hsclk1_rpllreset             ( 1'd0),
       // HSCLK LCPLL reset
       .QUAD0_hsclk1_lcpllreset            ( 1'd0),
       .QUAD0_hsclk1_rplllock              ( ),
 
       .QUAD0_hsclk1_lcplllock             ( ),
       // HSCLK debug interface 
       .QUAD0_hsclk1_lcpllpd               ( 1'd0),
       .QUAD0_hsclk1_lcpllresetbypassmode  ( 1'd0),
       .QUAD0_hsclk1_lcpllresetmask        ( 2'd3),
       .QUAD0_hsclk1_lcpllsdmtoggle        ( 1'd0),
       .QUAD0_hsclk1_lcpllrefclksel        ( 3'd1),
       .QUAD0_hsclk1_lcpllfbdiv            ( 8'd0),
       .QUAD0_hsclk1_lcpllfbclklost        ( ),
       .QUAD0_hsclk1_lcpllrefclklost       ( ),
       .QUAD0_hsclk1_lcpllrefclkmonitor    ( ),
//       .QUAD0_hsclk1_lcpllgtgrefclk        ( 1'b0),
       .QUAD0_hsclk1_rpllpd                ( 1'd0),
       .QUAD0_hsclk1_rpllresetbypassmode   ( 1'd0),
       .QUAD0_hsclk1_rpllresetmask         ( 2'd3),
       .QUAD0_hsclk1_rpllsdmtoggle         ( 1'd0),
       .QUAD0_hsclk1_rpllrefclksel         ( 3'd1),
       .QUAD0_hsclk1_rpllfbdiv             ( 8'd0),
       .QUAD0_hsclk1_rpllfbclklost         ( ),
       .QUAD0_hsclk1_rpllrefclklost        ( ),
       .QUAD0_hsclk1_rpllrefclkmonitor     ( ),
//       .QUAD0_hsclk1_rpllgtgrefclk         ( 1'b0),
       .QUAD0_hsclk1_rxrecclkout0          ( ),
       .QUAD0_hsclk1_rxrecclkout1          ( ),
       .QUAD0_hsclk0_lcpllsdmdata                  ( 26'd18729921),
       .QUAD0_hsclk0_rpllsdmdata                   ( 26'd4535360),
       .QUAD0_hsclk1_lcpllsdmdata                  ( 26'd18729921),
       .QUAD0_hsclk1_rpllsdmdata                   ( 26'd4535360),


       .QUAD0_rxp                                  ( QUAD0_rxp),
       .QUAD0_rxn                                  ( QUAD0_rxn),
       .QUAD0_txp                                  ( QUAD0_txp),
       .QUAD0_txn                                  ( QUAD0_txn),

       .QUAD0_ch0_xpipe5_pipeline_en       ( ),
       .QUAD0_RX0_refdebugout              ( QUAD0_RX0_ch_refdebugout),      
       .QUAD0_RX0_dapiresetdone            ( QUAD0_RX0_ch_rxdapiresetdone),
       .QUAD0_RX0_debugpcsout              ( QUAD0_RX0_ch_rxdebugpcsout),
       .QUAD0_RX0_pkdet                    ( QUAD0_RX0_ch_rxpkdet),
       .QUAD0_RX0_qpisenn                  ( QUAD0_RX0_ch_rxqpisenn),
       .QUAD0_RX0_qpisenp                  ( QUAD0_RX0_ch_rxqpisenp),
       .QUAD0_RX0_simplexphystatus         ( QUAD0_RX0_ch_rxsimplexphystatus),
       .QUAD0_RX0_slipdone                 ( QUAD0_RX0_ch_rxslipdone),
       .QUAD0_RX0_dfehold                  ( QUAD0_RX0_ch_dfehold),
       .QUAD0_RX0_dfeovrd                  ( QUAD0_RX0_ch_dfeovrd),
       .QUAD0_RX0_dapireset                ( QUAD0_RX0_ch_rxdapireset),
       .QUAD0_RX0_dapiresetmask            ( QUAD0_RX0_ch_rxdapiresetmask),
       .QUAD0_RX0_qpien                    ( QUAD0_RX0_ch_rxqpien),
       .QUAD0_TX0_dapiresetdone            ( QUAD0_TX0_ch_txdapiresetdone),
       .QUAD0_TX0_debugpcsout              ( QUAD0_TX0_ch_txdebugpcsout),
       .QUAD0_TX0_qpisenn                  ( QUAD0_TX0_ch_txqpisenn),
       .QUAD0_TX0_qpisenp                  ( QUAD0_TX0_ch_txqpisenp),
       .QUAD0_TX0_simplexphystatus         ( QUAD0_TX0_ch_txsimplexphystatus),
       .QUAD0_TX0_swingouthigh             ( QUAD0_TX0_ch_txswingouthigh),
       .QUAD0_TX0_swingoutlow              ( QUAD0_TX0_ch_txswingoutlow),
       .QUAD0_TX0_dapireset                ( QUAD0_TX0_ch_txdapireset),
       .QUAD0_TX0_dapiresetmask            ( QUAD0_TX0_ch_txdapiresetmask),
       .QUAD0_TX0_qpibiasen                ( QUAD0_TX0_ch_txqpibiasen),
       .QUAD0_TX0_qpiweakpu                ( QUAD0_TX0_ch_txqpiweakpu),
       .QUAD0_RX0_10gstat                  ( QUAD0_RX0_ch_rx10gstat),
       .QUAD0_RX0_byteisaligned            ( QUAD0_RX0_ch_rxbyteisaligned),
       .QUAD0_RX0_byterealign              ( QUAD0_RX0_ch_rxbyterealign),
       .QUAD0_RX0_chanbondseq              ( QUAD0_RX0_ch_rxchanbondseq),
       .QUAD0_RX0_chanisaligned            ( QUAD0_RX0_ch_rxchanisaligned),
       .QUAD0_RX0_chanrealign              ( QUAD0_RX0_ch_rxchanrealign),
       .QUAD0_RX0_chbondo                  ( QUAD0_RX0_ch_rxchbondo),
       .QUAD0_RX0_clkcorcnt                ( QUAD0_RX0_ch_rxclkcorcnt),
       .QUAD0_RX0_cominitdet               ( QUAD0_RX0_ch_rxcominitdet),
       .QUAD0_RX0_commadet                 ( QUAD0_RX0_ch_rxcommadet),
       .QUAD0_RX0_comsasdet                ( QUAD0_RX0_ch_rxcomsasdet),
       .QUAD0_RX0_comwakedet               ( QUAD0_RX0_ch_rxcomwakedet),
       .QUAD0_RX0_ctrl0                    ( QUAD0_RX0_ch_rxctrl0),
       .QUAD0_RX0_ctrl1                    ( QUAD0_RX0_ch_rxctrl1),
       .QUAD0_RX0_ctrl2                    ( QUAD0_RX0_ch_rxctrl2),
       .QUAD0_RX0_ctrl3                    ( QUAD0_RX0_ch_rxctrl3),
       .QUAD0_RX0_datavalid                ( QUAD0_RX0_ch_rxdatavalid),
       .QUAD0_RX0_dlyalignerr              ( QUAD0_RX0_ch_rxdlyalignerr),
       .QUAD0_RX0_dlyalignprog             ( QUAD0_RX0_ch_rxdlyalignprog),
       .QUAD0_RX0_elecidle                 ( QUAD0_RX0_ch_rxelecidle),
       .QUAD0_RX0_finealigndone            ( QUAD0_RX0_ch_rxfinealigndone),
       .QUAD0_RX0_header                   ( QUAD0_RX0_ch_rxheader),
       .QUAD0_RX0_headervalid              ( QUAD0_RX0_ch_rxheadervalid),
       .QUAD0_RX0_osintdone                ( QUAD0_RX0_ch_rxosintdone),
       .QUAD0_RX0_phaligndone              ( QUAD0_RX0_ch_rxphaligndone),
       .QUAD0_RX0_phalignerr               ( QUAD0_RX0_ch_rxphalignerr),
       .QUAD0_RX0_phdlyresetdone           ( QUAD0_RX0_ch_rxphdlyresetdone),
       .QUAD0_RX0_phsetinitdone            ( QUAD0_RX0_ch_rxphsetinitdone),
       .QUAD0_RX0_phshift180done           ( QUAD0_RX0_ch_rxphshift180done),
       .QUAD0_RX0_sliderdy                 ( QUAD0_RX0_ch_rxsliderdy),
       .QUAD0_RX0_startofseq               ( QUAD0_RX0_ch_rxstartofseq),
       .QUAD0_RX0_status                   ( QUAD0_RX0_ch_rxstatus),
       .QUAD0_RX0_syncdone                 ( QUAD0_RX0_ch_rxsyncdone),
       .QUAD0_RX0_valid                    ( QUAD0_RX0_ch_rxvalid),
       .QUAD0_RX0_cdrbmcdrreq              ( QUAD0_RX0_ch_cdrbmcdrreq),
       .QUAD0_RX0_chbondi                  ( QUAD0_RX0_ch_rxchbondi),
       .QUAD0_RX0_dapicodeovrden           ( QUAD0_RX0_ch_rxdapicodeovrden),
       .QUAD0_RX0_dapicodereset            ( QUAD0_RX0_ch_rxdapicodereset),
       .QUAD0_RX0_dlyalignreq              ( QUAD0_RX0_ch_rxdlyalignreq),
       .QUAD0_RX0_eqtraining               ( QUAD0_RX0_ch_rxeqtraining),
       .QUAD0_RX0_gearboxslip              ( QUAD0_RX0_ch_rxgearboxslip),
       .QUAD0_RX0_lpmen                    ( QUAD0_RX0_ch_rxlpmen),
       .QUAD0_RX0_mldchaindone             ( QUAD0_RX0_ch_rxmldchaindone),
       .QUAD0_RX0_mldchainreq              ( QUAD0_RX0_ch_rxmldchainreq),
       .QUAD0_RX0_mlfinealignreq           ( QUAD0_RX0_ch_rxmlfinealignreq),
       .QUAD0_RX0_oobreset                 ( QUAD0_RX0_ch_rxoobreset),
       .QUAD0_RX0_phalignreq               ( QUAD0_RX0_ch_rxphalignreq),
       .QUAD0_RX0_phalignresetmask         ( QUAD0_RX0_ch_rxphalignresetmask),
       .QUAD0_RX0_phdlypd                  ( QUAD0_RX0_ch_rxphdlypd),
       .QUAD0_RX0_phdlyreset               ( QUAD0_RX0_ch_rxphdlyreset),
       .QUAD0_RX0_phsetinitreq             ( QUAD0_RX0_ch_rxphsetinitreq),
       .QUAD0_RX0_phshift180               ( QUAD0_RX0_ch_rxphshift180),
       .QUAD0_RX0_slide                    ( QUAD0_RX0_ch_rxslide),
       .QUAD0_RX0_syncallin                ( QUAD0_RX0_ch_rxsyncallin),
       .QUAD0_RX0_termination              ( QUAD0_RX0_ch_rxtermination),
       .QUAD0_RX0_eyescandataerror         ( QUAD0_RX0_ch_eyescandataerror), 
       .QUAD0_RX0_cdrfreqos                ( QUAD0_RX0_ch_cdrfreqos),
       .QUAD0_RX0_cdrincpctrl              ( QUAD0_RX0_ch_cdrincpctrl),
       .QUAD0_RX0_cdrstepdir               ( QUAD0_RX0_ch_cdrstepdir),
       .QUAD0_RX0_cdrstepsq                ( QUAD0_RX0_ch_cdrstepsq),
       .QUAD0_RX0_cdrstepsx                ( QUAD0_RX0_ch_cdrstepsx),
       .QUAD0_RX0_eyescanreset             ( QUAD0_RX0_ch_eyescanreset),
       .QUAD0_RX0_eyescantrigger           ( QUAD0_RX0_ch_eyescantrigger),
       .QUAD0_RX0_bufstatus                ( QUAD0_RX0_ch_rxbufstatus),
       .QUAD0_RX0_cdrlock                  ( QUAD0_RX0_ch_rxcdrlock),
       .QUAD0_RX0_cdrphdone                ( QUAD0_RX0_ch_rxcdrphdone),
       .QUAD0_RX0_data                     ( QUAD0_RX0_ch_rxdata),
       .QUAD0_RX0_pmaresetdone             ( QUAD0_RX0_ch_rxpmaresetdone),
       .QUAD0_RX0_prbserr                  ( QUAD0_RX0_ch_rxprbserr),
       .QUAD0_RX0_prbslocked               ( QUAD0_RX0_ch_rxprbslocked),
       .QUAD0_RX0_progdivresetdone         ( QUAD0_RX0_ch_rxprogdivresetdone),
       .QUAD0_RX0_resetdone                ( QUAD0_RX0_ch_rxresetdone),
       .QUAD0_RX0_gtrxreset                ( QUAD0_RX0_ch_gtrxreset),
       .QUAD0_RX0_cdrhold                  ( QUAD0_RX0_ch_rxcdrhold),
       .QUAD0_RX0_cdrovrden                ( QUAD0_RX0_ch_rxcdrovrden),
       .QUAD0_RX0_cdrreset                 ( QUAD0_RX0_ch_rxcdrreset),
       .QUAD0_RX0_latclk                   ( QUAD0_RX0_ch_rxlatclk),
       .QUAD0_RX0_pcsresetmask             ( QUAD0_RX0_ch_rxpcsresetmask),
       .QUAD0_RX0_pd                       ( QUAD0_RX0_ch_rxpd),
       .QUAD0_RX0_pmaresetmask             ( QUAD0_RX0_ch_rxpmaresetmask),
       .QUAD0_RX0_polarity                 ( QUAD0_RX0_ch_rxpolarity),
       .QUAD0_RX0_prbscntreset             ( QUAD0_RX0_ch_rxprbscntreset),
       .QUAD0_RX0_prbssel                  ( QUAD0_RX0_ch_rxprbssel),
       .QUAD0_RX0_progdivreset             ( QUAD0_RX0_ch_rxprogdivreset),
       .QUAD0_RX0_rate                     ( QUAD0_RX0_ch_rxrate),
       .QUAD0_RX0_resetmode                ( QUAD0_RX0_ch_rxresetmode),
       .QUAD0_RX0_userrdy                  ( QUAD0_RX0_ch_rxuserrdy),
       .QUAD0_RX0_usrclk                   ( QUAD0_RX0_usrclk),
       .QUAD0_RX0_mstresetdone             ( QUAD0_RX0_ch_rxmstresetdone),
       .QUAD0_RX0_mstreset                 ( QUAD0_RX0_ch_rxmstreset),
       .QUAD0_RX0_mstdatapathreset         ( QUAD0_RX0_ch_rxmstdatapathreset),

       .QUAD0_TX0_10gstat                  ( QUAD0_TX0_ch_tx10gstat),
       .QUAD0_TX0_comfinish                ( QUAD0_TX0_ch_txcomfinish),
       .QUAD0_TX0_dlyalignerr              ( QUAD0_TX0_ch_txdlyalignerr),
       .QUAD0_TX0_dlyalignprog             ( QUAD0_TX0_ch_txdlyalignprog),
       .QUAD0_TX0_phaligndone              ( QUAD0_TX0_ch_txphaligndone),
       .QUAD0_TX0_phalignerr               ( QUAD0_TX0_ch_txphalignerr),
       .QUAD0_TX0_phalignoutrsvd           ( QUAD0_TX0_ch_txphalignoutrsvd),
       .QUAD0_TX0_phdlyresetdone           ( QUAD0_TX0_ch_txphdlyresetdone),
       .QUAD0_TX0_phsetinitdone            ( QUAD0_TX0_ch_txphsetinitdone),
       .QUAD0_TX0_phshift180done           ( QUAD0_TX0_ch_txphshift180done),
       .QUAD0_TX0_syncdone                 ( QUAD0_TX0_ch_txsyncdone),
       .QUAD0_TX0_deemph                   ( QUAD0_TX0_ch_txdeemph),
       .QUAD0_TX0_detectrx                 ( QUAD0_TX0_ch_txdetectrx),
       .QUAD0_TX0_dapicodeovrden           ( QUAD0_TX0_ch_txdapicodeovrden),
       .QUAD0_TX0_dapicodereset            ( QUAD0_TX0_ch_txdapicodereset),
       .QUAD0_TX0_cominit                  ( QUAD0_TX0_ch_txcominit),
       .QUAD0_TX0_comsas                   ( QUAD0_TX0_ch_txcomsas),
       .QUAD0_TX0_comwake                  ( QUAD0_TX0_ch_txcomwake),
       .QUAD0_TX0_ctrl0                    ( QUAD0_TX0_ch_txctrl0),
       .QUAD0_TX0_ctrl1                    ( QUAD0_TX0_ch_txctrl1),
       .QUAD0_TX0_ctrl2                    ( QUAD0_TX0_ch_txctrl2),
       .QUAD0_TX0_diffctrl                 ( QUAD0_TX0_ch_txdiffctrl),
       .QUAD0_TX0_dlyalignreq              ( QUAD0_TX0_ch_txdlyalignreq),
       .QUAD0_TX0_elecidle                 ( QUAD0_TX0_ch_txelecidle),
       .QUAD0_TX0_header                   ( QUAD0_TX0_ch_txheader),
       .QUAD0_TX0_margin                   ( QUAD0_TX0_ch_txmargin),
       .QUAD0_TX0_mldchaindone             ( QUAD0_TX0_ch_txmldchaindone),
       .QUAD0_TX0_mldchainreq              ( QUAD0_TX0_ch_txmldchainreq),
       .QUAD0_TX0_oneszeros                ( QUAD0_TX0_ch_txoneszeros),
       .QUAD0_TX0_pausedelayalign          ( QUAD0_TX0_ch_txpausedelayalign),
       .QUAD0_TX0_phalignreq               ( QUAD0_TX0_ch_txphalignreq),
       .QUAD0_TX0_phalignresetmask         ( QUAD0_TX0_ch_txphalignresetmask),
       .QUAD0_TX0_phdlypd                  ( QUAD0_TX0_ch_txphdlypd),
       .QUAD0_TX0_phdlyreset               ( QUAD0_TX0_ch_txphdlyreset),
       .QUAD0_TX0_phdlytstclk              ( QUAD0_TX0_ch_txphdlytstclk),
       .QUAD0_TX0_phsetinitreq             ( QUAD0_TX0_ch_txphsetinitreq),
       .QUAD0_TX0_phshift180               ( QUAD0_TX0_ch_txphshift180),
       .QUAD0_TX0_picodeovrden             ( QUAD0_TX0_ch_txpicodeovrden),
       .QUAD0_TX0_picodereset              ( QUAD0_TX0_ch_txpicodereset),
       .QUAD0_TX0_pippmen                  ( QUAD0_TX0_ch_txpippmen),
       .QUAD0_TX0_pippmstepsize            ( QUAD0_TX0_ch_txpippmstepsize),
       .QUAD0_TX0_sequence                 ( QUAD0_TX0_ch_txsequence),
       .QUAD0_TX0_swing                    ( QUAD0_TX0_ch_txswing),
       .QUAD0_TX0_syncallin                ( QUAD0_TX0_ch_txsyncallin),
       .QUAD0_TX0_bufstatus                ( QUAD0_TX0_ch_txbufstatus),
       .QUAD0_TX0_dccdone                  ( QUAD0_TX0_ch_txdccdone),
       .QUAD0_TX0_pmaresetdone             ( QUAD0_TX0_ch_txpmaresetdone),
       .QUAD0_TX0_progdivresetdone         ( QUAD0_TX0_ch_txprogdivresetdone),
       .QUAD0_TX0_resetdone                ( QUAD0_TX0_ch_txresetdone),
       .QUAD0_TX0_gttxreset                ( QUAD0_TX0_ch_gttxreset),
       .QUAD0_TX0_data                     ( QUAD0_TX0_ch_txdata),
       .QUAD0_TX0_inhibit                  ( QUAD0_TX0_ch_txinhibit),
       .QUAD0_TX0_latclk                   ( QUAD0_TX0_ch_txlatclk),
       .QUAD0_TX0_maincursor               ( QUAD0_TX0_ch_txmaincursor),
       .QUAD0_TX0_pcsresetmask             ( QUAD0_TX0_ch_txpcsresetmask),
       .QUAD0_TX0_pd                       ( QUAD0_TX0_ch_txpd),
       .QUAD0_TX0_pisopd                   ( QUAD0_TX0_ch_txpisopd),
       .QUAD0_TX0_pmaresetmask             ( QUAD0_TX0_ch_txpmaresetmask),
       .QUAD0_TX0_polarity                 ( QUAD0_TX0_ch_txpolarity),
       .QUAD0_TX0_postcursor               ( QUAD0_TX0_ch_txpostcursor),
       .QUAD0_TX0_prbsforceerr             ( QUAD0_TX0_ch_txprbsforceerr),
       .QUAD0_TX0_prbssel                  ( QUAD0_TX0_ch_txprbssel),
       .QUAD0_TX0_precursor                ( QUAD0_TX0_ch_txprecursor),
       .QUAD0_TX0_progdivreset             ( QUAD0_TX0_ch_txprogdivreset),
       .QUAD0_TX0_rate                     ( QUAD0_TX0_ch_txrate),
       .QUAD0_TX0_resetmode                ( QUAD0_TX0_ch_txresetmode),
       .QUAD0_TX0_userrdy                  ( QUAD0_TX0_ch_txuserrdy),
       .QUAD0_TX0_usrclk                   ( QUAD0_TX0_usrclk),
       .QUAD0_TX0_mstresetdone             ( QUAD0_TX0_ch_txmstresetdone),
       .QUAD0_TX0_mstreset                 ( QUAD0_TX0_ch_txmstreset),
       .QUAD0_TX0_mstdatapathreset         ( QUAD0_TX0_ch_txmstdatapathreset),
       .QUAD0_ch1_xpipe5_pipeline_en       ( ),
       .QUAD0_RX1_refdebugout              ( QUAD0_RX1_ch_refdebugout),      
       .QUAD0_RX1_dapiresetdone            ( QUAD0_RX1_ch_rxdapiresetdone),
       .QUAD0_RX1_debugpcsout              ( QUAD0_RX1_ch_rxdebugpcsout),
       .QUAD0_RX1_pkdet                    ( QUAD0_RX1_ch_rxpkdet),
       .QUAD0_RX1_qpisenn                  ( QUAD0_RX1_ch_rxqpisenn),
       .QUAD0_RX1_qpisenp                  ( QUAD0_RX1_ch_rxqpisenp),
       .QUAD0_RX1_simplexphystatus         ( QUAD0_RX1_ch_rxsimplexphystatus),
       .QUAD0_RX1_slipdone                 ( QUAD0_RX1_ch_rxslipdone),
       .QUAD0_RX1_dfehold                  ( QUAD0_RX1_ch_dfehold),
       .QUAD0_RX1_dfeovrd                  ( QUAD0_RX1_ch_dfeovrd),
       .QUAD0_RX1_dapireset                ( QUAD0_RX1_ch_rxdapireset),
       .QUAD0_RX1_dapiresetmask            ( QUAD0_RX1_ch_rxdapiresetmask),
       .QUAD0_RX1_qpien                    ( QUAD0_RX1_ch_rxqpien),
       .QUAD0_TX1_dapiresetdone            ( QUAD0_TX1_ch_txdapiresetdone),
       .QUAD0_TX1_debugpcsout              ( QUAD0_TX1_ch_txdebugpcsout),
       .QUAD0_TX1_qpisenn                  ( QUAD0_TX1_ch_txqpisenn),
       .QUAD0_TX1_qpisenp                  ( QUAD0_TX1_ch_txqpisenp),
       .QUAD0_TX1_simplexphystatus         ( QUAD0_TX1_ch_txsimplexphystatus),
       .QUAD0_TX1_swingouthigh             ( QUAD0_TX1_ch_txswingouthigh),
       .QUAD0_TX1_swingoutlow              ( QUAD0_TX1_ch_txswingoutlow),
       .QUAD0_TX1_dapireset                ( QUAD0_TX1_ch_txdapireset),
       .QUAD0_TX1_dapiresetmask            ( QUAD0_TX1_ch_txdapiresetmask),
       .QUAD0_TX1_qpibiasen                ( QUAD0_TX1_ch_txqpibiasen),
       .QUAD0_TX1_qpiweakpu                ( QUAD0_TX1_ch_txqpiweakpu),
       .QUAD0_RX1_10gstat                  ( QUAD0_RX1_ch_rx10gstat),
       .QUAD0_RX1_byteisaligned            ( QUAD0_RX1_ch_rxbyteisaligned),
       .QUAD0_RX1_byterealign              ( QUAD0_RX1_ch_rxbyterealign),
       .QUAD0_RX1_chanbondseq              ( QUAD0_RX1_ch_rxchanbondseq),
       .QUAD0_RX1_chanisaligned            ( QUAD0_RX1_ch_rxchanisaligned),
       .QUAD0_RX1_chanrealign              ( QUAD0_RX1_ch_rxchanrealign),
       .QUAD0_RX1_chbondo                  ( QUAD0_RX1_ch_rxchbondo),
       .QUAD0_RX1_clkcorcnt                ( QUAD0_RX1_ch_rxclkcorcnt),
       .QUAD0_RX1_cominitdet               ( QUAD0_RX1_ch_rxcominitdet),
       .QUAD0_RX1_commadet                 ( QUAD0_RX1_ch_rxcommadet),
       .QUAD0_RX1_comsasdet                ( QUAD0_RX1_ch_rxcomsasdet),
       .QUAD0_RX1_comwakedet               ( QUAD0_RX1_ch_rxcomwakedet),
       .QUAD0_RX1_ctrl0                    ( QUAD0_RX1_ch_rxctrl0),
       .QUAD0_RX1_ctrl1                    ( QUAD0_RX1_ch_rxctrl1),
       .QUAD0_RX1_ctrl2                    ( QUAD0_RX1_ch_rxctrl2),
       .QUAD0_RX1_ctrl3                    ( QUAD0_RX1_ch_rxctrl3),
       .QUAD0_RX1_datavalid                ( QUAD0_RX1_ch_rxdatavalid),
       .QUAD0_RX1_dlyalignerr              ( QUAD0_RX1_ch_rxdlyalignerr),
       .QUAD0_RX1_dlyalignprog             ( QUAD0_RX1_ch_rxdlyalignprog),
       .QUAD0_RX1_elecidle                 ( QUAD0_RX1_ch_rxelecidle),
       .QUAD0_RX1_finealigndone            ( QUAD0_RX1_ch_rxfinealigndone),
       .QUAD0_RX1_header                   ( QUAD0_RX1_ch_rxheader),
       .QUAD0_RX1_headervalid              ( QUAD0_RX1_ch_rxheadervalid),
       .QUAD0_RX1_osintdone                ( QUAD0_RX1_ch_rxosintdone),
       .QUAD0_RX1_phaligndone              ( QUAD0_RX1_ch_rxphaligndone),
       .QUAD0_RX1_phalignerr               ( QUAD0_RX1_ch_rxphalignerr),
       .QUAD0_RX1_phdlyresetdone           ( QUAD0_RX1_ch_rxphdlyresetdone),
       .QUAD0_RX1_phsetinitdone            ( QUAD0_RX1_ch_rxphsetinitdone),
       .QUAD0_RX1_phshift180done           ( QUAD0_RX1_ch_rxphshift180done),
       .QUAD0_RX1_sliderdy                 ( QUAD0_RX1_ch_rxsliderdy),
       .QUAD0_RX1_startofseq               ( QUAD0_RX1_ch_rxstartofseq),
       .QUAD0_RX1_status                   ( QUAD0_RX1_ch_rxstatus),
       .QUAD0_RX1_syncdone                 ( QUAD0_RX1_ch_rxsyncdone),
       .QUAD0_RX1_valid                    ( QUAD0_RX1_ch_rxvalid),
       .QUAD0_RX1_cdrbmcdrreq              ( QUAD0_RX1_ch_cdrbmcdrreq),
       .QUAD0_RX1_chbondi                  ( QUAD0_RX1_ch_rxchbondi),
       .QUAD0_RX1_dapicodeovrden           ( QUAD0_RX1_ch_rxdapicodeovrden),
       .QUAD0_RX1_dapicodereset            ( QUAD0_RX1_ch_rxdapicodereset),
       .QUAD0_RX1_dlyalignreq              ( QUAD0_RX1_ch_rxdlyalignreq),
       .QUAD0_RX1_eqtraining               ( QUAD0_RX1_ch_rxeqtraining),
       .QUAD0_RX1_gearboxslip              ( QUAD0_RX1_ch_rxgearboxslip),
       .QUAD0_RX1_lpmen                    ( QUAD0_RX1_ch_rxlpmen),
       .QUAD0_RX1_mldchaindone             ( QUAD0_RX1_ch_rxmldchaindone),
       .QUAD0_RX1_mldchainreq              ( QUAD0_RX1_ch_rxmldchainreq),
       .QUAD0_RX1_mlfinealignreq           ( QUAD0_RX1_ch_rxmlfinealignreq),
       .QUAD0_RX1_oobreset                 ( QUAD0_RX1_ch_rxoobreset),
       .QUAD0_RX1_phalignreq               ( QUAD0_RX1_ch_rxphalignreq),
       .QUAD0_RX1_phalignresetmask         ( QUAD0_RX1_ch_rxphalignresetmask),
       .QUAD0_RX1_phdlypd                  ( QUAD0_RX1_ch_rxphdlypd),
       .QUAD0_RX1_phdlyreset               ( QUAD0_RX1_ch_rxphdlyreset),
       .QUAD0_RX1_phsetinitreq             ( QUAD0_RX1_ch_rxphsetinitreq),
       .QUAD0_RX1_phshift180               ( QUAD0_RX1_ch_rxphshift180),
       .QUAD0_RX1_slide                    ( QUAD0_RX1_ch_rxslide),
       .QUAD0_RX1_syncallin                ( QUAD0_RX1_ch_rxsyncallin),
       .QUAD0_RX1_termination              ( QUAD0_RX1_ch_rxtermination),
       .QUAD0_RX1_eyescandataerror         ( QUAD0_RX1_ch_eyescandataerror), 
       .QUAD0_RX1_cdrfreqos                ( QUAD0_RX1_ch_cdrfreqos),
       .QUAD0_RX1_cdrincpctrl              ( QUAD0_RX1_ch_cdrincpctrl),
       .QUAD0_RX1_cdrstepdir               ( QUAD0_RX1_ch_cdrstepdir),
       .QUAD0_RX1_cdrstepsq                ( QUAD0_RX1_ch_cdrstepsq),
       .QUAD0_RX1_cdrstepsx                ( QUAD0_RX1_ch_cdrstepsx),
       .QUAD0_RX1_eyescanreset             ( QUAD0_RX1_ch_eyescanreset),
       .QUAD0_RX1_eyescantrigger           ( QUAD0_RX1_ch_eyescantrigger),
       .QUAD0_RX1_bufstatus                ( QUAD0_RX1_ch_rxbufstatus),
       .QUAD0_RX1_cdrlock                  ( QUAD0_RX1_ch_rxcdrlock),
       .QUAD0_RX1_cdrphdone                ( QUAD0_RX1_ch_rxcdrphdone),
       .QUAD0_RX1_data                     ( QUAD0_RX1_ch_rxdata),
       .QUAD0_RX1_pmaresetdone             ( QUAD0_RX1_ch_rxpmaresetdone),
       .QUAD0_RX1_prbserr                  ( QUAD0_RX1_ch_rxprbserr),
       .QUAD0_RX1_prbslocked               ( QUAD0_RX1_ch_rxprbslocked),
       .QUAD0_RX1_progdivresetdone         ( QUAD0_RX1_ch_rxprogdivresetdone),
       .QUAD0_RX1_resetdone                ( QUAD0_RX1_ch_rxresetdone),
       .QUAD0_RX1_gtrxreset                ( QUAD0_RX1_ch_gtrxreset),
       .QUAD0_RX1_cdrhold                  ( QUAD0_RX1_ch_rxcdrhold),
       .QUAD0_RX1_cdrovrden                ( QUAD0_RX1_ch_rxcdrovrden),
       .QUAD0_RX1_cdrreset                 ( QUAD0_RX1_ch_rxcdrreset),
       .QUAD0_RX1_latclk                   ( QUAD0_RX1_ch_rxlatclk),
       .QUAD0_RX1_pcsresetmask             ( QUAD0_RX1_ch_rxpcsresetmask),
       .QUAD0_RX1_pd                       ( QUAD0_RX1_ch_rxpd),
       .QUAD0_RX1_pmaresetmask             ( QUAD0_RX1_ch_rxpmaresetmask),
       .QUAD0_RX1_polarity                 ( QUAD0_RX1_ch_rxpolarity),
       .QUAD0_RX1_prbscntreset             ( QUAD0_RX1_ch_rxprbscntreset),
       .QUAD0_RX1_prbssel                  ( QUAD0_RX1_ch_rxprbssel),
       .QUAD0_RX1_progdivreset             ( QUAD0_RX1_ch_rxprogdivreset),
       .QUAD0_RX1_rate                     ( QUAD0_RX1_ch_rxrate),
       .QUAD0_RX1_resetmode                ( QUAD0_RX1_ch_rxresetmode),
       .QUAD0_RX1_userrdy                  ( QUAD0_RX1_ch_rxuserrdy),
       .QUAD0_RX1_usrclk                   ( QUAD0_RX1_usrclk),
       .QUAD0_RX1_mstresetdone             ( QUAD0_RX1_ch_rxmstresetdone),
       .QUAD0_RX1_mstreset                 ( QUAD0_RX1_ch_rxmstreset),
       .QUAD0_RX1_mstdatapathreset         ( QUAD0_RX1_ch_rxmstdatapathreset),

       .QUAD0_TX1_10gstat                  ( QUAD0_TX1_ch_tx10gstat),
       .QUAD0_TX1_comfinish                ( QUAD0_TX1_ch_txcomfinish),
       .QUAD0_TX1_dlyalignerr              ( QUAD0_TX1_ch_txdlyalignerr),
       .QUAD0_TX1_dlyalignprog             ( QUAD0_TX1_ch_txdlyalignprog),
       .QUAD0_TX1_phaligndone              ( QUAD0_TX1_ch_txphaligndone),
       .QUAD0_TX1_phalignerr               ( QUAD0_TX1_ch_txphalignerr),
       .QUAD0_TX1_phalignoutrsvd           ( QUAD0_TX1_ch_txphalignoutrsvd),
       .QUAD0_TX1_phdlyresetdone           ( QUAD0_TX1_ch_txphdlyresetdone),
       .QUAD0_TX1_phsetinitdone            ( QUAD0_TX1_ch_txphsetinitdone),
       .QUAD0_TX1_phshift180done           ( QUAD0_TX1_ch_txphshift180done),
       .QUAD0_TX1_syncdone                 ( QUAD0_TX1_ch_txsyncdone),
       .QUAD0_TX1_deemph                   ( QUAD0_TX1_ch_txdeemph),
       .QUAD0_TX1_detectrx                 ( QUAD0_TX1_ch_txdetectrx),
       .QUAD0_TX1_dapicodeovrden           ( QUAD0_TX1_ch_txdapicodeovrden),
       .QUAD0_TX1_dapicodereset            ( QUAD0_TX1_ch_txdapicodereset),
       .QUAD0_TX1_cominit                  ( QUAD0_TX1_ch_txcominit),
       .QUAD0_TX1_comsas                   ( QUAD0_TX1_ch_txcomsas),
       .QUAD0_TX1_comwake                  ( QUAD0_TX1_ch_txcomwake),
       .QUAD0_TX1_ctrl0                    ( QUAD0_TX1_ch_txctrl0),
       .QUAD0_TX1_ctrl1                    ( QUAD0_TX1_ch_txctrl1),
       .QUAD0_TX1_ctrl2                    ( QUAD0_TX1_ch_txctrl2),
       .QUAD0_TX1_diffctrl                 ( QUAD0_TX1_ch_txdiffctrl),
       .QUAD0_TX1_dlyalignreq              ( QUAD0_TX1_ch_txdlyalignreq),
       .QUAD0_TX1_elecidle                 ( QUAD0_TX1_ch_txelecidle),
       .QUAD0_TX1_header                   ( QUAD0_TX1_ch_txheader),
       .QUAD0_TX1_margin                   ( QUAD0_TX1_ch_txmargin),
       .QUAD0_TX1_mldchaindone             ( QUAD0_TX1_ch_txmldchaindone),
       .QUAD0_TX1_mldchainreq              ( QUAD0_TX1_ch_txmldchainreq),
       .QUAD0_TX1_oneszeros                ( QUAD0_TX1_ch_txoneszeros),
       .QUAD0_TX1_pausedelayalign          ( QUAD0_TX1_ch_txpausedelayalign),
       .QUAD0_TX1_phalignreq               ( QUAD0_TX1_ch_txphalignreq),
       .QUAD0_TX1_phalignresetmask         ( QUAD0_TX1_ch_txphalignresetmask),
       .QUAD0_TX1_phdlypd                  ( QUAD0_TX1_ch_txphdlypd),
       .QUAD0_TX1_phdlyreset               ( QUAD0_TX1_ch_txphdlyreset),
       .QUAD0_TX1_phdlytstclk              ( QUAD0_TX1_ch_txphdlytstclk),
       .QUAD0_TX1_phsetinitreq             ( QUAD0_TX1_ch_txphsetinitreq),
       .QUAD0_TX1_phshift180               ( QUAD0_TX1_ch_txphshift180),
       .QUAD0_TX1_picodeovrden             ( QUAD0_TX1_ch_txpicodeovrden),
       .QUAD0_TX1_picodereset              ( QUAD0_TX1_ch_txpicodereset),
       .QUAD0_TX1_pippmen                  ( QUAD0_TX1_ch_txpippmen),
       .QUAD0_TX1_pippmstepsize            ( QUAD0_TX1_ch_txpippmstepsize),
       .QUAD0_TX1_sequence                 ( QUAD0_TX1_ch_txsequence),
       .QUAD0_TX1_swing                    ( QUAD0_TX1_ch_txswing),
       .QUAD0_TX1_syncallin                ( QUAD0_TX1_ch_txsyncallin),
       .QUAD0_TX1_bufstatus                ( QUAD0_TX1_ch_txbufstatus),
       .QUAD0_TX1_dccdone                  ( QUAD0_TX1_ch_txdccdone),
       .QUAD0_TX1_pmaresetdone             ( QUAD0_TX1_ch_txpmaresetdone),
       .QUAD0_TX1_progdivresetdone         ( QUAD0_TX1_ch_txprogdivresetdone),
       .QUAD0_TX1_resetdone                ( QUAD0_TX1_ch_txresetdone),
       .QUAD0_TX1_gttxreset                ( QUAD0_TX1_ch_gttxreset),
       .QUAD0_TX1_data                     ( QUAD0_TX1_ch_txdata),
       .QUAD0_TX1_inhibit                  ( QUAD0_TX1_ch_txinhibit),
       .QUAD0_TX1_latclk                   ( QUAD0_TX1_ch_txlatclk),
       .QUAD0_TX1_maincursor               ( QUAD0_TX1_ch_txmaincursor),
       .QUAD0_TX1_pcsresetmask             ( QUAD0_TX1_ch_txpcsresetmask),
       .QUAD0_TX1_pd                       ( QUAD0_TX1_ch_txpd),
       .QUAD0_TX1_pisopd                   ( QUAD0_TX1_ch_txpisopd),
       .QUAD0_TX1_pmaresetmask             ( QUAD0_TX1_ch_txpmaresetmask),
       .QUAD0_TX1_polarity                 ( QUAD0_TX1_ch_txpolarity),
       .QUAD0_TX1_postcursor               ( QUAD0_TX1_ch_txpostcursor),
       .QUAD0_TX1_prbsforceerr             ( QUAD0_TX1_ch_txprbsforceerr),
       .QUAD0_TX1_prbssel                  ( QUAD0_TX1_ch_txprbssel),
       .QUAD0_TX1_precursor                ( QUAD0_TX1_ch_txprecursor),
       .QUAD0_TX1_progdivreset             ( QUAD0_TX1_ch_txprogdivreset),
       .QUAD0_TX1_rate                     ( QUAD0_TX1_ch_txrate),
       .QUAD0_TX1_resetmode                ( QUAD0_TX1_ch_txresetmode),
       .QUAD0_TX1_userrdy                  ( QUAD0_TX1_ch_txuserrdy),
       .QUAD0_TX1_usrclk                   ( QUAD0_TX1_usrclk),
       .QUAD0_TX1_mstresetdone             ( QUAD0_TX1_ch_txmstresetdone),
       .QUAD0_TX1_mstreset                 ( QUAD0_TX1_ch_txmstreset),
       .QUAD0_TX1_mstdatapathreset         ( QUAD0_TX1_ch_txmstdatapathreset),
       .QUAD0_ch2_xpipe5_pipeline_en       ( ),
       .QUAD0_RX2_refdebugout              ( QUAD0_RX2_ch_refdebugout),      
       .QUAD0_RX2_dapiresetdone            ( QUAD0_RX2_ch_rxdapiresetdone),
       .QUAD0_RX2_debugpcsout              ( QUAD0_RX2_ch_rxdebugpcsout),
       .QUAD0_RX2_pkdet                    ( QUAD0_RX2_ch_rxpkdet),
       .QUAD0_RX2_qpisenn                  ( QUAD0_RX2_ch_rxqpisenn),
       .QUAD0_RX2_qpisenp                  ( QUAD0_RX2_ch_rxqpisenp),
       .QUAD0_RX2_simplexphystatus         ( QUAD0_RX2_ch_rxsimplexphystatus),
       .QUAD0_RX2_slipdone                 ( QUAD0_RX2_ch_rxslipdone),
       .QUAD0_RX2_dfehold                  ( QUAD0_RX2_ch_dfehold),
       .QUAD0_RX2_dfeovrd                  ( QUAD0_RX2_ch_dfeovrd),
       .QUAD0_RX2_dapireset                ( QUAD0_RX2_ch_rxdapireset),
       .QUAD0_RX2_dapiresetmask            ( QUAD0_RX2_ch_rxdapiresetmask),
       .QUAD0_RX2_qpien                    ( QUAD0_RX2_ch_rxqpien),
       .QUAD0_TX2_dapiresetdone            ( QUAD0_TX2_ch_txdapiresetdone),
       .QUAD0_TX2_debugpcsout              ( QUAD0_TX2_ch_txdebugpcsout),
       .QUAD0_TX2_qpisenn                  ( QUAD0_TX2_ch_txqpisenn),
       .QUAD0_TX2_qpisenp                  ( QUAD0_TX2_ch_txqpisenp),
       .QUAD0_TX2_simplexphystatus         ( QUAD0_TX2_ch_txsimplexphystatus),
       .QUAD0_TX2_swingouthigh             ( QUAD0_TX2_ch_txswingouthigh),
       .QUAD0_TX2_swingoutlow              ( QUAD0_TX2_ch_txswingoutlow),
       .QUAD0_TX2_dapireset                ( QUAD0_TX2_ch_txdapireset),
       .QUAD0_TX2_dapiresetmask            ( QUAD0_TX2_ch_txdapiresetmask),
       .QUAD0_TX2_qpibiasen                ( QUAD0_TX2_ch_txqpibiasen),
       .QUAD0_TX2_qpiweakpu                ( QUAD0_TX2_ch_txqpiweakpu),
       .QUAD0_RX2_10gstat                  ( QUAD0_RX2_ch_rx10gstat),
       .QUAD0_RX2_byteisaligned            ( QUAD0_RX2_ch_rxbyteisaligned),
       .QUAD0_RX2_byterealign              ( QUAD0_RX2_ch_rxbyterealign),
       .QUAD0_RX2_chanbondseq              ( QUAD0_RX2_ch_rxchanbondseq),
       .QUAD0_RX2_chanisaligned            ( QUAD0_RX2_ch_rxchanisaligned),
       .QUAD0_RX2_chanrealign              ( QUAD0_RX2_ch_rxchanrealign),
       .QUAD0_RX2_chbondo                  ( QUAD0_RX2_ch_rxchbondo),
       .QUAD0_RX2_clkcorcnt                ( QUAD0_RX2_ch_rxclkcorcnt),
       .QUAD0_RX2_cominitdet               ( QUAD0_RX2_ch_rxcominitdet),
       .QUAD0_RX2_commadet                 ( QUAD0_RX2_ch_rxcommadet),
       .QUAD0_RX2_comsasdet                ( QUAD0_RX2_ch_rxcomsasdet),
       .QUAD0_RX2_comwakedet               ( QUAD0_RX2_ch_rxcomwakedet),
       .QUAD0_RX2_ctrl0                    ( QUAD0_RX2_ch_rxctrl0),
       .QUAD0_RX2_ctrl1                    ( QUAD0_RX2_ch_rxctrl1),
       .QUAD0_RX2_ctrl2                    ( QUAD0_RX2_ch_rxctrl2),
       .QUAD0_RX2_ctrl3                    ( QUAD0_RX2_ch_rxctrl3),
       .QUAD0_RX2_datavalid                ( QUAD0_RX2_ch_rxdatavalid),
       .QUAD0_RX2_dlyalignerr              ( QUAD0_RX2_ch_rxdlyalignerr),
       .QUAD0_RX2_dlyalignprog             ( QUAD0_RX2_ch_rxdlyalignprog),
       .QUAD0_RX2_elecidle                 ( QUAD0_RX2_ch_rxelecidle),
       .QUAD0_RX2_finealigndone            ( QUAD0_RX2_ch_rxfinealigndone),
       .QUAD0_RX2_header                   ( QUAD0_RX2_ch_rxheader),
       .QUAD0_RX2_headervalid              ( QUAD0_RX2_ch_rxheadervalid),
       .QUAD0_RX2_osintdone                ( QUAD0_RX2_ch_rxosintdone),
       .QUAD0_RX2_phaligndone              ( QUAD0_RX2_ch_rxphaligndone),
       .QUAD0_RX2_phalignerr               ( QUAD0_RX2_ch_rxphalignerr),
       .QUAD0_RX2_phdlyresetdone           ( QUAD0_RX2_ch_rxphdlyresetdone),
       .QUAD0_RX2_phsetinitdone            ( QUAD0_RX2_ch_rxphsetinitdone),
       .QUAD0_RX2_phshift180done           ( QUAD0_RX2_ch_rxphshift180done),
       .QUAD0_RX2_sliderdy                 ( QUAD0_RX2_ch_rxsliderdy),
       .QUAD0_RX2_startofseq               ( QUAD0_RX2_ch_rxstartofseq),
       .QUAD0_RX2_status                   ( QUAD0_RX2_ch_rxstatus),
       .QUAD0_RX2_syncdone                 ( QUAD0_RX2_ch_rxsyncdone),
       .QUAD0_RX2_valid                    ( QUAD0_RX2_ch_rxvalid),
       .QUAD0_RX2_cdrbmcdrreq              ( QUAD0_RX2_ch_cdrbmcdrreq),
       .QUAD0_RX2_chbondi                  ( QUAD0_RX2_ch_rxchbondi),
       .QUAD0_RX2_dapicodeovrden           ( QUAD0_RX2_ch_rxdapicodeovrden),
       .QUAD0_RX2_dapicodereset            ( QUAD0_RX2_ch_rxdapicodereset),
       .QUAD0_RX2_dlyalignreq              ( QUAD0_RX2_ch_rxdlyalignreq),
       .QUAD0_RX2_eqtraining               ( QUAD0_RX2_ch_rxeqtraining),
       .QUAD0_RX2_gearboxslip              ( QUAD0_RX2_ch_rxgearboxslip),
       .QUAD0_RX2_lpmen                    ( QUAD0_RX2_ch_rxlpmen),
       .QUAD0_RX2_mldchaindone             ( QUAD0_RX2_ch_rxmldchaindone),
       .QUAD0_RX2_mldchainreq              ( QUAD0_RX2_ch_rxmldchainreq),
       .QUAD0_RX2_mlfinealignreq           ( QUAD0_RX2_ch_rxmlfinealignreq),
       .QUAD0_RX2_oobreset                 ( QUAD0_RX2_ch_rxoobreset),
       .QUAD0_RX2_phalignreq               ( QUAD0_RX2_ch_rxphalignreq),
       .QUAD0_RX2_phalignresetmask         ( QUAD0_RX2_ch_rxphalignresetmask),
       .QUAD0_RX2_phdlypd                  ( QUAD0_RX2_ch_rxphdlypd),
       .QUAD0_RX2_phdlyreset               ( QUAD0_RX2_ch_rxphdlyreset),
       .QUAD0_RX2_phsetinitreq             ( QUAD0_RX2_ch_rxphsetinitreq),
       .QUAD0_RX2_phshift180               ( QUAD0_RX2_ch_rxphshift180),
       .QUAD0_RX2_slide                    ( QUAD0_RX2_ch_rxslide),
       .QUAD0_RX2_syncallin                ( QUAD0_RX2_ch_rxsyncallin),
       .QUAD0_RX2_termination              ( QUAD0_RX2_ch_rxtermination),
       .QUAD0_RX2_eyescandataerror         ( QUAD0_RX2_ch_eyescandataerror), 
       .QUAD0_RX2_cdrfreqos                ( QUAD0_RX2_ch_cdrfreqos),
       .QUAD0_RX2_cdrincpctrl              ( QUAD0_RX2_ch_cdrincpctrl),
       .QUAD0_RX2_cdrstepdir               ( QUAD0_RX2_ch_cdrstepdir),
       .QUAD0_RX2_cdrstepsq                ( QUAD0_RX2_ch_cdrstepsq),
       .QUAD0_RX2_cdrstepsx                ( QUAD0_RX2_ch_cdrstepsx),
       .QUAD0_RX2_eyescanreset             ( QUAD0_RX2_ch_eyescanreset),
       .QUAD0_RX2_eyescantrigger           ( QUAD0_RX2_ch_eyescantrigger),
       .QUAD0_RX2_bufstatus                ( QUAD0_RX2_ch_rxbufstatus),
       .QUAD0_RX2_cdrlock                  ( QUAD0_RX2_ch_rxcdrlock),
       .QUAD0_RX2_cdrphdone                ( QUAD0_RX2_ch_rxcdrphdone),
       .QUAD0_RX2_data                     ( QUAD0_RX2_ch_rxdata),
       .QUAD0_RX2_pmaresetdone             ( QUAD0_RX2_ch_rxpmaresetdone),
       .QUAD0_RX2_prbserr                  ( QUAD0_RX2_ch_rxprbserr),
       .QUAD0_RX2_prbslocked               ( QUAD0_RX2_ch_rxprbslocked),
       .QUAD0_RX2_progdivresetdone         ( QUAD0_RX2_ch_rxprogdivresetdone),
       .QUAD0_RX2_resetdone                ( QUAD0_RX2_ch_rxresetdone),
       .QUAD0_RX2_gtrxreset                ( QUAD0_RX2_ch_gtrxreset),
       .QUAD0_RX2_cdrhold                  ( QUAD0_RX2_ch_rxcdrhold),
       .QUAD0_RX2_cdrovrden                ( QUAD0_RX2_ch_rxcdrovrden),
       .QUAD0_RX2_cdrreset                 ( QUAD0_RX2_ch_rxcdrreset),
       .QUAD0_RX2_latclk                   ( QUAD0_RX2_ch_rxlatclk),
       .QUAD0_RX2_pcsresetmask             ( QUAD0_RX2_ch_rxpcsresetmask),
       .QUAD0_RX2_pd                       ( QUAD0_RX2_ch_rxpd),
       .QUAD0_RX2_pmaresetmask             ( QUAD0_RX2_ch_rxpmaresetmask),
       .QUAD0_RX2_polarity                 ( QUAD0_RX2_ch_rxpolarity),
       .QUAD0_RX2_prbscntreset             ( QUAD0_RX2_ch_rxprbscntreset),
       .QUAD0_RX2_prbssel                  ( QUAD0_RX2_ch_rxprbssel),
       .QUAD0_RX2_progdivreset             ( QUAD0_RX2_ch_rxprogdivreset),
       .QUAD0_RX2_rate                     ( QUAD0_RX2_ch_rxrate),
       .QUAD0_RX2_resetmode                ( QUAD0_RX2_ch_rxresetmode),
       .QUAD0_RX2_userrdy                  ( QUAD0_RX2_ch_rxuserrdy),
       .QUAD0_RX2_usrclk                   ( QUAD0_RX2_usrclk),
       .QUAD0_RX2_mstresetdone             ( QUAD0_RX2_ch_rxmstresetdone),
       .QUAD0_RX2_mstreset                 ( QUAD0_RX2_ch_rxmstreset),
       .QUAD0_RX2_mstdatapathreset         ( QUAD0_RX2_ch_rxmstdatapathreset),

       .QUAD0_TX2_10gstat                  ( QUAD0_TX2_ch_tx10gstat),
       .QUAD0_TX2_comfinish                ( QUAD0_TX2_ch_txcomfinish),
       .QUAD0_TX2_dlyalignerr              ( QUAD0_TX2_ch_txdlyalignerr),
       .QUAD0_TX2_dlyalignprog             ( QUAD0_TX2_ch_txdlyalignprog),
       .QUAD0_TX2_phaligndone              ( QUAD0_TX2_ch_txphaligndone),
       .QUAD0_TX2_phalignerr               ( QUAD0_TX2_ch_txphalignerr),
       .QUAD0_TX2_phalignoutrsvd           ( QUAD0_TX2_ch_txphalignoutrsvd),
       .QUAD0_TX2_phdlyresetdone           ( QUAD0_TX2_ch_txphdlyresetdone),
       .QUAD0_TX2_phsetinitdone            ( QUAD0_TX2_ch_txphsetinitdone),
       .QUAD0_TX2_phshift180done           ( QUAD0_TX2_ch_txphshift180done),
       .QUAD0_TX2_syncdone                 ( QUAD0_TX2_ch_txsyncdone),
       .QUAD0_TX2_deemph                   ( QUAD0_TX2_ch_txdeemph),
       .QUAD0_TX2_detectrx                 ( QUAD0_TX2_ch_txdetectrx),
       .QUAD0_TX2_dapicodeovrden           ( QUAD0_TX2_ch_txdapicodeovrden),
       .QUAD0_TX2_dapicodereset            ( QUAD0_TX2_ch_txdapicodereset),
       .QUAD0_TX2_cominit                  ( QUAD0_TX2_ch_txcominit),
       .QUAD0_TX2_comsas                   ( QUAD0_TX2_ch_txcomsas),
       .QUAD0_TX2_comwake                  ( QUAD0_TX2_ch_txcomwake),
       .QUAD0_TX2_ctrl0                    ( QUAD0_TX2_ch_txctrl0),
       .QUAD0_TX2_ctrl1                    ( QUAD0_TX2_ch_txctrl1),
       .QUAD0_TX2_ctrl2                    ( QUAD0_TX2_ch_txctrl2),
       .QUAD0_TX2_diffctrl                 ( QUAD0_TX2_ch_txdiffctrl),
       .QUAD0_TX2_dlyalignreq              ( QUAD0_TX2_ch_txdlyalignreq),
       .QUAD0_TX2_elecidle                 ( QUAD0_TX2_ch_txelecidle),
       .QUAD0_TX2_header                   ( QUAD0_TX2_ch_txheader),
       .QUAD0_TX2_margin                   ( QUAD0_TX2_ch_txmargin),
       .QUAD0_TX2_mldchaindone             ( QUAD0_TX2_ch_txmldchaindone),
       .QUAD0_TX2_mldchainreq              ( QUAD0_TX2_ch_txmldchainreq),
       .QUAD0_TX2_oneszeros                ( QUAD0_TX2_ch_txoneszeros),
       .QUAD0_TX2_pausedelayalign          ( QUAD0_TX2_ch_txpausedelayalign),
       .QUAD0_TX2_phalignreq               ( QUAD0_TX2_ch_txphalignreq),
       .QUAD0_TX2_phalignresetmask         ( QUAD0_TX2_ch_txphalignresetmask),
       .QUAD0_TX2_phdlypd                  ( QUAD0_TX2_ch_txphdlypd),
       .QUAD0_TX2_phdlyreset               ( QUAD0_TX2_ch_txphdlyreset),
       .QUAD0_TX2_phdlytstclk              ( QUAD0_TX2_ch_txphdlytstclk),
       .QUAD0_TX2_phsetinitreq             ( QUAD0_TX2_ch_txphsetinitreq),
       .QUAD0_TX2_phshift180               ( QUAD0_TX2_ch_txphshift180),
       .QUAD0_TX2_picodeovrden             ( QUAD0_TX2_ch_txpicodeovrden),
       .QUAD0_TX2_picodereset              ( QUAD0_TX2_ch_txpicodereset),
       .QUAD0_TX2_pippmen                  ( QUAD0_TX2_ch_txpippmen),
       .QUAD0_TX2_pippmstepsize            ( QUAD0_TX2_ch_txpippmstepsize),
       .QUAD0_TX2_sequence                 ( QUAD0_TX2_ch_txsequence),
       .QUAD0_TX2_swing                    ( QUAD0_TX2_ch_txswing),
       .QUAD0_TX2_syncallin                ( QUAD0_TX2_ch_txsyncallin),
       .QUAD0_TX2_bufstatus                ( QUAD0_TX2_ch_txbufstatus),
       .QUAD0_TX2_dccdone                  ( QUAD0_TX2_ch_txdccdone),
       .QUAD0_TX2_pmaresetdone             ( QUAD0_TX2_ch_txpmaresetdone),
       .QUAD0_TX2_progdivresetdone         ( QUAD0_TX2_ch_txprogdivresetdone),
       .QUAD0_TX2_resetdone                ( QUAD0_TX2_ch_txresetdone),
       .QUAD0_TX2_gttxreset                ( QUAD0_TX2_ch_gttxreset),
       .QUAD0_TX2_data                     ( QUAD0_TX2_ch_txdata),
       .QUAD0_TX2_inhibit                  ( QUAD0_TX2_ch_txinhibit),
       .QUAD0_TX2_latclk                   ( QUAD0_TX2_ch_txlatclk),
       .QUAD0_TX2_maincursor               ( QUAD0_TX2_ch_txmaincursor),
       .QUAD0_TX2_pcsresetmask             ( QUAD0_TX2_ch_txpcsresetmask),
       .QUAD0_TX2_pd                       ( QUAD0_TX2_ch_txpd),
       .QUAD0_TX2_pisopd                   ( QUAD0_TX2_ch_txpisopd),
       .QUAD0_TX2_pmaresetmask             ( QUAD0_TX2_ch_txpmaresetmask),
       .QUAD0_TX2_polarity                 ( QUAD0_TX2_ch_txpolarity),
       .QUAD0_TX2_postcursor               ( QUAD0_TX2_ch_txpostcursor),
       .QUAD0_TX2_prbsforceerr             ( QUAD0_TX2_ch_txprbsforceerr),
       .QUAD0_TX2_prbssel                  ( QUAD0_TX2_ch_txprbssel),
       .QUAD0_TX2_precursor                ( QUAD0_TX2_ch_txprecursor),
       .QUAD0_TX2_progdivreset             ( QUAD0_TX2_ch_txprogdivreset),
       .QUAD0_TX2_rate                     ( QUAD0_TX2_ch_txrate),
       .QUAD0_TX2_resetmode                ( QUAD0_TX2_ch_txresetmode),
       .QUAD0_TX2_userrdy                  ( QUAD0_TX2_ch_txuserrdy),
       .QUAD0_TX2_usrclk                   ( QUAD0_TX2_usrclk),
       .QUAD0_TX2_mstresetdone             ( QUAD0_TX2_ch_txmstresetdone),
       .QUAD0_TX2_mstreset                 ( QUAD0_TX2_ch_txmstreset),
       .QUAD0_TX2_mstdatapathreset         ( QUAD0_TX2_ch_txmstdatapathreset),
       .QUAD0_ch3_xpipe5_pipeline_en       ( ),
       .QUAD0_RX3_refdebugout              ( QUAD0_RX3_ch_refdebugout),      
       .QUAD0_RX3_dapiresetdone            ( QUAD0_RX3_ch_rxdapiresetdone),
       .QUAD0_RX3_debugpcsout              ( QUAD0_RX3_ch_rxdebugpcsout),
       .QUAD0_RX3_pkdet                    ( QUAD0_RX3_ch_rxpkdet),
       .QUAD0_RX3_qpisenn                  ( QUAD0_RX3_ch_rxqpisenn),
       .QUAD0_RX3_qpisenp                  ( QUAD0_RX3_ch_rxqpisenp),
       .QUAD0_RX3_simplexphystatus         ( QUAD0_RX3_ch_rxsimplexphystatus),
       .QUAD0_RX3_slipdone                 ( QUAD0_RX3_ch_rxslipdone),
       .QUAD0_RX3_dfehold                  ( QUAD0_RX3_ch_dfehold),
       .QUAD0_RX3_dfeovrd                  ( QUAD0_RX3_ch_dfeovrd),
       .QUAD0_RX3_dapireset                ( QUAD0_RX3_ch_rxdapireset),
       .QUAD0_RX3_dapiresetmask            ( QUAD0_RX3_ch_rxdapiresetmask),
       .QUAD0_RX3_qpien                    ( QUAD0_RX3_ch_rxqpien),
       .QUAD0_TX3_dapiresetdone            ( QUAD0_TX3_ch_txdapiresetdone),
       .QUAD0_TX3_debugpcsout              ( QUAD0_TX3_ch_txdebugpcsout),
       .QUAD0_TX3_qpisenn                  ( QUAD0_TX3_ch_txqpisenn),
       .QUAD0_TX3_qpisenp                  ( QUAD0_TX3_ch_txqpisenp),
       .QUAD0_TX3_simplexphystatus         ( QUAD0_TX3_ch_txsimplexphystatus),
       .QUAD0_TX3_swingouthigh             ( QUAD0_TX3_ch_txswingouthigh),
       .QUAD0_TX3_swingoutlow              ( QUAD0_TX3_ch_txswingoutlow),
       .QUAD0_TX3_dapireset                ( QUAD0_TX3_ch_txdapireset),
       .QUAD0_TX3_dapiresetmask            ( QUAD0_TX3_ch_txdapiresetmask),
       .QUAD0_TX3_qpibiasen                ( QUAD0_TX3_ch_txqpibiasen),
       .QUAD0_TX3_qpiweakpu                ( QUAD0_TX3_ch_txqpiweakpu),
       .QUAD0_RX3_10gstat                  ( QUAD0_RX3_ch_rx10gstat),
       .QUAD0_RX3_byteisaligned            ( QUAD0_RX3_ch_rxbyteisaligned),
       .QUAD0_RX3_byterealign              ( QUAD0_RX3_ch_rxbyterealign),
       .QUAD0_RX3_chanbondseq              ( QUAD0_RX3_ch_rxchanbondseq),
       .QUAD0_RX3_chanisaligned            ( QUAD0_RX3_ch_rxchanisaligned),
       .QUAD0_RX3_chanrealign              ( QUAD0_RX3_ch_rxchanrealign),
       .QUAD0_RX3_chbondo                  ( QUAD0_RX3_ch_rxchbondo),
       .QUAD0_RX3_clkcorcnt                ( QUAD0_RX3_ch_rxclkcorcnt),
       .QUAD0_RX3_cominitdet               ( QUAD0_RX3_ch_rxcominitdet),
       .QUAD0_RX3_commadet                 ( QUAD0_RX3_ch_rxcommadet),
       .QUAD0_RX3_comsasdet                ( QUAD0_RX3_ch_rxcomsasdet),
       .QUAD0_RX3_comwakedet               ( QUAD0_RX3_ch_rxcomwakedet),
       .QUAD0_RX3_ctrl0                    ( QUAD0_RX3_ch_rxctrl0),
       .QUAD0_RX3_ctrl1                    ( QUAD0_RX3_ch_rxctrl1),
       .QUAD0_RX3_ctrl2                    ( QUAD0_RX3_ch_rxctrl2),
       .QUAD0_RX3_ctrl3                    ( QUAD0_RX3_ch_rxctrl3),
       .QUAD0_RX3_datavalid                ( QUAD0_RX3_ch_rxdatavalid),
       .QUAD0_RX3_dlyalignerr              ( QUAD0_RX3_ch_rxdlyalignerr),
       .QUAD0_RX3_dlyalignprog             ( QUAD0_RX3_ch_rxdlyalignprog),
       .QUAD0_RX3_elecidle                 ( QUAD0_RX3_ch_rxelecidle),
       .QUAD0_RX3_finealigndone            ( QUAD0_RX3_ch_rxfinealigndone),
       .QUAD0_RX3_header                   ( QUAD0_RX3_ch_rxheader),
       .QUAD0_RX3_headervalid              ( QUAD0_RX3_ch_rxheadervalid),
       .QUAD0_RX3_osintdone                ( QUAD0_RX3_ch_rxosintdone),
       .QUAD0_RX3_phaligndone              ( QUAD0_RX3_ch_rxphaligndone),
       .QUAD0_RX3_phalignerr               ( QUAD0_RX3_ch_rxphalignerr),
       .QUAD0_RX3_phdlyresetdone           ( QUAD0_RX3_ch_rxphdlyresetdone),
       .QUAD0_RX3_phsetinitdone            ( QUAD0_RX3_ch_rxphsetinitdone),
       .QUAD0_RX3_phshift180done           ( QUAD0_RX3_ch_rxphshift180done),
       .QUAD0_RX3_sliderdy                 ( QUAD0_RX3_ch_rxsliderdy),
       .QUAD0_RX3_startofseq               ( QUAD0_RX3_ch_rxstartofseq),
       .QUAD0_RX3_status                   ( QUAD0_RX3_ch_rxstatus),
       .QUAD0_RX3_syncdone                 ( QUAD0_RX3_ch_rxsyncdone),
       .QUAD0_RX3_valid                    ( QUAD0_RX3_ch_rxvalid),
       .QUAD0_RX3_cdrbmcdrreq              ( QUAD0_RX3_ch_cdrbmcdrreq),
       .QUAD0_RX3_chbondi                  ( QUAD0_RX3_ch_rxchbondi),
       .QUAD0_RX3_dapicodeovrden           ( QUAD0_RX3_ch_rxdapicodeovrden),
       .QUAD0_RX3_dapicodereset            ( QUAD0_RX3_ch_rxdapicodereset),
       .QUAD0_RX3_dlyalignreq              ( QUAD0_RX3_ch_rxdlyalignreq),
       .QUAD0_RX3_eqtraining               ( QUAD0_RX3_ch_rxeqtraining),
       .QUAD0_RX3_gearboxslip              ( QUAD0_RX3_ch_rxgearboxslip),
       .QUAD0_RX3_lpmen                    ( QUAD0_RX3_ch_rxlpmen),
       .QUAD0_RX3_mldchaindone             ( QUAD0_RX3_ch_rxmldchaindone),
       .QUAD0_RX3_mldchainreq              ( QUAD0_RX3_ch_rxmldchainreq),
       .QUAD0_RX3_mlfinealignreq           ( QUAD0_RX3_ch_rxmlfinealignreq),
       .QUAD0_RX3_oobreset                 ( QUAD0_RX3_ch_rxoobreset),
       .QUAD0_RX3_phalignreq               ( QUAD0_RX3_ch_rxphalignreq),
       .QUAD0_RX3_phalignresetmask         ( QUAD0_RX3_ch_rxphalignresetmask),
       .QUAD0_RX3_phdlypd                  ( QUAD0_RX3_ch_rxphdlypd),
       .QUAD0_RX3_phdlyreset               ( QUAD0_RX3_ch_rxphdlyreset),
       .QUAD0_RX3_phsetinitreq             ( QUAD0_RX3_ch_rxphsetinitreq),
       .QUAD0_RX3_phshift180               ( QUAD0_RX3_ch_rxphshift180),
       .QUAD0_RX3_slide                    ( QUAD0_RX3_ch_rxslide),
       .QUAD0_RX3_syncallin                ( QUAD0_RX3_ch_rxsyncallin),
       .QUAD0_RX3_termination              ( QUAD0_RX3_ch_rxtermination),
       .QUAD0_RX3_eyescandataerror         ( QUAD0_RX3_ch_eyescandataerror), 
       .QUAD0_RX3_cdrfreqos                ( QUAD0_RX3_ch_cdrfreqos),
       .QUAD0_RX3_cdrincpctrl              ( QUAD0_RX3_ch_cdrincpctrl),
       .QUAD0_RX3_cdrstepdir               ( QUAD0_RX3_ch_cdrstepdir),
       .QUAD0_RX3_cdrstepsq                ( QUAD0_RX3_ch_cdrstepsq),
       .QUAD0_RX3_cdrstepsx                ( QUAD0_RX3_ch_cdrstepsx),
       .QUAD0_RX3_eyescanreset             ( QUAD0_RX3_ch_eyescanreset),
       .QUAD0_RX3_eyescantrigger           ( QUAD0_RX3_ch_eyescantrigger),
       .QUAD0_RX3_bufstatus                ( QUAD0_RX3_ch_rxbufstatus),
       .QUAD0_RX3_cdrlock                  ( QUAD0_RX3_ch_rxcdrlock),
       .QUAD0_RX3_cdrphdone                ( QUAD0_RX3_ch_rxcdrphdone),
       .QUAD0_RX3_data                     ( QUAD0_RX3_ch_rxdata),
       .QUAD0_RX3_pmaresetdone             ( QUAD0_RX3_ch_rxpmaresetdone),
       .QUAD0_RX3_prbserr                  ( QUAD0_RX3_ch_rxprbserr),
       .QUAD0_RX3_prbslocked               ( QUAD0_RX3_ch_rxprbslocked),
       .QUAD0_RX3_progdivresetdone         ( QUAD0_RX3_ch_rxprogdivresetdone),
       .QUAD0_RX3_resetdone                ( QUAD0_RX3_ch_rxresetdone),
       .QUAD0_RX3_gtrxreset                ( QUAD0_RX3_ch_gtrxreset),
       .QUAD0_RX3_cdrhold                  ( QUAD0_RX3_ch_rxcdrhold),
       .QUAD0_RX3_cdrovrden                ( QUAD0_RX3_ch_rxcdrovrden),
       .QUAD0_RX3_cdrreset                 ( QUAD0_RX3_ch_rxcdrreset),
       .QUAD0_RX3_latclk                   ( QUAD0_RX3_ch_rxlatclk),
       .QUAD0_RX3_pcsresetmask             ( QUAD0_RX3_ch_rxpcsresetmask),
       .QUAD0_RX3_pd                       ( QUAD0_RX3_ch_rxpd),
       .QUAD0_RX3_pmaresetmask             ( QUAD0_RX3_ch_rxpmaresetmask),
       .QUAD0_RX3_polarity                 ( QUAD0_RX3_ch_rxpolarity),
       .QUAD0_RX3_prbscntreset             ( QUAD0_RX3_ch_rxprbscntreset),
       .QUAD0_RX3_prbssel                  ( QUAD0_RX3_ch_rxprbssel),
       .QUAD0_RX3_progdivreset             ( QUAD0_RX3_ch_rxprogdivreset),
       .QUAD0_RX3_rate                     ( QUAD0_RX3_ch_rxrate),
       .QUAD0_RX3_resetmode                ( QUAD0_RX3_ch_rxresetmode),
       .QUAD0_RX3_userrdy                  ( QUAD0_RX3_ch_rxuserrdy),
       .QUAD0_RX3_usrclk                   ( QUAD0_RX3_usrclk),
       .QUAD0_RX3_mstresetdone             ( QUAD0_RX3_ch_rxmstresetdone),
       .QUAD0_RX3_mstreset                 ( QUAD0_RX3_ch_rxmstreset),
       .QUAD0_RX3_mstdatapathreset         ( QUAD0_RX3_ch_rxmstdatapathreset),

       .QUAD0_TX3_10gstat                  ( QUAD0_TX3_ch_tx10gstat),
       .QUAD0_TX3_comfinish                ( QUAD0_TX3_ch_txcomfinish),
       .QUAD0_TX3_dlyalignerr              ( QUAD0_TX3_ch_txdlyalignerr),
       .QUAD0_TX3_dlyalignprog             ( QUAD0_TX3_ch_txdlyalignprog),
       .QUAD0_TX3_phaligndone              ( QUAD0_TX3_ch_txphaligndone),
       .QUAD0_TX3_phalignerr               ( QUAD0_TX3_ch_txphalignerr),
       .QUAD0_TX3_phalignoutrsvd           ( QUAD0_TX3_ch_txphalignoutrsvd),
       .QUAD0_TX3_phdlyresetdone           ( QUAD0_TX3_ch_txphdlyresetdone),
       .QUAD0_TX3_phsetinitdone            ( QUAD0_TX3_ch_txphsetinitdone),
       .QUAD0_TX3_phshift180done           ( QUAD0_TX3_ch_txphshift180done),
       .QUAD0_TX3_syncdone                 ( QUAD0_TX3_ch_txsyncdone),
       .QUAD0_TX3_deemph                   ( QUAD0_TX3_ch_txdeemph),
       .QUAD0_TX3_detectrx                 ( QUAD0_TX3_ch_txdetectrx),
       .QUAD0_TX3_dapicodeovrden           ( QUAD0_TX3_ch_txdapicodeovrden),
       .QUAD0_TX3_dapicodereset            ( QUAD0_TX3_ch_txdapicodereset),
       .QUAD0_TX3_cominit                  ( QUAD0_TX3_ch_txcominit),
       .QUAD0_TX3_comsas                   ( QUAD0_TX3_ch_txcomsas),
       .QUAD0_TX3_comwake                  ( QUAD0_TX3_ch_txcomwake),
       .QUAD0_TX3_ctrl0                    ( QUAD0_TX3_ch_txctrl0),
       .QUAD0_TX3_ctrl1                    ( QUAD0_TX3_ch_txctrl1),
       .QUAD0_TX3_ctrl2                    ( QUAD0_TX3_ch_txctrl2),
       .QUAD0_TX3_diffctrl                 ( QUAD0_TX3_ch_txdiffctrl),
       .QUAD0_TX3_dlyalignreq              ( QUAD0_TX3_ch_txdlyalignreq),
       .QUAD0_TX3_elecidle                 ( QUAD0_TX3_ch_txelecidle),
       .QUAD0_TX3_header                   ( QUAD0_TX3_ch_txheader),
       .QUAD0_TX3_margin                   ( QUAD0_TX3_ch_txmargin),
       .QUAD0_TX3_mldchaindone             ( QUAD0_TX3_ch_txmldchaindone),
       .QUAD0_TX3_mldchainreq              ( QUAD0_TX3_ch_txmldchainreq),
       .QUAD0_TX3_oneszeros                ( QUAD0_TX3_ch_txoneszeros),
       .QUAD0_TX3_pausedelayalign          ( QUAD0_TX3_ch_txpausedelayalign),
       .QUAD0_TX3_phalignreq               ( QUAD0_TX3_ch_txphalignreq),
       .QUAD0_TX3_phalignresetmask         ( QUAD0_TX3_ch_txphalignresetmask),
       .QUAD0_TX3_phdlypd                  ( QUAD0_TX3_ch_txphdlypd),
       .QUAD0_TX3_phdlyreset               ( QUAD0_TX3_ch_txphdlyreset),
       .QUAD0_TX3_phdlytstclk              ( QUAD0_TX3_ch_txphdlytstclk),
       .QUAD0_TX3_phsetinitreq             ( QUAD0_TX3_ch_txphsetinitreq),
       .QUAD0_TX3_phshift180               ( QUAD0_TX3_ch_txphshift180),
       .QUAD0_TX3_picodeovrden             ( QUAD0_TX3_ch_txpicodeovrden),
       .QUAD0_TX3_picodereset              ( QUAD0_TX3_ch_txpicodereset),
       .QUAD0_TX3_pippmen                  ( QUAD0_TX3_ch_txpippmen),
       .QUAD0_TX3_pippmstepsize            ( QUAD0_TX3_ch_txpippmstepsize),
       .QUAD0_TX3_sequence                 ( QUAD0_TX3_ch_txsequence),
       .QUAD0_TX3_swing                    ( QUAD0_TX3_ch_txswing),
       .QUAD0_TX3_syncallin                ( QUAD0_TX3_ch_txsyncallin),
       .QUAD0_TX3_bufstatus                ( QUAD0_TX3_ch_txbufstatus),
       .QUAD0_TX3_dccdone                  ( QUAD0_TX3_ch_txdccdone),
       .QUAD0_TX3_pmaresetdone             ( QUAD0_TX3_ch_txpmaresetdone),
       .QUAD0_TX3_progdivresetdone         ( QUAD0_TX3_ch_txprogdivresetdone),
       .QUAD0_TX3_resetdone                ( QUAD0_TX3_ch_txresetdone),
       .QUAD0_TX3_gttxreset                ( QUAD0_TX3_ch_gttxreset),
       .QUAD0_TX3_data                     ( QUAD0_TX3_ch_txdata),
       .QUAD0_TX3_inhibit                  ( QUAD0_TX3_ch_txinhibit),
       .QUAD0_TX3_latclk                   ( QUAD0_TX3_ch_txlatclk),
       .QUAD0_TX3_maincursor               ( QUAD0_TX3_ch_txmaincursor),
       .QUAD0_TX3_pcsresetmask             ( QUAD0_TX3_ch_txpcsresetmask),
       .QUAD0_TX3_pd                       ( QUAD0_TX3_ch_txpd),
       .QUAD0_TX3_pisopd                   ( QUAD0_TX3_ch_txpisopd),
       .QUAD0_TX3_pmaresetmask             ( QUAD0_TX3_ch_txpmaresetmask),
       .QUAD0_TX3_polarity                 ( QUAD0_TX3_ch_txpolarity),
       .QUAD0_TX3_postcursor               ( QUAD0_TX3_ch_txpostcursor),
       .QUAD0_TX3_prbsforceerr             ( QUAD0_TX3_ch_txprbsforceerr),
       .QUAD0_TX3_prbssel                  ( QUAD0_TX3_ch_txprbssel),
       .QUAD0_TX3_precursor                ( QUAD0_TX3_ch_txprecursor),
       .QUAD0_TX3_progdivreset             ( QUAD0_TX3_ch_txprogdivreset),
       .QUAD0_TX3_rate                     ( QUAD0_TX3_ch_txrate),
       .QUAD0_TX3_resetmode                ( QUAD0_TX3_ch_txresetmode),
       .QUAD0_TX3_userrdy                  ( QUAD0_TX3_ch_txuserrdy),
       .QUAD0_TX3_usrclk                   ( QUAD0_TX3_usrclk),
       .QUAD0_TX3_mstresetdone             ( QUAD0_TX3_ch_txmstresetdone),
       .QUAD0_TX3_mstreset                 ( QUAD0_TX3_ch_txmstreset),
       .QUAD0_TX3_mstdatapathreset         ( QUAD0_TX3_ch_txmstdatapathreset),

       .QUAD0_gtpowergood                  ( QUAD0_gtpowergood)

);
endmodule
