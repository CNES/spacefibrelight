///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.0 
//  \   \         Description : Xilinx Fast Functional Simulation Library Component
//  /   /                  18X18 Signed Multiplier Followed by Three-Input Adder plus ALU with Pipeline Registers
// /___/   /\     Filename : DSP48E1.v
// \   \  /  \    Timestamp : Thu May 21 10:14:08 PDT 2009
//  \___\/\___\
//
// Revision:
//    04/05/12 - PR 603477 - Initial Fast version from uniprim.
//    10/22/14 - Added #1 to $finish (CR 808642).
// End Revision

`timescale  1 ps / 1 ps

`celldefine

module DSP48E1 (ACOUT, BCOUT, CARRYCASCOUT, CARRYOUT, MULTSIGNOUT, OVERFLOW, P, PATTERNBDETECT, PATTERNDETECT, PCOUT, UNDERFLOW, A, ACIN, ALUMODE, B, BCIN, C, CARRYCASCIN, CARRYIN, CARRYINSEL, CEA1, CEA2, CEAD, CEALUMODE, CEB1, CEB2, CEC, CECARRYIN, CECTRL, CED, CEINMODE, CEM, CEP, CLK, D, INMODE, MULTSIGNIN, OPMODE, PCIN, RSTA, RSTALLCARRYIN, RSTALUMODE, RSTB, RSTC, RSTCTRL, RSTD, RSTINMODE, RSTM, RSTP); 

    parameter integer ACASCREG = 1;
    parameter integer ADREG = 1;
    parameter integer ALUMODEREG = 1;
    parameter integer AREG = 1;
    parameter AUTORESET_PATDET = "NO_RESET";  // {NO_RESET, RESET_MATCH, RESET_NOT_MATCH}
    parameter A_INPUT = "DIRECT";
    parameter integer BCASCREG = 1;
    parameter integer BREG = 1;
    parameter B_INPUT = "DIRECT";
    parameter integer CARRYINREG = 1;
    parameter integer CARRYINSELREG = 1;
    parameter integer CREG = 1;
    parameter integer DREG = 1;
    parameter integer INMODEREG = 1;
    parameter [3:0] IS_ALUMODE_INVERTED = 4'b0;
    parameter [0:0] IS_CARRYIN_INVERTED = 1'b0;
    parameter [0:0] IS_CLK_INVERTED = 1'b0;
    parameter [4:0] IS_INMODE_INVERTED = 5'b0;
    parameter [6:0] IS_OPMODE_INVERTED = 7'b0;
    parameter [47:0] MASK =  48'h3FFFFFFFFFFF;
    parameter integer MREG = 1;
    parameter integer OPMODEREG = 1;
    parameter [47:0] PATTERN =  48'h000000000000;
    parameter integer PREG = 1;
    parameter SEL_MASK = "MASK";
    parameter SEL_PATTERN = "PATTERN";
    parameter USE_DPORT = "FALSE";
    parameter USE_MULT = "MULTIPLY";
    parameter USE_PATTERN_DETECT = "NO_PATDET";
    parameter USE_SIMD = "ONE48";

    output [29:0] ACOUT; 
    output [17:0] BCOUT; 
    output CARRYCASCOUT;
    output [3:0] CARRYOUT;
    output MULTSIGNOUT;
    output OVERFLOW;
    output [47:0] P; 
    output PATTERNBDETECT;
    output PATTERNDETECT;
    output [47:0] PCOUT;
    output UNDERFLOW;

    input [29:0] A;
    input [29:0] ACIN;
    input [3:0] ALUMODE;
    input [17:0] B;
    input [17:0] BCIN;
    input [47:0] C;
    input CARRYCASCIN;
    input CARRYIN;
    input [2:0] CARRYINSEL;
    input CEA1;
    input CEA2;
    input CEAD;         // new
    input CEALUMODE;
    input CEB1;
    input CEB2;
    input CEC;
    input CECARRYIN;
    input CECTRL;
    input CED;          // new
    input CEINMODE;     // new
    input CEM; 
    input CEP;
    input CLK;
    input [24:0] D; // new
    input [4:0] INMODE; // new
    input MULTSIGNIN;
    input [6:0] OPMODE;
    input [47:0] PCIN;
    input RSTA;
    input RSTALLCARRYIN;
    input RSTALUMODE;
    input RSTB;
    input RSTC;
    input RSTCTRL;
    input RSTD;          // new
    input RSTINMODE;     // new 
    input RSTM;  
    input RSTP;

    tri0  GSR = glbl.GSR;

//------------------- constants -------------------------
   localparam MAX_ACOUT      = 30;
   localparam MAX_BCOUT      = 18;
   localparam MAX_CARRYOUT   = 4;
   localparam MAX_P          = 48;
   localparam MAX_PCOUT      = 48;

   localparam MAX_A          = 30;
   localparam MAX_ACIN       = 30;
   localparam MAX_ALUMODE    = 4;
   localparam MAX_A_MULT     = 25;
   localparam MAX_B          = 18;
   localparam MAX_B_MULT     = 18;
   localparam MAX_BCIN       = 18;
   localparam MAX_C          = 48;
   localparam MAX_CARRYINSEL = 3;
   localparam MAX_D          = 25;
   localparam MAX_INMODE     = 5;
   localparam MAX_OPMODE     = 7;
   localparam MAX_PCIN       = 48;

   localparam MAX_ALU_FULL   = 48;
   localparam MAX_ALU_HALF   = 24;
   localparam MAX_ALU_QUART  = 12;

   localparam MSB_ACOUT      = MAX_ACOUT - 1;
   localparam MSB_BCOUT      = MAX_BCOUT - 1;
   localparam MSB_CARRYOUT   = MAX_CARRYOUT - 1;
   localparam MSB_P          = MAX_P - 1;
   localparam MSB_PCOUT      = MAX_PCOUT - 1;
 
   localparam MSB_A          = MAX_A - 1;
   localparam MSB_ACIN       = MAX_ACIN - 1;
   localparam MSB_ALUMODE    = MAX_ALUMODE - 1;
   localparam MSB_A_MULT     = MAX_A_MULT - 1;
   localparam MSB_B          = MAX_B - 1;
   localparam MSB_B_MULT     = MAX_B_MULT - 1;
   localparam MSB_BCIN       = MAX_BCIN - 1;
   localparam MSB_C          = MAX_C - 1;
   localparam MSB_CARRYINSEL = MAX_CARRYINSEL - 1;
   localparam MSB_D          = MAX_D - 1;
   localparam MSB_INMODE     = MAX_INMODE - 1;
   localparam MSB_OPMODE     = MAX_OPMODE - 1;
   localparam MSB_PCIN       = MAX_PCIN - 1;

   localparam MSB_ALU_FULL   = MAX_ALU_FULL  - 1;
   localparam MSB_ALU_HALF   = MAX_ALU_HALF  - 1;
   localparam MSB_ALU_QUART  = MAX_ALU_QUART - 1;

   localparam SHIFT_MUXZ     = 17;

    reg [29:0] a_o_mux, qa_o_mux, qa_o_reg1, qa_o_reg2, qacout_o_mux;

