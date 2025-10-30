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


// IP VLNV: xilinx.com:ip:gt_quad_base:1.1
// IP Revision: 16

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module extended_phy_layer_gtwiz_versal_0_0_gt_quad_base_0 (
  rxmarginclk,
  hsclk0_lcpllreset,
  hsclk0_rpllreset,
  hsclk1_lcpllreset,
  hsclk1_rpllreset,
  hsclk0_lcplllock,
  hsclk1_lcplllock,
  hsclk0_rplllock,
  hsclk1_rplllock,
  gtpowergood,
  ch0_pcierstb,
  ch1_pcierstb,
  ch2_pcierstb,
  ch3_pcierstb,
  pcielinkreachtarget,
  pcieltssm,
  rxmarginreqack,
  rxmarginrescmd,
  rxmarginreslanenum,
  rxmarginrespayld,
  rxmarginresreq,
  rxmarginreqcmd,
  rxmarginreqlanenum,
  rxmarginreqpayld,
  rxmarginreqreq,
  rxmarginresack,
  ch0_iloreset,
  ch1_iloreset,
  ch2_iloreset,
  ch3_iloreset,
  ch0_iloresetdone,
  ch1_iloresetdone,
  ch2_iloresetdone,
  ch3_iloresetdone,
  ch0_phystatus,
  ch1_phystatus,
  ch2_phystatus,
  ch3_phystatus,
  hsclk0_lcpllfbclklost,
  hsclk0_lcpllrefclklost,
  hsclk0_lcpllrefclkmonitor,
  hsclk0_rpllfbclklost,
  hsclk0_rpllrefclklost,
  hsclk0_rpllrefclkmonitor,
  hsclk1_lcpllfbclklost,
  hsclk1_lcpllrefclklost,
  hsclk1_lcpllrefclkmonitor,
  hsclk1_rpllfbclklost,
  hsclk1_rpllrefclklost,
  hsclk1_rpllrefclkmonitor,
  hsclk0_lcpllpd,
  hsclk0_rpllpd,
  hsclk0_lcpllresetbypassmode,
  hsclk0_lcpllsdmtoggle,
  hsclk0_rpllresetbypassmode,
  hsclk0_rpllsdmtoggle,
  hsclk1_lcpllpd,
  hsclk1_lcpllresetbypassmode,
  hsclk1_lcpllsdmtoggle,
  hsclk1_rpllpd,
  hsclk1_rpllresetbypassmode,
  hsclk1_rpllsdmtoggle,
  refclk0_gtrefclkpd,
  refclk1_gtrefclkpd,
  hsclk0_lcpllrefclksel,
  hsclk1_lcpllrefclksel,
  hsclk0_rpllrefclksel,
  hsclk1_rpllrefclksel,
  hsclk0_lcpllfbdiv,
  hsclk0_rpllfbdiv,
  hsclk1_lcpllfbdiv,
  hsclk1_rpllfbdiv,
  hsclk0_rxrecclkout0,
  hsclk0_rxrecclkout1,
  hsclk1_rxrecclkout0,
  hsclk1_rxrecclkout1,
  hsclk0_lcpllsdmdata,
  hsclk1_lcpllsdmdata,
  hsclk0_rpllsdmdata,
  hsclk1_rpllsdmdata,
  hsclk0_lcpllresetmask,
  hsclk1_lcpllresetmask,
  hsclk0_rpllresetmask,
  hsclk1_rpllresetmask,
  ch0_txdata,
  ch0_txheader,
  ch0_txsequence,
  ch0_gttxreset,
  ch0_txprogdivreset,
  ch0_txuserrdy,
  ch0_txphalignresetmask,
  ch0_txcominit,
  ch0_txcomsas,
  ch0_txcomwake,
  ch0_txdapicodeovrden,
  ch0_txdapicodereset,
  ch0_txdetectrx,
  ch0_txlatclk,
  ch0_txphdlytstclk,
  ch0_txdlyalignreq,
  ch0_txelecidle,
  ch0_txinhibit,
  ch0_txmldchaindone,
  ch0_txmldchainreq,
  ch0_txoneszeros,
  ch0_txpausedelayalign,
  ch0_txpcsresetmask,
  ch0_txphalignreq,
  ch0_txphdlypd,
  ch0_txphdlyreset,
  ch0_txphsetinitreq,
  ch0_txphshift180,
  ch0_txpicodeovrden,
  ch0_txpicodereset,
  ch0_txpippmen,
  ch0_txpisopd,
  ch0_txpolarity,
  ch0_txprbsforceerr,
  ch0_txswing,
  ch0_txsyncallin,
  ch0_tx10gstat,
  ch0_txcomfinish,
  ch0_txdccdone,
  ch0_txdlyalignerr,
  ch0_txdlyalignprog,
  ch0_txphaligndone,
  ch0_txphalignerr,
  ch0_txphalignoutrsvd,
  ch0_txphdlyresetdone,
  ch0_txphsetinitdone,
  ch0_txphshift180done,
  ch0_txsyncdone,
  ch0_txbufstatus,
  ch0_txctrl0,
  ch0_txctrl1,
  ch0_txdeemph,
  ch0_txpd,
  ch0_txresetmode,
  ch0_txmstreset,
  ch0_txmstdatapathreset,
  ch0_txmstresetdone,
  ch0_txmargin,
  ch0_txpmaresetmask,
  ch0_txprbssel,
  ch0_txdiffctrl,
  ch0_txpippmstepsize,
  ch0_txpostcursor,
  ch0_txprecursor,
  ch0_txmaincursor,
  ch0_txctrl2,
  ch0_txrate,
  ch0_txprogdivresetdone,
  ch0_txpmaresetdone,
  ch0_txresetdone,
  ch0_txdapiresetdone,
  ch0_txdebugpcsout,
  ch0_txqpisenn,
  ch0_txqpisenp,
  ch0_txsimplexphystatus,
  ch0_txswingouthigh,
  ch0_txswingoutlow,
  ch0_txdapireset,
  ch0_txdapiresetmask,
  ch0_txqpibiasen,
  ch0_txqpiweakpu,
  ch0_txoutclk,
  ch0_txusrclk,
  ch1_txdata,
  ch1_txheader,
  ch1_txsequence,
  ch1_gttxreset,
  ch1_txprogdivreset,
  ch1_txuserrdy,
  ch1_txphalignresetmask,
  ch1_txcominit,
  ch1_txcomsas,
  ch1_txcomwake,
  ch1_txdapicodeovrden,
  ch1_txdapicodereset,
  ch1_txdetectrx,
  ch1_txlatclk,
  ch1_txphdlytstclk,
  ch1_txdlyalignreq,
  ch1_txelecidle,
  ch1_txinhibit,
  ch1_txmldchaindone,
  ch1_txmldchainreq,
  ch1_txoneszeros,
  ch1_txpausedelayalign,
  ch1_txpcsresetmask,
  ch1_txphalignreq,
  ch1_txphdlypd,
  ch1_txphdlyreset,
  ch1_txphsetinitreq,
  ch1_txphshift180,
  ch1_txpicodeovrden,
  ch1_txpicodereset,
  ch1_txpippmen,
  ch1_txpisopd,
  ch1_txpolarity,
  ch1_txprbsforceerr,
  ch1_txswing,
  ch1_txsyncallin,
  ch1_tx10gstat,
  ch1_txcomfinish,
  ch1_txdccdone,
  ch1_txdlyalignerr,
  ch1_txdlyalignprog,
  ch1_txphaligndone,
  ch1_txphalignerr,
  ch1_txphalignoutrsvd,
  ch1_txphdlyresetdone,
  ch1_txphsetinitdone,
  ch1_txphshift180done,
  ch1_txsyncdone,
  ch1_txbufstatus,
  ch1_txctrl0,
  ch1_txctrl1,
  ch1_txdeemph,
  ch1_txpd,
  ch1_txresetmode,
  ch1_txmstreset,
  ch1_txmstdatapathreset,
  ch1_txmstresetdone,
  ch1_txmargin,
  ch1_txpmaresetmask,
  ch1_txprbssel,
  ch1_txdiffctrl,
  ch1_txpippmstepsize,
  ch1_txpostcursor,
  ch1_txprecursor,
  ch1_txmaincursor,
  ch1_txctrl2,
  ch1_txrate,
  ch1_txprogdivresetdone,
  ch1_txpmaresetdone,
  ch1_txresetdone,
  ch1_txdapiresetdone,
  ch1_txdebugpcsout,
  ch1_txqpisenn,
  ch1_txqpisenp,
  ch1_txsimplexphystatus,
  ch1_txswingouthigh,
  ch1_txswingoutlow,
  ch1_txdapireset,
  ch1_txdapiresetmask,
  ch1_txqpibiasen,
  ch1_txqpiweakpu,
  ch1_txoutclk,
  ch1_txusrclk,
  ch2_txdata,
  ch2_txheader,
  ch2_txsequence,
  ch2_gttxreset,
  ch2_txprogdivreset,
  ch2_txuserrdy,
  ch2_txphalignresetmask,
  ch2_txcominit,
  ch2_txcomsas,
  ch2_txcomwake,
  ch2_txdapicodeovrden,
  ch2_txdapicodereset,
  ch2_txdetectrx,
  ch2_txlatclk,
  ch2_txphdlytstclk,
  ch2_txdlyalignreq,
  ch2_txelecidle,
  ch2_txinhibit,
  ch2_txmldchaindone,
  ch2_txmldchainreq,
  ch2_txoneszeros,
  ch2_txpausedelayalign,
  ch2_txpcsresetmask,
  ch2_txphalignreq,
  ch2_txphdlypd,
  ch2_txphdlyreset,
  ch2_txphsetinitreq,
  ch2_txphshift180,
  ch2_txpicodeovrden,
  ch2_txpicodereset,
  ch2_txpippmen,
  ch2_txpisopd,
  ch2_txpolarity,
  ch2_txprbsforceerr,
  ch2_txswing,
  ch2_txsyncallin,
  ch2_tx10gstat,
  ch2_txcomfinish,
  ch2_txdccdone,
  ch2_txdlyalignerr,
  ch2_txdlyalignprog,
  ch2_txphaligndone,
  ch2_txphalignerr,
  ch2_txphalignoutrsvd,
  ch2_txphdlyresetdone,
  ch2_txphsetinitdone,
  ch2_txphshift180done,
  ch2_txsyncdone,
  ch2_txbufstatus,
  ch2_txctrl0,
  ch2_txctrl1,
  ch2_txdeemph,
  ch2_txpd,
  ch2_txresetmode,
  ch2_txmstreset,
  ch2_txmstdatapathreset,
  ch2_txmstresetdone,
  ch2_txmargin,
  ch2_txpmaresetmask,
  ch2_txprbssel,
  ch2_txdiffctrl,
  ch2_txpippmstepsize,
  ch2_txpostcursor,
  ch2_txprecursor,
  ch2_txmaincursor,
  ch2_txctrl2,
  ch2_txrate,
  ch2_txprogdivresetdone,
  ch2_txpmaresetdone,
  ch2_txresetdone,
  ch2_txdapiresetdone,
  ch2_txdebugpcsout,
  ch2_txqpisenn,
  ch2_txqpisenp,
  ch2_txsimplexphystatus,
  ch2_txswingouthigh,
  ch2_txswingoutlow,
  ch2_txdapireset,
  ch2_txdapiresetmask,
  ch2_txqpibiasen,
  ch2_txqpiweakpu,
  ch2_txoutclk,
  ch2_txusrclk,
  ch3_txdata,
  ch3_txheader,
  ch3_txsequence,
  ch3_gttxreset,
  ch3_txprogdivreset,
  ch3_txuserrdy,
  ch3_txphalignresetmask,
  ch3_txcominit,
  ch3_txcomsas,
  ch3_txcomwake,
  ch3_txdapicodeovrden,
  ch3_txdapicodereset,
  ch3_txdetectrx,
  ch3_txlatclk,
  ch3_txphdlytstclk,
  ch3_txdlyalignreq,
  ch3_txelecidle,
  ch3_txinhibit,
  ch3_txmldchaindone,
  ch3_txmldchainreq,
  ch3_txoneszeros,
  ch3_txpausedelayalign,
  ch3_txpcsresetmask,
  ch3_txphalignreq,
  ch3_txphdlypd,
  ch3_txphdlyreset,
  ch3_txphsetinitreq,
  ch3_txphshift180,
  ch3_txpicodeovrden,
  ch3_txpicodereset,
  ch3_txpippmen,
  ch3_txpisopd,
  ch3_txpolarity,
  ch3_txprbsforceerr,
  ch3_txswing,
  ch3_txsyncallin,
  ch3_tx10gstat,
  ch3_txcomfinish,
  ch3_txdccdone,
  ch3_txdlyalignerr,
  ch3_txdlyalignprog,
  ch3_txphaligndone,
  ch3_txphalignerr,
  ch3_txphalignoutrsvd,
  ch3_txphdlyresetdone,
  ch3_txphsetinitdone,
  ch3_txphshift180done,
  ch3_txsyncdone,
  ch3_txbufstatus,
  ch3_txctrl0,
  ch3_txctrl1,
  ch3_txdeemph,
  ch3_txpd,
  ch3_txresetmode,
  ch3_txmstreset,
  ch3_txmstdatapathreset,
  ch3_txmstresetdone,
  ch3_txmargin,
  ch3_txpmaresetmask,
  ch3_txprbssel,
  ch3_txdiffctrl,
  ch3_txpippmstepsize,
  ch3_txpostcursor,
  ch3_txprecursor,
  ch3_txmaincursor,
  ch3_txctrl2,
  ch3_txrate,
  ch3_txprogdivresetdone,
  ch3_txpmaresetdone,
  ch3_txresetdone,
  ch3_txdapiresetdone,
  ch3_txdebugpcsout,
  ch3_txqpisenn,
  ch3_txqpisenp,
  ch3_txsimplexphystatus,
  ch3_txswingouthigh,
  ch3_txswingoutlow,
  ch3_txdapireset,
  ch3_txdapiresetmask,
  ch3_txqpibiasen,
  ch3_txqpiweakpu,
  ch3_txoutclk,
  ch3_txusrclk,
  ch0_rxdata,
  ch0_rxdatavalid,
  ch0_rxheader,
  ch0_rxgearboxslip,
  ch0_rxlatclk,
  ch0_gtrxreset,
  ch0_rxprogdivreset,
  ch0_rxuserrdy,
  ch0_rxprogdivresetdone,
  ch0_rxpmaresetdone,
  ch0_rxresetdone,
  ch0_rx10gstat,
  ch0_rxbufstatus,
  ch0_rxbyteisaligned,
  ch0_rxbyterealign,
  ch0_rxcdrhold,
  ch0_rxcdrlock,
  ch0_rxcdrovrden,
  ch0_rxcdrphdone,
  ch0_rxcdrreset,
  ch0_rxchanbondseq,
  ch0_rxchanisaligned,
  ch0_rxchanrealign,
  ch0_rxchbondi,
  ch0_rxchbondo,
  ch0_rxclkcorcnt,
  ch0_rxcominitdet,
  ch0_rxcommadet,
  ch0_rxcomsasdet,
  ch0_rxcomwakedet,
  ch0_rxctrl0,
  ch0_rxctrl1,
  ch0_rxctrl2,
  ch0_rxctrl3,
  ch0_rxdapicodeovrden,
  ch0_rxdapicodereset,
  ch0_rxdlyalignerr,
  ch0_rxdlyalignprog,
  ch0_rxdlyalignreq,
  ch0_rxelecidle,
  ch0_rxeqtraining,
  ch0_rxfinealigndone,
  ch0_rxheadervalid,
  ch0_rxlpmen,
  ch0_rxmldchaindone,
  ch0_rxmldchainreq,
  ch0_rxmlfinealignreq,
  ch0_rxoobreset,
  ch0_rxosintdone,
  ch0_rxpcsresetmask,
  ch0_rxpd,
  ch0_rxphaligndone,
  ch0_rxphalignerr,
  ch0_rxphalignreq,
  ch0_rxphalignresetmask,
  ch0_rxphdlypd,
  ch0_rxphdlyreset,
  ch0_rxphdlyresetdone,
  ch0_rxphsetinitdone,
  ch0_rxphsetinitreq,
  ch0_rxphshift180,
  ch0_rxphshift180done,
  ch0_rxpmaresetmask,
  ch0_rxpolarity,
  ch0_rxprbscntreset,
  ch0_rxprbserr,
  ch0_rxprbslocked,
  ch0_rxprbssel,
  ch0_rxrate,
  ch0_rxresetmode,
  ch0_rxmstreset,
  ch0_rxmstdatapathreset,
  ch0_rxmstresetdone,
  ch0_rxslide,
  ch0_rxsliderdy,
  ch0_rxstartofseq,
  ch0_rxstatus,
  ch0_rxsyncallin,
  ch0_rxsyncdone,
  ch0_rxtermination,
  ch0_rxvalid,
  ch0_cdrbmcdrreq,
  ch0_cdrfreqos,
  ch0_cdrincpctrl,
  ch0_cdrstepdir,
  ch0_cdrstepsq,
  ch0_cdrstepsx,
  ch0_eyescanreset,
  ch0_eyescantrigger,
  ch0_eyescandataerror,
  ch0_refdebugout,
  ch0_rxdapiresetdone,
  ch0_rxdebugpcsout,
  ch0_rxpkdet,
  ch0_rxqpisenn,
  ch0_rxqpisenp,
  ch0_rxsimplexphystatus,
  ch0_rxslipdone,
  ch0_dfehold,
  ch0_dfeovrd,
  ch0_rxdapireset,
  ch0_rxdapiresetmask,
  ch0_rxqpien,
  ch0_rxoutclk,
  ch0_rxusrclk,
  ch1_rxdata,
  ch1_rxdatavalid,
  ch1_rxheader,
  ch1_rxgearboxslip,
  ch1_rxlatclk,
  ch1_gtrxreset,
  ch1_rxprogdivreset,
  ch1_rxuserrdy,
  ch1_rxprogdivresetdone,
  ch1_rxpmaresetdone,
  ch1_rxresetdone,
  ch1_rx10gstat,
  ch1_rxbufstatus,
  ch1_rxbyteisaligned,
  ch1_rxbyterealign,
  ch1_rxcdrhold,
  ch1_rxcdrlock,
  ch1_rxcdrovrden,
  ch1_rxcdrphdone,
  ch1_rxcdrreset,
  ch1_rxchanbondseq,
  ch1_rxchanisaligned,
  ch1_rxchanrealign,
  ch1_rxchbondi,
  ch1_rxchbondo,
  ch1_rxclkcorcnt,
  ch1_rxcominitdet,
  ch1_rxcommadet,
  ch1_rxcomsasdet,
  ch1_rxcomwakedet,
  ch1_rxctrl0,
  ch1_rxctrl1,
  ch1_rxctrl2,
  ch1_rxctrl3,
  ch1_rxdapicodeovrden,
  ch1_rxdapicodereset,
  ch1_rxdlyalignerr,
  ch1_rxdlyalignprog,
  ch1_rxdlyalignreq,
  ch1_rxelecidle,
  ch1_rxeqtraining,
  ch1_rxfinealigndone,
  ch1_rxheadervalid,
  ch1_rxlpmen,
  ch1_rxmldchaindone,
  ch1_rxmldchainreq,
  ch1_rxmlfinealignreq,
  ch1_rxoobreset,
  ch1_rxosintdone,
  ch1_rxpcsresetmask,
  ch1_rxpd,
  ch1_rxphaligndone,
  ch1_rxphalignerr,
  ch1_rxphalignreq,
  ch1_rxphalignresetmask,
  ch1_rxphdlypd,
  ch1_rxphdlyreset,
  ch1_rxphdlyresetdone,
  ch1_rxphsetinitdone,
  ch1_rxphsetinitreq,
  ch1_rxphshift180,
  ch1_rxphshift180done,
  ch1_rxpmaresetmask,
  ch1_rxpolarity,
  ch1_rxprbscntreset,
  ch1_rxprbserr,
  ch1_rxprbslocked,
  ch1_rxprbssel,
  ch1_rxrate,
  ch1_rxresetmode,
  ch1_rxmstreset,
  ch1_rxmstdatapathreset,
  ch1_rxmstresetdone,
  ch1_rxslide,
  ch1_rxsliderdy,
  ch1_rxstartofseq,
  ch1_rxstatus,
  ch1_rxsyncallin,
  ch1_rxsyncdone,
  ch1_rxtermination,
  ch1_rxvalid,
  ch1_cdrbmcdrreq,
  ch1_cdrfreqos,
  ch1_cdrincpctrl,
  ch1_cdrstepdir,
  ch1_cdrstepsq,
  ch1_cdrstepsx,
  ch1_eyescanreset,
  ch1_eyescantrigger,
  ch1_eyescandataerror,
  ch1_refdebugout,
  ch1_rxdapiresetdone,
  ch1_rxdebugpcsout,
  ch1_rxpkdet,
  ch1_rxqpisenn,
  ch1_rxqpisenp,
  ch1_rxsimplexphystatus,
  ch1_rxslipdone,
  ch1_dfehold,
  ch1_dfeovrd,
  ch1_rxdapireset,
  ch1_rxdapiresetmask,
  ch1_rxqpien,
  ch1_rxoutclk,
  ch1_rxusrclk,
  ch2_rxdata,
  ch2_rxdatavalid,
  ch2_rxheader,
  ch2_rxgearboxslip,
  ch2_rxlatclk,
  ch2_gtrxreset,
  ch2_rxprogdivreset,
  ch2_rxuserrdy,
  ch2_rxprogdivresetdone,
  ch2_rxpmaresetdone,
  ch2_rxresetdone,
  ch2_rx10gstat,
  ch2_rxbufstatus,
  ch2_rxbyteisaligned,
  ch2_rxbyterealign,
  ch2_rxcdrhold,
  ch2_rxcdrlock,
  ch2_rxcdrovrden,
  ch2_rxcdrphdone,
  ch2_rxcdrreset,
  ch2_rxchanbondseq,
  ch2_rxchanisaligned,
  ch2_rxchanrealign,
  ch2_rxchbondi,
  ch2_rxchbondo,
  ch2_rxclkcorcnt,
  ch2_rxcominitdet,
  ch2_rxcommadet,
  ch2_rxcomsasdet,
  ch2_rxcomwakedet,
  ch2_rxctrl0,
  ch2_rxctrl1,
  ch2_rxctrl2,
  ch2_rxctrl3,
  ch2_rxdapicodeovrden,
  ch2_rxdapicodereset,
  ch2_rxdlyalignerr,
  ch2_rxdlyalignprog,
  ch2_rxdlyalignreq,
  ch2_rxelecidle,
  ch2_rxeqtraining,
  ch2_rxfinealigndone,
  ch2_rxheadervalid,
  ch2_rxlpmen,
  ch2_rxmldchaindone,
  ch2_rxmldchainreq,
  ch2_rxmlfinealignreq,
  ch2_rxoobreset,
  ch2_rxosintdone,
  ch2_rxpcsresetmask,
  ch2_rxpd,
  ch2_rxphaligndone,
  ch2_rxphalignerr,
  ch2_rxphalignreq,
  ch2_rxphalignresetmask,
  ch2_rxphdlypd,
  ch2_rxphdlyreset,
  ch2_rxphdlyresetdone,
  ch2_rxphsetinitdone,
  ch2_rxphsetinitreq,
  ch2_rxphshift180,
  ch2_rxphshift180done,
  ch2_rxpmaresetmask,
  ch2_rxpolarity,
  ch2_rxprbscntreset,
  ch2_rxprbserr,
  ch2_rxprbslocked,
  ch2_rxprbssel,
  ch2_rxrate,
  ch2_rxresetmode,
  ch2_rxmstreset,
  ch2_rxmstdatapathreset,
  ch2_rxmstresetdone,
  ch2_rxslide,
  ch2_rxsliderdy,
  ch2_rxstartofseq,
  ch2_rxstatus,
  ch2_rxsyncallin,
  ch2_rxsyncdone,
  ch2_rxtermination,
  ch2_rxvalid,
  ch2_cdrbmcdrreq,
  ch2_cdrfreqos,
  ch2_cdrincpctrl,
  ch2_cdrstepdir,
  ch2_cdrstepsq,
  ch2_cdrstepsx,
  ch2_eyescanreset,
  ch2_eyescantrigger,
  ch2_eyescandataerror,
  ch2_refdebugout,
  ch2_rxdapiresetdone,
  ch2_rxdebugpcsout,
  ch2_rxpkdet,
  ch2_rxqpisenn,
  ch2_rxqpisenp,
  ch2_rxsimplexphystatus,
  ch2_rxslipdone,
  ch2_dfehold,
  ch2_dfeovrd,
  ch2_rxdapireset,
  ch2_rxdapiresetmask,
  ch2_rxqpien,
  ch2_rxoutclk,
  ch2_rxusrclk,
  ch3_rxdata,
  ch3_rxdatavalid,
  ch3_rxheader,
  ch3_rxgearboxslip,
  ch3_rxlatclk,
  ch3_gtrxreset,
  ch3_rxprogdivreset,
  ch3_rxuserrdy,
  ch3_rxprogdivresetdone,
  ch3_rxpmaresetdone,
  ch3_rxresetdone,
  ch3_rx10gstat,
  ch3_rxbufstatus,
  ch3_rxbyteisaligned,
  ch3_rxbyterealign,
  ch3_rxcdrhold,
  ch3_rxcdrlock,
  ch3_rxcdrovrden,
  ch3_rxcdrphdone,
  ch3_rxcdrreset,
  ch3_rxchanbondseq,
  ch3_rxchanisaligned,
  ch3_rxchanrealign,
  ch3_rxchbondi,
  ch3_rxchbondo,
  ch3_rxclkcorcnt,
  ch3_rxcominitdet,
  ch3_rxcommadet,
  ch3_rxcomsasdet,
  ch3_rxcomwakedet,
  ch3_rxctrl0,
  ch3_rxctrl1,
  ch3_rxctrl2,
  ch3_rxctrl3,
  ch3_rxdapicodeovrden,
  ch3_rxdapicodereset,
  ch3_rxdlyalignerr,
  ch3_rxdlyalignprog,
  ch3_rxdlyalignreq,
  ch3_rxelecidle,
  ch3_rxeqtraining,
  ch3_rxfinealigndone,
  ch3_rxheadervalid,
  ch3_rxlpmen,
  ch3_rxmldchaindone,
  ch3_rxmldchainreq,
  ch3_rxmlfinealignreq,
  ch3_rxoobreset,
  ch3_rxosintdone,
  ch3_rxpcsresetmask,
  ch3_rxpd,
  ch3_rxphaligndone,
  ch3_rxphalignerr,
  ch3_rxphalignreq,
  ch3_rxphalignresetmask,
  ch3_rxphdlypd,
  ch3_rxphdlyreset,
  ch3_rxphdlyresetdone,
  ch3_rxphsetinitdone,
  ch3_rxphsetinitreq,
  ch3_rxphshift180,
  ch3_rxphshift180done,
  ch3_rxpmaresetmask,
  ch3_rxpolarity,
  ch3_rxprbscntreset,
  ch3_rxprbserr,
  ch3_rxprbslocked,
  ch3_rxprbssel,
  ch3_rxrate,
  ch3_rxresetmode,
  ch3_rxmstreset,
  ch3_rxmstdatapathreset,
  ch3_rxmstresetdone,
  ch3_rxslide,
  ch3_rxsliderdy,
  ch3_rxstartofseq,
  ch3_rxstatus,
  ch3_rxsyncallin,
  ch3_rxsyncdone,
  ch3_rxtermination,
  ch3_rxvalid,
  ch3_cdrbmcdrreq,
  ch3_cdrfreqos,
  ch3_cdrincpctrl,
  ch3_cdrstepdir,
  ch3_cdrstepsq,
  ch3_cdrstepsx,
  ch3_eyescanreset,
  ch3_eyescantrigger,
  ch3_eyescandataerror,
  ch3_refdebugout,
  ch3_rxdapiresetdone,
  ch3_rxdebugpcsout,
  ch3_rxpkdet,
  ch3_rxqpisenn,
  ch3_rxqpisenp,
  ch3_rxsimplexphystatus,
  ch3_rxslipdone,
  ch3_dfehold,
  ch3_dfeovrd,
  ch3_rxdapireset,
  ch3_rxdapiresetmask,
  ch3_rxqpien,
  ch3_rxoutclk,
  ch3_rxusrclk,
  ch0_bufgtce,
  ch0_bufgtrst,
  ch0_bufgtcemask,
  ch0_bufgtrstmask,
  ch0_bufgtdiv,
  ch0_clkrsvd0,
  ch0_clkrsvd1,
  ch0_dmonitorclk,
  ch0_phyesmadaptsave,
  ch0_iloresetmask,
  ch0_loopback,
  ch0_dmonfiforeset,
  ch0_pcsrsvdin,
  ch0_gtrsvd,
  ch0_pcsrsvdout,
  ch0_pinrsvdas,
  ch0_dmonitoroutclk,
  ch0_resetexception,
  ch0_dmonitorout,
  ch0_phyready,
  ch0_hsdppcsreset,
  ch1_bufgtce,
  ch1_bufgtrst,
  ch1_bufgtcemask,
  ch1_bufgtrstmask,
  ch1_bufgtdiv,
  ch1_clkrsvd0,
  ch1_clkrsvd1,
  ch1_dmonitorclk,
  ch1_phyesmadaptsave,
  ch1_iloresetmask,
  ch1_loopback,
  ch1_dmonfiforeset,
  ch1_pcsrsvdin,
  ch1_gtrsvd,
  ch1_pcsrsvdout,
  ch1_pinrsvdas,
  ch1_dmonitoroutclk,
  ch1_resetexception,
  ch1_dmonitorout,
  ch1_phyready,
  ch1_hsdppcsreset,
  ch2_bufgtce,
  ch2_bufgtrst,
  ch2_bufgtcemask,
  ch2_bufgtrstmask,
  ch2_bufgtdiv,
  ch2_clkrsvd0,
  ch2_clkrsvd1,
  ch2_dmonitorclk,
  ch2_phyesmadaptsave,
  ch2_iloresetmask,
  ch2_loopback,
  ch2_dmonfiforeset,
  ch2_pcsrsvdin,
  ch2_gtrsvd,
  ch2_pcsrsvdout,
  ch2_pinrsvdas,
  ch2_dmonitoroutclk,
  ch2_resetexception,
  ch2_dmonitorout,
  ch2_phyready,
  ch2_hsdppcsreset,
  ch3_bufgtce,
  ch3_bufgtrst,
  ch3_bufgtcemask,
  ch3_bufgtrstmask,
  ch3_bufgtdiv,
  ch3_clkrsvd0,
  ch3_clkrsvd1,
  ch3_dmonitorclk,
  ch3_phyesmadaptsave,
  ch3_iloresetmask,
  ch3_loopback,
  ch3_dmonfiforeset,
  ch3_pcsrsvdin,
  ch3_gtrsvd,
  ch3_pcsrsvdout,
  ch3_pinrsvdas,
  ch3_dmonitoroutclk,
  ch3_resetexception,
  ch3_dmonitorout,
  ch3_phyready,
  ch3_hsdppcsreset,
  resetdone_northin,
  resetdone_southin,
  resetdone_northout,
  resetdone_southout,
  txpinorthin,
  rxpinorthin,
  txpisouthin,
  rxpisouthin,
  pipenorthin,
  pipesouthin,
  txpinorthout,
  txpisouthout,
  rxpinorthout,
  rxpisouthout,
  pipenorthout,
  pipesouthout,
  GT_REFCLK0,
  bgbypassb,
  bgmonitorenb,
  bgpdb,
  bgrcalovrdenb,
  bgrcalovrd,
  debugtraceready,
  debugtraceclk,
  rcalenb,
  trigackout0,
  trigin0,
  ubenable,
  ubiolmbrst,
  ubmbrst,
  ubintr,
  ubrxuart,
  ctrlrsvdin,
  coestatusdebug,
  gpi,
  refclk0_clktestsig,
  refclk1_clktestsig,
  correcterr,
  debugtracetvalid,
  debugtracetdata,
  refclk0_gtrefclkpdint,
  refclk0_clktestsigint,
  refclk1_gtrefclkpdint,
  refclk1_clktestsigint,
  trigackin0,
  trigout0,
  ubinterrupt,
  ubtxuart,
  uncorrecterr,
  ctrlrsvdout,
  gpo,
  hsclk0_rxrecclksel,
  hsclk1_rxrecclksel,
  ch0_xpipe5_pipeline_en,
  ch1_xpipe5_pipeline_en,
  ch2_xpipe5_pipeline_en,
  ch3_xpipe5_pipeline_en,
  apb3clk,
  apb3paddr,
  apb3penable,
  apb3presetn,
  apb3prdata,
  apb3psel,
  apb3pslverr,
  apb3pready,
  apb3pwdata,
  apb3pwrite,
  rxp,
  rxn,
  txp,
  txn
);