// new
    reg [4:0]  qinmode_o_mux, qinmode_o_reg;
// new
    wire [24:0] a_preaddsub;

    reg [17:0] b_o_mux, qb_o_mux, qb_o_reg1, qb_o_reg2, qbcout_o_mux;
    reg [2:0] qcarryinsel_o_mux, qcarryinsel_o_reg1;

// new  
    reg [MSB_D:0] d_o_mux, qd_o_mux, qd_o_reg1;

    reg [(MSB_A_MULT+MSB_B_MULT+1):0] qmult_o_mux, qmult_o_reg;
    reg [47:0] qc_o_mux, qc_o_reg1;
    reg [47:0] qp_o_mux, qp_o_reg1;
    reg [47:0] qx_o_mux, qy_o_mux, qz_o_mux;
    reg [6:0]  qopmode_o_mux, qopmode_o_reg1;

    

    reg qcarryin_o_mux0, qcarryin_o_reg0, qcarryin_o_mux7, qcarryin_o_reg7;
    reg qcarryin_o_mux, qcarryin_o_reg;

    reg [3:0]  qalumode_o_mux, qalumode_o_reg1;

    reg invalid_opmode, opmode_valid_flag, ping_opmode_drc_check = 0;

//    reg [47:0] alu_o;
    wire [47:0] alu_o;

    reg qmultsignout_o_reg, multsignout_o_mux; 
    wire multsignout_o_opmode;

    reg [MAX_ALU_FULL:0]  alu_full_tmp;
    reg [MAX_ALU_HALF:0]  alu_hlf1_tmp, alu_hlf2_tmp;
    reg [MAX_ALU_QUART:0] alu_qrt1_tmp,  alu_qrt2_tmp, alu_qrt3_tmp, alu_qrt4_tmp;
    
    wire pdet_o_mux, pdetb_o_mux;

    wire [47:0] the_pattern; 
    reg [47:0] the_mask = 0;
    wire carrycascout_o;
    reg carrycascout_o_reg = 0;
    reg carrycascout_o_mux = 0;

//    reg [3:0] carryout_o = 0;
//  CR 577648
//    reg [3:0] carryout_o_reg = 0;
//    reg [3:0] carryout_o_mux = 0;
//  CR 588861
    reg [3:0] carryout_o_reg = 0;
    reg [3:0] carryout_o_mux;
    wire [3:0] carryout_x_o;

    wire pdet_o, pdetb_o;
    reg  pdet_o_reg1, pdet_o_reg2, pdetb_o_reg1, pdetb_o_reg2;
    wire overflow_o, underflow_o;

    wire [(MSB_A_MULT+MSB_B_MULT+1):0] mult_o;
// new 
    wire [MSB_A_MULT:0] ad_addsub, ad_mult;
    reg  [MSB_A_MULT:0] qad_o_reg1, qad_o_mux;
    wire [MSB_B_MULT:0] b_mult;


    wire [MSB_A:0] a_in;
    wire [MSB_ACIN:0] acin_in;
    wire [MSB_B:0] b_in;
    wire [MSB_BCIN:0] bcin_in;
    wire [MSB_CARRYINSEL:0] carryinsel_in;
    wire [MSB_PCIN:0] pcin_in, c_in;
    wire [MSB_OPMODE:0] opmode_in;
    wire [MSB_ALUMODE:0] alumode_in;
    wire carryin_in;
    wire carrycascin_in;
    wire cep_in;
    wire cea1_in;
    wire cea2_in;
    wire cealumode_in;
    wire ceb1_in;
    wire ceb2_in;
    wire cec_in;
    wire cead_in;
    wire ced_in;
    wire cecarryin_in;
    wire cectrl_in;
    wire ceinmode_in;
    wire cem_in;
    wire clk_in;
    wire [MSB_D:0] d_in;
    wire gsr_in;
    wire [MSB_INMODE:0] inmode_in;
    wire multsignin_in;
    wire rstp_in;
    wire rsta_in;
    wire rstalumode_in;
    wire rstb_in;
    wire rstallcarryin_in;
    wire rstc_in;
    wire rstctrl_in;
    wire rstd_in;
    wire rstinmode_in;
    wire rstm_in;

//----------------------------------------------------------------------
//------------------------  Output Ports  ------------------------------
//----------------------------------------------------------------------
    assign ACOUT = qacout_o_mux;
    assign BCOUT = qbcout_o_mux;
    assign CARRYCASCOUT = carrycascout_o_mux;
    assign CARRYOUT     = carryout_x_o;
    assign MULTSIGNOUT  = multsignout_o_mux;
    assign OVERFLOW     = overflow_o;
    assign P            = qp_o_mux;
    assign PCOUT        = qp_o_mux;
    assign PATTERNDETECT = pdet_o_mux;
    assign PATTERNBDETECT = pdetb_o_mux;
    assign UNDERFLOW     = underflow_o;

//-----------------------------------------------------
//-----------   Inputs --------------------------------
//-----------------------------------------------------
      assign gsr_in = GSR;
      assign a_in = A;
      assign acin_in = ACIN;
      assign alumode_in = ALUMODE ^ IS_ALUMODE_INVERTED;
      assign b_in = B;
      assign bcin_in = BCIN;
      assign c_in = C;
      assign carrycascin_in = CARRYCASCIN;
      assign carryin_in = CARRYIN ^ IS_CARRYIN_INVERTED;
      assign carryinsel_in = CARRYINSEL;
      assign cea1_in = CEA1;
      assign cea2_in = CEA2;
      assign cead_in = CEAD;
      assign cealumode_in = CEALUMODE;
      assign ceb1_in = CEB1;
      assign ceb2_in = CEB2;
      assign cec_in = CEC;
      assign cecarryin_in = CECARRYIN;
      assign cectrl_in = CECTRL;
      assign ced_in = CED;
      assign ceinmode_in = CEINMODE;
      assign cem_in = CEM;
      assign cep_in = CEP;
      assign clk_in = CLK ^ IS_CLK_INVERTED;
      assign d_in = D;
      assign inmode_in = INMODE ^ IS_INMODE_INVERTED;
      assign multsignin_in = MULTSIGNIN;
      assign opmode_in = OPMODE ^ IS_OPMODE_INVERTED;
      assign pcin_in = PCIN;
      assign rsta_in = RSTA;
      assign rstallcarryin_in = RSTALLCARRYIN;
      assign rstalumode_in = RSTALUMODE;
      assign rstb_in = RSTB;
      assign rstc_in = RSTC;
      assign rstctrl_in = RSTCTRL;
      assign rstd_in = RSTD;
      assign rstinmode_in = RSTINMODE;
      assign rstm_in = RSTM;
      assign rstp_in = RSTP;

//*** GLOBAL hidden GSR pin
    always @(gsr_in) begin
	if (gsr_in) begin
            assign qcarryin_o_reg0 = 1'b0;
            assign qcarryinsel_o_reg1 = 3'b0;
            assign qopmode_o_reg1 = 7'b0;
            assign qalumode_o_reg1 = 4'b0;
            assign qa_o_reg1 = 30'b0;
            assign qa_o_reg2 = 30'b0;
            assign qb_o_reg1 = 18'b0;
            assign qb_o_reg2 = 18'b0;
            assign qc_o_reg1 = 48'b0;
            assign qp_o_reg1 = 48'b0;
	    assign qmult_o_reg = 36'b0;
            assign pdet_o_reg1 = 1'b0;
            assign pdet_o_reg2 = 1'b0;
            assign pdetb_o_reg1 = 1'b0;
            assign pdetb_o_reg2 = 1'b0;
// 577648 commented out the following line
//            assign carryout_o_reg = 4'b0;
            assign carrycascout_o_reg = 1'b0;

	    assign qmultsignout_o_reg = 1'b0;

            assign qd_o_reg1 = 25'b0;
            assign qad_o_reg1 = 25'b0;
            assign qinmode_o_reg = 5'b0;
	end
	else begin
            deassign qcarryin_o_reg0;
            deassign qcarryinsel_o_reg1;
            deassign qopmode_o_reg1;
            deassign qalumode_o_reg1;
            deassign qa_o_reg1;
            deassign qa_o_reg2;
            deassign qb_o_reg1;
            deassign qb_o_reg2;
            deassign qc_o_reg1;
            deassign qp_o_reg1;
	    deassign qmult_o_reg;

            deassign pdet_o_reg1;
            deassign pdet_o_reg2;
            deassign pdetb_o_reg1;
            deassign pdetb_o_reg2;

// 577648 commented out the following line
//            deassign carryout_o_reg;
            deassign carrycascout_o_reg;

	    deassign qmultsignout_o_reg;

            deassign qd_o_reg1;
            deassign qad_o_reg1;
            deassign qinmode_o_reg;
	end
    end


    initial begin
	opmode_valid_flag <= 1;
	invalid_opmode <= 1;

        //-------- A_INPUT check

	case (A_INPUT)
             "DIRECT", "CASCADE" : ;
              default : begin
	       	            $display("Attribute Syntax Error : The attribute A_INPUT on DSP48E1 instance %m is set to %s.  Legal values for this attribute are DIRECT or CASCADE.", A_INPUT);
		            #1 $finish;
                        end
	endcase

        //-------- ALUMODEREG check

	case (ALUMODEREG)
            0, 1 : ;
            default : begin
	                  $display("Attribute Syntax Error : The attribute ALUMODEREG on DSP48E1 instance %m is set to %d.  Legal values for this attribute are 0, 1.", ALUMODEREG);
	                  #1 $finish;
	              end
	endcase

        //-------- AREG check

	case (AREG)
            0, 1, 2 : ;
            default : begin
	                  $display("Attribute Syntax Error : The attribute AREG on DSP48E1 instance %m is set to %d.  Legal values for this attribute are 0, 1 or 2.", AREG);
	                  #1 $finish;
	              end
	endcase

        //-------- (ACASCREG) and (ACASCREG vs AREG) check

	case (AREG)
            0 : if(AREG != ACASCREG) begin
                    $display("Attribute Syntax Error : The attribute ACASCREG  on DSP48E1 instance %m is set to %d.  ACASCREG has to be set to 0 when attribute AREG = 0.", ACASCREG);
                    #1 $finish;
                end
            1 : if(AREG != ACASCREG) begin
                    $display("Attribute Syntax Error : The attribute ACASCREG  on DSP48E1 instance %m is set to %d.  ACASCREG has to be set to 1 when attribute AREG = 1.", ACASCREG);
                    #1 $finish;
                end
            2 : if((AREG != ACASCREG) && ((AREG-1) != ACASCREG)) begin
                    $display("Attribute Syntax Error : The attribute ACASCREG  on DSP48E1 instance %m is set to %d.  ACASCREG has to be set to either 2 or 1 when attribute AREG = 2.", ACASCREG);
                    #1 $finish;
                end
            default : ;
	endcase

        //-------- B_INPUT check

	case (B_INPUT)
             "DIRECT", "CASCADE" : ;
              default : begin
	       	            $display("Attribute Syntax Error : The attribute B_INPUT on DSP48E1 instance %m is set to %s.  Legal values for this attribute are DIRECT or CASCADE.", B_INPUT);
		            #1 $finish;
                        end
	endcase


        //-------- BREG check

	case (BREG)
            0, 1, 2 : ;
            default : begin
	                  $display("Attribute Syntax Error : The attribute BREG on DSP48E1 instance %m is set to %d.  Legal values for this attribute are 0, 1 or 2.", BREG);
	                  #1 $finish;
	              end
	endcase

        //-------- (BCASCREG) and (BCASCREG vs BREG) check

	case (BREG)
            0 : if(BREG != BCASCREG) begin
                    $display("Attribute Syntax Error : The attribute BCASCREG  on DSP48E1 instance %m is set to %d.  BCASCREG has to be set to 0 when attribute BREG = 0.", BCASCREG);
                    #1 $finish;
                end
            1 : if(BREG != BCASCREG) begin
                    $display("Attribute Syntax Error : The attribute BCASCREG  on DSP48E1 instance %m is set to %d.  BCASCREG has to be set to 1 when attribute BREG = 1.", BCASCREG);
                    #1 $finish;
                end
            2 : if((BREG != BCASCREG) && ((BREG-1) != BCASCREG)) begin
                    $display("Attribute Syntax Error : The attribute BCASCREG  on DSP48E1 instance %m is set to %d.  BCASCREG has to be set to either 2 or 1 when attribute BREG = 2.", BCASCREG);
                    #1 $finish;
                end
            default : ;
	endcase

        //-------- CARRYINREG check

	case (CARRYINREG)
            0, 1 : ;
            default : begin
	                  $display("Attribute Syntax Error : The attribute CARRYINREG on DSP48E1 instance %m is set to %d.  Legal values for this attribute are 0, 1.", CARRYINREG);
	                  #1 $finish;
	              end
	endcase

        //-------- CARRYINSELREG check

	case (CARRYINSELREG)
            0, 1 : ;
            default : begin
	                  $display("Attribute Syntax Error : The attribute CARRYINSELREG on DSP48E1 instance %m is set to %d.  Legal values for this attribute are 0, 1.", CARRYINSELREG);
	                  #1 $finish;
	              end
	endcase

        //-------- CREG check

	case (CREG)
            0, 1 : ;
            default : begin
	                  $display("Attribute Syntax Error : The attribute CREG on DSP48E1 instance %m is set to %d.  Legal values for this attribute are 0, or 1.", CREG);
	                  #1 $finish;
	              end
	endcase


        //-------- OPMODEREG check

	case (OPMODEREG)
            0, 1 : ;
            default : begin
	                  $display("Attribute Syntax Error : The attribute OPMODEREG on DSP48E1 instance %m is set to %d.  Legal values for this attribute are 0, 1.", OPMODEREG);
	                  #1 $finish;
	              end
	endcase

        //-------- USE_MULT

        case (USE_MULT)
            "NONE", "MULTIPLY", "DYNAMIC" : ;
            default : begin
                          $display("Attribute Syntax Error : The attribute USE_MULT on DSP48E1 instance %m is set to %s. Legal values for this attribute are MULTIPLY, DYNAMIC or NONE.", USE_MULT);
                          #1 $finish;
                     end