(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rxmargin_intf:1.0 gt_rxmargin_intf rxmarginclk" *)
input wire rxmarginclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME hsclk0_lcpllreset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 hsclk0_lcpllreset RST" *)
input wire hsclk0_lcpllreset;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME hsclk0_rpllreset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 hsclk0_rpllreset RST" *)
input wire hsclk0_rpllreset;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME hsclk1_lcpllreset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 hsclk1_lcpllreset RST" *)
input wire hsclk1_lcpllreset;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME hsclk1_rpllreset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 hsclk1_rpllreset RST" *)
input wire hsclk1_rpllreset;
output wire hsclk0_lcplllock;
output wire hsclk1_lcplllock;
output wire hsclk0_rplllock;
output wire hsclk1_rplllock;
output wire gtpowergood;
input wire ch0_pcierstb;
input wire ch1_pcierstb;
input wire ch2_pcierstb;
input wire ch3_pcierstb;
input wire pcielinkreachtarget;
input wire [5 : 0] pcieltssm;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rxmargin_intf:1.0 gt_rxmargin_intf rxmarginreqack" *)
output wire rxmarginreqack;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rxmargin_intf:1.0 gt_rxmargin_intf rxmarginrescmd" *)
output wire [3 : 0] rxmarginrescmd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rxmargin_intf:1.0 gt_rxmargin_intf rxmarginreslanenum" *)
output wire [1 : 0] rxmarginreslanenum;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rxmargin_intf:1.0 gt_rxmargin_intf rxmarginrespayld" *)
output wire [7 : 0] rxmarginrespayld;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rxmargin_intf:1.0 gt_rxmargin_intf rxmarginresreq" *)
output wire rxmarginresreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rxmargin_intf:1.0 gt_rxmargin_intf rxmarginreqcmd" *)
input wire [3 : 0] rxmarginreqcmd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rxmargin_intf:1.0 gt_rxmargin_intf rxmarginreqlanenum" *)
input wire [1 : 0] rxmarginreqlanenum;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rxmargin_intf:1.0 gt_rxmargin_intf rxmarginreqpayld" *)
input wire [7 : 0] rxmarginreqpayld;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rxmargin_intf:1.0 gt_rxmargin_intf rxmarginreqreq" *)
input wire rxmarginreqreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rxmargin_intf:1.0 gt_rxmargin_intf rxmarginresack" *)
input wire rxmarginresack;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ch0_iloreset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ch0_iloreset RST" *)
input wire ch0_iloreset;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ch1_iloreset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ch1_iloreset RST" *)
input wire ch1_iloreset;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ch2_iloreset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ch2_iloreset RST" *)
input wire ch2_iloreset;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ch3_iloreset, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ch3_iloreset RST" *)
input wire ch3_iloreset;
output wire ch0_iloresetdone;
output wire ch1_iloresetdone;
output wire ch2_iloresetdone;
output wire ch3_iloresetdone;
output wire ch0_phystatus;
output wire ch1_phystatus;
output wire ch2_phystatus;
output wire ch3_phystatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_LCPLLFBCLKLOST" *)
output wire hsclk0_lcpllfbclklost;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_LCPLLREFCLKLOST" *)
output wire hsclk0_lcpllrefclklost;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_LCPLLREFCLKMONITOR" *)
output wire hsclk0_lcpllrefclkmonitor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_RPLLFBCLKLOST" *)
output wire hsclk0_rpllfbclklost;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_RPLLREFCLKLOST" *)
output wire hsclk0_rpllrefclklost;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_RPLLREFCLKMONITOR" *)
output wire hsclk0_rpllrefclkmonitor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_LCPLLFBCLKLOST" *)
output wire hsclk1_lcpllfbclklost;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_LCPLLREFCLKLOST" *)
output wire hsclk1_lcpllrefclklost;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_LCPLLREFCLKMONITOR" *)
output wire hsclk1_lcpllrefclkmonitor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_RPLLFBCLKLOST" *)
output wire hsclk1_rpllfbclklost;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_RPLLREFCLKLOST" *)
output wire hsclk1_rpllrefclklost;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_RPLLREFCLKMONITOR" *)
output wire hsclk1_rpllrefclkmonitor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_LCPLLPD" *)
input wire hsclk0_lcpllpd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_RPLLPD" *)
input wire hsclk0_rpllpd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_LCPLLRESETBYPASSMODE" *)
input wire hsclk0_lcpllresetbypassmode;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_LCPLLSDMTOGGLE" *)
input wire hsclk0_lcpllsdmtoggle;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_RPLLRESETBYPASSMODE" *)
input wire hsclk0_rpllresetbypassmode;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_RPLLSDMTOGGLE" *)
input wire hsclk0_rpllsdmtoggle;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_LCPLLPD" *)
input wire hsclk1_lcpllpd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_LCPLLRESETBYPASSMODE" *)
input wire hsclk1_lcpllresetbypassmode;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_LCPLLSDMTOGGLE" *)
input wire hsclk1_lcpllsdmtoggle;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_RPLLPD" *)
input wire hsclk1_rpllpd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_RPLLRESETBYPASSMODE" *)
input wire hsclk1_rpllresetbypassmode;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_RPLLSDMTOGGLE" *)
input wire hsclk1_rpllsdmtoggle;
input wire refclk0_gtrefclkpd;
input wire refclk1_gtrefclkpd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_LCPLLREFCLKSEL" *)
input wire [2 : 0] hsclk0_lcpllrefclksel;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_LCPLLREFCLKSEL" *)
input wire [2 : 0] hsclk1_lcpllrefclksel;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_RPLLREFCLKSEL" *)
input wire [2 : 0] hsclk0_rpllrefclksel;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_RPLLREFCLKSEL" *)
input wire [2 : 0] hsclk1_rpllrefclksel;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_LCPLLFBDIV" *)
input wire [7 : 0] hsclk0_lcpllfbdiv;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_RPLLFBDIV" *)
input wire [7 : 0] hsclk0_rpllfbdiv;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_LCPLLFBDIV" *)
input wire [7 : 0] hsclk1_lcpllfbdiv;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_RPLLFBDIV" *)
input wire [7 : 0] hsclk1_rpllfbdiv;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_RXRECCLKOUT0" *)
output wire hsclk0_rxrecclkout0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_RXRECCLKOUT1" *)
output wire hsclk0_rxrecclkout1;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_RXRECCLKOUT0" *)
output wire hsclk1_rxrecclkout0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_RXRECCLKOUT1" *)
output wire hsclk1_rxrecclkout1;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_LCPLLSDMDATA" *)
input wire [25 : 0] hsclk0_lcpllsdmdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_LCPLLSDMDATA" *)
input wire [25 : 0] hsclk1_lcpllsdmdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_RPLLSDMDATA" *)
input wire [25 : 0] hsclk0_rpllsdmdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_RPLLSDMDATA" *)
input wire [25 : 0] hsclk1_rpllsdmdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_LCPLLRESETMASK" *)
input wire [1 : 0] hsclk0_lcpllresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_LCPLLRESETMASK" *)
input wire [1 : 0] hsclk1_lcpllresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK0_DEBUG HSCLK_RPLLRESETMASK" *)
input wire [1 : 0] hsclk0_rpllresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_hsclk_debug:1.0 HSCLK1_DEBUG HSCLK_RPLLRESETMASK" *)
input wire [1 : 0] hsclk1_rpllresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txdata" *)
input wire [127 : 0] ch0_txdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txheader" *)
input wire [5 : 0] ch0_txheader;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txsequence" *)
input wire [6 : 0] ch0_txsequence;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_gttxreset" *)
input wire ch0_gttxreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txprogdivreset" *)
input wire ch0_txprogdivreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txuserrdy" *)
input wire ch0_txuserrdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txphalignresetmask" *)
input wire [1 : 0] ch0_txphalignresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txcominit" *)
input wire ch0_txcominit;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txcomsas" *)
input wire ch0_txcomsas;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txcomwake" *)
input wire ch0_txcomwake;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txdapicodeovrden" *)
input wire ch0_txdapicodeovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txdapicodereset" *)
input wire ch0_txdapicodereset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txdetectrx" *)
input wire ch0_txdetectrx;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txlatclk" *)
input wire ch0_txlatclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txphdlytstclk" *)
input wire ch0_txphdlytstclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txdlyalignreq" *)
input wire ch0_txdlyalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txelecidle" *)
input wire ch0_txelecidle;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txinhibit" *)
input wire ch0_txinhibit;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txmldchaindone" *)
input wire ch0_txmldchaindone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txmldchainreq" *)
input wire ch0_txmldchainreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txoneszeros" *)
input wire ch0_txoneszeros;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txpausedelayalign" *)
input wire ch0_txpausedelayalign;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txpcsresetmask" *)
input wire ch0_txpcsresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txphalignreq" *)
input wire ch0_txphalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txphdlypd" *)
input wire ch0_txphdlypd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txphdlyreset" *)
input wire ch0_txphdlyreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txphsetinitreq" *)
input wire ch0_txphsetinitreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txphshift180" *)
input wire ch0_txphshift180;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txpicodeovrden" *)
input wire ch0_txpicodeovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txpicodereset" *)
input wire ch0_txpicodereset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txpippmen" *)
input wire ch0_txpippmen;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txpisopd" *)
input wire ch0_txpisopd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txpolarity" *)
input wire ch0_txpolarity;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txprbsforceerr" *)
input wire ch0_txprbsforceerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txswing" *)
input wire ch0_txswing;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txsyncallin" *)
input wire ch0_txsyncallin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_tx10gstat" *)
output wire ch0_tx10gstat;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txcomfinish" *)
output wire ch0_txcomfinish;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txdccdone" *)
output wire ch0_txdccdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txdlyalignerr" *)
output wire ch0_txdlyalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txdlyalignprog" *)
output wire ch0_txdlyalignprog;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txphaligndone" *)
output wire ch0_txphaligndone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txphalignerr" *)
output wire ch0_txphalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txphalignoutrsvd" *)
output wire ch0_txphalignoutrsvd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txphdlyresetdone" *)
output wire ch0_txphdlyresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txphsetinitdone" *)
output wire ch0_txphsetinitdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txphshift180done" *)
output wire ch0_txphshift180done;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txsyncdone" *)
output wire ch0_txsyncdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txbufstatus" *)
output wire [1 : 0] ch0_txbufstatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txctrl0" *)
input wire [15 : 0] ch0_txctrl0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txctrl1" *)
input wire [15 : 0] ch0_txctrl1;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txdeemph" *)
input wire [1 : 0] ch0_txdeemph;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txpd" *)
input wire [1 : 0] ch0_txpd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txresetmode" *)
input wire [1 : 0] ch0_txresetmode;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txmstreset" *)
input wire ch0_txmstreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txmstdatapathreset" *)
input wire ch0_txmstdatapathreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txmstresetdone" *)
output wire ch0_txmstresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txmargin" *)
input wire [2 : 0] ch0_txmargin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txpmaresetmask" *)
input wire [2 : 0] ch0_txpmaresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txprbssel" *)
input wire [3 : 0] ch0_txprbssel;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txdiffctrl" *)
input wire [4 : 0] ch0_txdiffctrl;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txpippmstepsize" *)
input wire [4 : 0] ch0_txpippmstepsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txpostcursor" *)
input wire [4 : 0] ch0_txpostcursor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txprecursor" *)
input wire [4 : 0] ch0_txprecursor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txmaincursor" *)
input wire [6 : 0] ch0_txmaincursor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txctrl2" *)
input wire [7 : 0] ch0_txctrl2;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txrate" *)
input wire [7 : 0] ch0_txrate;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txprogdivresetdone" *)
output wire ch0_txprogdivresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txpmaresetdone" *)
output wire ch0_txpmaresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txresetdone" *)
output wire ch0_txresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txdapiresetdone" *)
output wire ch0_txdapiresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txdebugpcsout" *)
output wire ch0_txdebugpcsout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txqpisenn" *)
output wire ch0_txqpisenn;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txqpisenp" *)
output wire ch0_txqpisenp;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txsimplexphystatus" *)
output wire ch0_txsimplexphystatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txswingouthigh" *)
output wire ch0_txswingouthigh;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txswingoutlow" *)
output wire ch0_txswingoutlow;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txdapireset" *)
input wire ch0_txdapireset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txdapiresetmask" *)
input wire [1 : 0] ch0_txdapiresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txqpibiasen" *)
input wire ch0_txqpibiasen;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME TX0_GT_IP_Interface, PARENT_ID undef, CHNL_NUMBER undef, MASTERCLK_SRC undef, GT_DIRECTION undef, TX_SETTINGS undef, ADDITIONAL_QUAD_SETTINGS undef, ADDITIONAL_CONFIG_FILE undef, ADDITIONAL_CONFIG_ENABLE undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX0_GT_IP_Interface ch_txqpiweakpu" *)
input wire ch0_txqpiweakpu;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME TX0_OUTCLK, FREQ_HZ 156250000, IS_MASTER false, PARENT_ID undef, PHASE 0.0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:gt_outclk:1.0 TX0_OUTCLK CLK" *)
output wire ch0_txoutclk;
input wire ch0_txusrclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txdata" *)
input wire [127 : 0] ch1_txdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txheader" *)
input wire [5 : 0] ch1_txheader;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txsequence" *)
input wire [6 : 0] ch1_txsequence;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_gttxreset" *)
input wire ch1_gttxreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txprogdivreset" *)
input wire ch1_txprogdivreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txuserrdy" *)
input wire ch1_txuserrdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txphalignresetmask" *)
input wire [1 : 0] ch1_txphalignresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txcominit" *)
input wire ch1_txcominit;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txcomsas" *)
input wire ch1_txcomsas;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txcomwake" *)
input wire ch1_txcomwake;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txdapicodeovrden" *)
input wire ch1_txdapicodeovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txdapicodereset" *)
input wire ch1_txdapicodereset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txdetectrx" *)
input wire ch1_txdetectrx;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txlatclk" *)
input wire ch1_txlatclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txphdlytstclk" *)
input wire ch1_txphdlytstclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txdlyalignreq" *)
input wire ch1_txdlyalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txelecidle" *)
input wire ch1_txelecidle;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txinhibit" *)
input wire ch1_txinhibit;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txmldchaindone" *)
input wire ch1_txmldchaindone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txmldchainreq" *)
input wire ch1_txmldchainreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txoneszeros" *)
input wire ch1_txoneszeros;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txpausedelayalign" *)
input wire ch1_txpausedelayalign;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txpcsresetmask" *)
input wire ch1_txpcsresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txphalignreq" *)
input wire ch1_txphalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txphdlypd" *)
input wire ch1_txphdlypd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txphdlyreset" *)
input wire ch1_txphdlyreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txphsetinitreq" *)
input wire ch1_txphsetinitreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txphshift180" *)
input wire ch1_txphshift180;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txpicodeovrden" *)
input wire ch1_txpicodeovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txpicodereset" *)
input wire ch1_txpicodereset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txpippmen" *)
input wire ch1_txpippmen;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txpisopd" *)
input wire ch1_txpisopd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txpolarity" *)
input wire ch1_txpolarity;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txprbsforceerr" *)
input wire ch1_txprbsforceerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txswing" *)
input wire ch1_txswing;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txsyncallin" *)
input wire ch1_txsyncallin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_tx10gstat" *)
output wire ch1_tx10gstat;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txcomfinish" *)
output wire ch1_txcomfinish;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txdccdone" *)
output wire ch1_txdccdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txdlyalignerr" *)
output wire ch1_txdlyalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txdlyalignprog" *)
output wire ch1_txdlyalignprog;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txphaligndone" *)
output wire ch1_txphaligndone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txphalignerr" *)
output wire ch1_txphalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txphalignoutrsvd" *)
output wire ch1_txphalignoutrsvd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txphdlyresetdone" *)
output wire ch1_txphdlyresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txphsetinitdone" *)
output wire ch1_txphsetinitdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txphshift180done" *)
output wire ch1_txphshift180done;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txsyncdone" *)
output wire ch1_txsyncdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txbufstatus" *)
output wire [1 : 0] ch1_txbufstatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txctrl0" *)
input wire [15 : 0] ch1_txctrl0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txctrl1" *)
input wire [15 : 0] ch1_txctrl1;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txdeemph" *)
input wire [1 : 0] ch1_txdeemph;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txpd" *)
input wire [1 : 0] ch1_txpd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txresetmode" *)
input wire [1 : 0] ch1_txresetmode;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txmstreset" *)
input wire ch1_txmstreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txmstdatapathreset" *)
input wire ch1_txmstdatapathreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txmstresetdone" *)
output wire ch1_txmstresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txmargin" *)
input wire [2 : 0] ch1_txmargin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txpmaresetmask" *)
input wire [2 : 0] ch1_txpmaresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txprbssel" *)
input wire [3 : 0] ch1_txprbssel;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txdiffctrl" *)
input wire [4 : 0] ch1_txdiffctrl;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txpippmstepsize" *)
input wire [4 : 0] ch1_txpippmstepsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txpostcursor" *)
input wire [4 : 0] ch1_txpostcursor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txprecursor" *)
input wire [4 : 0] ch1_txprecursor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txmaincursor" *)
input wire [6 : 0] ch1_txmaincursor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txctrl2" *)
input wire [7 : 0] ch1_txctrl2;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txrate" *)
input wire [7 : 0] ch1_txrate;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txprogdivresetdone" *)
output wire ch1_txprogdivresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txpmaresetdone" *)
output wire ch1_txpmaresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txresetdone" *)
output wire ch1_txresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txdapiresetdone" *)
output wire ch1_txdapiresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txdebugpcsout" *)
output wire ch1_txdebugpcsout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txqpisenn" *)
output wire ch1_txqpisenn;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txqpisenp" *)
output wire ch1_txqpisenp;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txsimplexphystatus" *)
output wire ch1_txsimplexphystatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txswingouthigh" *)
output wire ch1_txswingouthigh;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txswingoutlow" *)
output wire ch1_txswingoutlow;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txdapireset" *)
input wire ch1_txdapireset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txdapiresetmask" *)
input wire [1 : 0] ch1_txdapiresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txqpibiasen" *)
input wire ch1_txqpibiasen;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME TX1_GT_IP_Interface, PARENT_ID undef, CHNL_NUMBER undef, MASTERCLK_SRC undef, GT_DIRECTION undef, TX_SETTINGS undef, ADDITIONAL_QUAD_SETTINGS undef, ADDITIONAL_CONFIG_FILE undef, ADDITIONAL_CONFIG_ENABLE undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX1_GT_IP_Interface ch_txqpiweakpu" *)
input wire ch1_txqpiweakpu;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME TX1_OUTCLK, FREQ_HZ 156250000, IS_MASTER false, PARENT_ID undef, PHASE 0.0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:gt_outclk:1.0 TX1_OUTCLK CLK" *)
output wire ch1_txoutclk;
input wire ch1_txusrclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txdata" *)
input wire [127 : 0] ch2_txdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txheader" *)
input wire [5 : 0] ch2_txheader;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txsequence" *)
input wire [6 : 0] ch2_txsequence;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_gttxreset" *)
input wire ch2_gttxreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txprogdivreset" *)
input wire ch2_txprogdivreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txuserrdy" *)
input wire ch2_txuserrdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txphalignresetmask" *)
input wire [1 : 0] ch2_txphalignresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txcominit" *)
input wire ch2_txcominit;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txcomsas" *)
input wire ch2_txcomsas;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txcomwake" *)
input wire ch2_txcomwake;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txdapicodeovrden" *)
input wire ch2_txdapicodeovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txdapicodereset" *)
input wire ch2_txdapicodereset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txdetectrx" *)
input wire ch2_txdetectrx;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txlatclk" *)
input wire ch2_txlatclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txphdlytstclk" *)
input wire ch2_txphdlytstclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txdlyalignreq" *)
input wire ch2_txdlyalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txelecidle" *)
input wire ch2_txelecidle;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txinhibit" *)
input wire ch2_txinhibit;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txmldchaindone" *)
input wire ch2_txmldchaindone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txmldchainreq" *)
input wire ch2_txmldchainreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txoneszeros" *)
input wire ch2_txoneszeros;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txpausedelayalign" *)
input wire ch2_txpausedelayalign;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txpcsresetmask" *)
input wire ch2_txpcsresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txphalignreq" *)
input wire ch2_txphalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txphdlypd" *)
input wire ch2_txphdlypd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txphdlyreset" *)
input wire ch2_txphdlyreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txphsetinitreq" *)
input wire ch2_txphsetinitreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txphshift180" *)
input wire ch2_txphshift180;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txpicodeovrden" *)
input wire ch2_txpicodeovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txpicodereset" *)
input wire ch2_txpicodereset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txpippmen" *)
input wire ch2_txpippmen;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txpisopd" *)
input wire ch2_txpisopd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txpolarity" *)
input wire ch2_txpolarity;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txprbsforceerr" *)
input wire ch2_txprbsforceerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txswing" *)
input wire ch2_txswing;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txsyncallin" *)
input wire ch2_txsyncallin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_tx10gstat" *)
output wire ch2_tx10gstat;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txcomfinish" *)
output wire ch2_txcomfinish;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txdccdone" *)
output wire ch2_txdccdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txdlyalignerr" *)
output wire ch2_txdlyalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txdlyalignprog" *)
output wire ch2_txdlyalignprog;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txphaligndone" *)
output wire ch2_txphaligndone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txphalignerr" *)
output wire ch2_txphalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txphalignoutrsvd" *)
output wire ch2_txphalignoutrsvd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txphdlyresetdone" *)
output wire ch2_txphdlyresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txphsetinitdone" *)
output wire ch2_txphsetinitdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txphshift180done" *)
output wire ch2_txphshift180done;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txsyncdone" *)
output wire ch2_txsyncdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txbufstatus" *)
output wire [1 : 0] ch2_txbufstatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txctrl0" *)
input wire [15 : 0] ch2_txctrl0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txctrl1" *)
input wire [15 : 0] ch2_txctrl1;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txdeemph" *)
input wire [1 : 0] ch2_txdeemph;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txpd" *)
input wire [1 : 0] ch2_txpd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txresetmode" *)
input wire [1 : 0] ch2_txresetmode;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txmstreset" *)
input wire ch2_txmstreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txmstdatapathreset" *)
input wire ch2_txmstdatapathreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txmstresetdone" *)
output wire ch2_txmstresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txmargin" *)
input wire [2 : 0] ch2_txmargin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txpmaresetmask" *)
input wire [2 : 0] ch2_txpmaresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txprbssel" *)
input wire [3 : 0] ch2_txprbssel;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txdiffctrl" *)
input wire [4 : 0] ch2_txdiffctrl;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txpippmstepsize" *)
input wire [4 : 0] ch2_txpippmstepsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txpostcursor" *)
input wire [4 : 0] ch2_txpostcursor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txprecursor" *)
input wire [4 : 0] ch2_txprecursor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txmaincursor" *)
input wire [6 : 0] ch2_txmaincursor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txctrl2" *)
input wire [7 : 0] ch2_txctrl2;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txrate" *)
input wire [7 : 0] ch2_txrate;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txprogdivresetdone" *)
output wire ch2_txprogdivresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txpmaresetdone" *)
output wire ch2_txpmaresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txresetdone" *)
output wire ch2_txresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txdapiresetdone" *)
output wire ch2_txdapiresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txdebugpcsout" *)
output wire ch2_txdebugpcsout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txqpisenn" *)
output wire ch2_txqpisenn;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txqpisenp" *)
output wire ch2_txqpisenp;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txsimplexphystatus" *)
output wire ch2_txsimplexphystatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txswingouthigh" *)
output wire ch2_txswingouthigh;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txswingoutlow" *)
output wire ch2_txswingoutlow;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txdapireset" *)
input wire ch2_txdapireset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txdapiresetmask" *)
input wire [1 : 0] ch2_txdapiresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txqpibiasen" *)
input wire ch2_txqpibiasen;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME TX2_GT_IP_Interface, PARENT_ID undef, CHNL_NUMBER undef, MASTERCLK_SRC undef, GT_DIRECTION undef, TX_SETTINGS undef, ADDITIONAL_QUAD_SETTINGS undef, ADDITIONAL_CONFIG_FILE undef, ADDITIONAL_CONFIG_ENABLE undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX2_GT_IP_Interface ch_txqpiweakpu" *)
input wire ch2_txqpiweakpu;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME TX2_OUTCLK, FREQ_HZ 156250000, IS_MASTER false, PARENT_ID undef, PHASE 0.0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:gt_outclk:1.0 TX2_OUTCLK CLK" *)
output wire ch2_txoutclk;
input wire ch2_txusrclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txdata" *)
input wire [127 : 0] ch3_txdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txheader" *)
input wire [5 : 0] ch3_txheader;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txsequence" *)
input wire [6 : 0] ch3_txsequence;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_gttxreset" *)
input wire ch3_gttxreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txprogdivreset" *)
input wire ch3_txprogdivreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txuserrdy" *)
input wire ch3_txuserrdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txphalignresetmask" *)
input wire [1 : 0] ch3_txphalignresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txcominit" *)
input wire ch3_txcominit;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txcomsas" *)
input wire ch3_txcomsas;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txcomwake" *)
input wire ch3_txcomwake;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txdapicodeovrden" *)
input wire ch3_txdapicodeovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txdapicodereset" *)
input wire ch3_txdapicodereset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txdetectrx" *)
input wire ch3_txdetectrx;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txlatclk" *)
input wire ch3_txlatclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txphdlytstclk" *)
input wire ch3_txphdlytstclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txdlyalignreq" *)
input wire ch3_txdlyalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txelecidle" *)
input wire ch3_txelecidle;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txinhibit" *)
input wire ch3_txinhibit;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txmldchaindone" *)
input wire ch3_txmldchaindone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txmldchainreq" *)
input wire ch3_txmldchainreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txoneszeros" *)
input wire ch3_txoneszeros;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txpausedelayalign" *)
input wire ch3_txpausedelayalign;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txpcsresetmask" *)
input wire ch3_txpcsresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txphalignreq" *)
input wire ch3_txphalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txphdlypd" *)
input wire ch3_txphdlypd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txphdlyreset" *)
input wire ch3_txphdlyreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txphsetinitreq" *)
input wire ch3_txphsetinitreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txphshift180" *)
input wire ch3_txphshift180;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txpicodeovrden" *)
input wire ch3_txpicodeovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txpicodereset" *)
input wire ch3_txpicodereset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txpippmen" *)
input wire ch3_txpippmen;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txpisopd" *)
input wire ch3_txpisopd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txpolarity" *)
input wire ch3_txpolarity;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txprbsforceerr" *)
input wire ch3_txprbsforceerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txswing" *)
input wire ch3_txswing;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txsyncallin" *)
input wire ch3_txsyncallin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_tx10gstat" *)
output wire ch3_tx10gstat;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txcomfinish" *)
output wire ch3_txcomfinish;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txdccdone" *)
output wire ch3_txdccdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txdlyalignerr" *)
output wire ch3_txdlyalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txdlyalignprog" *)
output wire ch3_txdlyalignprog;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txphaligndone" *)
output wire ch3_txphaligndone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txphalignerr" *)
output wire ch3_txphalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txphalignoutrsvd" *)
output wire ch3_txphalignoutrsvd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txphdlyresetdone" *)
output wire ch3_txphdlyresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txphsetinitdone" *)
output wire ch3_txphsetinitdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txphshift180done" *)
output wire ch3_txphshift180done;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txsyncdone" *)
output wire ch3_txsyncdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txbufstatus" *)
output wire [1 : 0] ch3_txbufstatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txctrl0" *)
input wire [15 : 0] ch3_txctrl0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txctrl1" *)
input wire [15 : 0] ch3_txctrl1;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txdeemph" *)
input wire [1 : 0] ch3_txdeemph;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txpd" *)
input wire [1 : 0] ch3_txpd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txresetmode" *)
input wire [1 : 0] ch3_txresetmode;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txmstreset" *)
input wire ch3_txmstreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txmstdatapathreset" *)
input wire ch3_txmstdatapathreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txmstresetdone" *)
output wire ch3_txmstresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txmargin" *)
input wire [2 : 0] ch3_txmargin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txpmaresetmask" *)
input wire [2 : 0] ch3_txpmaresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txprbssel" *)
input wire [3 : 0] ch3_txprbssel;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txdiffctrl" *)
input wire [4 : 0] ch3_txdiffctrl;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txpippmstepsize" *)
input wire [4 : 0] ch3_txpippmstepsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txpostcursor" *)
input wire [4 : 0] ch3_txpostcursor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txprecursor" *)
input wire [4 : 0] ch3_txprecursor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txmaincursor" *)
input wire [6 : 0] ch3_txmaincursor;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txctrl2" *)
input wire [7 : 0] ch3_txctrl2;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txrate" *)
input wire [7 : 0] ch3_txrate;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txprogdivresetdone" *)
output wire ch3_txprogdivresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txpmaresetdone" *)
output wire ch3_txpmaresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txresetdone" *)
output wire ch3_txresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txdapiresetdone" *)
output wire ch3_txdapiresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txdebugpcsout" *)
output wire ch3_txdebugpcsout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txqpisenn" *)
output wire ch3_txqpisenn;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txqpisenp" *)
output wire ch3_txqpisenp;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txsimplexphystatus" *)
output wire ch3_txsimplexphystatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txswingouthigh" *)
output wire ch3_txswingouthigh;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txswingoutlow" *)
output wire ch3_txswingoutlow;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txdapireset" *)
input wire ch3_txdapireset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txdapiresetmask" *)
input wire [1 : 0] ch3_txdapiresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txqpibiasen" *)
input wire ch3_txqpibiasen;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME TX3_GT_IP_Interface, PARENT_ID undef, CHNL_NUMBER undef, MASTERCLK_SRC undef, GT_DIRECTION undef, TX_SETTINGS undef, ADDITIONAL_QUAD_SETTINGS undef, ADDITIONAL_CONFIG_FILE undef, ADDITIONAL_CONFIG_ENABLE undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_tx_interface:1.0 TX3_GT_IP_Interface ch_txqpiweakpu" *)
input wire ch3_txqpiweakpu;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME TX3_OUTCLK, FREQ_HZ 156250000, IS_MASTER false, PARENT_ID undef, PHASE 0.0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:gt_outclk:1.0 TX3_OUTCLK CLK" *)
output wire ch3_txoutclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME TX3_USRCLK, FREQ_HZ 156250000, PARENT_ID undef, PHASE 0.0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:gt_usrclk:1.0 TX3_USRCLK CLK" *)
input wire ch3_txusrclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxdata" *)
output wire [127 : 0] ch0_rxdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxdatavalid" *)
output wire [1 : 0] ch0_rxdatavalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxheader" *)
output wire [5 : 0] ch0_rxheader;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxgearboxslip" *)
input wire ch0_rxgearboxslip;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxlatclk" *)
input wire ch0_rxlatclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_gtrxreset" *)
input wire ch0_gtrxreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxprogdivreset" *)
input wire ch0_rxprogdivreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxuserrdy" *)
input wire ch0_rxuserrdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxprogdivresetdone" *)
output wire ch0_rxprogdivresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxpmaresetdone" *)
output wire ch0_rxpmaresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxresetdone" *)
output wire ch0_rxresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rx10gstat" *)
output wire [7 : 0] ch0_rx10gstat;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxbufstatus" *)
output wire [2 : 0] ch0_rxbufstatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxbyteisaligned" *)
output wire ch0_rxbyteisaligned;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxbyterealign" *)
output wire ch0_rxbyterealign;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxcdrhold" *)
input wire ch0_rxcdrhold;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxcdrlock" *)
output wire ch0_rxcdrlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxcdrovrden" *)
input wire ch0_rxcdrovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxcdrphdone" *)
output wire ch0_rxcdrphdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxcdrreset" *)
input wire ch0_rxcdrreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxchanbondseq" *)
output wire ch0_rxchanbondseq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxchanisaligned" *)
output wire ch0_rxchanisaligned;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxchanrealign" *)
output wire ch0_rxchanrealign;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxchbondi" *)
input wire [4 : 0] ch0_rxchbondi;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxchbondo" *)
output wire [4 : 0] ch0_rxchbondo;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxclkcorcnt" *)
output wire [1 : 0] ch0_rxclkcorcnt;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxcominitdet" *)
output wire ch0_rxcominitdet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxcommadet" *)
output wire ch0_rxcommadet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxcomsasdet" *)
output wire ch0_rxcomsasdet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxcomwakedet" *)
output wire ch0_rxcomwakedet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxctrl0" *)
output wire [15 : 0] ch0_rxctrl0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxctrl1" *)
output wire [15 : 0] ch0_rxctrl1;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxctrl2" *)
output wire [7 : 0] ch0_rxctrl2;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxctrl3" *)
output wire [7 : 0] ch0_rxctrl3;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxdapicodeovrden" *)
input wire ch0_rxdapicodeovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxdapicodereset" *)
input wire ch0_rxdapicodereset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxdlyalignerr" *)
output wire ch0_rxdlyalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxdlyalignprog" *)
output wire ch0_rxdlyalignprog;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxdlyalignreq" *)
input wire ch0_rxdlyalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxelecidle" *)
output wire ch0_rxelecidle;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxeqtraining" *)
input wire ch0_rxeqtraining;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxfinealigndone" *)
output wire ch0_rxfinealigndone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxheadervalid" *)
output wire [1 : 0] ch0_rxheadervalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxlpmen" *)
input wire ch0_rxlpmen;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxmldchaindone" *)
input wire ch0_rxmldchaindone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxmldchainreq" *)
input wire ch0_rxmldchainreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxmlfinealignreq" *)
input wire ch0_rxmlfinealignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxoobreset" *)
input wire ch0_rxoobreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxosintdone" *)
output wire ch0_rxosintdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxpcsresetmask" *)
input wire [4 : 0] ch0_rxpcsresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxpd" *)
input wire [1 : 0] ch0_rxpd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxphaligndone" *)
output wire ch0_rxphaligndone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxphalignerr" *)
output wire ch0_rxphalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxphalignreq" *)
input wire ch0_rxphalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxphalignresetmask" *)
input wire [1 : 0] ch0_rxphalignresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxphdlypd" *)
input wire ch0_rxphdlypd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxphdlyreset" *)
input wire ch0_rxphdlyreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxphdlyresetdone" *)
output wire ch0_rxphdlyresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxphsetinitdone" *)
output wire ch0_rxphsetinitdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxphsetinitreq" *)
input wire ch0_rxphsetinitreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxphshift180" *)
input wire ch0_rxphshift180;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxphshift180done" *)
output wire ch0_rxphshift180done;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxpmaresetmask" *)
input wire [6 : 0] ch0_rxpmaresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxpolarity" *)
input wire ch0_rxpolarity;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxprbscntreset" *)
input wire ch0_rxprbscntreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxprbserr" *)
output wire ch0_rxprbserr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxprbslocked" *)
output wire ch0_rxprbslocked;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxprbssel" *)
input wire [3 : 0] ch0_rxprbssel;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxrate" *)
input wire [7 : 0] ch0_rxrate;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxresetmode" *)
input wire [1 : 0] ch0_rxresetmode;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxmstreset" *)
input wire ch0_rxmstreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxmstdatapathreset" *)
input wire ch0_rxmstdatapathreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxmstresetdone" *)
output wire ch0_rxmstresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxslide" *)
input wire ch0_rxslide;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxsliderdy" *)
output wire ch0_rxsliderdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxstartofseq" *)
output wire [1 : 0] ch0_rxstartofseq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxstatus" *)
output wire [2 : 0] ch0_rxstatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxsyncallin" *)
input wire ch0_rxsyncallin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxsyncdone" *)
output wire ch0_rxsyncdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxtermination" *)
input wire ch0_rxtermination;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxvalid" *)
output wire ch0_rxvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_cdrbmcdrreq" *)
input wire ch0_cdrbmcdrreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_cdrfreqos" *)
input wire ch0_cdrfreqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_cdrincpctrl" *)
input wire ch0_cdrincpctrl;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_cdrstepdir" *)
input wire ch0_cdrstepdir;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_cdrstepsq" *)
input wire ch0_cdrstepsq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_cdrstepsx" *)
input wire ch0_cdrstepsx;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_eyescanreset" *)
input wire ch0_eyescanreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_eyescantrigger" *)
input wire ch0_eyescantrigger;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_eyescandataerror" *)
output wire ch0_eyescandataerror;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_refdebugout" *)
output wire [1 : 0] ch0_refdebugout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxdapiresetdone" *)
output wire ch0_rxdapiresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxdebugpcsout" *)
output wire ch0_rxdebugpcsout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxpkdet" *)
output wire ch0_rxpkdet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxqpisenn" *)
output wire ch0_rxqpisenn;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxqpisenp" *)
output wire ch0_rxqpisenp;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxsimplexphystatus" *)
output wire ch0_rxsimplexphystatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxslipdone" *)
output wire ch0_rxslipdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_dfehold" *)
input wire ch0_dfehold;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_dfeovrd" *)
input wire ch0_dfeovrd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxdapireset" *)
input wire ch0_rxdapireset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxdapiresetmask" *)
input wire [1 : 0] ch0_rxdapiresetmask;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RX0_GT_IP_Interface, PARENT_ID undef, CHNL_NUMBER undef, MASTERCLK_SRC undef, GT_DIRECTION undef, RX_SETTINGS undef, ADDITIONAL_QUAD_SETTINGS undef, ADDITIONAL_CONFIG_FILE undef, ADDITIONAL_CONFIG_ENABLE undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX0_GT_IP_Interface ch_rxqpien" *)
input wire ch0_rxqpien;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RX0_OUTCLK, FREQ_HZ 156250000, IS_MASTER false, PARENT_ID undef, PHASE 0.0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:gt_outclk:1.0 RX0_OUTCLK CLK" *)
output wire ch0_rxoutclk;
input wire ch0_rxusrclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxdata" *)
output wire [127 : 0] ch1_rxdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxdatavalid" *)
output wire [1 : 0] ch1_rxdatavalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxheader" *)
output wire [5 : 0] ch1_rxheader;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxgearboxslip" *)
input wire ch1_rxgearboxslip;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxlatclk" *)
input wire ch1_rxlatclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_gtrxreset" *)
input wire ch1_gtrxreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxprogdivreset" *)
input wire ch1_rxprogdivreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxuserrdy" *)
input wire ch1_rxuserrdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxprogdivresetdone" *)
output wire ch1_rxprogdivresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxpmaresetdone" *)
output wire ch1_rxpmaresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxresetdone" *)
output wire ch1_rxresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rx10gstat" *)
output wire [7 : 0] ch1_rx10gstat;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxbufstatus" *)
output wire [2 : 0] ch1_rxbufstatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxbyteisaligned" *)
output wire ch1_rxbyteisaligned;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxbyterealign" *)
output wire ch1_rxbyterealign;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxcdrhold" *)
input wire ch1_rxcdrhold;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxcdrlock" *)
output wire ch1_rxcdrlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxcdrovrden" *)
input wire ch1_rxcdrovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxcdrphdone" *)
output wire ch1_rxcdrphdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxcdrreset" *)
input wire ch1_rxcdrreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxchanbondseq" *)
output wire ch1_rxchanbondseq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxchanisaligned" *)
output wire ch1_rxchanisaligned;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxchanrealign" *)
output wire ch1_rxchanrealign;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxchbondi" *)
input wire [4 : 0] ch1_rxchbondi;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxchbondo" *)
output wire [4 : 0] ch1_rxchbondo;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxclkcorcnt" *)
output wire [1 : 0] ch1_rxclkcorcnt;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxcominitdet" *)
output wire ch1_rxcominitdet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxcommadet" *)
output wire ch1_rxcommadet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxcomsasdet" *)
output wire ch1_rxcomsasdet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxcomwakedet" *)
output wire ch1_rxcomwakedet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxctrl0" *)
output wire [15 : 0] ch1_rxctrl0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxctrl1" *)
output wire [15 : 0] ch1_rxctrl1;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxctrl2" *)
output wire [7 : 0] ch1_rxctrl2;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxctrl3" *)
output wire [7 : 0] ch1_rxctrl3;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxdapicodeovrden" *)
input wire ch1_rxdapicodeovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxdapicodereset" *)
input wire ch1_rxdapicodereset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxdlyalignerr" *)
output wire ch1_rxdlyalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxdlyalignprog" *)
output wire ch1_rxdlyalignprog;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxdlyalignreq" *)
input wire ch1_rxdlyalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxelecidle" *)
output wire ch1_rxelecidle;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxeqtraining" *)
input wire ch1_rxeqtraining;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxfinealigndone" *)
output wire ch1_rxfinealigndone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxheadervalid" *)
output wire [1 : 0] ch1_rxheadervalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxlpmen" *)
input wire ch1_rxlpmen;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxmldchaindone" *)
input wire ch1_rxmldchaindone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxmldchainreq" *)
input wire ch1_rxmldchainreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxmlfinealignreq" *)
input wire ch1_rxmlfinealignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxoobreset" *)
input wire ch1_rxoobreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxosintdone" *)
output wire ch1_rxosintdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxpcsresetmask" *)
input wire [4 : 0] ch1_rxpcsresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxpd" *)
input wire [1 : 0] ch1_rxpd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxphaligndone" *)
output wire ch1_rxphaligndone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxphalignerr" *)
output wire ch1_rxphalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxphalignreq" *)
input wire ch1_rxphalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxphalignresetmask" *)
input wire [1 : 0] ch1_rxphalignresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxphdlypd" *)
input wire ch1_rxphdlypd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxphdlyreset" *)
input wire ch1_rxphdlyreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxphdlyresetdone" *)
output wire ch1_rxphdlyresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxphsetinitdone" *)
output wire ch1_rxphsetinitdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxphsetinitreq" *)
input wire ch1_rxphsetinitreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxphshift180" *)
input wire ch1_rxphshift180;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxphshift180done" *)
output wire ch1_rxphshift180done;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxpmaresetmask" *)
input wire [6 : 0] ch1_rxpmaresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxpolarity" *)
input wire ch1_rxpolarity;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxprbscntreset" *)
input wire ch1_rxprbscntreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxprbserr" *)
output wire ch1_rxprbserr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxprbslocked" *)
output wire ch1_rxprbslocked;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxprbssel" *)
input wire [3 : 0] ch1_rxprbssel;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxrate" *)
input wire [7 : 0] ch1_rxrate;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxresetmode" *)
input wire [1 : 0] ch1_rxresetmode;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxmstreset" *)
input wire ch1_rxmstreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxmstdatapathreset" *)
input wire ch1_rxmstdatapathreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxmstresetdone" *)
output wire ch1_rxmstresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxslide" *)
input wire ch1_rxslide;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxsliderdy" *)
output wire ch1_rxsliderdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxstartofseq" *)
output wire [1 : 0] ch1_rxstartofseq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxstatus" *)
output wire [2 : 0] ch1_rxstatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxsyncallin" *)
input wire ch1_rxsyncallin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxsyncdone" *)
output wire ch1_rxsyncdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxtermination" *)
input wire ch1_rxtermination;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxvalid" *)
output wire ch1_rxvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_cdrbmcdrreq" *)
input wire ch1_cdrbmcdrreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_cdrfreqos" *)
input wire ch1_cdrfreqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_cdrincpctrl" *)
input wire ch1_cdrincpctrl;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_cdrstepdir" *)
input wire ch1_cdrstepdir;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_cdrstepsq" *)
input wire ch1_cdrstepsq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_cdrstepsx" *)
input wire ch1_cdrstepsx;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_eyescanreset" *)
input wire ch1_eyescanreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_eyescantrigger" *)
input wire ch1_eyescantrigger;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_eyescandataerror" *)
output wire ch1_eyescandataerror;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_refdebugout" *)
output wire [1 : 0] ch1_refdebugout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxdapiresetdone" *)
output wire ch1_rxdapiresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxdebugpcsout" *)
output wire ch1_rxdebugpcsout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxpkdet" *)
output wire ch1_rxpkdet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxqpisenn" *)
output wire ch1_rxqpisenn;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxqpisenp" *)
output wire ch1_rxqpisenp;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxsimplexphystatus" *)
output wire ch1_rxsimplexphystatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxslipdone" *)
output wire ch1_rxslipdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_dfehold" *)
input wire ch1_dfehold;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_dfeovrd" *)
input wire ch1_dfeovrd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxdapireset" *)
input wire ch1_rxdapireset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxdapiresetmask" *)
input wire [1 : 0] ch1_rxdapiresetmask;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RX1_GT_IP_Interface, PARENT_ID undef, CHNL_NUMBER undef, MASTERCLK_SRC undef, GT_DIRECTION undef, RX_SETTINGS undef, ADDITIONAL_QUAD_SETTINGS undef, ADDITIONAL_CONFIG_FILE undef, ADDITIONAL_CONFIG_ENABLE undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX1_GT_IP_Interface ch_rxqpien" *)
input wire ch1_rxqpien;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RX1_OUTCLK, FREQ_HZ 156250000, IS_MASTER false, PARENT_ID undef, PHASE 0.0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:gt_outclk:1.0 RX1_OUTCLK CLK" *)
output wire ch1_rxoutclk;
input wire ch1_rxusrclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxdata" *)
output wire [127 : 0] ch2_rxdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxdatavalid" *)
output wire [1 : 0] ch2_rxdatavalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxheader" *)
output wire [5 : 0] ch2_rxheader;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxgearboxslip" *)
input wire ch2_rxgearboxslip;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxlatclk" *)
input wire ch2_rxlatclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_gtrxreset" *)
input wire ch2_gtrxreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxprogdivreset" *)
input wire ch2_rxprogdivreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxuserrdy" *)
input wire ch2_rxuserrdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxprogdivresetdone" *)
output wire ch2_rxprogdivresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxpmaresetdone" *)
output wire ch2_rxpmaresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxresetdone" *)
output wire ch2_rxresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rx10gstat" *)
output wire [7 : 0] ch2_rx10gstat;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxbufstatus" *)
output wire [2 : 0] ch2_rxbufstatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxbyteisaligned" *)
output wire ch2_rxbyteisaligned;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxbyterealign" *)
output wire ch2_rxbyterealign;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxcdrhold" *)
input wire ch2_rxcdrhold;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxcdrlock" *)
output wire ch2_rxcdrlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxcdrovrden" *)
input wire ch2_rxcdrovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxcdrphdone" *)
output wire ch2_rxcdrphdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxcdrreset" *)
input wire ch2_rxcdrreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxchanbondseq" *)
output wire ch2_rxchanbondseq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxchanisaligned" *)
output wire ch2_rxchanisaligned;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxchanrealign" *)
output wire ch2_rxchanrealign;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxchbondi" *)
input wire [4 : 0] ch2_rxchbondi;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxchbondo" *)
output wire [4 : 0] ch2_rxchbondo;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxclkcorcnt" *)
output wire [1 : 0] ch2_rxclkcorcnt;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxcominitdet" *)
output wire ch2_rxcominitdet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxcommadet" *)
output wire ch2_rxcommadet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxcomsasdet" *)
output wire ch2_rxcomsasdet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxcomwakedet" *)
output wire ch2_rxcomwakedet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxctrl0" *)
output wire [15 : 0] ch2_rxctrl0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxctrl1" *)
output wire [15 : 0] ch2_rxctrl1;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxctrl2" *)
output wire [7 : 0] ch2_rxctrl2;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxctrl3" *)
output wire [7 : 0] ch2_rxctrl3;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxdapicodeovrden" *)
input wire ch2_rxdapicodeovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxdapicodereset" *)
input wire ch2_rxdapicodereset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxdlyalignerr" *)
output wire ch2_rxdlyalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxdlyalignprog" *)
output wire ch2_rxdlyalignprog;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxdlyalignreq" *)
input wire ch2_rxdlyalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxelecidle" *)
output wire ch2_rxelecidle;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxeqtraining" *)
input wire ch2_rxeqtraining;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxfinealigndone" *)
output wire ch2_rxfinealigndone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxheadervalid" *)
output wire [1 : 0] ch2_rxheadervalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxlpmen" *)
input wire ch2_rxlpmen;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxmldchaindone" *)
input wire ch2_rxmldchaindone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxmldchainreq" *)
input wire ch2_rxmldchainreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxmlfinealignreq" *)
input wire ch2_rxmlfinealignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxoobreset" *)
input wire ch2_rxoobreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxosintdone" *)
output wire ch2_rxosintdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxpcsresetmask" *)
input wire [4 : 0] ch2_rxpcsresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxpd" *)
input wire [1 : 0] ch2_rxpd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxphaligndone" *)
output wire ch2_rxphaligndone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxphalignerr" *)
output wire ch2_rxphalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxphalignreq" *)
input wire ch2_rxphalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxphalignresetmask" *)
input wire [1 : 0] ch2_rxphalignresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxphdlypd" *)
input wire ch2_rxphdlypd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxphdlyreset" *)
input wire ch2_rxphdlyreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxphdlyresetdone" *)
output wire ch2_rxphdlyresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxphsetinitdone" *)
output wire ch2_rxphsetinitdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxphsetinitreq" *)
input wire ch2_rxphsetinitreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxphshift180" *)
input wire ch2_rxphshift180;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxphshift180done" *)
output wire ch2_rxphshift180done;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxpmaresetmask" *)
input wire [6 : 0] ch2_rxpmaresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxpolarity" *)
input wire ch2_rxpolarity;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxprbscntreset" *)
input wire ch2_rxprbscntreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxprbserr" *)
output wire ch2_rxprbserr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxprbslocked" *)
output wire ch2_rxprbslocked;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxprbssel" *)
input wire [3 : 0] ch2_rxprbssel;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxrate" *)
input wire [7 : 0] ch2_rxrate;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxresetmode" *)
input wire [1 : 0] ch2_rxresetmode;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxmstreset" *)
input wire ch2_rxmstreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxmstdatapathreset" *)
input wire ch2_rxmstdatapathreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxmstresetdone" *)
output wire ch2_rxmstresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxslide" *)
input wire ch2_rxslide;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxsliderdy" *)
output wire ch2_rxsliderdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxstartofseq" *)
output wire [1 : 0] ch2_rxstartofseq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxstatus" *)
output wire [2 : 0] ch2_rxstatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxsyncallin" *)
input wire ch2_rxsyncallin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxsyncdone" *)
output wire ch2_rxsyncdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxtermination" *)
input wire ch2_rxtermination;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxvalid" *)
output wire ch2_rxvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_cdrbmcdrreq" *)
input wire ch2_cdrbmcdrreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_cdrfreqos" *)
input wire ch2_cdrfreqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_cdrincpctrl" *)
input wire ch2_cdrincpctrl;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_cdrstepdir" *)
input wire ch2_cdrstepdir;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_cdrstepsq" *)
input wire ch2_cdrstepsq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_cdrstepsx" *)
input wire ch2_cdrstepsx;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_eyescanreset" *)
input wire ch2_eyescanreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_eyescantrigger" *)
input wire ch2_eyescantrigger;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_eyescandataerror" *)
output wire ch2_eyescandataerror;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_refdebugout" *)
output wire [1 : 0] ch2_refdebugout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxdapiresetdone" *)
output wire ch2_rxdapiresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxdebugpcsout" *)
output wire ch2_rxdebugpcsout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxpkdet" *)
output wire ch2_rxpkdet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxqpisenn" *)
output wire ch2_rxqpisenn;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxqpisenp" *)
output wire ch2_rxqpisenp;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxsimplexphystatus" *)
output wire ch2_rxsimplexphystatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxslipdone" *)
output wire ch2_rxslipdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_dfehold" *)
input wire ch2_dfehold;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_dfeovrd" *)
input wire ch2_dfeovrd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxdapireset" *)
input wire ch2_rxdapireset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxdapiresetmask" *)
input wire [1 : 0] ch2_rxdapiresetmask;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RX2_GT_IP_Interface, PARENT_ID undef, CHNL_NUMBER undef, MASTERCLK_SRC undef, GT_DIRECTION undef, RX_SETTINGS undef, ADDITIONAL_QUAD_SETTINGS undef, ADDITIONAL_CONFIG_FILE undef, ADDITIONAL_CONFIG_ENABLE undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX2_GT_IP_Interface ch_rxqpien" *)
input wire ch2_rxqpien;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RX2_OUTCLK, FREQ_HZ 156250000, IS_MASTER false, PARENT_ID undef, PHASE 0.0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:gt_outclk:1.0 RX2_OUTCLK CLK" *)
output wire ch2_rxoutclk;
input wire ch2_rxusrclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxdata" *)
output wire [127 : 0] ch3_rxdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxdatavalid" *)
output wire [1 : 0] ch3_rxdatavalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxheader" *)
output wire [5 : 0] ch3_rxheader;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxgearboxslip" *)
input wire ch3_rxgearboxslip;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxlatclk" *)
input wire ch3_rxlatclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_gtrxreset" *)
input wire ch3_gtrxreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxprogdivreset" *)
input wire ch3_rxprogdivreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxuserrdy" *)
input wire ch3_rxuserrdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxprogdivresetdone" *)
output wire ch3_rxprogdivresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxpmaresetdone" *)
output wire ch3_rxpmaresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxresetdone" *)
output wire ch3_rxresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rx10gstat" *)
output wire [7 : 0] ch3_rx10gstat;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxbufstatus" *)
output wire [2 : 0] ch3_rxbufstatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxbyteisaligned" *)
output wire ch3_rxbyteisaligned;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxbyterealign" *)
output wire ch3_rxbyterealign;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxcdrhold" *)
input wire ch3_rxcdrhold;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxcdrlock" *)
output wire ch3_rxcdrlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxcdrovrden" *)
input wire ch3_rxcdrovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxcdrphdone" *)
output wire ch3_rxcdrphdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxcdrreset" *)
input wire ch3_rxcdrreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxchanbondseq" *)
output wire ch3_rxchanbondseq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxchanisaligned" *)
output wire ch3_rxchanisaligned;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxchanrealign" *)
output wire ch3_rxchanrealign;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxchbondi" *)
input wire [4 : 0] ch3_rxchbondi;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxchbondo" *)
output wire [4 : 0] ch3_rxchbondo;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxclkcorcnt" *)
output wire [1 : 0] ch3_rxclkcorcnt;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxcominitdet" *)
output wire ch3_rxcominitdet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxcommadet" *)
output wire ch3_rxcommadet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxcomsasdet" *)
output wire ch3_rxcomsasdet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxcomwakedet" *)
output wire ch3_rxcomwakedet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxctrl0" *)
output wire [15 : 0] ch3_rxctrl0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxctrl1" *)
output wire [15 : 0] ch3_rxctrl1;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxctrl2" *)
output wire [7 : 0] ch3_rxctrl2;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxctrl3" *)
output wire [7 : 0] ch3_rxctrl3;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxdapicodeovrden" *)
input wire ch3_rxdapicodeovrden;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxdapicodereset" *)
input wire ch3_rxdapicodereset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxdlyalignerr" *)
output wire ch3_rxdlyalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxdlyalignprog" *)
output wire ch3_rxdlyalignprog;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxdlyalignreq" *)
input wire ch3_rxdlyalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxelecidle" *)
output wire ch3_rxelecidle;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxeqtraining" *)
input wire ch3_rxeqtraining;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxfinealigndone" *)
output wire ch3_rxfinealigndone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxheadervalid" *)
output wire [1 : 0] ch3_rxheadervalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxlpmen" *)
input wire ch3_rxlpmen;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxmldchaindone" *)
input wire ch3_rxmldchaindone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxmldchainreq" *)
input wire ch3_rxmldchainreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxmlfinealignreq" *)
input wire ch3_rxmlfinealignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxoobreset" *)
input wire ch3_rxoobreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxosintdone" *)
output wire ch3_rxosintdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxpcsresetmask" *)
input wire [4 : 0] ch3_rxpcsresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxpd" *)
input wire [1 : 0] ch3_rxpd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxphaligndone" *)
output wire ch3_rxphaligndone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxphalignerr" *)
output wire ch3_rxphalignerr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxphalignreq" *)
input wire ch3_rxphalignreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxphalignresetmask" *)
input wire [1 : 0] ch3_rxphalignresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxphdlypd" *)
input wire ch3_rxphdlypd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxphdlyreset" *)
input wire ch3_rxphdlyreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxphdlyresetdone" *)
output wire ch3_rxphdlyresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxphsetinitdone" *)
output wire ch3_rxphsetinitdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxphsetinitreq" *)
input wire ch3_rxphsetinitreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxphshift180" *)
input wire ch3_rxphshift180;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxphshift180done" *)
output wire ch3_rxphshift180done;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxpmaresetmask" *)
input wire [6 : 0] ch3_rxpmaresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxpolarity" *)
input wire ch3_rxpolarity;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxprbscntreset" *)
input wire ch3_rxprbscntreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxprbserr" *)
output wire ch3_rxprbserr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxprbslocked" *)
output wire ch3_rxprbslocked;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxprbssel" *)
input wire [3 : 0] ch3_rxprbssel;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxrate" *)
input wire [7 : 0] ch3_rxrate;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxresetmode" *)
input wire [1 : 0] ch3_rxresetmode;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxmstreset" *)
input wire ch3_rxmstreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxmstdatapathreset" *)
input wire ch3_rxmstdatapathreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxmstresetdone" *)
output wire ch3_rxmstresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxslide" *)
input wire ch3_rxslide;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxsliderdy" *)
output wire ch3_rxsliderdy;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxstartofseq" *)
output wire [1 : 0] ch3_rxstartofseq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxstatus" *)
output wire [2 : 0] ch3_rxstatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxsyncallin" *)
input wire ch3_rxsyncallin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxsyncdone" *)
output wire ch3_rxsyncdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxtermination" *)
input wire ch3_rxtermination;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxvalid" *)
output wire ch3_rxvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_cdrbmcdrreq" *)
input wire ch3_cdrbmcdrreq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_cdrfreqos" *)
input wire ch3_cdrfreqos;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_cdrincpctrl" *)
input wire ch3_cdrincpctrl;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_cdrstepdir" *)
input wire ch3_cdrstepdir;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_cdrstepsq" *)
input wire ch3_cdrstepsq;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_cdrstepsx" *)
input wire ch3_cdrstepsx;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_eyescanreset" *)
input wire ch3_eyescanreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_eyescantrigger" *)
input wire ch3_eyescantrigger;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_eyescandataerror" *)
output wire ch3_eyescandataerror;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_refdebugout" *)
output wire [1 : 0] ch3_refdebugout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxdapiresetdone" *)
output wire ch3_rxdapiresetdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxdebugpcsout" *)
output wire ch3_rxdebugpcsout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxpkdet" *)
output wire ch3_rxpkdet;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxqpisenn" *)
output wire ch3_rxqpisenn;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxqpisenp" *)
output wire ch3_rxqpisenp;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxsimplexphystatus" *)
output wire ch3_rxsimplexphystatus;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxslipdone" *)
output wire ch3_rxslipdone;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_dfehold" *)
input wire ch3_dfehold;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_dfeovrd" *)
input wire ch3_dfeovrd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxdapireset" *)
input wire ch3_rxdapireset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxdapiresetmask" *)
input wire [1 : 0] ch3_rxdapiresetmask;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RX3_GT_IP_Interface, PARENT_ID undef, CHNL_NUMBER undef, MASTERCLK_SRC undef, GT_DIRECTION undef, RX_SETTINGS undef, ADDITIONAL_QUAD_SETTINGS undef, ADDITIONAL_CONFIG_FILE undef, ADDITIONAL_CONFIG_ENABLE undef" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_rx_interface:1.0 RX3_GT_IP_Interface ch_rxqpien" *)
input wire ch3_rxqpien;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RX3_OUTCLK, FREQ_HZ 156250000, IS_MASTER false, PARENT_ID undef, PHASE 0.0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:gt_outclk:1.0 RX3_OUTCLK CLK" *)
output wire ch3_rxoutclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RX3_USRCLK, FREQ_HZ 156250000, PARENT_ID undef, PHASE 0.0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:gt_usrclk:1.0 RX3_USRCLK CLK" *)
input wire ch3_rxusrclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT0_BUFGT ch_bufgtce" *)
output wire ch0_bufgtce;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT0_BUFGT ch_bufgtrst" *)
output wire ch0_bufgtrst;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT0_BUFGT ch_bufgtcemask" *)
output wire [3 : 0] ch0_bufgtcemask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT0_BUFGT ch_bufgtrstmask" *)
output wire [3 : 0] ch0_bufgtrstmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT0_BUFGT ch_bufgtdiv" *)
output wire [11 : 0] ch0_bufgtdiv;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH0_DEBUG ch_clkrsvd0" *)
input wire ch0_clkrsvd0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH0_DEBUG ch_clkrsvd1" *)
input wire ch0_clkrsvd1;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH0_DEBUG ch_dmonitorclk" *)
input wire ch0_dmonitorclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH0_DEBUG ch_phyesmadaptsave" *)
input wire ch0_phyesmadaptsave;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH0_DEBUG ch_iloresetmask" *)
input wire ch0_iloresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH0_DEBUG ch_loopback" *)
input wire [2 : 0] ch0_loopback;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH0_DEBUG ch_dmonfiforeset" *)
input wire ch0_dmonfiforeset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH0_DEBUG ch_pcsrsvdin" *)
input wire [15 : 0] ch0_pcsrsvdin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH0_DEBUG ch_gtrsvd" *)
input wire [15 : 0] ch0_gtrsvd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH0_DEBUG ch_pcsrsvdout" *)
output wire [15 : 0] ch0_pcsrsvdout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH0_DEBUG ch_pinrsvdas" *)
output wire [15 : 0] ch0_pinrsvdas;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH0_DEBUG ch_dmonitoroutclk" *)
output wire ch0_dmonitoroutclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH0_DEBUG ch_resetexception" *)
output wire ch0_resetexception;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH0_DEBUG ch_dmonitorout" *)
output wire [31 : 0] ch0_dmonitorout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH0_DEBUG ch_phyready" *)
output wire ch0_phyready;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH0_DEBUG ch_hsdppcsreset" *)
input wire ch0_hsdppcsreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT1_BUFGT ch_bufgtce" *)
output wire ch1_bufgtce;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT1_BUFGT ch_bufgtrst" *)
output wire ch1_bufgtrst;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT1_BUFGT ch_bufgtcemask" *)
output wire [3 : 0] ch1_bufgtcemask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT1_BUFGT ch_bufgtrstmask" *)
output wire [3 : 0] ch1_bufgtrstmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT1_BUFGT ch_bufgtdiv" *)
output wire [11 : 0] ch1_bufgtdiv;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH1_DEBUG ch_clkrsvd0" *)
input wire ch1_clkrsvd0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH1_DEBUG ch_clkrsvd1" *)
input wire ch1_clkrsvd1;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH1_DEBUG ch_dmonitorclk" *)
input wire ch1_dmonitorclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH1_DEBUG ch_phyesmadaptsave" *)
input wire ch1_phyesmadaptsave;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH1_DEBUG ch_iloresetmask" *)
input wire ch1_iloresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH1_DEBUG ch_loopback" *)
input wire [2 : 0] ch1_loopback;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH1_DEBUG ch_dmonfiforeset" *)
input wire ch1_dmonfiforeset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH1_DEBUG ch_pcsrsvdin" *)
input wire [15 : 0] ch1_pcsrsvdin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH1_DEBUG ch_gtrsvd" *)
input wire [15 : 0] ch1_gtrsvd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH1_DEBUG ch_pcsrsvdout" *)
output wire [15 : 0] ch1_pcsrsvdout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH1_DEBUG ch_pinrsvdas" *)
output wire [15 : 0] ch1_pinrsvdas;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH1_DEBUG ch_dmonitoroutclk" *)
output wire ch1_dmonitoroutclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH1_DEBUG ch_resetexception" *)
output wire ch1_resetexception;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH1_DEBUG ch_dmonitorout" *)
output wire [31 : 0] ch1_dmonitorout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH1_DEBUG ch_phyready" *)
output wire ch1_phyready;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH1_DEBUG ch_hsdppcsreset" *)
input wire ch1_hsdppcsreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT2_BUFGT ch_bufgtce" *)
output wire ch2_bufgtce;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT2_BUFGT ch_bufgtrst" *)
output wire ch2_bufgtrst;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT2_BUFGT ch_bufgtcemask" *)
output wire [3 : 0] ch2_bufgtcemask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT2_BUFGT ch_bufgtrstmask" *)
output wire [3 : 0] ch2_bufgtrstmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT2_BUFGT ch_bufgtdiv" *)
output wire [11 : 0] ch2_bufgtdiv;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH2_DEBUG ch_clkrsvd0" *)
input wire ch2_clkrsvd0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH2_DEBUG ch_clkrsvd1" *)
input wire ch2_clkrsvd1;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH2_DEBUG ch_dmonitorclk" *)
input wire ch2_dmonitorclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH2_DEBUG ch_phyesmadaptsave" *)
input wire ch2_phyesmadaptsave;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH2_DEBUG ch_iloresetmask" *)
input wire ch2_iloresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH2_DEBUG ch_loopback" *)
input wire [2 : 0] ch2_loopback;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH2_DEBUG ch_dmonfiforeset" *)
input wire ch2_dmonfiforeset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH2_DEBUG ch_pcsrsvdin" *)
input wire [15 : 0] ch2_pcsrsvdin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH2_DEBUG ch_gtrsvd" *)
input wire [15 : 0] ch2_gtrsvd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH2_DEBUG ch_pcsrsvdout" *)
output wire [15 : 0] ch2_pcsrsvdout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH2_DEBUG ch_pinrsvdas" *)
output wire [15 : 0] ch2_pinrsvdas;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH2_DEBUG ch_dmonitoroutclk" *)
output wire ch2_dmonitoroutclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH2_DEBUG ch_resetexception" *)
output wire ch2_resetexception;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH2_DEBUG ch_dmonitorout" *)
output wire [31 : 0] ch2_dmonitorout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH2_DEBUG ch_phyready" *)
output wire ch2_phyready;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH2_DEBUG ch_hsdppcsreset" *)
input wire ch2_hsdppcsreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT3_BUFGT ch_bufgtce" *)
output wire ch3_bufgtce;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT3_BUFGT ch_bufgtrst" *)
output wire ch3_bufgtrst;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT3_BUFGT ch_bufgtcemask" *)
output wire [3 : 0] ch3_bufgtcemask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT3_BUFGT ch_bufgtrstmask" *)
output wire [3 : 0] ch3_bufgtrstmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_bufgt:1.0 GT3_BUFGT ch_bufgtdiv" *)
output wire [11 : 0] ch3_bufgtdiv;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH3_DEBUG ch_clkrsvd0" *)
input wire ch3_clkrsvd0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH3_DEBUG ch_clkrsvd1" *)
input wire ch3_clkrsvd1;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH3_DEBUG ch_dmonitorclk" *)
input wire ch3_dmonitorclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH3_DEBUG ch_phyesmadaptsave" *)
input wire ch3_phyesmadaptsave;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH3_DEBUG ch_iloresetmask" *)
input wire ch3_iloresetmask;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH3_DEBUG ch_loopback" *)
input wire [2 : 0] ch3_loopback;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH3_DEBUG ch_dmonfiforeset" *)
input wire ch3_dmonfiforeset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH3_DEBUG ch_pcsrsvdin" *)
input wire [15 : 0] ch3_pcsrsvdin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH3_DEBUG ch_gtrsvd" *)
input wire [15 : 0] ch3_gtrsvd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH3_DEBUG ch_pcsrsvdout" *)
output wire [15 : 0] ch3_pcsrsvdout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH3_DEBUG ch_pinrsvdas" *)
output wire [15 : 0] ch3_pinrsvdas;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH3_DEBUG ch_dmonitoroutclk" *)
output wire ch3_dmonitoroutclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH3_DEBUG ch_resetexception" *)
output wire ch3_resetexception;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH3_DEBUG ch_dmonitorout" *)
output wire [31 : 0] ch3_dmonitorout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH3_DEBUG ch_phyready" *)
output wire ch3_phyready;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_channel_debug:1.0 CH3_DEBUG ch_hsdppcsreset" *)
input wire ch3_hsdppcsreset;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_northsouth:1.0 GT_NORTHIN_SOUTHOUT RESETDONE_NORTHIN" *)
input wire [1 : 0] resetdone_northin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_northsouth:1.0 GT_NORTHOUT_SOUTHIN RESETDONE_SOUTHOUT" *)
input wire [1 : 0] resetdone_southin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_northsouth:1.0 GT_NORTHOUT_SOUTHIN RESETDONE_NORTHIN" *)
output wire [1 : 0] resetdone_northout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_northsouth:1.0 GT_NORTHIN_SOUTHOUT RESETDONE_SOUTHOUT" *)
output wire [1 : 0] resetdone_southout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_northsouth:1.0 GT_NORTHIN_SOUTHOUT TXPINORTHIN" *)
input wire [3 : 0] txpinorthin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_northsouth:1.0 GT_NORTHIN_SOUTHOUT RXPINORTHIN" *)
input wire [3 : 0] rxpinorthin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_northsouth:1.0 GT_NORTHOUT_SOUTHIN TXPISOUTHOUT" *)
input wire [3 : 0] txpisouthin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_northsouth:1.0 GT_NORTHOUT_SOUTHIN RXPISOUTHOUT" *)
input wire [3 : 0] rxpisouthin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_northsouth:1.0 GT_NORTHIN_SOUTHOUT PIPENORTHIN" *)
input wire [5 : 0] pipenorthin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_northsouth:1.0 GT_NORTHOUT_SOUTHIN PIPESOUTHOUT" *)
input wire [5 : 0] pipesouthin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_northsouth:1.0 GT_NORTHOUT_SOUTHIN txpinorthin" *)
output wire [3 : 0] txpinorthout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_northsouth:1.0 GT_NORTHIN_SOUTHOUT TXPISOUTHOUT" *)
output wire [3 : 0] txpisouthout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_northsouth:1.0 GT_NORTHOUT_SOUTHIN RXPINORTHIN" *)
output wire [3 : 0] rxpinorthout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_northsouth:1.0 GT_NORTHIN_SOUTHOUT RXPISOUTHOUT" *)
output wire [3 : 0] rxpisouthout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_northsouth:1.0 GT_NORTHOUT_SOUTHIN PIPENORTHIN" *)
output wire [5 : 0] pipenorthout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_northsouth:1.0 GT_NORTHIN_SOUTHOUT PIPESOUTHOUT" *)
output wire [5 : 0] pipesouthout;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME GT_REFCLK0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 GT_REFCLK0 CLK" *)
input wire GT_REFCLK0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG bgbypassb" *)
input wire bgbypassb;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG bgmonitorenb" *)
input wire bgmonitorenb;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG bgpdb" *)
input wire bgpdb;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG bgrcalovrdenb" *)
input wire bgrcalovrdenb;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG bgrcalovrd" *)
input wire [4 : 0] bgrcalovrd;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG debugtraceready" *)
input wire debugtraceready;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG debugtraceclk" *)
input wire debugtraceclk;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG rcalenb" *)
input wire rcalenb;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG trigackout0" *)
input wire trigackout0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG trigin0" *)
input wire trigin0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG ubenable" *)
input wire ubenable;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG ubiolmbrst" *)
input wire ubiolmbrst;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG ubmbrst" *)
input wire ubmbrst;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG ubintr" *)
input wire [11 : 0] ubintr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG ubrxuart" *)
input wire ubrxuart;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG ctrlrsvdin0" *)
input wire [7 : 0] ctrlrsvdin;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG coestatusdebug" *)
input wire coestatusdebug;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG gpi" *)
input wire [31 : 0] gpi;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG refclk0_clktestsig" *)
input wire refclk0_clktestsig;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG refclk1_clktestsig" *)
input wire refclk1_clktestsig;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG correcterr" *)
output wire correcterr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG debugtracetvalid" *)
output wire debugtracetvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG debugtracedata" *)
output wire [15 : 0] debugtracetdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG refclk0_gtrefclkpdint" *)
output wire refclk0_gtrefclkpdint;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG refclk0_clktestsigint" *)
output wire refclk0_clktestsigint;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG refclk1_gtrefclkpdint" *)
output wire refclk1_gtrefclkpdint;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG refclk1_clktestsigint" *)
output wire refclk1_clktestsigint;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG trigackin0" *)
output wire trigackin0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG trigout0" *)
output wire trigout0;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG ubinterrupt" *)
output wire ubinterrupt;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG ubtxuart" *)
output wire ubtxuart;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG uncorrecterr" *)
output wire uncorrecterr;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG ctrlrsvdout" *)
output wire [7 : 0] ctrlrsvdout;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG gpo" *)
output wire [31 : 0] gpo;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG hsclk0_rxrecclksel" *)
output wire [1 : 0] hsclk0_rxrecclksel;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt_debug:1.0 GT_DEBUG hsclk1_rxrecclksel" *)
output wire [1 : 0] hsclk1_rxrecclksel;
output wire ch0_xpipe5_pipeline_en;
output wire ch1_xpipe5_pipeline_en;
output wire ch2_xpipe5_pipeline_en;
output wire ch3_xpipe5_pipeline_en;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME apb3clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 apb3clk CLK" *)
input wire apb3clk;
(* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB3_INTF PADDR" *)
input wire [15 : 0] apb3paddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB3_INTF PENABLE" *)
input wire apb3penable;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME apb3presetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 apb3presetn RST" *)
input wire apb3presetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB3_INTF PRDATA" *)
output wire [31 : 0] apb3prdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB3_INTF PSEL" *)
input wire apb3psel;
(* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB3_INTF PSLVERR" *)
output wire apb3pslverr;
(* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB3_INTF PREADY" *)
output wire apb3pready;
(* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB3_INTF PWDATA" *)
input wire [31 : 0] apb3pwdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:apb:1.0 APB3_INTF PWRITE" *)
input wire apb3pwrite;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 GT_Serial GRX_P" *)
input wire [3 : 0] rxp;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 GT_Serial GRX_N" *)
input wire [3 : 0] rxn;
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 GT_Serial GTX_P" *)
output wire [3 : 0] txp;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME GT_Serial, CAN_DEBUG false" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 GT_Serial GTX_N" *)
output wire [3 : 0] txn;

  extended_phy_layer_gtwiz_versal_0_0_gt_quad_base_0_inst #(
    .PROT0_SETTINGS("LR0_SETTINGS {GT_DIRECTION DUPLEX GT_TYPE GTYP INS_LOSS_NYQ 20 INTERNAL_PRESET None OOB_ENABLE false PCIE_ENABLE false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 PRESET None RESET_SEQUENCE_INTERVAL 0 RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 150.000000 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 RX_64B66B_CRC false RX_64B66B_DECODER false RX_64B66B_DESCRAMBLER false RX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_\
MODE_LANE MULTI RX_BUFFER_MODE 1 RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RX_CB_DISP_0_0 false RX_CB_DISP_0_1 false RX_CB_DISP_0_2 false RX_CB_DISP_0_3 false RX_CB_DISP_1_0 false RX_CB_DISP_1_1 false RX_CB_DISP_1_2 false RX_CB_DISP_1_3 false RX_CB_K_0_0 false RX_CB_K_0_1 false RX_CB_K_0_2 false RX_CB_K_0_3 false RX_CB_K_1_0 false RX_CB_K_1_1 false RX_CB_K_1_2 false RX_CB_K_1_3 false RX_CB_LEN_SEQ 1 RX_CB_MASK_0_0 false RX_CB_\
MASK_0_1 false RX_CB_MASK_0_2 false RX_CB_MASK_0_3 false RX_CB_MASK_1_0 false RX_CB_MASK_1_1 false RX_CB_MASK_1_2 false RX_CB_MASK_1_3 false RX_CB_MAX_LEVEL 1 RX_CB_MAX_SKEW 1 RX_CB_NUM_SEQ 0 RX_CB_VAL_0_0 00000000 RX_CB_VAL_0_1 00000000 RX_CB_VAL_0_2 00000000 RX_CB_VAL_0_3 00000000 RX_CB_VAL_1_0 00000000 RX_CB_VAL_1_1 00000000 RX_CB_VAL_1_2 00000000 RX_CB_VAL_1_3 00000000 RX_CC_DISP_0_0 false RX_CC_DISP_0_1 false RX_CC_DISP_0_2 false RX_CC_DISP_0_3 false RX_CC_DISP_1_0 false RX_CC_DISP_1_1 fals\
e RX_CC_DISP_1_2 false RX_CC_DISP_1_3 false RX_CC_KEEP_IDLE DISABLE RX_CC_K_0_0 true RX_CC_K_0_1 false RX_CC_K_0_2 false RX_CC_K_0_3 false RX_CC_K_1_0 false RX_CC_K_1_1 false RX_CC_K_1_2 false RX_CC_K_1_3 false RX_CC_LEN_SEQ 4 RX_CC_MASK_0_0 false RX_CC_MASK_0_1 false RX_CC_MASK_0_2 false RX_CC_MASK_0_3 false RX_CC_MASK_1_0 false RX_CC_MASK_1_1 false RX_CC_MASK_1_2 false RX_CC_MASK_1_3 false RX_CC_NUM_SEQ 1 RX_CC_PERIODICITY 20000 RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000\
000000000000000000000000000000001111111000111111100110011100011111100 RX_CC_VAL_0_0 11111100 RX_CC_VAL_0_1 11001110 RX_CC_VAL_0_2 01111111 RX_CC_VAL_0_3 01111111 RX_CC_VAL_1_0 00000000 RX_CC_VAL_1_1 00000000 RX_CC_VAL_1_2 00000000 RX_CC_VAL_1_3 00000000 RX_COMMA_ALIGN_WORD 4 RX_COMMA_DOUBLE_ENABLE false RX_COMMA_MASK 0001111111 RX_COMMA_M_ENABLE true RX_COMMA_M_VAL 1010000011 RX_COMMA_PRESET NONE RX_COMMA_P_ENABLE true RX_COMMA_P_VAL 0101111100 RX_COMMA_SHOW_REALIGN_ENABLE true RX_COMMA_VALID_ON\
LY 0 RX_COUPLING AC RX_DATA_DECODING 8B10B RX_EQ_MODE AUTO RX_FRACN_ENABLED false RX_FRACN_NUMERATOR 0 RX_FRACN_OVRD false RX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true RX_HD_EN 0 RX_INT_DATA_WIDTH 40 RX_JTOL_FC 3.5992801 RX_JTOL_LF_SLOPE -20 RX_LINE_RATE 6 RX_OUTCLK_SOURCE RXOUTCLKPMA RX_PAM_SEL NRZ RX_PLL_TYPE LCPLL RX_PPM_OFFSET 0 RX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false RX_RATE_GROUP A RX_REFCLK_FREQUENCY 100 RX_REFCLK_SOURCE R0 RX_SLIDE_MODE PCS RX_SSC_PPM 0 RX_TERMINATION PROGRAMMABL\
E RX_TERMINATION_PROG_VALUE 800 RX_USER_DATA_WIDTH 32 TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 150.000000 TX_64B66B_CRC false TX_64B66B_ENCODER false TX_64B66B_SCRAMBLER false TX_ACTUAL_REFCLK_FREQUENCY 100.000000000000 TX_BUFFER_BYPASS_MODE Fast_Sync TX_BUFFER_MODE 1 TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_DATA_ENCODING 8B10B TX_DIFF_SWING_EMPH_MODE CUSTOM TX_FRACN_ENABLED false TX_FRACN_NUMERATOR 0 TX_FRACN_OVRD false TX_GRAY_BYP true TX_GRAY_LITTLEENDIAN tru\
e TX_HD_EN 0 TX_INT_DATA_WIDTH 40 TX_LANE_DESKEW_HDMI_ENABLE false TX_LINE_RATE 6 TX_OUTCLK_SOURCE TXOUTCLKPMA TX_PAM_SEL NRZ TX_PIPM_ENABLE false TX_PLL_TYPE LCPLL TX_PRECODE_BYP true TX_PRECODE_LITTLEENDIAN false TX_RATE_GROUP A TX_REFCLK_FREQUENCY 100 TX_REFCLK_SOURCE R0 TX_USER_DATA_WIDTH 32} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { } LR12_SETTINGS\
 { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .PROT1_SETTINGS("LR0_SETTINGS {PRESET None RX_PAM_SEL NRZ TX_PAM_SEL NRZ TX_HD_EN 0 RX_HD_EN 0 RX_GRAY_BYP true TX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true TX_GRAY_LITTLEENDIAN true RX_PRECODE_BYP true TX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false TX_PRECODE_LITTLEENDIAN false INTERNAL_PRESET None GT_TYPE GTY GT_DIRECTION DUPLEX TX_LINE_RATE 10.3125 TX_PLL_TYPE LCPLL TX_REFCLK_FREQUENCY 156.25 TX_ACTUAL_REFCLK_FREQUENCY 156.250000000000 TX_FRACN_ENABLED false TX_FRACN_OVRD false TX_FRACN_NUMERATOR 0 TX_REFCLK\
_SOURCE R0 TX_DATA_ENCODING RAW TX_USER_DATA_WIDTH 32 TX_INT_DATA_WIDTH 32 TX_BUFFER_MODE 1 TX_BUFFER_BYPASS_MODE Fast_Sync TX_PIPM_ENABLE false TX_OUTCLK_SOURCE TXOUTCLKPMA TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 322.265625 TX_DIFF_SWING_EMPH_MODE CUSTOM TX_64B66B_SCRAMBLER false TX_64B66B_ENCODER false TX_64B66B_CRC false TX_RATE_GROUP A RX_LINE_RATE 10.3125 RX_PLL_TYPE LCPLL RX_REFCLK_FREQUENCY 156.25 RX_ACTUAL_REFCLK_FREQUENCY 156.250000000000 RX_FRACN_ENAB\
LED false RX_FRACN_OVRD false RX_FRACN_NUMERATOR 0 RX_REFCLK_SOURCE R0 RX_DATA_DECODING RAW RX_USER_DATA_WIDTH 32 RX_INT_DATA_WIDTH 32 RX_BUFFER_MODE 1 RX_OUTCLK_SOURCE RXOUTCLKPMA RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 322.265625 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 INS_LOSS_NYQ 20 RX_EQ_MODE AUTO RX_COUPLING AC RX_TERMINATION PROGRAMMABLE RX_RATE_GROUP A RX_TERMINATION_PROG_VALUE 800 RX_PPM_OFFSET 0 RX_64B66B_DESCRAMBLER false RX_64B66B_DECODER fal\
se RX_64B66B_CRC false OOB_ENABLE false RX_COMMA_ALIGN_WORD 1 RX_COMMA_SHOW_REALIGN_ENABLE true PCIE_ENABLE false TX_LANE_DESKEW_HDMI_ENABLE false RX_COMMA_P_ENABLE false RX_COMMA_M_ENABLE false RX_COMMA_DOUBLE_ENABLE false RX_COMMA_P_VAL 0101111100 RX_COMMA_M_VAL 1010000011 RX_COMMA_MASK 0000000000 RX_SLIDE_MODE OFF RX_SSC_PPM 0 RX_CB_NUM_SEQ 0 RX_CB_LEN_SEQ 1 RX_CB_MAX_SKEW 1 RX_CB_MAX_LEVEL 1 RX_CB_MASK_0_0 false RX_CB_VAL_0_0 00000000 RX_CB_K_0_0 false RX_CB_DISP_0_0 false RX_CB_MASK_0_1 fal\
se RX_CB_VAL_0_1 00000000 RX_CB_K_0_1 false RX_CB_DISP_0_1 false RX_CB_MASK_0_2 false RX_CB_VAL_0_2 00000000 RX_CB_K_0_2 false RX_CB_DISP_0_2 false RX_CB_MASK_0_3 false RX_CB_VAL_0_3 00000000 RX_CB_K_0_3 false RX_CB_DISP_0_3 false RX_CB_MASK_1_0 false RX_CB_VAL_1_0 00000000 RX_CB_K_1_0 false RX_CB_DISP_1_0 false RX_CB_MASK_1_1 false RX_CB_VAL_1_1 00000000 RX_CB_K_1_1 false RX_CB_DISP_1_1 false RX_CB_MASK_1_2 false RX_CB_VAL_1_2 00000000 RX_CB_K_1_2 false RX_CB_DISP_1_2 false RX_CB_MASK_1_3 false\
 RX_CB_VAL_1_3 00000000 RX_CB_K_1_3 false RX_CB_DISP_1_3 false RX_CC_NUM_SEQ 0 RX_CC_LEN_SEQ 1 RX_CC_PERIODICITY 5000 RX_CC_KEEP_IDLE DISABLE RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000000000000000000000000000000000000000000000000000000000000000000000000 RX_CC_MASK_0_0 false RX_CC_VAL_0_0 00000000 RX_CC_K_0_0 false RX_CC_DISP_0_0 false RX_CC_MASK_0_1 false RX_CC_VAL_0_1 00000000 RX_CC_K_0_1 false RX_CC_DISP_0_1 false RX_CC_MASK_0_2 false RX_CC_VAL_0_2 00000000 RX_CC_K_0_2 f\
alse RX_CC_DISP_0_2 false RX_CC_MASK_0_3 false RX_CC_VAL_0_3 00000000 RX_CC_K_0_3 false RX_CC_DISP_0_3 false RX_CC_MASK_1_0 false RX_CC_VAL_1_0 00000000 RX_CC_K_1_0 false RX_CC_DISP_1_0 false RX_CC_MASK_1_1 false RX_CC_VAL_1_1 00000000 RX_CC_K_1_1 false RX_CC_DISP_1_1 false RX_CC_MASK_1_2 false RX_CC_VAL_1_2 00000000 RX_CC_K_1_2 false RX_CC_DISP_1_2 false RX_CC_MASK_1_3 false RX_CC_VAL_1_3 00000000 RX_CC_K_1_3 false RX_CC_DISP_1_3 false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 RX_JTOL_FC 6.1\
862627 RX_JTOL_LF_SLOPE -20 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_MODE_LANE MULTI RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RESET_SEQUENCE_INTERVAL 0 RX_COMMA_PRESET NONE RX_COMMA_VALID_ONLY 0} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { \
} LR12_SETTINGS { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .PROT2_SETTINGS("LR0_SETTINGS {PRESET None RX_PAM_SEL NRZ TX_PAM_SEL NRZ TX_HD_EN 0 RX_HD_EN 0 RX_GRAY_BYP true TX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true TX_GRAY_LITTLEENDIAN true RX_PRECODE_BYP true TX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false TX_PRECODE_LITTLEENDIAN false INTERNAL_PRESET None GT_TYPE GTY GT_DIRECTION DUPLEX TX_LINE_RATE 10.3125 TX_PLL_TYPE LCPLL TX_REFCLK_FREQUENCY 156.25 TX_ACTUAL_REFCLK_FREQUENCY 156.250000000000 TX_FRACN_ENABLED false TX_FRACN_OVRD false TX_FRACN_NUMERATOR 0 TX_REFCLK\
_SOURCE R0 TX_DATA_ENCODING RAW TX_USER_DATA_WIDTH 32 TX_INT_DATA_WIDTH 32 TX_BUFFER_MODE 1 TX_BUFFER_BYPASS_MODE Fast_Sync TX_PIPM_ENABLE false TX_OUTCLK_SOURCE TXOUTCLKPMA TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 322.265625 TX_DIFF_SWING_EMPH_MODE CUSTOM TX_64B66B_SCRAMBLER false TX_64B66B_ENCODER false TX_64B66B_CRC false TX_RATE_GROUP A RX_LINE_RATE 10.3125 RX_PLL_TYPE LCPLL RX_REFCLK_FREQUENCY 156.25 RX_ACTUAL_REFCLK_FREQUENCY 156.250000000000 RX_FRACN_ENAB\
LED false RX_FRACN_OVRD false RX_FRACN_NUMERATOR 0 RX_REFCLK_SOURCE R0 RX_DATA_DECODING RAW RX_USER_DATA_WIDTH 32 RX_INT_DATA_WIDTH 32 RX_BUFFER_MODE 1 RX_OUTCLK_SOURCE RXOUTCLKPMA RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 322.265625 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 INS_LOSS_NYQ 20 RX_EQ_MODE AUTO RX_COUPLING AC RX_TERMINATION PROGRAMMABLE RX_RATE_GROUP A RX_TERMINATION_PROG_VALUE 800 RX_PPM_OFFSET 0 RX_64B66B_DESCRAMBLER false RX_64B66B_DECODER fal\
se RX_64B66B_CRC false OOB_ENABLE false RX_COMMA_ALIGN_WORD 1 RX_COMMA_SHOW_REALIGN_ENABLE true PCIE_ENABLE false TX_LANE_DESKEW_HDMI_ENABLE false RX_COMMA_P_ENABLE false RX_COMMA_M_ENABLE false RX_COMMA_DOUBLE_ENABLE false RX_COMMA_P_VAL 0101111100 RX_COMMA_M_VAL 1010000011 RX_COMMA_MASK 0000000000 RX_SLIDE_MODE OFF RX_SSC_PPM 0 RX_CB_NUM_SEQ 0 RX_CB_LEN_SEQ 1 RX_CB_MAX_SKEW 1 RX_CB_MAX_LEVEL 1 RX_CB_MASK_0_0 false RX_CB_VAL_0_0 00000000 RX_CB_K_0_0 false RX_CB_DISP_0_0 false RX_CB_MASK_0_1 fal\
se RX_CB_VAL_0_1 00000000 RX_CB_K_0_1 false RX_CB_DISP_0_1 false RX_CB_MASK_0_2 false RX_CB_VAL_0_2 00000000 RX_CB_K_0_2 false RX_CB_DISP_0_2 false RX_CB_MASK_0_3 false RX_CB_VAL_0_3 00000000 RX_CB_K_0_3 false RX_CB_DISP_0_3 false RX_CB_MASK_1_0 false RX_CB_VAL_1_0 00000000 RX_CB_K_1_0 false RX_CB_DISP_1_0 false RX_CB_MASK_1_1 false RX_CB_VAL_1_1 00000000 RX_CB_K_1_1 false RX_CB_DISP_1_1 false RX_CB_MASK_1_2 false RX_CB_VAL_1_2 00000000 RX_CB_K_1_2 false RX_CB_DISP_1_2 false RX_CB_MASK_1_3 false\
 RX_CB_VAL_1_3 00000000 RX_CB_K_1_3 false RX_CB_DISP_1_3 false RX_CC_NUM_SEQ 0 RX_CC_LEN_SEQ 1 RX_CC_PERIODICITY 5000 RX_CC_KEEP_IDLE DISABLE RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000000000000000000000000000000000000000000000000000000000000000000000000 RX_CC_MASK_0_0 false RX_CC_VAL_0_0 00000000 RX_CC_K_0_0 false RX_CC_DISP_0_0 false RX_CC_MASK_0_1 false RX_CC_VAL_0_1 00000000 RX_CC_K_0_1 false RX_CC_DISP_0_1 false RX_CC_MASK_0_2 false RX_CC_VAL_0_2 00000000 RX_CC_K_0_2 f\
alse RX_CC_DISP_0_2 false RX_CC_MASK_0_3 false RX_CC_VAL_0_3 00000000 RX_CC_K_0_3 false RX_CC_DISP_0_3 false RX_CC_MASK_1_0 false RX_CC_VAL_1_0 00000000 RX_CC_K_1_0 false RX_CC_DISP_1_0 false RX_CC_MASK_1_1 false RX_CC_VAL_1_1 00000000 RX_CC_K_1_1 false RX_CC_DISP_1_1 false RX_CC_MASK_1_2 false RX_CC_VAL_1_2 00000000 RX_CC_K_1_2 false RX_CC_DISP_1_2 false RX_CC_MASK_1_3 false RX_CC_VAL_1_3 00000000 RX_CC_K_1_3 false RX_CC_DISP_1_3 false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 RX_JTOL_FC 6.1\
862627 RX_JTOL_LF_SLOPE -20 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_MODE_LANE MULTI RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RESET_SEQUENCE_INTERVAL 0 RX_COMMA_PRESET NONE RX_COMMA_VALID_ONLY 0} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { \
} LR12_SETTINGS { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .PROT3_SETTINGS("LR0_SETTINGS {PRESET None RX_PAM_SEL NRZ TX_PAM_SEL NRZ TX_HD_EN 0 RX_HD_EN 0 RX_GRAY_BYP true TX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true TX_GRAY_LITTLEENDIAN true RX_PRECODE_BYP true TX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false TX_PRECODE_LITTLEENDIAN false INTERNAL_PRESET None GT_TYPE GTY GT_DIRECTION DUPLEX TX_LINE_RATE 10.3125 TX_PLL_TYPE LCPLL TX_REFCLK_FREQUENCY 156.25 TX_ACTUAL_REFCLK_FREQUENCY 156.250000000000 TX_FRACN_ENABLED false TX_FRACN_OVRD false TX_FRACN_NUMERATOR 0 TX_REFCLK\
_SOURCE R0 TX_DATA_ENCODING RAW TX_USER_DATA_WIDTH 32 TX_INT_DATA_WIDTH 32 TX_BUFFER_MODE 1 TX_BUFFER_BYPASS_MODE Fast_Sync TX_PIPM_ENABLE false TX_OUTCLK_SOURCE TXOUTCLKPMA TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 322.265625 TX_DIFF_SWING_EMPH_MODE CUSTOM TX_64B66B_SCRAMBLER false TX_64B66B_ENCODER false TX_64B66B_CRC false TX_RATE_GROUP A RX_LINE_RATE 10.3125 RX_PLL_TYPE LCPLL RX_REFCLK_FREQUENCY 156.25 RX_ACTUAL_REFCLK_FREQUENCY 156.250000000000 RX_FRACN_ENAB\
LED false RX_FRACN_OVRD false RX_FRACN_NUMERATOR 0 RX_REFCLK_SOURCE R0 RX_DATA_DECODING RAW RX_USER_DATA_WIDTH 32 RX_INT_DATA_WIDTH 32 RX_BUFFER_MODE 1 RX_OUTCLK_SOURCE RXOUTCLKPMA RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 322.265625 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 INS_LOSS_NYQ 20 RX_EQ_MODE AUTO RX_COUPLING AC RX_TERMINATION PROGRAMMABLE RX_RATE_GROUP A RX_TERMINATION_PROG_VALUE 800 RX_PPM_OFFSET 0 RX_64B66B_DESCRAMBLER false RX_64B66B_DECODER fal\
se RX_64B66B_CRC false OOB_ENABLE false RX_COMMA_ALIGN_WORD 1 RX_COMMA_SHOW_REALIGN_ENABLE true PCIE_ENABLE false TX_LANE_DESKEW_HDMI_ENABLE false RX_COMMA_P_ENABLE false RX_COMMA_M_ENABLE false RX_COMMA_DOUBLE_ENABLE false RX_COMMA_P_VAL 0101111100 RX_COMMA_M_VAL 1010000011 RX_COMMA_MASK 0000000000 RX_SLIDE_MODE OFF RX_SSC_PPM 0 RX_CB_NUM_SEQ 0 RX_CB_LEN_SEQ 1 RX_CB_MAX_SKEW 1 RX_CB_MAX_LEVEL 1 RX_CB_MASK_0_0 false RX_CB_VAL_0_0 00000000 RX_CB_K_0_0 false RX_CB_DISP_0_0 false RX_CB_MASK_0_1 fal\
se RX_CB_VAL_0_1 00000000 RX_CB_K_0_1 false RX_CB_DISP_0_1 false RX_CB_MASK_0_2 false RX_CB_VAL_0_2 00000000 RX_CB_K_0_2 false RX_CB_DISP_0_2 false RX_CB_MASK_0_3 false RX_CB_VAL_0_3 00000000 RX_CB_K_0_3 false RX_CB_DISP_0_3 false RX_CB_MASK_1_0 false RX_CB_VAL_1_0 00000000 RX_CB_K_1_0 false RX_CB_DISP_1_0 false RX_CB_MASK_1_1 false RX_CB_VAL_1_1 00000000 RX_CB_K_1_1 false RX_CB_DISP_1_1 false RX_CB_MASK_1_2 false RX_CB_VAL_1_2 00000000 RX_CB_K_1_2 false RX_CB_DISP_1_2 false RX_CB_MASK_1_3 false\
 RX_CB_VAL_1_3 00000000 RX_CB_K_1_3 false RX_CB_DISP_1_3 false RX_CC_NUM_SEQ 0 RX_CC_LEN_SEQ 1 RX_CC_PERIODICITY 5000 RX_CC_KEEP_IDLE DISABLE RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000000000000000000000000000000000000000000000000000000000000000000000000 RX_CC_MASK_0_0 false RX_CC_VAL_0_0 00000000 RX_CC_K_0_0 false RX_CC_DISP_0_0 false RX_CC_MASK_0_1 false RX_CC_VAL_0_1 00000000 RX_CC_K_0_1 false RX_CC_DISP_0_1 false RX_CC_MASK_0_2 false RX_CC_VAL_0_2 00000000 RX_CC_K_0_2 f\
alse RX_CC_DISP_0_2 false RX_CC_MASK_0_3 false RX_CC_VAL_0_3 00000000 RX_CC_K_0_3 false RX_CC_DISP_0_3 false RX_CC_MASK_1_0 false RX_CC_VAL_1_0 00000000 RX_CC_K_1_0 false RX_CC_DISP_1_0 false RX_CC_MASK_1_1 false RX_CC_VAL_1_1 00000000 RX_CC_K_1_1 false RX_CC_DISP_1_1 false RX_CC_MASK_1_2 false RX_CC_VAL_1_2 00000000 RX_CC_K_1_2 false RX_CC_DISP_1_2 false RX_CC_MASK_1_3 false RX_CC_VAL_1_3 00000000 RX_CC_K_1_3 false RX_CC_DISP_1_3 false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 RX_JTOL_FC 6.1\
862627 RX_JTOL_LF_SLOPE -20 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_MODE_LANE MULTI RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RESET_SEQUENCE_INTERVAL 0 RX_COMMA_PRESET NONE RX_COMMA_VALID_ONLY 0} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { \
} LR12_SETTINGS { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .PROT4_SETTINGS("LR0_SETTINGS {PRESET None RX_PAM_SEL NRZ TX_PAM_SEL NRZ TX_HD_EN 0 RX_HD_EN 0 RX_GRAY_BYP true TX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true TX_GRAY_LITTLEENDIAN true RX_PRECODE_BYP true TX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false TX_PRECODE_LITTLEENDIAN false INTERNAL_PRESET None GT_TYPE GTY GT_DIRECTION DUPLEX TX_LINE_RATE 10.3125 TX_PLL_TYPE LCPLL TX_REFCLK_FREQUENCY 156.25 TX_ACTUAL_REFCLK_FREQUENCY 156.250000000000 TX_FRACN_ENABLED false TX_FRACN_OVRD false TX_FRACN_NUMERATOR 0 TX_REFCLK\
_SOURCE R0 TX_DATA_ENCODING RAW TX_USER_DATA_WIDTH 32 TX_INT_DATA_WIDTH 32 TX_BUFFER_MODE 1 TX_BUFFER_BYPASS_MODE Fast_Sync TX_PIPM_ENABLE false TX_OUTCLK_SOURCE TXOUTCLKPMA TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 322.265625 TX_DIFF_SWING_EMPH_MODE CUSTOM TX_64B66B_SCRAMBLER false TX_64B66B_ENCODER false TX_64B66B_CRC false TX_RATE_GROUP A RX_LINE_RATE 10.3125 RX_PLL_TYPE LCPLL RX_REFCLK_FREQUENCY 156.25 RX_ACTUAL_REFCLK_FREQUENCY 156.250000000000 RX_FRACN_ENAB\
LED false RX_FRACN_OVRD false RX_FRACN_NUMERATOR 0 RX_REFCLK_SOURCE R0 RX_DATA_DECODING RAW RX_USER_DATA_WIDTH 32 RX_INT_DATA_WIDTH 32 RX_BUFFER_MODE 1 RX_OUTCLK_SOURCE RXOUTCLKPMA RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 322.265625 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 INS_LOSS_NYQ 20 RX_EQ_MODE AUTO RX_COUPLING AC RX_TERMINATION PROGRAMMABLE RX_RATE_GROUP A RX_TERMINATION_PROG_VALUE 800 RX_PPM_OFFSET 0 RX_64B66B_DESCRAMBLER false RX_64B66B_DECODER fal\
se RX_64B66B_CRC false OOB_ENABLE false RX_COMMA_ALIGN_WORD 1 RX_COMMA_SHOW_REALIGN_ENABLE true PCIE_ENABLE false TX_LANE_DESKEW_HDMI_ENABLE false RX_COMMA_P_ENABLE false RX_COMMA_M_ENABLE false RX_COMMA_DOUBLE_ENABLE false RX_COMMA_P_VAL 0101111100 RX_COMMA_M_VAL 1010000011 RX_COMMA_MASK 0000000000 RX_SLIDE_MODE OFF RX_SSC_PPM 0 RX_CB_NUM_SEQ 0 RX_CB_LEN_SEQ 1 RX_CB_MAX_SKEW 1 RX_CB_MAX_LEVEL 1 RX_CB_MASK_0_0 false RX_CB_VAL_0_0 00000000 RX_CB_K_0_0 false RX_CB_DISP_0_0 false RX_CB_MASK_0_1 fal\
se RX_CB_VAL_0_1 00000000 RX_CB_K_0_1 false RX_CB_DISP_0_1 false RX_CB_MASK_0_2 false RX_CB_VAL_0_2 00000000 RX_CB_K_0_2 false RX_CB_DISP_0_2 false RX_CB_MASK_0_3 false RX_CB_VAL_0_3 00000000 RX_CB_K_0_3 false RX_CB_DISP_0_3 false RX_CB_MASK_1_0 false RX_CB_VAL_1_0 00000000 RX_CB_K_1_0 false RX_CB_DISP_1_0 false RX_CB_MASK_1_1 false RX_CB_VAL_1_1 00000000 RX_CB_K_1_1 false RX_CB_DISP_1_1 false RX_CB_MASK_1_2 false RX_CB_VAL_1_2 00000000 RX_CB_K_1_2 false RX_CB_DISP_1_2 false RX_CB_MASK_1_3 false\
 RX_CB_VAL_1_3 00000000 RX_CB_K_1_3 false RX_CB_DISP_1_3 false RX_CC_NUM_SEQ 0 RX_CC_LEN_SEQ 1 RX_CC_PERIODICITY 5000 RX_CC_KEEP_IDLE DISABLE RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000000000000000000000000000000000000000000000000000000000000000000000000 RX_CC_MASK_0_0 false RX_CC_VAL_0_0 00000000 RX_CC_K_0_0 false RX_CC_DISP_0_0 false RX_CC_MASK_0_1 false RX_CC_VAL_0_1 00000000 RX_CC_K_0_1 false RX_CC_DISP_0_1 false RX_CC_MASK_0_2 false RX_CC_VAL_0_2 00000000 RX_CC_K_0_2 f\
alse RX_CC_DISP_0_2 false RX_CC_MASK_0_3 false RX_CC_VAL_0_3 00000000 RX_CC_K_0_3 false RX_CC_DISP_0_3 false RX_CC_MASK_1_0 false RX_CC_VAL_1_0 00000000 RX_CC_K_1_0 false RX_CC_DISP_1_0 false RX_CC_MASK_1_1 false RX_CC_VAL_1_1 00000000 RX_CC_K_1_1 false RX_CC_DISP_1_1 false RX_CC_MASK_1_2 false RX_CC_VAL_1_2 00000000 RX_CC_K_1_2 false RX_CC_DISP_1_2 false RX_CC_MASK_1_3 false RX_CC_VAL_1_3 00000000 RX_CC_K_1_3 false RX_CC_DISP_1_3 false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 RX_JTOL_FC 6.1\
862627 RX_JTOL_LF_SLOPE -20 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_MODE_LANE MULTI RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RESET_SEQUENCE_INTERVAL 0 RX_COMMA_PRESET NONE RX_COMMA_VALID_ONLY 0} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { \
} LR12_SETTINGS { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .PROT5_SETTINGS("LR0_SETTINGS {PRESET None RX_PAM_SEL NRZ TX_PAM_SEL NRZ TX_HD_EN 0 RX_HD_EN 0 RX_GRAY_BYP true TX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true TX_GRAY_LITTLEENDIAN true RX_PRECODE_BYP true TX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false TX_PRECODE_LITTLEENDIAN false INTERNAL_PRESET None GT_TYPE GTY GT_DIRECTION DUPLEX TX_LINE_RATE 10.3125 TX_PLL_TYPE LCPLL TX_REFCLK_FREQUENCY 156.25 TX_ACTUAL_REFCLK_FREQUENCY 156.250000000000 TX_FRACN_ENABLED false TX_FRACN_OVRD false TX_FRACN_NUMERATOR 0 TX_REFCLK\
_SOURCE R0 TX_DATA_ENCODING RAW TX_USER_DATA_WIDTH 32 TX_INT_DATA_WIDTH 32 TX_BUFFER_MODE 1 TX_BUFFER_BYPASS_MODE Fast_Sync TX_PIPM_ENABLE false TX_OUTCLK_SOURCE TXOUTCLKPMA TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 322.265625 TX_DIFF_SWING_EMPH_MODE CUSTOM TX_64B66B_SCRAMBLER false TX_64B66B_ENCODER false TX_64B66B_CRC false TX_RATE_GROUP A RX_LINE_RATE 10.3125 RX_PLL_TYPE LCPLL RX_REFCLK_FREQUENCY 156.25 RX_ACTUAL_REFCLK_FREQUENCY 156.250000000000 RX_FRACN_ENAB\
LED false RX_FRACN_OVRD false RX_FRACN_NUMERATOR 0 RX_REFCLK_SOURCE R0 RX_DATA_DECODING RAW RX_USER_DATA_WIDTH 32 RX_INT_DATA_WIDTH 32 RX_BUFFER_MODE 1 RX_OUTCLK_SOURCE RXOUTCLKPMA RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 322.265625 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 INS_LOSS_NYQ 20 RX_EQ_MODE AUTO RX_COUPLING AC RX_TERMINATION PROGRAMMABLE RX_RATE_GROUP A RX_TERMINATION_PROG_VALUE 800 RX_PPM_OFFSET 0 RX_64B66B_DESCRAMBLER false RX_64B66B_DECODER fal\
se RX_64B66B_CRC false OOB_ENABLE false RX_COMMA_ALIGN_WORD 1 RX_COMMA_SHOW_REALIGN_ENABLE true PCIE_ENABLE false TX_LANE_DESKEW_HDMI_ENABLE false RX_COMMA_P_ENABLE false RX_COMMA_M_ENABLE false RX_COMMA_DOUBLE_ENABLE false RX_COMMA_P_VAL 0101111100 RX_COMMA_M_VAL 1010000011 RX_COMMA_MASK 0000000000 RX_SLIDE_MODE OFF RX_SSC_PPM 0 RX_CB_NUM_SEQ 0 RX_CB_LEN_SEQ 1 RX_CB_MAX_SKEW 1 RX_CB_MAX_LEVEL 1 RX_CB_MASK_0_0 false RX_CB_VAL_0_0 00000000 RX_CB_K_0_0 false RX_CB_DISP_0_0 false RX_CB_MASK_0_1 fal\
se RX_CB_VAL_0_1 00000000 RX_CB_K_0_1 false RX_CB_DISP_0_1 false RX_CB_MASK_0_2 false RX_CB_VAL_0_2 00000000 RX_CB_K_0_2 false RX_CB_DISP_0_2 false RX_CB_MASK_0_3 false RX_CB_VAL_0_3 00000000 RX_CB_K_0_3 false RX_CB_DISP_0_3 false RX_CB_MASK_1_0 false RX_CB_VAL_1_0 00000000 RX_CB_K_1_0 false RX_CB_DISP_1_0 false RX_CB_MASK_1_1 false RX_CB_VAL_1_1 00000000 RX_CB_K_1_1 false RX_CB_DISP_1_1 false RX_CB_MASK_1_2 false RX_CB_VAL_1_2 00000000 RX_CB_K_1_2 false RX_CB_DISP_1_2 false RX_CB_MASK_1_3 false\
 RX_CB_VAL_1_3 00000000 RX_CB_K_1_3 false RX_CB_DISP_1_3 false RX_CC_NUM_SEQ 0 RX_CC_LEN_SEQ 1 RX_CC_PERIODICITY 5000 RX_CC_KEEP_IDLE DISABLE RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000000000000000000000000000000000000000000000000000000000000000000000000 RX_CC_MASK_0_0 false RX_CC_VAL_0_0 00000000 RX_CC_K_0_0 false RX_CC_DISP_0_0 false RX_CC_MASK_0_1 false RX_CC_VAL_0_1 00000000 RX_CC_K_0_1 false RX_CC_DISP_0_1 false RX_CC_MASK_0_2 false RX_CC_VAL_0_2 00000000 RX_CC_K_0_2 f\
alse RX_CC_DISP_0_2 false RX_CC_MASK_0_3 false RX_CC_VAL_0_3 00000000 RX_CC_K_0_3 false RX_CC_DISP_0_3 false RX_CC_MASK_1_0 false RX_CC_VAL_1_0 00000000 RX_CC_K_1_0 false RX_CC_DISP_1_0 false RX_CC_MASK_1_1 false RX_CC_VAL_1_1 00000000 RX_CC_K_1_1 false RX_CC_DISP_1_1 false RX_CC_MASK_1_2 false RX_CC_VAL_1_2 00000000 RX_CC_K_1_2 false RX_CC_DISP_1_2 false RX_CC_MASK_1_3 false RX_CC_VAL_1_3 00000000 RX_CC_K_1_3 false RX_CC_DISP_1_3 false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 RX_JTOL_FC 6.1\
862627 RX_JTOL_LF_SLOPE -20 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_MODE_LANE MULTI RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RESET_SEQUENCE_INTERVAL 0 RX_COMMA_PRESET NONE RX_COMMA_VALID_ONLY 0} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { \
} LR12_SETTINGS { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .PROT6_SETTINGS("LR0_SETTINGS {PRESET None RX_PAM_SEL NRZ TX_PAM_SEL NRZ TX_HD_EN 0 RX_HD_EN 0 RX_GRAY_BYP true TX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true TX_GRAY_LITTLEENDIAN true RX_PRECODE_BYP true TX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false TX_PRECODE_LITTLEENDIAN false INTERNAL_PRESET None GT_TYPE GTY GT_DIRECTION DUPLEX TX_LINE_RATE 10.3125 TX_PLL_TYPE LCPLL TX_REFCLK_FREQUENCY 156.25 TX_ACTUAL_REFCLK_FREQUENCY 156.250000000000 TX_FRACN_ENABLED false TX_FRACN_OVRD false TX_FRACN_NUMERATOR 0 TX_REFCLK\
_SOURCE R0 TX_DATA_ENCODING RAW TX_USER_DATA_WIDTH 32 TX_INT_DATA_WIDTH 32 TX_BUFFER_MODE 1 TX_BUFFER_BYPASS_MODE Fast_Sync TX_PIPM_ENABLE false TX_OUTCLK_SOURCE TXOUTCLKPMA TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 322.265625 TX_DIFF_SWING_EMPH_MODE CUSTOM TX_64B66B_SCRAMBLER false TX_64B66B_ENCODER false TX_64B66B_CRC false TX_RATE_GROUP A RX_LINE_RATE 10.3125 RX_PLL_TYPE LCPLL RX_REFCLK_FREQUENCY 156.25 RX_ACTUAL_REFCLK_FREQUENCY 156.250000000000 RX_FRACN_ENAB\
LED false RX_FRACN_OVRD false RX_FRACN_NUMERATOR 0 RX_REFCLK_SOURCE R0 RX_DATA_DECODING RAW RX_USER_DATA_WIDTH 32 RX_INT_DATA_WIDTH 32 RX_BUFFER_MODE 1 RX_OUTCLK_SOURCE RXOUTCLKPMA RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 322.265625 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 INS_LOSS_NYQ 20 RX_EQ_MODE AUTO RX_COUPLING AC RX_TERMINATION PROGRAMMABLE RX_RATE_GROUP A RX_TERMINATION_PROG_VALUE 800 RX_PPM_OFFSET 0 RX_64B66B_DESCRAMBLER false RX_64B66B_DECODER fal\
se RX_64B66B_CRC false OOB_ENABLE false RX_COMMA_ALIGN_WORD 1 RX_COMMA_SHOW_REALIGN_ENABLE true PCIE_ENABLE false TX_LANE_DESKEW_HDMI_ENABLE false RX_COMMA_P_ENABLE false RX_COMMA_M_ENABLE false RX_COMMA_DOUBLE_ENABLE false RX_COMMA_P_VAL 0101111100 RX_COMMA_M_VAL 1010000011 RX_COMMA_MASK 0000000000 RX_SLIDE_MODE OFF RX_SSC_PPM 0 RX_CB_NUM_SEQ 0 RX_CB_LEN_SEQ 1 RX_CB_MAX_SKEW 1 RX_CB_MAX_LEVEL 1 RX_CB_MASK_0_0 false RX_CB_VAL_0_0 00000000 RX_CB_K_0_0 false RX_CB_DISP_0_0 false RX_CB_MASK_0_1 fal\
se RX_CB_VAL_0_1 00000000 RX_CB_K_0_1 false RX_CB_DISP_0_1 false RX_CB_MASK_0_2 false RX_CB_VAL_0_2 00000000 RX_CB_K_0_2 false RX_CB_DISP_0_2 false RX_CB_MASK_0_3 false RX_CB_VAL_0_3 00000000 RX_CB_K_0_3 false RX_CB_DISP_0_3 false RX_CB_MASK_1_0 false RX_CB_VAL_1_0 00000000 RX_CB_K_1_0 false RX_CB_DISP_1_0 false RX_CB_MASK_1_1 false RX_CB_VAL_1_1 00000000 RX_CB_K_1_1 false RX_CB_DISP_1_1 false RX_CB_MASK_1_2 false RX_CB_VAL_1_2 00000000 RX_CB_K_1_2 false RX_CB_DISP_1_2 false RX_CB_MASK_1_3 false\
 RX_CB_VAL_1_3 00000000 RX_CB_K_1_3 false RX_CB_DISP_1_3 false RX_CC_NUM_SEQ 0 RX_CC_LEN_SEQ 1 RX_CC_PERIODICITY 5000 RX_CC_KEEP_IDLE DISABLE RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000000000000000000000000000000000000000000000000000000000000000000000000 RX_CC_MASK_0_0 false RX_CC_VAL_0_0 00000000 RX_CC_K_0_0 false RX_CC_DISP_0_0 false RX_CC_MASK_0_1 false RX_CC_VAL_0_1 00000000 RX_CC_K_0_1 false RX_CC_DISP_0_1 false RX_CC_MASK_0_2 false RX_CC_VAL_0_2 00000000 RX_CC_K_0_2 f\
alse RX_CC_DISP_0_2 false RX_CC_MASK_0_3 false RX_CC_VAL_0_3 00000000 RX_CC_K_0_3 false RX_CC_DISP_0_3 false RX_CC_MASK_1_0 false RX_CC_VAL_1_0 00000000 RX_CC_K_1_0 false RX_CC_DISP_1_0 false RX_CC_MASK_1_1 false RX_CC_VAL_1_1 00000000 RX_CC_K_1_1 false RX_CC_DISP_1_1 false RX_CC_MASK_1_2 false RX_CC_VAL_1_2 00000000 RX_CC_K_1_2 false RX_CC_DISP_1_2 false RX_CC_MASK_1_3 false RX_CC_VAL_1_3 00000000 RX_CC_K_1_3 false RX_CC_DISP_1_3 false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 RX_JTOL_FC 6.1\
862627 RX_JTOL_LF_SLOPE -20 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_MODE_LANE MULTI RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RESET_SEQUENCE_INTERVAL 0 RX_COMMA_PRESET NONE RX_COMMA_VALID_ONLY 0} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { \
} LR12_SETTINGS { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .PROT7_SETTINGS("LR0_SETTINGS {PRESET None RX_PAM_SEL NRZ TX_PAM_SEL NRZ TX_HD_EN 0 RX_HD_EN 0 RX_GRAY_BYP true TX_GRAY_BYP true RX_GRAY_LITTLEENDIAN true TX_GRAY_LITTLEENDIAN true RX_PRECODE_BYP true TX_PRECODE_BYP true RX_PRECODE_LITTLEENDIAN false TX_PRECODE_LITTLEENDIAN false INTERNAL_PRESET None GT_TYPE GTY GT_DIRECTION DUPLEX TX_LINE_RATE 10.3125 TX_PLL_TYPE LCPLL TX_REFCLK_FREQUENCY 156.25 TX_ACTUAL_REFCLK_FREQUENCY 156.250000000000 TX_FRACN_ENABLED false TX_FRACN_OVRD false TX_FRACN_NUMERATOR 0 TX_REFCLK\
_SOURCE R0 TX_DATA_ENCODING RAW TX_USER_DATA_WIDTH 32 TX_INT_DATA_WIDTH 32 TX_BUFFER_MODE 1 TX_BUFFER_BYPASS_MODE Fast_Sync TX_PIPM_ENABLE false TX_OUTCLK_SOURCE TXOUTCLKPMA TXPROGDIV_FREQ_ENABLE false TXPROGDIV_FREQ_SOURCE LCPLL TXPROGDIV_FREQ_VAL 322.265625 TX_DIFF_SWING_EMPH_MODE CUSTOM TX_64B66B_SCRAMBLER false TX_64B66B_ENCODER false TX_64B66B_CRC false TX_RATE_GROUP A RX_LINE_RATE 10.3125 RX_PLL_TYPE LCPLL RX_REFCLK_FREQUENCY 156.25 RX_ACTUAL_REFCLK_FREQUENCY 156.250000000000 RX_FRACN_ENAB\
LED false RX_FRACN_OVRD false RX_FRACN_NUMERATOR 0 RX_REFCLK_SOURCE R0 RX_DATA_DECODING RAW RX_USER_DATA_WIDTH 32 RX_INT_DATA_WIDTH 32 RX_BUFFER_MODE 1 RX_OUTCLK_SOURCE RXOUTCLKPMA RXPROGDIV_FREQ_ENABLE false RXPROGDIV_FREQ_SOURCE LCPLL RXPROGDIV_FREQ_VAL 322.265625 RXRECCLK_FREQ_ENABLE false RXRECCLK_FREQ_VAL 0 INS_LOSS_NYQ 20 RX_EQ_MODE AUTO RX_COUPLING AC RX_TERMINATION PROGRAMMABLE RX_RATE_GROUP A RX_TERMINATION_PROG_VALUE 800 RX_PPM_OFFSET 0 RX_64B66B_DESCRAMBLER false RX_64B66B_DECODER fal\
se RX_64B66B_CRC false OOB_ENABLE false RX_COMMA_ALIGN_WORD 1 RX_COMMA_SHOW_REALIGN_ENABLE true PCIE_ENABLE false TX_LANE_DESKEW_HDMI_ENABLE false RX_COMMA_P_ENABLE false RX_COMMA_M_ENABLE false RX_COMMA_DOUBLE_ENABLE false RX_COMMA_P_VAL 0101111100 RX_COMMA_M_VAL 1010000011 RX_COMMA_MASK 0000000000 RX_SLIDE_MODE OFF RX_SSC_PPM 0 RX_CB_NUM_SEQ 0 RX_CB_LEN_SEQ 1 RX_CB_MAX_SKEW 1 RX_CB_MAX_LEVEL 1 RX_CB_MASK_0_0 false RX_CB_VAL_0_0 00000000 RX_CB_K_0_0 false RX_CB_DISP_0_0 false RX_CB_MASK_0_1 fal\
se RX_CB_VAL_0_1 00000000 RX_CB_K_0_1 false RX_CB_DISP_0_1 false RX_CB_MASK_0_2 false RX_CB_VAL_0_2 00000000 RX_CB_K_0_2 false RX_CB_DISP_0_2 false RX_CB_MASK_0_3 false RX_CB_VAL_0_3 00000000 RX_CB_K_0_3 false RX_CB_DISP_0_3 false RX_CB_MASK_1_0 false RX_CB_VAL_1_0 00000000 RX_CB_K_1_0 false RX_CB_DISP_1_0 false RX_CB_MASK_1_1 false RX_CB_VAL_1_1 00000000 RX_CB_K_1_1 false RX_CB_DISP_1_1 false RX_CB_MASK_1_2 false RX_CB_VAL_1_2 00000000 RX_CB_K_1_2 false RX_CB_DISP_1_2 false RX_CB_MASK_1_3 false\
 RX_CB_VAL_1_3 00000000 RX_CB_K_1_3 false RX_CB_DISP_1_3 false RX_CC_NUM_SEQ 0 RX_CC_LEN_SEQ 1 RX_CC_PERIODICITY 5000 RX_CC_KEEP_IDLE DISABLE RX_CC_PRECEDENCE ENABLE RX_CC_REPEAT_WAIT 0 RX_CC_VAL 00000000000000000000000000000000000000000000000000000000000000000000000000000000 RX_CC_MASK_0_0 false RX_CC_VAL_0_0 00000000 RX_CC_K_0_0 false RX_CC_DISP_0_0 false RX_CC_MASK_0_1 false RX_CC_VAL_0_1 00000000 RX_CC_K_0_1 false RX_CC_DISP_0_1 false RX_CC_MASK_0_2 false RX_CC_VAL_0_2 00000000 RX_CC_K_0_2 f\
alse RX_CC_DISP_0_2 false RX_CC_MASK_0_3 false RX_CC_VAL_0_3 00000000 RX_CC_K_0_3 false RX_CC_DISP_0_3 false RX_CC_MASK_1_0 false RX_CC_VAL_1_0 00000000 RX_CC_K_1_0 false RX_CC_DISP_1_0 false RX_CC_MASK_1_1 false RX_CC_VAL_1_1 00000000 RX_CC_K_1_1 false RX_CC_DISP_1_1 false RX_CC_MASK_1_2 false RX_CC_VAL_1_2 00000000 RX_CC_K_1_2 false RX_CC_DISP_1_2 false RX_CC_MASK_1_3 false RX_CC_VAL_1_3 00000000 RX_CC_K_1_3 false RX_CC_DISP_1_3 false PCIE_USERCLK2_FREQ 250 PCIE_USERCLK_FREQ 250 RX_JTOL_FC 6.1\
862627 RX_JTOL_LF_SLOPE -20 RX_BUFFER_BYPASS_MODE Fast_Sync RX_BUFFER_BYPASS_MODE_LANE MULTI RX_BUFFER_RESET_ON_CB_CHANGE ENABLE RX_BUFFER_RESET_ON_COMMAALIGN DISABLE RX_BUFFER_RESET_ON_RATE_CHANGE ENABLE TX_BUFFER_RESET_ON_RATE_CHANGE ENABLE RESET_SEQUENCE_INTERVAL 0 RX_COMMA_PRESET NONE RX_COMMA_VALID_ONLY 0} LR1_SETTINGS { } LR2_SETTINGS { } LR3_SETTINGS { } LR4_SETTINGS { } LR5_SETTINGS { } LR6_SETTINGS { } LR7_SETTINGS { } LR8_SETTINGS { } LR9_SETTINGS { } LR10_SETTINGS { } LR11_SETTINGS { \
} LR12_SETTINGS { } LR13_SETTINGS { } LR14_SETTINGS { } LR15_SETTINGS { }"),
    .ENABLE_APB3(1'B1),
    .IS_GTYE5(1'B0),
    .IS_GTYP(1'B1),
    .IS_KSB(1'B0),
    .LANEUSAGE("PROT0 {group A rates 0 txrate PROT0.D1 tx 3 rxrate PROT0.D1 rx 3}"),
    .REFCLK_SEL("HSCLK1_LCPLLGTREFCLK0 refclk_PROT0_R0_100_MHz_unique1"),
    .GT_REFCLK_INFO("refclk_PROT0_R0_100_MHz_unique1"),
    .LANE_SATISFIED("1 {}"),
    .QUAD_PACK(""),
    .QUAD_USAGE("TX_QUAD_CH {TXQuad_0_/extended_phy_layer_gtwiz_versal_0_0/extended_phy_layer_gtwiz_versal_0_0_gt_quad_base_0 {/extended_phy_layer_gtwiz_versal_0_0/extended_phy_layer_gtwiz_versal_0_0_gt_quad_base_0 undef,undef,undef,PROT0.IP_CH0 MSTRCLK 0,0,0,1 IS_CURRENT_QUAD 1}} RX_QUAD_CH {RXQuad_0_/extended_phy_layer_gtwiz_versal_0_0/extended_phy_layer_gtwiz_versal_0_0_gt_quad_base_0 {/extended_phy_layer_gtwiz_versal_0_0/extended_phy_layer_gtwiz_versal_0_0_gt_quad_base_0 undef,undef,undef,PROT0.IP_CH0 MSTRCL\
K 0,0,0,1 IS_CURRENT_QUAD 1}}"),
    .LANE_SEL_DICT("unconnected {RX0 RX1 RX2 TX0 TX1 TX2} PROT0 {RX3 TX3}"),
    .MSTCLK_SRC_DICT("TX 0,0,0,1 RX 0,0,0,1"),
    .PROT_DUAL_OCCUPIED("PROT0 DUAL1"),
    .EGW_IS_QUAD("1"),
    .QUAD_COMMON_SETTINGS("mode full bonded true LANEUSAGE {PROT0 {group A rates 0 txrate PROT0.D1 tx 3 rxrate PROT0.D1 rx 3}}"),
    .CHANNEL_BONDING_EN(""),
    .PROTO_IS_FABRIC_BRAMN_NEEDED(1'B0)
  ) inst (
    .rxmarginclk(rxmarginclk),
    .hsclk0_lcpllreset(hsclk0_lcpllreset),
    .hsclk0_rpllreset(hsclk0_rpllreset),
    .hsclk1_lcpllreset(hsclk1_lcpllreset),
    .hsclk1_rpllreset(hsclk1_rpllreset),
    .hsclk0_lcplllock(hsclk0_lcplllock),
    .hsclk1_lcplllock(hsclk1_lcplllock),
    .hsclk0_rplllock(hsclk0_rplllock),
    .hsclk1_rplllock(hsclk1_rplllock),
    .gtpowergood(gtpowergood),
    .ch0_pcierstb(ch0_pcierstb),
    .ch1_pcierstb(ch1_pcierstb),
    .ch2_pcierstb(ch2_pcierstb),
    .ch3_pcierstb(ch3_pcierstb),
    .pcielinkreachtarget(pcielinkreachtarget),
    .pcieltssm(pcieltssm),
    .rxmarginreqack(rxmarginreqack),
    .rxmarginrescmd(rxmarginrescmd),
    .rxmarginreslanenum(rxmarginreslanenum),
    .rxmarginrespayld(rxmarginrespayld),
    .rxmarginresreq(rxmarginresreq),
    .rxmarginreqcmd(rxmarginreqcmd),
    .rxmarginreqlanenum(rxmarginreqlanenum),
    .rxmarginreqpayld(rxmarginreqpayld),
    .rxmarginreqreq(rxmarginreqreq),
    .rxmarginresack(rxmarginresack),
    .ch0_iloreset(ch0_iloreset),
    .ch1_iloreset(ch1_iloreset),
    .ch2_iloreset(ch2_iloreset),
    .ch3_iloreset(ch3_iloreset),
    .ch0_iloresetdone(ch0_iloresetdone),
    .ch1_iloresetdone(ch1_iloresetdone),
    .ch2_iloresetdone(ch2_iloresetdone),
    .ch3_iloresetdone(ch3_iloresetdone),
    .ch0_phystatus(ch0_phystatus),
    .ch1_phystatus(ch1_phystatus),
    .ch2_phystatus(ch2_phystatus),
    .ch3_phystatus(ch3_phystatus),
    .hsclk0_lcpllfbclklost(hsclk0_lcpllfbclklost),
    .hsclk0_lcpllrefclklost(hsclk0_lcpllrefclklost),
    .hsclk0_lcpllrefclkmonitor(hsclk0_lcpllrefclkmonitor),
    .hsclk0_rpllfbclklost(hsclk0_rpllfbclklost),
    .hsclk0_rpllrefclklost(hsclk0_rpllrefclklost),
    .hsclk0_rpllrefclkmonitor(hsclk0_rpllrefclkmonitor),
    .hsclk1_lcpllfbclklost(hsclk1_lcpllfbclklost),
    .hsclk1_lcpllrefclklost(hsclk1_lcpllrefclklost),
    .hsclk1_lcpllrefclkmonitor(hsclk1_lcpllrefclkmonitor),
    .hsclk1_rpllfbclklost(hsclk1_rpllfbclklost),
    .hsclk1_rpllrefclklost(hsclk1_rpllrefclklost),
    .hsclk1_rpllrefclkmonitor(hsclk1_rpllrefclkmonitor),
    .hsclk0_lcpllpd(hsclk0_lcpllpd),
    .hsclk0_rpllpd(hsclk0_rpllpd),
    .hsclk0_lcpllresetbypassmode(hsclk0_lcpllresetbypassmode),
    .hsclk0_lcpllsdmtoggle(hsclk0_lcpllsdmtoggle),
    .hsclk0_rpllresetbypassmode(hsclk0_rpllresetbypassmode),
    .hsclk0_rpllsdmtoggle(hsclk0_rpllsdmtoggle),
    .hsclk1_lcpllpd(hsclk1_lcpllpd),
    .hsclk1_lcpllresetbypassmode(hsclk1_lcpllresetbypassmode),
    .hsclk1_lcpllsdmtoggle(hsclk1_lcpllsdmtoggle),
    .hsclk1_rpllpd(hsclk1_rpllpd),
    .hsclk1_rpllresetbypassmode(hsclk1_rpllresetbypassmode),
    .hsclk1_rpllsdmtoggle(hsclk1_rpllsdmtoggle),
    .refclk0_gtrefclkpd(refclk0_gtrefclkpd),
    .refclk1_gtrefclkpd(refclk1_gtrefclkpd),
    .hsclk0_lcpllrefclksel(hsclk0_lcpllrefclksel),
    .hsclk1_lcpllrefclksel(hsclk1_lcpllrefclksel),
    .hsclk0_rpllrefclksel(hsclk0_rpllrefclksel),
    .hsclk1_rpllrefclksel(hsclk1_rpllrefclksel),
    .hsclk0_lcpllfbdiv(hsclk0_lcpllfbdiv),
    .hsclk0_rpllfbdiv(hsclk0_rpllfbdiv),
    .hsclk1_lcpllfbdiv(hsclk1_lcpllfbdiv),
    .hsclk1_rpllfbdiv(hsclk1_rpllfbdiv),
    .hsclk0_rxrecclkout0(hsclk0_rxrecclkout0),
    .hsclk0_rxrecclkout1(hsclk0_rxrecclkout1),
    .hsclk1_rxrecclkout0(hsclk1_rxrecclkout0),
    .hsclk1_rxrecclkout1(hsclk1_rxrecclkout1),
    .hsclk0_lcpllsdmdata(hsclk0_lcpllsdmdata),
    .hsclk1_lcpllsdmdata(hsclk1_lcpllsdmdata),
    .hsclk0_rpllsdmdata(hsclk0_rpllsdmdata),
    .hsclk1_rpllsdmdata(hsclk1_rpllsdmdata),
    .hsclk0_lcpllresetmask(hsclk0_lcpllresetmask),
    .hsclk1_lcpllresetmask(hsclk1_lcpllresetmask),
    .hsclk0_rpllresetmask(hsclk0_rpllresetmask),
    .hsclk1_rpllresetmask(hsclk1_rpllresetmask),
    .ch0_txdata(ch0_txdata),
    .ch0_txheader(ch0_txheader),
    .ch0_txsequence(ch0_txsequence),
    .ch0_gttxreset(ch0_gttxreset),
    .ch0_txprogdivreset(ch0_txprogdivreset),
    .ch0_txuserrdy(ch0_txuserrdy),
    .ch0_txphalignresetmask(ch0_txphalignresetmask),
    .ch0_txcominit(ch0_txcominit),
    .ch0_txcomsas(ch0_txcomsas),
    .ch0_txcomwake(ch0_txcomwake),
    .ch0_txdapicodeovrden(ch0_txdapicodeovrden),
    .ch0_txdapicodereset(ch0_txdapicodereset),
    .ch0_txdetectrx(ch0_txdetectrx),
    .ch0_txlatclk(ch0_txlatclk),
    .ch0_txphdlytstclk(ch0_txphdlytstclk),
    .ch0_txdlyalignreq(ch0_txdlyalignreq),
    .ch0_txelecidle(ch0_txelecidle),
    .ch0_txinhibit(ch0_txinhibit),
    .ch0_txmldchaindone(ch0_txmldchaindone),
    .ch0_txmldchainreq(ch0_txmldchainreq),
    .ch0_txoneszeros(ch0_txoneszeros),
    .ch0_txpausedelayalign(ch0_txpausedelayalign),
    .ch0_txpcsresetmask(ch0_txpcsresetmask),
    .ch0_txphalignreq(ch0_txphalignreq),
    .ch0_txphdlypd(ch0_txphdlypd),
    .ch0_txphdlyreset(ch0_txphdlyreset),
    .ch0_txphsetinitreq(ch0_txphsetinitreq),
    .ch0_txphshift180(ch0_txphshift180),
    .ch0_txpicodeovrden(ch0_txpicodeovrden),
    .ch0_txpicodereset(ch0_txpicodereset),
    .ch0_txpippmen(ch0_txpippmen),
    .ch0_txpisopd(ch0_txpisopd),
    .ch0_txpolarity(ch0_txpolarity),
    .ch0_txprbsforceerr(ch0_txprbsforceerr),
    .ch0_txswing(ch0_txswing),
    .ch0_txsyncallin(ch0_txsyncallin),
    .ch0_tx10gstat(ch0_tx10gstat),
    .ch0_txcomfinish(ch0_txcomfinish),
    .ch0_txdccdone(ch0_txdccdone),
    .ch0_txdlyalignerr(ch0_txdlyalignerr),
    .ch0_txdlyalignprog(ch0_txdlyalignprog),
    .ch0_txphaligndone(ch0_txphaligndone),
    .ch0_txphalignerr(ch0_txphalignerr),
    .ch0_txphalignoutrsvd(ch0_txphalignoutrsvd),
    .ch0_txphdlyresetdone(ch0_txphdlyresetdone),
    .ch0_txphsetinitdone(ch0_txphsetinitdone),
    .ch0_txphshift180done(ch0_txphshift180done),
    .ch0_txsyncdone(ch0_txsyncdone),
    .ch0_txbufstatus(ch0_txbufstatus),
    .ch0_txctrl0(ch0_txctrl0),
    .ch0_txctrl1(ch0_txctrl1),
    .ch0_txdeemph(ch0_txdeemph),
    .ch0_txpd(ch0_txpd),
    .ch0_txresetmode(ch0_txresetmode),
    .ch0_txmstreset(ch0_txmstreset),
    .ch0_txmstdatapathreset(ch0_txmstdatapathreset),
    .ch0_txmstresetdone(ch0_txmstresetdone),
    .ch0_txmargin(ch0_txmargin),
    .ch0_txpmaresetmask(ch0_txpmaresetmask),
    .ch0_txprbssel(ch0_txprbssel),
    .ch0_txdiffctrl(ch0_txdiffctrl),
    .ch0_txpippmstepsize(ch0_txpippmstepsize),
    .ch0_txpostcursor(ch0_txpostcursor),
    .ch0_txprecursor(ch0_txprecursor),
    .ch0_txmaincursor(ch0_txmaincursor),
    .ch0_txctrl2(ch0_txctrl2),
    .ch0_txrate(ch0_txrate),
    .ch0_txprogdivresetdone(ch0_txprogdivresetdone),
    .ch0_txpmaresetdone(ch0_txpmaresetdone),
    .ch0_txresetdone(ch0_txresetdone),
    .ch0_txdapiresetdone(ch0_txdapiresetdone),
    .ch0_txdebugpcsout(ch0_txdebugpcsout),
    .ch0_txqpisenn(ch0_txqpisenn),
    .ch0_txqpisenp(ch0_txqpisenp),
    .ch0_txsimplexphystatus(ch0_txsimplexphystatus),
    .ch0_txswingouthigh(ch0_txswingouthigh),
    .ch0_txswingoutlow(ch0_txswingoutlow),
    .ch0_txdapireset(ch0_txdapireset),
    .ch0_txdapiresetmask(ch0_txdapiresetmask),
    .ch0_txqpibiasen(ch0_txqpibiasen),
    .ch0_txqpiweakpu(ch0_txqpiweakpu),
    .ch0_txoutclk(ch0_txoutclk),
    .ch0_txusrclk(ch0_txusrclk),
    .ch1_txdata(ch1_txdata),
    .ch1_txheader(ch1_txheader),
    .ch1_txsequence(ch1_txsequence),
    .ch1_gttxreset(ch1_gttxreset),
    .ch1_txprogdivreset(ch1_txprogdivreset),
    .ch1_txuserrdy(ch1_txuserrdy),
    .ch1_txphalignresetmask(ch1_txphalignresetmask),
    .ch1_txcominit(ch1_txcominit),
    .ch1_txcomsas(ch1_txcomsas),
    .ch1_txcomwake(ch1_txcomwake),
    .ch1_txdapicodeovrden(ch1_txdapicodeovrden),
    .ch1_txdapicodereset(ch1_txdapicodereset),
    .ch1_txdetectrx(ch1_txdetectrx),
    .ch1_txlatclk(ch1_txlatclk),
    .ch1_txphdlytstclk(ch1_txphdlytstclk),
    .ch1_txdlyalignreq(ch1_txdlyalignreq),
    .ch1_txelecidle(ch1_txelecidle),
    .ch1_txinhibit(ch1_txinhibit),
    .ch1_txmldchaindone(ch1_txmldchaindone),
    .ch1_txmldchainreq(ch1_txmldchainreq),
    .ch1_txoneszeros(ch1_txoneszeros),
    .ch1_txpausedelayalign(ch1_txpausedelayalign),
    .ch1_txpcsresetmask(ch1_txpcsresetmask),
    .ch1_txphalignreq(ch1_txphalignreq),
    .ch1_txphdlypd(ch1_txphdlypd),
    .ch1_txphdlyreset(ch1_txphdlyreset),
    .ch1_txphsetinitreq(ch1_txphsetinitreq),
    .ch1_txphshift180(ch1_txphshift180),
    .ch1_txpicodeovrden(ch1_txpicodeovrden),
    .ch1_txpicodereset(ch1_txpicodereset),
    .ch1_txpippmen(ch1_txpippmen),
    .ch1_txpisopd(ch1_txpisopd),
    .ch1_txpolarity(ch1_txpolarity),
    .ch1_txprbsforceerr(ch1_txprbsforceerr),
    .ch1_txswing(ch1_txswing),
    .ch1_txsyncallin(ch1_txsyncallin),
    .ch1_tx10gstat(ch1_tx10gstat),
    .ch1_txcomfinish(ch1_txcomfinish),
    .ch1_txdccdone(ch1_txdccdone),
    .ch1_txdlyalignerr(ch1_txdlyalignerr),
    .ch1_txdlyalignprog(ch1_txdlyalignprog),
    .ch1_txphaligndone(ch1_txphaligndone),
    .ch1_txphalignerr(ch1_txphalignerr),
    .ch1_txphalignoutrsvd(ch1_txphalignoutrsvd),
    .ch1_txphdlyresetdone(ch1_txphdlyresetdone),
    .ch1_txphsetinitdone(ch1_txphsetinitdone),
    .ch1_txphshift180done(ch1_txphshift180done),
    .ch1_txsyncdone(ch1_txsyncdone),
    .ch1_txbufstatus(ch1_txbufstatus),
    .ch1_txctrl0(ch1_txctrl0),
    .ch1_txctrl1(ch1_txctrl1),
    .ch1_txdeemph(ch1_txdeemph),
    .ch1_txpd(ch1_txpd),
    .ch1_txresetmode(ch1_txresetmode),
    .ch1_txmstreset(ch1_txmstreset),
    .ch1_txmstdatapathreset(ch1_txmstdatapathreset),
    .ch1_txmstresetdone(ch1_txmstresetdone),
    .ch1_txmargin(ch1_txmargin),
    .ch1_txpmaresetmask(ch1_txpmaresetmask),
    .ch1_txprbssel(ch1_txprbssel),
    .ch1_txdiffctrl(ch1_txdiffctrl),
    .ch1_txpippmstepsize(ch1_txpippmstepsize),
    .ch1_txpostcursor(ch1_txpostcursor),
    .ch1_txprecursor(ch1_txprecursor),
    .ch1_txmaincursor(ch1_txmaincursor),
    .ch1_txctrl2(ch1_txctrl2),
    .ch1_txrate(ch1_txrate),
    .ch1_txprogdivresetdone(ch1_txprogdivresetdone),
    .ch1_txpmaresetdone(ch1_txpmaresetdone),
    .ch1_txresetdone(ch1_txresetdone),
    .ch1_txdapiresetdone(ch1_txdapiresetdone),
    .ch1_txdebugpcsout(ch1_txdebugpcsout),
    .ch1_txqpisenn(ch1_txqpisenn),
    .ch1_txqpisenp(ch1_txqpisenp),
    .ch1_txsimplexphystatus(ch1_txsimplexphystatus),
    .ch1_txswingouthigh(ch1_txswingouthigh),
    .ch1_txswingoutlow(ch1_txswingoutlow),
    .ch1_txdapireset(ch1_txdapireset),
    .ch1_txdapiresetmask(ch1_txdapiresetmask),
    .ch1_txqpibiasen(ch1_txqpibiasen),
    .ch1_txqpiweakpu(ch1_txqpiweakpu),
    .ch1_txoutclk(ch1_txoutclk),
    .ch1_txusrclk(ch1_txusrclk),
    .ch2_txdata(ch2_txdata),
    .ch2_txheader(ch2_txheader),
    .ch2_txsequence(ch2_txsequence),
    .ch2_gttxreset(ch2_gttxreset),
    .ch2_txprogdivreset(ch2_txprogdivreset),
    .ch2_txuserrdy(ch2_txuserrdy),
    .ch2_txphalignresetmask(ch2_txphalignresetmask),
    .ch2_txcominit(ch2_txcominit),
    .ch2_txcomsas(ch2_txcomsas),
    .ch2_txcomwake(ch2_txcomwake),
    .ch2_txdapicodeovrden(ch2_txdapicodeovrden),
    .ch2_txdapicodereset(ch2_txdapicodereset),
    .ch2_txdetectrx(ch2_txdetectrx),
    .ch2_txlatclk(ch2_txlatclk),
    .ch2_txphdlytstclk(ch2_txphdlytstclk),
    .ch2_txdlyalignreq(ch2_txdlyalignreq),
    .ch2_txelecidle(ch2_txelecidle),
    .ch2_txinhibit(ch2_txinhibit),
    .ch2_txmldchaindone(ch2_txmldchaindone),
    .ch2_txmldchainreq(ch2_txmldchainreq),
    .ch2_txoneszeros(ch2_txoneszeros),
    .ch2_txpausedelayalign(ch2_txpausedelayalign),
    .ch2_txpcsresetmask(ch2_txpcsresetmask),
    .ch2_txphalignreq(ch2_txphalignreq),
    .ch2_txphdlypd(ch2_txphdlypd),
    .ch2_txphdlyreset(ch2_txphdlyreset),
    .ch2_txphsetinitreq(ch2_txphsetinitreq),
    .ch2_txphshift180(ch2_txphshift180),
    .ch2_txpicodeovrden(ch2_txpicodeovrden),
    .ch2_txpicodereset(ch2_txpicodereset),
    .ch2_txpippmen(ch2_txpippmen),
    .ch2_txpisopd(ch2_txpisopd),
    .ch2_txpolarity(ch2_txpolarity),
    .ch2_txprbsforceerr(ch2_txprbsforceerr),
    .ch2_txswing(ch2_txswing),
    .ch2_txsyncallin(ch2_txsyncallin),
    .ch2_tx10gstat(ch2_tx10gstat),
    .ch2_txcomfinish(ch2_txcomfinish),
    .ch2_txdccdone(ch2_txdccdone),
    .ch2_txdlyalignerr(ch2_txdlyalignerr),
    .ch2_txdlyalignprog(ch2_txdlyalignprog),
    .ch2_txphaligndone(ch2_txphaligndone),
    .ch2_txphalignerr(ch2_txphalignerr),
    .ch2_txphalignoutrsvd(ch2_txphalignoutrsvd),
    .ch2_txphdlyresetdone(ch2_txphdlyresetdone),
    .ch2_txphsetinitdone(ch2_txphsetinitdone),
    .ch2_txphshift180done(ch2_txphshift180done),
    .ch2_txsyncdone(ch2_txsyncdone),
    .ch2_txbufstatus(ch2_txbufstatus),
    .ch2_txctrl0(ch2_txctrl0),
    .ch2_txctrl1(ch2_txctrl1),
    .ch2_txdeemph(ch2_txdeemph),
    .ch2_txpd(ch2_txpd),
    .ch2_txresetmode(ch2_txresetmode),
    .ch2_txmstreset(ch2_txmstreset),
    .ch2_txmstdatapathreset(ch2_txmstdatapathreset),
    .ch2_txmstresetdone(ch2_txmstresetdone),
    .ch2_txmargin(ch2_txmargin),
    .ch2_txpmaresetmask(ch2_txpmaresetmask),
    .ch2_txprbssel(ch2_txprbssel),
    .ch2_txdiffctrl(ch2_txdiffctrl),
    .ch2_txpippmstepsize(ch2_txpippmstepsize),
    .ch2_txpostcursor(ch2_txpostcursor),
    .ch2_txprecursor(ch2_txprecursor),
    .ch2_txmaincursor(ch2_txmaincursor),
    .ch2_txctrl2(ch2_txctrl2),
    .ch2_txrate(ch2_txrate),
    .ch2_txprogdivresetdone(ch2_txprogdivresetdone),
    .ch2_txpmaresetdone(ch2_txpmaresetdone),
    .ch2_txresetdone(ch2_txresetdone),
    .ch2_txdapiresetdone(ch2_txdapiresetdone),
    .ch2_txdebugpcsout(ch2_txdebugpcsout),
    .ch2_txqpisenn(ch2_txqpisenn),
    .ch2_txqpisenp(ch2_txqpisenp),
    .ch2_txsimplexphystatus(ch2_txsimplexphystatus),
    .ch2_txswingouthigh(ch2_txswingouthigh),
    .ch2_txswingoutlow(ch2_txswingoutlow),
    .ch2_txdapireset(ch2_txdapireset),
    .ch2_txdapiresetmask(ch2_txdapiresetmask),
    .ch2_txqpibiasen(ch2_txqpibiasen),
    .ch2_txqpiweakpu(ch2_txqpiweakpu),
    .ch2_txoutclk(ch2_txoutclk),
    .ch2_txusrclk(ch2_txusrclk),
    .ch3_txdata(ch3_txdata),
    .ch3_txheader(ch3_txheader),
    .ch3_txsequence(ch3_txsequence),
    .ch3_gttxreset(ch3_gttxreset),
    .ch3_txprogdivreset(ch3_txprogdivreset),
    .ch3_txuserrdy(ch3_txuserrdy),
    .ch3_txphalignresetmask(ch3_txphalignresetmask),
    .ch3_txcominit(ch3_txcominit),
    .ch3_txcomsas(ch3_txcomsas),
    .ch3_txcomwake(ch3_txcomwake),
    .ch3_txdapicodeovrden(ch3_txdapicodeovrden),
    .ch3_txdapicodereset(ch3_txdapicodereset),
    .ch3_txdetectrx(ch3_txdetectrx),
    .ch3_txlatclk(ch3_txlatclk),
    .ch3_txphdlytstclk(ch3_txphdlytstclk),
    .ch3_txdlyalignreq(ch3_txdlyalignreq),
    .ch3_txelecidle(ch3_txelecidle),
    .ch3_txinhibit(ch3_txinhibit),
    .ch3_txmldchaindone(ch3_txmldchaindone),
    .ch3_txmldchainreq(ch3_txmldchainreq),
    .ch3_txoneszeros(ch3_txoneszeros),
    .ch3_txpausedelayalign(ch3_txpausedelayalign),
    .ch3_txpcsresetmask(ch3_txpcsresetmask),
    .ch3_txphalignreq(ch3_txphalignreq),
    .ch3_txphdlypd(ch3_txphdlypd),
    .ch3_txphdlyreset(ch3_txphdlyreset),
    .ch3_txphsetinitreq(ch3_txphsetinitreq),
    .ch3_txphshift180(ch3_txphshift180),
    .ch3_txpicodeovrden(ch3_txpicodeovrden),
    .ch3_txpicodereset(ch3_txpicodereset),
    .ch3_txpippmen(ch3_txpippmen),
    .ch3_txpisopd(ch3_txpisopd),
    .ch3_txpolarity(ch3_txpolarity),
    .ch3_txprbsforceerr(ch3_txprbsforceerr),
    .ch3_txswing(ch3_txswing),
    .ch3_txsyncallin(ch3_txsyncallin),
    .ch3_tx10gstat(ch3_tx10gstat),
    .ch3_txcomfinish(ch3_txcomfinish),
    .ch3_txdccdone(ch3_txdccdone),
    .ch3_txdlyalignerr(ch3_txdlyalignerr),
    .ch3_txdlyalignprog(ch3_txdlyalignprog),
    .ch3_txphaligndone(ch3_txphaligndone),
    .ch3_txphalignerr(ch3_txphalignerr),
    .ch3_txphalignoutrsvd(ch3_txphalignoutrsvd),
    .ch3_txphdlyresetdone(ch3_txphdlyresetdone),
    .ch3_txphsetinitdone(ch3_txphsetinitdone),
    .ch3_txphshift180done(ch3_txphshift180done),
    .ch3_txsyncdone(ch3_txsyncdone),
    .ch3_txbufstatus(ch3_txbufstatus),
    .ch3_txctrl0(ch3_txctrl0),
    .ch3_txctrl1(ch3_txctrl1),
    .ch3_txdeemph(ch3_txdeemph),
    .ch3_txpd(ch3_txpd),
    .ch3_txresetmode(ch3_txresetmode),
    .ch3_txmstreset(ch3_txmstreset),
    .ch3_txmstdatapathreset(ch3_txmstdatapathreset),
    .ch3_txmstresetdone(ch3_txmstresetdone),
    .ch3_txmargin(ch3_txmargin),
    .ch3_txpmaresetmask(ch3_txpmaresetmask),
    .ch3_txprbssel(ch3_txprbssel),
    .ch3_txdiffctrl(ch3_txdiffctrl),
    .ch3_txpippmstepsize(ch3_txpippmstepsize),
    .ch3_txpostcursor(ch3_txpostcursor),
    .ch3_txprecursor(ch3_txprecursor),
    .ch3_txmaincursor(ch3_txmaincursor),
    .ch3_txctrl2(ch3_txctrl2),
    .ch3_txrate(ch3_txrate),
    .ch3_txprogdivresetdone(ch3_txprogdivresetdone),
    .ch3_txpmaresetdone(ch3_txpmaresetdone),
    .ch3_txresetdone(ch3_txresetdone),
    .ch3_txdapiresetdone(ch3_txdapiresetdone),
    .ch3_txdebugpcsout(ch3_txdebugpcsout),
    .ch3_txqpisenn(ch3_txqpisenn),
    .ch3_txqpisenp(ch3_txqpisenp),
    .ch3_txsimplexphystatus(ch3_txsimplexphystatus),
    .ch3_txswingouthigh(ch3_txswingouthigh),
    .ch3_txswingoutlow(ch3_txswingoutlow),
    .ch3_txdapireset(ch3_txdapireset),
    .ch3_txdapiresetmask(ch3_txdapiresetmask),
    .ch3_txqpibiasen(ch3_txqpibiasen),
    .ch3_txqpiweakpu(ch3_txqpiweakpu),
    .ch3_txoutclk(ch3_txoutclk),
    .ch3_txusrclk(ch3_txusrclk),
    .ch0_rxdata(ch0_rxdata),
    .ch0_rxdatavalid(ch0_rxdatavalid),
    .ch0_rxheader(ch0_rxheader),
    .ch0_rxgearboxslip(ch0_rxgearboxslip),
    .ch0_rxlatclk(ch0_rxlatclk),
    .ch0_gtrxreset(ch0_gtrxreset),
    .ch0_rxprogdivreset(ch0_rxprogdivreset),
    .ch0_rxuserrdy(ch0_rxuserrdy),
    .ch0_rxprogdivresetdone(ch0_rxprogdivresetdone),
    .ch0_rxpmaresetdone(ch0_rxpmaresetdone),
    .ch0_rxresetdone(ch0_rxresetdone),
    .ch0_rx10gstat(ch0_rx10gstat),
    .ch0_rxbufstatus(ch0_rxbufstatus),
    .ch0_rxbyteisaligned(ch0_rxbyteisaligned),
    .ch0_rxbyterealign(ch0_rxbyterealign),
    .ch0_rxcdrhold(ch0_rxcdrhold),
    .ch0_rxcdrlock(ch0_rxcdrlock),
    .ch0_rxcdrovrden(ch0_rxcdrovrden),
    .ch0_rxcdrphdone(ch0_rxcdrphdone),
    .ch0_rxcdrreset(ch0_rxcdrreset),
    .ch0_rxchanbondseq(ch0_rxchanbondseq),
    .ch0_rxchanisaligned(ch0_rxchanisaligned),
    .ch0_rxchanrealign(ch0_rxchanrealign),
    .ch0_rxchbondi(ch0_rxchbondi),
    .ch0_rxchbondo(ch0_rxchbondo),
    .ch0_rxclkcorcnt(ch0_rxclkcorcnt),
    .ch0_rxcominitdet(ch0_rxcominitdet),
    .ch0_rxcommadet(ch0_rxcommadet),
    .ch0_rxcomsasdet(ch0_rxcomsasdet),
    .ch0_rxcomwakedet(ch0_rxcomwakedet),
    .ch0_rxctrl0(ch0_rxctrl0),
    .ch0_rxctrl1(ch0_rxctrl1),
    .ch0_rxctrl2(ch0_rxctrl2),
    .ch0_rxctrl3(ch0_rxctrl3),
    .ch0_rxdapicodeovrden(ch0_rxdapicodeovrden),
    .ch0_rxdapicodereset(ch0_rxdapicodereset),
    .ch0_rxdlyalignerr(ch0_rxdlyalignerr),
    .ch0_rxdlyalignprog(ch0_rxdlyalignprog),
    .ch0_rxdlyalignreq(ch0_rxdlyalignreq),
    .ch0_rxelecidle(ch0_rxelecidle),
    .ch0_rxeqtraining(ch0_rxeqtraining),
    .ch0_rxfinealigndone(ch0_rxfinealigndone),
    .ch0_rxheadervalid(ch0_rxheadervalid),
    .ch0_rxlpmen(ch0_rxlpmen),
    .ch0_rxmldchaindone(ch0_rxmldchaindone),
    .ch0_rxmldchainreq(ch0_rxmldchainreq),
    .ch0_rxmlfinealignreq(ch0_rxmlfinealignreq),
    .ch0_rxoobreset(ch0_rxoobreset),
    .ch0_rxosintdone(ch0_rxosintdone),
    .ch0_rxpcsresetmask(ch0_rxpcsresetmask),
    .ch0_rxpd(ch0_rxpd),
    .ch0_rxphaligndone(ch0_rxphaligndone),
    .ch0_rxphalignerr(ch0_rxphalignerr),
    .ch0_rxphalignreq(ch0_rxphalignreq),
    .ch0_rxphalignresetmask(ch0_rxphalignresetmask),
    .ch0_rxphdlypd(ch0_rxphdlypd),
    .ch0_rxphdlyreset(ch0_rxphdlyreset),
    .ch0_rxphdlyresetdone(ch0_rxphdlyresetdone),
    .ch0_rxphsetinitdone(ch0_rxphsetinitdone),
    .ch0_rxphsetinitreq(ch0_rxphsetinitreq),
    .ch0_rxphshift180(ch0_rxphshift180),
    .ch0_rxphshift180done(ch0_rxphshift180done),
    .ch0_rxpmaresetmask(ch0_rxpmaresetmask),
    .ch0_rxpolarity(ch0_rxpolarity),
    .ch0_rxprbscntreset(ch0_rxprbscntreset),
    .ch0_rxprbserr(ch0_rxprbserr),
    .ch0_rxprbslocked(ch0_rxprbslocked),
    .ch0_rxprbssel(ch0_rxprbssel),
    .ch0_rxrate(ch0_rxrate),
    .ch0_rxresetmode(ch0_rxresetmode),
    .ch0_rxmstreset(ch0_rxmstreset),
    .ch0_rxmstdatapathreset(ch0_rxmstdatapathreset),
    .ch0_rxmstresetdone(ch0_rxmstresetdone),
    .ch0_rxslide(ch0_rxslide),
    .ch0_rxsliderdy(ch0_rxsliderdy),
    .ch0_rxstartofseq(ch0_rxstartofseq),
    .ch0_rxstatus(ch0_rxstatus),
    .ch0_rxsyncallin(ch0_rxsyncallin),
    .ch0_rxsyncdone(ch0_rxsyncdone),
    .ch0_rxtermination(ch0_rxtermination),
    .ch0_rxvalid(ch0_rxvalid),
    .ch0_cdrbmcdrreq(ch0_cdrbmcdrreq),
    .ch0_cdrfreqos(ch0_cdrfreqos),
    .ch0_cdrincpctrl(ch0_cdrincpctrl),
    .ch0_cdrstepdir(ch0_cdrstepdir),
    .ch0_cdrstepsq(ch0_cdrstepsq),
    .ch0_cdrstepsx(ch0_cdrstepsx),
    .ch0_eyescanreset(ch0_eyescanreset),
    .ch0_eyescantrigger(ch0_eyescantrigger),
    .ch0_eyescandataerror(ch0_eyescandataerror),
    .ch0_refdebugout(ch0_refdebugout),
    .ch0_rxdapiresetdone(ch0_rxdapiresetdone),
    .ch0_rxdebugpcsout(ch0_rxdebugpcsout),
    .ch0_rxpkdet(ch0_rxpkdet),
    .ch0_rxqpisenn(ch0_rxqpisenn),
    .ch0_rxqpisenp(ch0_rxqpisenp),
    .ch0_rxsimplexphystatus(ch0_rxsimplexphystatus),
    .ch0_rxslipdone(ch0_rxslipdone),
    .ch0_dfehold(ch0_dfehold),
    .ch0_dfeovrd(ch0_dfeovrd),
    .ch0_rxdapireset(ch0_rxdapireset),
    .ch0_rxdapiresetmask(ch0_rxdapiresetmask),
    .ch0_rxqpien(ch0_rxqpien),
    .ch0_rxoutclk(ch0_rxoutclk),
    .ch0_rxusrclk(ch0_rxusrclk),
    .ch1_rxdata(ch1_rxdata),
    .ch1_rxdatavalid(ch1_rxdatavalid),
    .ch1_rxheader(ch1_rxheader),
    .ch1_rxgearboxslip(ch1_rxgearboxslip),
    .ch1_rxlatclk(ch1_rxlatclk),
    .ch1_gtrxreset(ch1_gtrxreset),
    .ch1_rxprogdivreset(ch1_rxprogdivreset),
    .ch1_rxuserrdy(ch1_rxuserrdy),
    .ch1_rxprogdivresetdone(ch1_rxprogdivresetdone),
    .ch1_rxpmaresetdone(ch1_rxpmaresetdone),
    .ch1_rxresetdone(ch1_rxresetdone),
    .ch1_rx10gstat(ch1_rx10gstat),
    .ch1_rxbufstatus(ch1_rxbufstatus),
    .ch1_rxbyteisaligned(ch1_rxbyteisaligned),
    .ch1_rxbyterealign(ch1_rxbyterealign),
    .ch1_rxcdrhold(ch1_rxcdrhold),
    .ch1_rxcdrlock(ch1_rxcdrlock),
    .ch1_rxcdrovrden(ch1_rxcdrovrden),
    .ch1_rxcdrphdone(ch1_rxcdrphdone),
    .ch1_rxcdrreset(ch1_rxcdrreset),
    .ch1_rxchanbondseq(ch1_rxchanbondseq),
    .ch1_rxchanisaligned(ch1_rxchanisaligned),
    .ch1_rxchanrealign(ch1_rxchanrealign),
    .ch1_rxchbondi(ch1_rxchbondi),
    .ch1_rxchbondo(ch1_rxchbondo),
    .ch1_rxclkcorcnt(ch1_rxclkcorcnt),
    .ch1_rxcominitdet(ch1_rxcominitdet),
    .ch1_rxcommadet(ch1_rxcommadet),
    .ch1_rxcomsasdet(ch1_rxcomsasdet),
    .ch1_rxcomwakedet(ch1_rxcomwakedet),
    .ch1_rxctrl0(ch1_rxctrl0),
    .ch1_rxctrl1(ch1_rxctrl1),
    .ch1_rxctrl2(ch1_rxctrl2),
    .ch1_rxctrl3(ch1_rxctrl3),
    .ch1_rxdapicodeovrden(ch1_rxdapicodeovrden),
    .ch1_rxdapicodereset(ch1_rxdapicodereset),
    .ch1_rxdlyalignerr(ch1_rxdlyalignerr),
    .ch1_rxdlyalignprog(ch1_rxdlyalignprog),
    .ch1_rxdlyalignreq(ch1_rxdlyalignreq),
    .ch1_rxelecidle(ch1_rxelecidle),
    .ch1_rxeqtraining(ch1_rxeqtraining),
    .ch1_rxfinealigndone(ch1_rxfinealigndone),
    .ch1_rxheadervalid(ch1_rxheadervalid),
    .ch1_rxlpmen(ch1_rxlpmen),
    .ch1_rxmldchaindone(ch1_rxmldchaindone),
    .ch1_rxmldchainreq(ch1_rxmldchainreq),
    .ch1_rxmlfinealignreq(ch1_rxmlfinealignreq),
    .ch1_rxoobreset(ch1_rxoobreset),
    .ch1_rxosintdone(ch1_rxosintdone),
    .ch1_rxpcsresetmask(ch1_rxpcsresetmask),
    .ch1_rxpd(ch1_rxpd),
    .ch1_rxphaligndone(ch1_rxphaligndone),
    .ch1_rxphalignerr(ch1_rxphalignerr),
    .ch1_rxphalignreq(ch1_rxphalignreq),
    .ch1_rxphalignresetmask(ch1_rxphalignresetmask),
    .ch1_rxphdlypd(ch1_rxphdlypd),
    .ch1_rxphdlyreset(ch1_rxphdlyreset),
    .ch1_rxphdlyresetdone(ch1_rxphdlyresetdone),
    .ch1_rxphsetinitdone(ch1_rxphsetinitdone),
    .ch1_rxphsetinitreq(ch1_rxphsetinitreq),
    .ch1_rxphshift180(ch1_rxphshift180),
    .ch1_rxphshift180done(ch1_rxphshift180done),
    .ch1_rxpmaresetmask(ch1_rxpmaresetmask),
    .ch1_rxpolarity(ch1_rxpolarity),
    .ch1_rxprbscntreset(ch1_rxprbscntreset),
    .ch1_rxprbserr(ch1_rxprbserr),
    .ch1_rxprbslocked(ch1_rxprbslocked),
    .ch1_rxprbssel(ch1_rxprbssel),
    .ch1_rxrate(ch1_rxrate),
    .ch1_rxresetmode(ch1_rxresetmode),
    .ch1_rxmstreset(ch1_rxmstreset),
    .ch1_rxmstdatapathreset(ch1_rxmstdatapathreset),
    .ch1_rxmstresetdone(ch1_rxmstresetdone),
    .ch1_rxslide(ch1_rxslide),
    .ch1_rxsliderdy(ch1_rxsliderdy),
    .ch1_rxstartofseq(ch1_rxstartofseq),
    .ch1_rxstatus(ch1_rxstatus),
    .ch1_rxsyncallin(ch1_rxsyncallin),
    .ch1_rxsyncdone(ch1_rxsyncdone),
    .ch1_rxtermination(ch1_rxtermination),
    .ch1_rxvalid(ch1_rxvalid),
    .ch1_cdrbmcdrreq(ch1_cdrbmcdrreq),
    .ch1_cdrfreqos(ch1_cdrfreqos),
    .ch1_cdrincpctrl(ch1_cdrincpctrl),
    .ch1_cdrstepdir(ch1_cdrstepdir),
    .ch1_cdrstepsq(ch1_cdrstepsq),
    .ch1_cdrstepsx(ch1_cdrstepsx),
    .ch1_eyescanreset(ch1_eyescanreset),
    .ch1_eyescantrigger(ch1_eyescantrigger),
    .ch1_eyescandataerror(ch1_eyescandataerror),
    .ch1_refdebugout(ch1_refdebugout),
    .ch1_rxdapiresetdone(ch1_rxdapiresetdone),
    .ch1_rxdebugpcsout(ch1_rxdebugpcsout),
    .ch1_rxpkdet(ch1_rxpkdet),
    .ch1_rxqpisenn(ch1_rxqpisenn),
    .ch1_rxqpisenp(ch1_rxqpisenp),
    .ch1_rxsimplexphystatus(ch1_rxsimplexphystatus),
    .ch1_rxslipdone(ch1_rxslipdone),
    .ch1_dfehold(ch1_dfehold),
    .ch1_dfeovrd(ch1_dfeovrd),
    .ch1_rxdapireset(ch1_rxdapireset),
    .ch1_rxdapiresetmask(ch1_rxdapiresetmask),
    .ch1_rxqpien(ch1_rxqpien),
    .ch1_rxoutclk(ch1_rxoutclk),
    .ch1_rxusrclk(ch1_rxusrclk),
    .ch2_rxdata(ch2_rxdata),
    .ch2_rxdatavalid(ch2_rxdatavalid),
    .ch2_rxheader(ch2_rxheader),
    .ch2_rxgearboxslip(ch2_rxgearboxslip),
    .ch2_rxlatclk(ch2_rxlatclk),
    .ch2_gtrxreset(ch2_gtrxreset),
    .ch2_rxprogdivreset(ch2_rxprogdivreset),
    .ch2_rxuserrdy(ch2_rxuserrdy),
    .ch2_rxprogdivresetdone(ch2_rxprogdivresetdone),
    .ch2_rxpmaresetdone(ch2_rxpmaresetdone),
    .ch2_rxresetdone(ch2_rxresetdone),
    .ch2_rx10gstat(ch2_rx10gstat),
    .ch2_rxbufstatus(ch2_rxbufstatus),
    .ch2_rxbyteisaligned(ch2_rxbyteisaligned),
    .ch2_rxbyterealign(ch2_rxbyterealign),
    .ch2_rxcdrhold(ch2_rxcdrhold),
    .ch2_rxcdrlock(ch2_rxcdrlock),
    .ch2_rxcdrovrden(ch2_rxcdrovrden),
    .ch2_rxcdrphdone(ch2_rxcdrphdone),
    .ch2_rxcdrreset(ch2_rxcdrreset),
    .ch2_rxchanbondseq(ch2_rxchanbondseq),
    .ch2_rxchanisaligned(ch2_rxchanisaligned),
    .ch2_rxchanrealign(ch2_rxchanrealign),
    .ch2_rxchbondi(ch2_rxchbondi),
    .ch2_rxchbondo(ch2_rxchbondo),
    .ch2_rxclkcorcnt(ch2_rxclkcorcnt),
    .ch2_rxcominitdet(ch2_rxcominitdet),
    .ch2_rxcommadet(ch2_rxcommadet),
    .ch2_rxcomsasdet(ch2_rxcomsasdet),
    .ch2_rxcomwakedet(ch2_rxcomwakedet),
    .ch2_rxctrl0(ch2_rxctrl0),
    .ch2_rxctrl1(ch2_rxctrl1),
    .ch2_rxctrl2(ch2_rxctrl2),
    .ch2_rxctrl3(ch2_rxctrl3),
    .ch2_rxdapicodeovrden(ch2_rxdapicodeovrden),
    .ch2_rxdapicodereset(ch2_rxdapicodereset),
    .ch2_rxdlyalignerr(ch2_rxdlyalignerr),
    .ch2_rxdlyalignprog(ch2_rxdlyalignprog),
    .ch2_rxdlyalignreq(ch2_rxdlyalignreq),
    .ch2_rxelecidle(ch2_rxelecidle),
    .ch2_rxeqtraining(ch2_rxeqtraining),
    .ch2_rxfinealigndone(ch2_rxfinealigndone),
    .ch2_rxheadervalid(ch2_rxheadervalid),
    .ch2_rxlpmen(ch2_rxlpmen),
    .ch2_rxmldchaindone(ch2_rxmldchaindone),
    .ch2_rxmldchainreq(ch2_rxmldchainreq),
    .ch2_rxmlfinealignreq(ch2_rxmlfinealignreq),
    .ch2_rxoobreset(ch2_rxoobreset),
    .ch2_rxosintdone(ch2_rxosintdone),
    .ch2_rxpcsresetmask(ch2_rxpcsresetmask),
    .ch2_rxpd(ch2_rxpd),
    .ch2_rxphaligndone(ch2_rxphaligndone),
    .ch2_rxphalignerr(ch2_rxphalignerr),
    .ch2_rxphalignreq(ch2_rxphalignreq),
    .ch2_rxphalignresetmask(ch2_rxphalignresetmask),
    .ch2_rxphdlypd(ch2_rxphdlypd),
    .ch2_rxphdlyreset(ch2_rxphdlyreset),
    .ch2_rxphdlyresetdone(ch2_rxphdlyresetdone),
    .ch2_rxphsetinitdone(ch2_rxphsetinitdone),
    .ch2_rxphsetinitreq(ch2_rxphsetinitreq),
    .ch2_rxphshift180(ch2_rxphshift180),
    .ch2_rxphshift180done(ch2_rxphshift180done),
    .ch2_rxpmaresetmask(ch2_rxpmaresetmask),
    .ch2_rxpolarity(ch2_rxpolarity),
    .ch2_rxprbscntreset(ch2_rxprbscntreset),
    .ch2_rxprbserr(ch2_rxprbserr),
    .ch2_rxprbslocked(ch2_rxprbslocked),
    .ch2_rxprbssel(ch2_rxprbssel),
    .ch2_rxrate(ch2_rxrate),
    .ch2_rxresetmode(ch2_rxresetmode),
    .ch2_rxmstreset(ch2_rxmstreset),
    .ch2_rxmstdatapathreset(ch2_rxmstdatapathreset),
    .ch2_rxmstresetdone(ch2_rxmstresetdone),
    .ch2_rxslide(ch2_rxslide),
    .ch2_rxsliderdy(ch2_rxsliderdy),
    .ch2_rxstartofseq(ch2_rxstartofseq),
    .ch2_rxstatus(ch2_rxstatus),
    .ch2_rxsyncallin(ch2_rxsyncallin),
    .ch2_rxsyncdone(ch2_rxsyncdone),
    .ch2_rxtermination(ch2_rxtermination),
    .ch2_rxvalid(ch2_rxvalid),
    .ch2_cdrbmcdrreq(ch2_cdrbmcdrreq),
    .ch2_cdrfreqos(ch2_cdrfreqos),
    .ch2_cdrincpctrl(ch2_cdrincpctrl),
    .ch2_cdrstepdir(ch2_cdrstepdir),
    .ch2_cdrstepsq(ch2_cdrstepsq),
    .ch2_cdrstepsx(ch2_cdrstepsx),
    .ch2_eyescanreset(ch2_eyescanreset),
    .ch2_eyescantrigger(ch2_eyescantrigger),
    .ch2_eyescandataerror(ch2_eyescandataerror),
    .ch2_refdebugout(ch2_refdebugout),
    .ch2_rxdapiresetdone(ch2_rxdapiresetdone),
    .ch2_rxdebugpcsout(ch2_rxdebugpcsout),
    .ch2_rxpkdet(ch2_rxpkdet),
    .ch2_rxqpisenn(ch2_rxqpisenn),
    .ch2_rxqpisenp(ch2_rxqpisenp),
    .ch2_rxsimplexphystatus(ch2_rxsimplexphystatus),
    .ch2_rxslipdone(ch2_rxslipdone),
    .ch2_dfehold(ch2_dfehold),
    .ch2_dfeovrd(ch2_dfeovrd),
    .ch2_rxdapireset(ch2_rxdapireset),
    .ch2_rxdapiresetmask(ch2_rxdapiresetmask),
    .ch2_rxqpien(ch2_rxqpien),
    .ch2_rxoutclk(ch2_rxoutclk),
    .ch2_rxusrclk(ch2_rxusrclk),
    .ch3_rxdata(ch3_rxdata),
    .ch3_rxdatavalid(ch3_rxdatavalid),
    .ch3_rxheader(ch3_rxheader),
    .ch3_rxgearboxslip(ch3_rxgearboxslip),
    .ch3_rxlatclk(ch3_rxlatclk),
    .ch3_gtrxreset(ch3_gtrxreset),
    .ch3_rxprogdivreset(ch3_rxprogdivreset),
    .ch3_rxuserrdy(ch3_rxuserrdy),
    .ch3_rxprogdivresetdone(ch3_rxprogdivresetdone),
    .ch3_rxpmaresetdone(ch3_rxpmaresetdone),
    .ch3_rxresetdone(ch3_rxresetdone),
    .ch3_rx10gstat(ch3_rx10gstat),
    .ch3_rxbufstatus(ch3_rxbufstatus),
    .ch3_rxbyteisaligned(ch3_rxbyteisaligned),
    .ch3_rxbyterealign(ch3_rxbyterealign),
    .ch3_rxcdrhold(ch3_rxcdrhold),
    .ch3_rxcdrlock(ch3_rxcdrlock),
    .ch3_rxcdrovrden(ch3_rxcdrovrden),
    .ch3_rxcdrphdone(ch3_rxcdrphdone),
    .ch3_rxcdrreset(ch3_rxcdrreset),
    .ch3_rxchanbondseq(ch3_rxchanbondseq),
    .ch3_rxchanisaligned(ch3_rxchanisaligned),
    .ch3_rxchanrealign(ch3_rxchanrealign),
    .ch3_rxchbondi(ch3_rxchbondi),
    .ch3_rxchbondo(ch3_rxchbondo),
    .ch3_rxclkcorcnt(ch3_rxclkcorcnt),
    .ch3_rxcominitdet(ch3_rxcominitdet),
    .ch3_rxcommadet(ch3_rxcommadet),
    .ch3_rxcomsasdet(ch3_rxcomsasdet),
    .ch3_rxcomwakedet(ch3_rxcomwakedet),
    .ch3_rxctrl0(ch3_rxctrl0),
    .ch3_rxctrl1(ch3_rxctrl1),
    .ch3_rxctrl2(ch3_rxctrl2),
    .ch3_rxctrl3(ch3_rxctrl3),
    .ch3_rxdapicodeovrden(ch3_rxdapicodeovrden),
    .ch3_rxdapicodereset(ch3_rxdapicodereset),
    .ch3_rxdlyalignerr(ch3_rxdlyalignerr),
    .ch3_rxdlyalignprog(ch3_rxdlyalignprog),
    .ch3_rxdlyalignreq(ch3_rxdlyalignreq),
    .ch3_rxelecidle(ch3_rxelecidle),
    .ch3_rxeqtraining(ch3_rxeqtraining),
    .ch3_rxfinealigndone(ch3_rxfinealigndone),
    .ch3_rxheadervalid(ch3_rxheadervalid),
    .ch3_rxlpmen(ch3_rxlpmen),
    .ch3_rxmldchaindone(ch3_rxmldchaindone),
    .ch3_rxmldchainreq(ch3_rxmldchainreq),
    .ch3_rxmlfinealignreq(ch3_rxmlfinealignreq),
    .ch3_rxoobreset(ch3_rxoobreset),
    .ch3_rxosintdone(ch3_rxosintdone),
    .ch3_rxpcsresetmask(ch3_rxpcsresetmask),
    .ch3_rxpd(ch3_rxpd),
    .ch3_rxphaligndone(ch3_rxphaligndone),
    .ch3_rxphalignerr(ch3_rxphalignerr),
    .ch3_rxphalignreq(ch3_rxphalignreq),
    .ch3_rxphalignresetmask(ch3_rxphalignresetmask),
    .ch3_rxphdlypd(ch3_rxphdlypd),
    .ch3_rxphdlyreset(ch3_rxphdlyreset),
    .ch3_rxphdlyresetdone(ch3_rxphdlyresetdone),
    .ch3_rxphsetinitdone(ch3_rxphsetinitdone),
    .ch3_rxphsetinitreq(ch3_rxphsetinitreq),
    .ch3_rxphshift180(ch3_rxphshift180),
    .ch3_rxphshift180done(ch3_rxphshift180done),
    .ch3_rxpmaresetmask(ch3_rxpmaresetmask),
    .ch3_rxpolarity(ch3_rxpolarity),
    .ch3_rxprbscntreset(ch3_rxprbscntreset),
    .ch3_rxprbserr(ch3_rxprbserr),
    .ch3_rxprbslocked(ch3_rxprbslocked),
    .ch3_rxprbssel(ch3_rxprbssel),
    .ch3_rxrate(ch3_rxrate),
    .ch3_rxresetmode(ch3_rxresetmode),
    .ch3_rxmstreset(ch3_rxmstreset),
    .ch3_rxmstdatapathreset(ch3_rxmstdatapathreset),
    .ch3_rxmstresetdone(ch3_rxmstresetdone),
    .ch3_rxslide(ch3_rxslide),
    .ch3_rxsliderdy(ch3_rxsliderdy),
    .ch3_rxstartofseq(ch3_rxstartofseq),
    .ch3_rxstatus(ch3_rxstatus),
    .ch3_rxsyncallin(ch3_rxsyncallin),
    .ch3_rxsyncdone(ch3_rxsyncdone),
    .ch3_rxtermination(ch3_rxtermination),
    .ch3_rxvalid(ch3_rxvalid),
    .ch3_cdrbmcdrreq(ch3_cdrbmcdrreq),
    .ch3_cdrfreqos(ch3_cdrfreqos),
    .ch3_cdrincpctrl(ch3_cdrincpctrl),
    .ch3_cdrstepdir(ch3_cdrstepdir),
    .ch3_cdrstepsq(ch3_cdrstepsq),
    .ch3_cdrstepsx(ch3_cdrstepsx),
    .ch3_eyescanreset(ch3_eyescanreset),
    .ch3_eyescantrigger(ch3_eyescantrigger),
    .ch3_eyescandataerror(ch3_eyescandataerror),
    .ch3_refdebugout(ch3_refdebugout),
    .ch3_rxdapiresetdone(ch3_rxdapiresetdone),
    .ch3_rxdebugpcsout(ch3_rxdebugpcsout),
    .ch3_rxpkdet(ch3_rxpkdet),
    .ch3_rxqpisenn(ch3_rxqpisenn),
    .ch3_rxqpisenp(ch3_rxqpisenp),
    .ch3_rxsimplexphystatus(ch3_rxsimplexphystatus),
    .ch3_rxslipdone(ch3_rxslipdone),
    .ch3_dfehold(ch3_dfehold),
    .ch3_dfeovrd(ch3_dfeovrd),
    .ch3_rxdapireset(ch3_rxdapireset),
    .ch3_rxdapiresetmask(ch3_rxdapiresetmask),
    .ch3_rxqpien(ch3_rxqpien),
    .ch3_rxoutclk(ch3_rxoutclk),
    .ch3_rxusrclk(ch3_rxusrclk),
    .ch0_bufgtce(ch0_bufgtce),
    .ch0_bufgtrst(ch0_bufgtrst),
    .ch0_bufgtcemask(ch0_bufgtcemask),
    .ch0_bufgtrstmask(ch0_bufgtrstmask),
    .ch0_bufgtdiv(ch0_bufgtdiv),
    .ch0_clkrsvd0(ch0_clkrsvd0),
    .ch0_clkrsvd1(ch0_clkrsvd1),
    .ch0_dmonitorclk(ch0_dmonitorclk),
    .ch0_phyesmadaptsave(ch0_phyesmadaptsave),
    .ch0_iloresetmask(ch0_iloresetmask),
    .ch0_loopback(ch0_loopback),
    .ch0_dmonfiforeset(ch0_dmonfiforeset),
    .ch0_pcsrsvdin(ch0_pcsrsvdin),
    .ch0_gtrsvd(ch0_gtrsvd),
    .ch0_pcsrsvdout(ch0_pcsrsvdout),
    .ch0_pinrsvdas(ch0_pinrsvdas),
    .ch0_dmonitoroutclk(ch0_dmonitoroutclk),
    .ch0_resetexception(ch0_resetexception),
    .ch0_dmonitorout(ch0_dmonitorout),
    .ch0_phyready(ch0_phyready),
    .ch0_hsdppcsreset(ch0_hsdppcsreset),
    .ch1_bufgtce(ch1_bufgtce),
    .ch1_bufgtrst(ch1_bufgtrst),
    .ch1_bufgtcemask(ch1_bufgtcemask),
    .ch1_bufgtrstmask(ch1_bufgtrstmask),
    .ch1_bufgtdiv(ch1_bufgtdiv),
    .ch1_clkrsvd0(ch1_clkrsvd0),
    .ch1_clkrsvd1(ch1_clkrsvd1),
    .ch1_dmonitorclk(ch1_dmonitorclk),
    .ch1_phyesmadaptsave(ch1_phyesmadaptsave),
    .ch1_iloresetmask(ch1_iloresetmask),
    .ch1_loopback(ch1_loopback),
    .ch1_dmonfiforeset(ch1_dmonfiforeset),
    .ch1_pcsrsvdin(ch1_pcsrsvdin),
    .ch1_gtrsvd(ch1_gtrsvd),
    .ch1_pcsrsvdout(ch1_pcsrsvdout),
    .ch1_pinrsvdas(ch1_pinrsvdas),
    .ch1_dmonitoroutclk(ch1_dmonitoroutclk),
    .ch1_resetexception(ch1_resetexception),
    .ch1_dmonitorout(ch1_dmonitorout),
    .ch1_phyready(ch1_phyready),
    .ch1_hsdppcsreset(ch1_hsdppcsreset),
    .ch2_bufgtce(ch2_bufgtce),
    .ch2_bufgtrst(ch2_bufgtrst),
    .ch2_bufgtcemask(ch2_bufgtcemask),
    .ch2_bufgtrstmask(ch2_bufgtrstmask),
    .ch2_bufgtdiv(ch2_bufgtdiv),
    .ch2_clkrsvd0(ch2_clkrsvd0),
    .ch2_clkrsvd1(ch2_clkrsvd1),
    .ch2_dmonitorclk(ch2_dmonitorclk),
    .ch2_phyesmadaptsave(ch2_phyesmadaptsave),
    .ch2_iloresetmask(ch2_iloresetmask),
    .ch2_loopback(ch2_loopback),
    .ch2_dmonfiforeset(ch2_dmonfiforeset),
    .ch2_pcsrsvdin(ch2_pcsrsvdin),
    .ch2_gtrsvd(ch2_gtrsvd),
    .ch2_pcsrsvdout(ch2_pcsrsvdout),
    .ch2_pinrsvdas(ch2_pinrsvdas),
    .ch2_dmonitoroutclk(ch2_dmonitoroutclk),
    .ch2_resetexception(ch2_resetexception),
    .ch2_dmonitorout(ch2_dmonitorout),
    .ch2_phyready(ch2_phyready),
    .ch2_hsdppcsreset(ch2_hsdppcsreset),
    .ch3_bufgtce(ch3_bufgtce),
    .ch3_bufgtrst(ch3_bufgtrst),
    .ch3_bufgtcemask(ch3_bufgtcemask),
    .ch3_bufgtrstmask(ch3_bufgtrstmask),
    .ch3_bufgtdiv(ch3_bufgtdiv),
    .ch3_clkrsvd0(ch3_clkrsvd0),
    .ch3_clkrsvd1(ch3_clkrsvd1),
    .ch3_dmonitorclk(ch3_dmonitorclk),
    .ch3_phyesmadaptsave(ch3_phyesmadaptsave),
    .ch3_iloresetmask(ch3_iloresetmask),
    .ch3_loopback(ch3_loopback),
    .ch3_dmonfiforeset(ch3_dmonfiforeset),
    .ch3_pcsrsvdin(ch3_pcsrsvdin),
    .ch3_gtrsvd(ch3_gtrsvd),
    .ch3_pcsrsvdout(ch3_pcsrsvdout),
    .ch3_pinrsvdas(ch3_pinrsvdas),
    .ch3_dmonitoroutclk(ch3_dmonitoroutclk),
    .ch3_resetexception(ch3_resetexception),
    .ch3_dmonitorout(ch3_dmonitorout),
    .ch3_phyready(ch3_phyready),
    .ch3_hsdppcsreset(ch3_hsdppcsreset),
    .resetdone_northin(resetdone_northin),
    .resetdone_southin(resetdone_southin),
    .resetdone_northout(resetdone_northout),
    .resetdone_southout(resetdone_southout),
    .txpinorthin(txpinorthin),
    .rxpinorthin(rxpinorthin),
    .txpisouthin(txpisouthin),
    .rxpisouthin(rxpisouthin),
    .pipenorthin(pipenorthin),
    .pipesouthin(pipesouthin),
    .txpinorthout(txpinorthout),
    .txpisouthout(txpisouthout),
    .rxpinorthout(rxpinorthout),
    .rxpisouthout(rxpisouthout),
    .pipenorthout(pipenorthout),
    .pipesouthout(pipesouthout),
    .GT_REFCLK0(GT_REFCLK0),
    .bgbypassb(bgbypassb),
    .bgmonitorenb(bgmonitorenb),
    .bgpdb(bgpdb),
    .bgrcalovrdenb(bgrcalovrdenb),
    .bgrcalovrd(bgrcalovrd),
    .debugtraceready(debugtraceready),
    .debugtraceclk(debugtraceclk),
    .rcalenb(rcalenb),
    .trigackout0(trigackout0),
    .trigin0(trigin0),
    .ubenable(ubenable),
    .ubiolmbrst(ubiolmbrst),
    .ubmbrst(ubmbrst),
    .ubintr(ubintr),
    .ubrxuart(ubrxuart),
    .ctrlrsvdin(ctrlrsvdin),
    .coestatusdebug(coestatusdebug),
    .gpi(gpi),
    .refclk0_clktestsig(refclk0_clktestsig),
    .refclk1_clktestsig(refclk1_clktestsig),
    .correcterr(correcterr),
    .debugtracetvalid(debugtracetvalid),
    .debugtracetdata(debugtracetdata),
    .refclk0_gtrefclkpdint(refclk0_gtrefclkpdint),
    .refclk0_clktestsigint(refclk0_clktestsigint),
    .refclk1_gtrefclkpdint(refclk1_gtrefclkpdint),
    .refclk1_clktestsigint(refclk1_clktestsigint),
    .trigackin0(trigackin0),
    .trigout0(trigout0),
    .ubinterrupt(ubinterrupt),
    .ubtxuart(ubtxuart),
    .uncorrecterr(uncorrecterr),
    .ctrlrsvdout(ctrlrsvdout),
    .gpo(gpo),
    .hsclk0_rxrecclksel(hsclk0_rxrecclksel),
    .hsclk1_rxrecclksel(hsclk1_rxrecclksel),
    .ch0_xpipe5_pipeline_en(ch0_xpipe5_pipeline_en),
    .ch1_xpipe5_pipeline_en(ch1_xpipe5_pipeline_en),
    .ch2_xpipe5_pipeline_en(ch2_xpipe5_pipeline_en),
    .ch3_xpipe5_pipeline_en(ch3_xpipe5_pipeline_en),
    .apb3clk(apb3clk),
    .apb3paddr(apb3paddr),
    .apb3penable(apb3penable),
    .apb3presetn(apb3presetn),
    .apb3prdata(apb3prdata),
    .apb3psel(apb3psel),
    .apb3pslverr(apb3pslverr),
    .apb3pready(apb3pready),
    .apb3pwdata(apb3pwdata),
    .apb3pwrite(apb3pwrite),
    .rxp(rxp),
    .rxn(rxn),
    .txp(txp),
    .txn(txn)
  );
endmodule