/*
            "MULT" : if (MREG != 0) begin
                               $display("Attribute Syntax Error : The attribute USE_MULT on DSP48E1 instance %m is set to %s. This requires attribute MREG to be set to 0.", USE_MULT);
                               #1 $finish;
                        end
            "MULT_S" : if (MREG != 1) begin
                               $display("Attribute Syntax Error : The attribute USE_MULT on DSP48E1 instance %m is set to %s. This requires attribute MREG to be set to 1.", USE_MULT);
                               #1 $finish;
                        end
            default : begin
                          $display("Attribute Syntax Error : The attribute USE_MULT on DSP48E1 instance %m is set to %s. Legal values for this attribute are NONE, MULT or MULT_S.", USE_MULT);
                          #1 $finish;
                     end
*/
        endcase

        //-------- USE_PATTERN_DETECT

        case (USE_PATTERN_DETECT)
            "PATDET", "NO_PATDET" : ;
            default : begin
               $display("Attribute Syntax Error : The attribute USE_PATTERN_DETECT on DSP48E1 instance %m is set to %s.  Legal values for this attribute are PATDET or NO_PATDET.",  USE_PATTERN_DETECT);
               #1 $finish;
            end
        endcase

        //-------- AUTORESET_PATDET check

        case (AUTORESET_PATDET)
            "NO_RESET", "RESET_MATCH", "RESET_NOT_MATCH" : ;
            default : begin
               $display("Attribute Syntax Error : The attribute AUTORESET_PATDET on DSP48E1 instance %m is set to %s.  Legal values for this attribute are  NO_RESET or RESET_MATCH or RESET_NOT_MATCH.",  AUTORESET_PATDET);
               #1 $finish;
            end
        endcase

        //-------- SEL_PATTERN check

        case(SEL_PATTERN)
           "PATTERN", "C" : ;
            default : begin
                         $display("Attribute Syntax Error : The attribute SEL_PATTERN on DSP48E1 instance %m is set to %s.  Legal values for this attribute are PATTERN or C.", SEL_PATTERN);
                         #1 $finish;
                      end
	endcase

        //-------- SEL_MASK check

        case(SEL_MASK)
            "MASK", "C", "ROUNDING_MODE1", "ROUNDING_MODE2" : ;
             default : begin
                         $display("Attribute Syntax Error : The attribute SEL_MASK on DSP48E1 instance %m is set to %s.  Legal values for this attribute are MASK or C or ROUNDING_MODE1 or ROUNDING_MODE2.", SEL_MASK);
                          #1 $finish;
                       end
	endcase

        //-------- MREG check

	case (MREG)
            0, 1 : ;
            default : begin
	                  $display("Attribute Syntax Error : The attribute MREG on DSP48E1 instance %m is set to %d.  Legal values for this attribute are 0, 1.", MREG);
	                  #1 $finish;
	              end
	endcase


        //-------- PREG check

	case (PREG)
            0, 1 : ;
            default : begin
	                  $display("Attribute Syntax Error : The attribute PREG on DSP48E1 instance %m is set to %d.  Legal values for this attribute are 0, 1.", PREG);
	                  #1 $finish;
	              end
	endcase


        #100010 ping_opmode_drc_check <= 1;

    
//*********************************************************
//*** ADDITIONAL DRC  
//*********************************************************
// CR 219407  --  (1)
// old ask vicv
/*
    if((AUTORESET_PATTERN_DETECT == "TRUE") && (USE_PATTERN_DETECT == "NO_PATDET")) begin
         $display("Attribute Syntax Error : The attribute USE_PATTERN_DETECT on DSP48E1 instance %m must be set to PATDET in order to use AUTORESET_PATTERN_DETECT equals TRUE. Failure to do so could make timing reports inaccurate. ");
     end
*/
//*********************************************************
//***  new attribute DRC
//*********************************************************

        //-------- ADREG check

	case (ADREG)
            0, 1 : ;
            default : begin
	                  $display("Attribute Syntax Error : The attribute ADREG on DSP48E1 instance %m is set to %d.  Legal values for this attribute are 0, 1.", ADREG);
	                  #1 $finish;
	              end
	endcase

        //-------- DREG check

	case (DREG)
            0, 1 : ;
            default : begin
	                  $display("Attribute Syntax Error : The attribute DREG on DSP48E1 instance %m is set to %d.  Legal values for this attribute are 0, 1.", DREG);
	                  #1 $finish;
	              end
	endcase

        //-------- INMODEREG check

	case (INMODEREG)
            0, 1 : ;
            default : begin
	                  $display("Attribute Syntax Error : The attribute INMODEREG on DSP48E1 instance %m is set to %d.  Legal values for this attribute are 0, 1.", INMODEREG);
	                  #1 $finish;
	              end
	endcase

        //-------- USE_DPORT

        case (USE_DPORT)
            "TRUE", "FALSE" : ;
            default : begin
               $display("Attribute Syntax Error : The attribute USE_DPORT on DSP48E1 instance %m is set to %s.  Legal values for this attribute are TRUE or FALSE.",  USE_DPORT);
               #1 $finish;
            end
        endcase

    end


//*********************************************************
//**********  INMODE signal registering        ************
//*********************************************************
// new 
    always @(posedge clk_in) begin
       if (rstinmode_in)
          qinmode_o_reg <= 5'b0;
       else if (ceinmode_in)
          qinmode_o_reg <= inmode_in;
    end

    generate 
       case (INMODEREG)
          0: begin 
             always @(inmode_in)
                qinmode_o_mux <= inmode_in;
	  end

          1: begin 
             always @(qinmode_o_reg)
                qinmode_o_mux <= qinmode_o_reg;
	  end
       endcase
    endgenerate 

//*********************************************************
//*** Input register A with 2 level deep of registers
//*********************************************************

    generate 
       case (A_INPUT)
          "DIRECT"  : always @(a_in)    a_o_mux <= a_in;
          "CASCADE" : always @(acin_in) a_o_mux <= acin_in;
       endcase
    endgenerate 

    generate 
       case (AREG)
          1 : begin
              always @(posedge clk_in) begin
	         if (rsta_in) begin
                    qa_o_reg1 <= 30'b0;
                    qa_o_reg2 <= 30'b0;
                 end
                 else begin
                      if (cea1_in)
                          qa_o_reg1 <= a_o_mux;
                      if (cea2_in)
                          qa_o_reg2 <= a_o_mux;
                 end
              end
          end

          2 : begin
              always @(posedge clk_in) begin
	         if (rsta_in) begin
                    qa_o_reg1 <= 30'b0;
                    qa_o_reg2 <= 30'b0;
                 end
                 else begin
                      if (cea1_in)
                          qa_o_reg1 <= a_o_mux;
                      if (cea2_in)
                          qa_o_reg2 <= qa_o_reg1;
                 end
              end
          end
       endcase
    endgenerate 

    generate 
       case (AREG)
          0: always @(a_o_mux) qa_o_mux <= a_o_mux;
          1,2 : always @(qa_o_reg2) qa_o_mux <= qa_o_reg2;
       endcase
    endgenerate 

    generate 
       case (ACASCREG)
          1: always @(qa_o_mux or qa_o_reg1) begin
                 if(AREG == 2)
                    qacout_o_mux <= qa_o_reg1;
                 else
                    qacout_o_mux <= qa_o_mux;
             end
          0,2 : always @(qa_o_mux) qacout_o_mux <= qa_o_mux;
       endcase
    endgenerate 

// new  
    
   assign a_preaddsub = qinmode_o_mux[1]? 25'b0:(qinmode_o_mux[0]?qa_o_reg1[24:0]:qa_o_mux[24:0]);

//*********************************************************
//*** Input register B with 2 level deep of registers
//*********************************************************

    generate 
       case (B_INPUT)
          "DIRECT"  : always @(b_in)    b_o_mux <= b_in;
          "CASCADE" : always @(bcin_in) b_o_mux <= bcin_in;
       endcase
    endgenerate 

    generate 
       case (BREG)
          1 : begin
              always @(posedge clk_in) begin
	         if (rstb_in) begin
                      qb_o_reg1 <= 18'b0;
                      qb_o_reg2 <= 18'b0;
                 end
                 else begin
                      if (ceb1_in)
                          qb_o_reg1 <= b_o_mux;
                      if (ceb2_in)
                          qb_o_reg2 <= b_o_mux;
                 end
              end
          end

          2 : begin
              always @(posedge clk_in) begin
	         if (rstb_in) begin
                    qb_o_reg1 <= 18'b0;
                    qb_o_reg2 <= 18'b0;
                 end
                 else begin
                      if (ceb1_in)
                          qb_o_reg1 <= b_o_mux;
                      if (ceb2_in)
                          qb_o_reg2 <= qb_o_reg1;
                 end
              end
          end
       endcase
    endgenerate 

    generate 
       case (BREG)
          0: always @(b_o_mux) qb_o_mux <= b_o_mux;
          1,2 : always @(qb_o_reg2) qb_o_mux <= qb_o_reg2;
       endcase
    endgenerate 

    generate
       case (BCASCREG)
          1: always @(qb_o_mux or qb_o_reg1) begin
                 if(BREG == 2)
                    qbcout_o_mux <= qb_o_reg1;
                 else
                    qbcout_o_mux <= qb_o_mux;
             end
          0,2 : always @(qb_o_mux) qbcout_o_mux <= qb_o_mux;
       endcase
    endgenerate


// new
    
   assign b_mult = qinmode_o_mux[4]?qb_o_reg1:qb_o_mux;

//*********************************************************
//*** Input register C with 1 level deep of register
//*********************************************************

    always @(posedge clk_in) begin
	if (rstc_in)
            qc_o_reg1 <= 48'b0;
	else if (cec_in)
            qc_o_reg1 <= c_in;
    end


    generate
       case (CREG)
          0 : always @(c_in) qc_o_mux <= c_in;
          1 : always @(qc_o_reg1) qc_o_mux <= qc_o_reg1;
       endcase
    endgenerate


// new

//*********************************************************
//*** Input register D with 1 level deep of register
//*********************************************************
    always @(posedge clk_in) begin
	if (rstd_in)
            qd_o_reg1 <= 25'b0;
	else if (ced_in)
            qd_o_reg1 <= d_in;
    end

    generate
       case (DREG)
          0 : always @(d_in) qd_o_mux <= d_in;
          1 : always @(qd_o_reg1) qd_o_mux <= qd_o_reg1;
       endcase
    endgenerate




//*********************************************************
//*** Preaddsub AD register with 1 level deep of register
//*********************************************************
// new  
      assign ad_addsub = qinmode_o_mux[3]?(-a_preaddsub + (qinmode_o_mux[2]?qd_o_mux:25'b0)):(a_preaddsub + (qinmode_o_mux[2]?qd_o_mux:25'b0));

    always @(posedge clk_in) begin
	if (rstd_in)
            qad_o_reg1 <= 25'b0;
	else if (cead_in)
            qad_o_reg1 <= ad_addsub;
    end

    generate
       case (ADREG)
          0 : always @(ad_addsub) qad_o_mux <= ad_addsub;
          1 : always @(qad_o_reg1) qad_o_mux <= qad_o_reg1;
       endcase
    endgenerate

/*------------------------------------------------- */
/*------------------------------------------------- */

   assign ad_mult = (USE_DPORT=="TRUE")? qad_o_mux : a_preaddsub;
//*********************************************************

//*********************************************************
//***************      25x18 Multiplier     ***************
//*********************************************************
// 05/26/05 -- FP -- Added warning for invalid mult when USE_MULT=NONE
// SIMD=FOUR12 and SIMD=TWO24
// Made mult_o to be "X"

    always @(qopmode_o_mux) begin
       if(qopmode_o_mux[3:0] == 4'b0101)
          if((USE_MULT == "NONE") || (USE_SIMD == "TWO24") || (USE_SIMD == "FOUR12")) 
               $display("OPMODE Input Warning : The OPMODE[3:0] %b to DSP48E1 instance %m is invalid when using attributes USE_MULT = NONE, or USE_SIMD = TWO24 or FOUR12 at %.3f ns.", qopmode_o_mux[3:0], $time/1000.0);
    end

    assign mult_o = ((USE_MULT == "NONE") || (USE_SIMD == "TWO24") || (USE_SIMD == "FOUR12"))? 43'b0 : {{18{ad_mult[24]}}, ad_mult[24:0]} * {{25{b_mult[17]}}, b_mult};

    always @(posedge clk_in) begin
	if (rstm_in) begin
            qmult_o_reg <= 18'b0;
	end
	else if (cem_in) begin
            qmult_o_reg <= mult_o;
	end
    end

    generate
       case (MREG)
          0 : always @(mult_o) qmult_o_mux <= mult_o;
          1 : always @(qmult_o_reg) qmult_o_mux <= qmult_o_reg;
       endcase
    endgenerate


//*** X mux
// ask jmt

    always @(qp_o_mux or qa_o_mux or qb_o_mux or qmult_o_mux or qopmode_o_mux[1:0] or qcarryinsel_o_mux) begin
	case (qopmode_o_mux[1:0])
              2'b00 : qx_o_mux <= 48'b0;
              2'b01 : qx_o_mux <= {{5{qmult_o_mux[MSB_A_MULT + MSB_B_MULT + 1]}}, qmult_o_mux};
              2'b10 : qx_o_mux <= qp_o_mux;
// new DRC 
              2'b11 : begin
                         if((USE_MULT == "MULTIPLY") && (
                                  (AREG==0 && BREG==0 && MREG==0) ||
                                  (AREG==0 && BREG==0 && PREG==0) ||
                                  (MREG==0 && PREG==0)))
                               $display("OPMODE Input Warning : The OPMODE[1:0] %b to DSP48E1 instance %m is invalid when using attributes USE_MULT = MULTIPLY at %.3f ns. Please set USE_MULT to either NONE or DYNAMIC.", qopmode_o_mux[1:0], $time/1000.0);
	                 else
                            qx_o_mux <=  {qa_o_mux[MSB_A:0], qb_o_mux[MSB_B:0]};
	              end

            default : begin
	              end
	endcase
    end


//*** Y mux

// 08-06-08  
// IR 478378
    wire [47:0] y_mac_cascd = (qopmode_o_mux[6:4] == 3'b100) ? {48{multsignin_in}} : {48{1'b1}};

    always @(qc_o_mux or qopmode_o_mux[3:2] or qcarryinsel_o_mux or y_mac_cascd) begin
	case (qopmode_o_mux[3:2])
              2'b00 : qy_o_mux <= 48'b0;
              2'b01 : qy_o_mux <= 48'b0;
// 08-06-08  
              2'b10 : qy_o_mux <= y_mac_cascd;                // choose all ones or mult-sign-extend
              2'b11 : qy_o_mux <= qc_o_mux;
            default : begin
	              end
	endcase
    end


//*** Z mux

    always @(qp_o_mux or qc_o_mux or pcin_in or qopmode_o_mux[6:4] or qcarryinsel_o_mux) begin
// ask jmt
	casex (qopmode_o_mux[6:4])
             3'b000 : qz_o_mux <= 48'b0;
             3'b001 : qz_o_mux <= pcin_in;
             3'b010 : qz_o_mux <= qp_o_mux;
             3'b011 : qz_o_mux <= qc_o_mux;
             3'b100 : qz_o_mux <= qp_o_mux;
             3'b101 : qz_o_mux <= {{17{pcin_in[47]}}, pcin_in[47:17]};
// ask jmt 
             3'b11x : qz_o_mux <= {{17{qp_o_mux[47]}}, qp_o_mux[47:17]};
            default : begin
	              end
	endcase
    end



//*** CarryInSel and OpMode with 1 level of register
    always @(posedge clk_in) begin
	if (rstctrl_in) begin
            qcarryinsel_o_reg1 <= 3'b0;
            qopmode_o_reg1 <= 7'b0;
	end  
	else if (cectrl_in) begin
            qcarryinsel_o_reg1 <= carryinsel_in;
            qopmode_o_reg1 <= opmode_in;
	end
    end

    generate
       case (CARRYINSELREG)
          0 : always @(carryinsel_in) qcarryinsel_o_mux <= carryinsel_in;
          1 : always @(qcarryinsel_o_reg1) qcarryinsel_o_mux <= qcarryinsel_o_reg1;
       endcase
    endgenerate


//CR 219047 (3) 

//    always @(qcarryinsel_o_mux or multsignin_in or qopmode_o_mux) begin
//    always @(carrycascin_in or multsignin_in or qopmode_o_mux) begin
    always @(qcarryinsel_o_mux or carrycascin_in or multsignin_in or qopmode_o_mux) begin
        if(qcarryinsel_o_mux == 3'b010) begin 
           if(!((multsignin_in === 1'bx) || ((qopmode_o_mux == 7'b1001000) && !(multsignin_in === 1'bx)) 
                                 || ((multsignin_in == 1'b0) && (carrycascin_in == 1'b0)))) begin
	      $display("DRC warning : CARRYCASCIN can only be used in the current DSP48E1 instance %m if the previous DSP48E1 is performing a two input ADD operation, or the current DSP48E1 is configured in the MAC extend opmode 7'b1001000 at %.3f ns.", $time);

// CR 619940 -- Enhanced DRC warning
              $display("DRC warning note : The simulation model does not know the placement of the DSP48E1 slices used, so it cannot fully confirm the above warning. It is necessary to view the placement of the DSP48E1 slices and ensure that these warnings are not being breached\n");
            end  
        end  
    end 
/*
// old
// ask jmt
//CR 219047 (4) 
    always @(qcarryinsel_o_mux) begin
       if((qcarryinsel_o_mux == 3'b110) && (MULTCARRYINREG != MREG)) begin
	  $display("Attribute Syntax Warning : It is recommended that MREG and MULTCARRYINREG on DSP48E1 instance %m be set to the same value when using CARRYINSEL = 110 for multiply rounding.");
       end
    end
*/

    generate
       case (OPMODEREG)
          0 : always @(opmode_in) qopmode_o_mux <= opmode_in;
          1 : always @(qopmode_o_reg1) qopmode_o_mux <= qopmode_o_reg1;
       endcase
    endgenerate


//*** ALUMODE with 1 level of register
    always @(posedge clk_in) begin
	if (rstalumode_in)
            qalumode_o_reg1 <= 4'b0;
	else if (cealumode_in)
            qalumode_o_reg1 <= alumode_in;
    end


    generate
       case (ALUMODEREG)
          0 : always @(alumode_in) qalumode_o_mux <= alumode_in;
          1 : always @(qalumode_o_reg1) qalumode_o_mux <= qalumode_o_reg1;
       endcase
    endgenerate


//skip for FAST model
//------------------------------------------------------------------
//*** DRC for OPMODE
//------------------------------------------------------------------
//endskip

//--####################################################################
//--#####                         ALU                              #####
//--####################################################################

  wire mult_cout = ~qp_o_mux[42];
  reg  [MSB_ALU_FULL:0] co;
  reg  [MSB_ALU_FULL:0] s;
  wire [MSB_ALU_FULL:0] comux,smux;
  wire [MSB_CARRYOUT:0] carryout_o_hw;
  wire [MSB_CARRYOUT:0] carryout_o;
  wire tmp_carrycascout_in;

  always @ (qx_o_mux or qy_o_mux or qz_o_mux or qalumode_o_mux[0]) begin
    if (qalumode_o_mux[0]) begin
       co = ((qx_o_mux & qy_o_mux)|((~qz_o_mux) & qy_o_mux)|(qx_o_mux & (~qz_o_mux)));
       s  = (~qz_o_mux) ^ qx_o_mux ^ qy_o_mux;
    end
    else begin
       co = ((qx_o_mux & qy_o_mux)|(qz_o_mux & qy_o_mux)|(qx_o_mux & qz_o_mux));
       s  =  qz_o_mux ^ qx_o_mux ^ qy_o_mux;
    end
  end

  assign comux = qalumode_o_mux[2] ? 0 : co;
  assign smux = qalumode_o_mux[3] ? co : s;

  // FINAL ADDER
  wire [12:0] s0 = {comux[10:0],qcarryin_o_mux}+smux[11:0];
  wire cout0 = (comux[11] + s0[12]);
  assign carryout_o_hw[0] = (qalumode_o_mux[0] & qalumode_o_mux[1]) ? ~cout0 : cout0;
  wire C1 = (USE_SIMD == "FOUR12") ? 1'b0 : s0[12];

  wire co11_lsb = (USE_SIMD == "FOUR12") ? 1'b0 : comux[11];
  wire [12:0] s1 = {comux[22:12],co11_lsb}+smux[23:12]+C1;
  wire cout1 = (comux[23] + s1[12]);
  assign carryout_o_hw[1] = (qalumode_o_mux[0] & qalumode_o_mux[1]) ? ~cout1 : cout1;
  wire C2 = ((USE_SIMD == "TWO24") || (USE_SIMD == "FOUR12")) ? 1'b0 : s1[12];

  wire co23_lsb = ((USE_SIMD == "TWO24") || (USE_SIMD == "FOUR12")) ? 
       1'b0 : comux[23];

  wire [12:0] s2 = {comux[34:24],co23_lsb}+smux[35:24]+C2;
  wire cout2 = (comux[35] + s2[12]);
  assign carryout_o_hw[2] = (qalumode_o_mux[0] & qalumode_o_mux[1]) ? ~cout2 : cout2;
  wire C3 = (USE_SIMD == "FOUR12") ? 1'b0 : s2[12];

  wire co35_lsb = (USE_SIMD == "FOUR12") ? 1'b0 : comux[35];
  wire [13:0] s3 = {comux[47:36],co35_lsb}+smux[47:36]+C3;
  wire cout3 = s3[12];

  assign carryout_o_hw[3] = (qalumode_o_mux[0] & qalumode_o_mux[1]) ? ~cout3 : cout3;

  wire   cout4 = s3[13];
//  assign carryout_o_hw[4] = (qalumode_o_mux[0] & qalumode_o_mux[1]) ? ~cout4 : cout4;

  assign alu_o  = qalumode_o_mux[1] ? ~{s3[11:0],s2[11:0],s1[11:0],s0[11:0]} :
                                {s3[11:0],s2[11:0],s1[11:0],s0[11:0]};
  // COMPUTE CARRYCASCOUT
  assign carrycascout_o = cout3;
  
  // COMPUTE MULTSIGNOUT
  // 08-06-08  assign  multsignout_o_opmode = (qopmode_o_mux[3:0] === 4'b100) ? multsignin_in  : ~qp_o_mux[42];
  // IR 478378 
  assign  multsignout_o_opmode = (qopmode_o_mux[6:4] === 3'b100) ? multsignin_in  : qmult_o_mux[42];

  // CR 523600 -- "X" carryout for multiply and logic operations
    assign carryout_o[3] = ((qopmode_o_mux[3:0] == 4'b0101) || (qalumode_o_mux[3:2] != 2'b00))? 1'bx : carryout_o_hw[3];
    assign carryout_o[2] = ((qopmode_o_mux[3:0] == 4'b0101) || (qalumode_o_mux[3:2] != 2'b00))? 1'bx : (USE_SIMD == "FOUR12") ? carryout_o_hw[2] : 1'bx;
    assign carryout_o[1] = ((qopmode_o_mux[3:0] == 4'b0101) || (qalumode_o_mux[3:2] != 2'b00))? 1'bx : ((USE_SIMD == "TWO24") ||  (USE_SIMD == "FOUR12")) ? carryout_o_hw[1] : 1'bx;
    assign carryout_o[0] = ((qopmode_o_mux[3:0] == 4'b0101) || (qalumode_o_mux[3:2] != 2'b00))? 1'bx : (USE_SIMD == "FOUR12") ? carryout_o_hw[0] : 1'bx;

//--########################### END ALU ################################
 
    
//*** CarryIn Mux and Register

//-------  input 0
    always @(posedge clk_in) begin
	if (rstallcarryin_in)
            qcarryin_o_reg0 <= 1'b0;
	else if (cecarryin_in)
            qcarryin_o_reg0 <= carryin_in;
    end

    generate
       case (CARRYINREG)
          0 : always @(carryin_in) qcarryin_o_mux0 <= carryin_in;
          1 : always @(qcarryin_o_reg0) qcarryin_o_mux0 <= qcarryin_o_reg0;
       endcase
    endgenerate

//-------  input 7
    always @(posedge clk_in) begin
	if (rstallcarryin_in)
            qcarryin_o_reg7 <= 1'b0;
// old	else if (cemultcarryin_in)
// new
	else if (cem_in)
// IR 478377 
            qcarryin_o_reg7 <=  ad_mult[24] ~^ b_mult[17];  // xnor
    end

//    always @(qa_o_mux[24] or qb_o_mux[17] or qcarryin_o_reg7) begin
    always @(ad_mult[24] or b_mult[17] or qcarryin_o_reg7) begin
// old	case (MULTCARRYINREG)
// new 
	case (MREG)
// IR 478377 
                  0 : qcarryin_o_mux7 <= ad_mult[24] ~^ b_mult[17];
                  1 : qcarryin_o_mux7 <= qcarryin_o_reg7;
            default : begin
	                  $display("Attribute Syntax Error : The attribute MREG on DSP48E1 instance %m is set to %d.  Legal values for this attribute are 0 or 1.", MREG);
	                  $finish;
	              end
	endcase
    end
   
    reg qcarryin_o_mux_tmp;
    always @(qcarryin_o_mux0 or pcin_in[47] or carrycascin_in or carrycascout_o_mux or qp_o_mux[47] or qcarryin_o_mux7 or qcarryinsel_o_mux) begin
	case (qcarryinsel_o_mux)
              3'b000 : qcarryin_o_mux_tmp <= qcarryin_o_mux0;
              3'b001 : qcarryin_o_mux_tmp <= ~pcin_in[47];
              3'b010 : qcarryin_o_mux_tmp <= carrycascin_in;
              3'b011 : qcarryin_o_mux_tmp <= pcin_in[47];
              3'b100 : qcarryin_o_mux_tmp <= carrycascout_o_mux;
              3'b101 : qcarryin_o_mux_tmp <= ~qp_o_mux[47];
              3'b110 : qcarryin_o_mux_tmp <= qcarryin_o_mux7;
              3'b111 : qcarryin_o_mux_tmp <= qp_o_mux[47];
            default : begin
	              end
	endcase
    end
    // disable carryin when performing logic operation
    always @(qcarryin_o_mux_tmp or qalumode_o_mux[3:2]) begin
      qcarryin_o_mux <= (qalumode_o_mux[3] || qalumode_o_mux[2]) ? 1'b0 : qcarryin_o_mux_tmp;
    end
 

//--####################################################################
//--#####                     AUTORESET_PATDET                     #####
//--####################################################################
    assign the_auto_reset_patdet = ((AUTORESET_PATDET == "RESET_MATCH") &&  pdet_o_reg1) 
                                                   ||
                                   ((AUTORESET_PATDET == "RESET_NOT_MATCH") &&  (pdet_o_reg2 && !pdet_o_reg1));
//--####################################################################
//--#####      CARRYOUT, CARRYCASCOUT. MULTSIGNOUT and PCOUT      ###### 
//--####################################################################
//*** register with 1 level of register
    always @(posedge clk_in) begin
        if(rstp_in || the_auto_reset_patdet)
             begin
               carryout_o_reg     <= 4'b0;
               carrycascout_o_reg <= 1'b0;
               qmultsignout_o_reg <= 1'b0;
               qp_o_reg1 <= 48'b0;
             end
        else if (cep_in) begin
                   carryout_o_reg     <= carryout_o;
                   carrycascout_o_reg <= carrycascout_o;
                   qmultsignout_o_reg <= multsignout_o_opmode;
                   qp_o_reg1 <= alu_o;
             end
    end

    generate 
       case (PREG)
          0: begin 
             always @(carryout_o)
                carryout_o_mux <= carryout_o;
             always @(carrycascout_o)
                carrycascout_o_mux <= carrycascout_o;
             always @(multsignout_o_opmode)
                 multsignout_o_mux <= multsignout_o_opmode;
             always @(alu_o)
                 qp_o_mux <= alu_o;
	  end

          1: begin 
             always @(carryout_o_reg)
                carryout_o_mux <= carryout_o_reg;
             always @(carrycascout_o_reg)
                carrycascout_o_mux <= carrycascout_o_reg;
             always @(qmultsignout_o_reg)
                 multsignout_o_mux <= qmultsignout_o_reg;
             always @(qp_o_reg1)
                 qp_o_mux <= qp_o_reg1;
	  end
       endcase
    endgenerate



//CR 219047 (2)
// ask jmt whether i should comment this out 
/*
    always @(qmult_o_mux[(MSB_A_MULT+MSB_B_MULT+1)] or qopmode_o_mux[3:0]) begin
        if(qopmode_o_mux[3:0] == 4'b0101)
           multsignout_o_opmode = qmult_o_mux[(MSB_A_MULT+MSB_B_MULT+1)];
        else
           multsignout_o_opmode = 1'bx;
    end 
*/



//    assign carryout_x_o[4] =  carryout_o_mux[4];
// CR 510304 output X during multiply operation

    assign carryout_x_o[3] =  carryout_o_mux[3];
    assign carryout_x_o[2] =  (USE_SIMD == "FOUR12") ? carryout_o_mux[2] : 1'bx;
    assign carryout_x_o[1] =  ((USE_SIMD == "TWO24") ||  (USE_SIMD == "FOUR12")) ? carryout_o_mux[1] : 1'bx;
    assign carryout_x_o[0] =  (USE_SIMD == "FOUR12") ? carryout_o_mux[0] : 1'bx;


//--####################################################################
//--#####                    Pattern Detector                      #####
//--####################################################################


// new
    // selet pattern
    assign the_pattern = (SEL_PATTERN == "PATTERN") ? PATTERN : qc_o_mux; 

    // selet mask
    always @(qc_o_mux) begin
        case(SEL_MASK)
              "MASK" : the_mask <= MASK;
              "C"    : the_mask <= qc_o_mux;
              "ROUNDING_MODE1" :  the_mask     <=   ~qc_o_mux << 1;
              "ROUNDING_MODE2" :  the_mask     <=   ~qc_o_mux << 2;
               default : ;
        endcase
    end

    //--  now do the pattern detection
       
    assign pdet_o = &(~(the_pattern ^ alu_o) | the_mask);  
    assign pdetb_o = &((the_pattern ^ alu_o) | the_mask);  

    assign pdet_o_mux  = (~opmode_valid_flag) ? 1'bx : (PREG == 1) ? pdet_o_reg1 : pdet_o;
    assign pdetb_o_mux = (~opmode_valid_flag) ? 1'bx : (PREG == 1) ? pdetb_o_reg1 : pdetb_o;

//*** Output register PATTERN DETECT and UNDERFLOW / OVERFLOW 

    always @(posedge clk_in) begin
        if((rstp_in) || the_auto_reset_patdet) 
          begin 
            pdet_o_reg1  <= 1'b0;
            pdet_o_reg2  <= 1'b0;
            pdetb_o_reg1 <= 1'b0;
            pdetb_o_reg2 <= 1'b0;
          end
	else if(cep_in)
               begin
                 //-- the previous values are used in Underflow/Overflow
                 pdet_o_reg2  <= pdet_o_reg1;
                 pdet_o_reg1  <= pdet_o;
                 pdetb_o_reg2 <= pdetb_o_reg1;
                 pdetb_o_reg1 <= pdetb_o;
               end
    end

 
//--####################################################################
//--#####                    Underflow / Overflow                  #####
//--####################################################################
    generate if ((USE_PATTERN_DETECT == "PATDET") || (PREG == 1))
       begin         
          assign  overflow_o  = pdet_o_reg2 & !pdet_o_reg1 & !pdetb_o_reg1;
          assign  underflow_o = pdetb_o_reg2  & !pdet_o_reg1 & !pdetb_o_reg1;
       end
    else
       begin         
           assign overflow_o  = 1'bx;
           assign underflow_o = 1'bx;
       end
    endgenerate



    specify

        (CLK *> ACOUT) = (100, 100);
        (CLK *> BCOUT) = (100, 100);
        (CLK *> CARRYCASCOUT)      = (100, 100);
        (CLK *> CARRYOUT)       = (100, 100);
        (CLK *> MULTSIGNOUT)       = (100, 100);
        (CLK *> OVERFLOW)       = (100, 100);
        (CLK *> P) = (100, 100);
        (CLK *> PATTERNBDETECT) = (100, 100);
        (CLK *> PATTERNDETECT)  = (100, 100);
        (CLK *> PCOUT) = (100, 100);
        (CLK *> UNDERFLOW)      = (100, 100);

        specparam PATHPULSE$ = 0;

    endspecify

endmodule // DSP48E1

`endcelldefine

