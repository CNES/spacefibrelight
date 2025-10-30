//------------------------------------------------------------------------------
//  (c) Copyright 2017-2018 Advanced Micro Devices, Inc. All rights reserved.
//
//  This file contains confidential and proprietary information
//  of Advanced Micro Devices, Inc. and is protected under U.S. and
//  international copyright and other intellectual property
//  laws.
//
//  DISCLAIMER
//  This disclaimer is not a license and does not grant any
//  rights to the materials distributed herewith. Except as
//  otherwise provided in a valid license issued to you by
//  AMD, and to the maximum extent permitted by applicable
//  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
//  WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
//  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
//  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
//  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
//  (2) AMD shall not be liable (whether in contract or tort,
//  including negligence, or under any other theory of
//  liability) for any loss or damage of any kind or nature
//  related to, arising under or in connection with these
//  materials, including for any direct, or any indirect,
//  special, incidental, or consequential loss or damage
//  (including loss of data, profits, goodwill, or any type of
//  loss or damage suffered as a result of any action brought
//  by a third party) even if such damage or loss was
//  reasonably foreseeable or AMD had been advised of the
//  possibility of the same.
//
//  CRITICAL APPLICATIONS
//  AMD products are not designed or intended to be fail-
//  safe, or for use in any application requiring fail-safe
//  performance, such as life-support or safety devices or
//  systems, Class III medical devices, nuclear facilities,
//  applications related to the deployment of airbags, or any
//  other applications that could lead to death, personal
//  injury, or severe property or environmental damage
//  (individually and collectively, "Critical
//  Applications"). Customer assumes the sole risk and
//  liability of any use of AMD products in Critical
//  Applications, subject only to applicable laws and
//  regulations governing limitations on product liability.
//
//  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
//  PART OF THIS FILE AT ALL TIMES.
//------------------------------------------------------------------------------

`timescale 1ps/1ps

module extended_phy_layer_gtwiz_versal_0_0_gt_quad_base_0_tx_function 
(
  input apbclk, 
  input reset, 
  input wire MSTTXRESET,
  input wire TXPRERATECHANGE,
  input wire TXDATAPATHRESET,
  input wire TXLANEDESKEW,
  input wire [3:0] TXPRBSSEL,
  input wire [7:0] TXRATE,
  input wire gpoFromGT,
  
  output reg [3:0] Command, 
  output wire gpiToGT,
  output wire gpoTouser
); 

  reg   [10:0]  request;
  reg   gpoFromGTsync_r2, gpoFromGTsync_r1;
  reg   MSTTXRESET_r2, MSTTXRESET_r1;
  reg   TXPRERATECHANGE_r2, TXPRERATECHANGE_r1;
  reg   TXDATAPATHRESET_r2, TXDATAPATHRESET_r1;  
  reg   TXLANEDESKEW_r2, TXLANEDESKEW_r1; 
  reg   [7:0] TXRATE_r2, TXRATE_r1; 
  reg   [3:0] txprbssel_r, TXPRBSSEL_r1, TXPRBSSEL_r2, 
        txprbssel_stable, txprbs_counter;
  reg   txprbssel_en_r1, txprbssel_en_r2;
  reg   txrate_is_zero, txrate_is_zero_r1, txrate_is_zero_r2;
  reg   gpi;
  reg   gpo;
  reg   [19:0] request_r;
  reg [1:0] en [10:0];                    
  reg   [3:0] idx = 4'b0000;
  
  //
  // Arbitration state machine encodings
  //
  localparam [4:0] ARB_START            = 5'd1;
  localparam [4:0] ARB_WAIT             = 5'd2;
  localparam [4:0] ARB_REPORT           = 5'd4;
  localparam [4:0] ARB_WAIT_NXT_REQ     = 5'd8;  
  localparam [4:0] ARB_INC              = 5'd16;

  localparam [4:0] TXRATE_START         = 5'd1;
  localparam [4:0] TXRATE_STATE1        = 5'd2;
  localparam [4:0] TXRATE_STATE2        = 5'd4;
  localparam [4:0] TXRATE_STATE3        = 5'd8;

  localparam [1:0] TXPRBS_START         = 2'd1;
  localparam [1:0] TXPRBS_STATE1        = 2'd2;
    
  reg [4:0] arb_state = ARB_START;    
  reg [4:0] txrate_state = TXRATE_START; 
  reg [1:0] txprbs_state = TXPRBS_START;
  reg [3:0] rrst_r;
  wire rrst;
  integer i;
  reg [7:0] counter;
  reg [3:0] txrate_counter;
  reg [1:0] gpoState;
  (* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *) reg [3:0] gpoFromGTsync_r; 
  wire gpoFromGTsync;
  wire TXPRERATECHANGE_sync;
  wire MSTTXRESET_sync;
  wire TXDATAPATHRESET_sync;
  wire TXLANEDESKEW_sync; 
  wire [7:0] TXRATE_sync; 
  wire [3:0] TXPRBSSEL_sync;
  reg needService;

  //--------------------------------------------------------------------------------------------------
  //  Reset Synchronizer for REFCLK
  //--------------------------------------------------------------------------------------------------
  always @ (posedge apbclk or posedge reset)
  begin
    if (reset) 
        rrst_r <= 4'b1111;
    else
        rrst_r <= {rrst_r[2:0], 1'd0};
  end   

  assign rrst = rrst_r[3];

  //--------------------------------------------------------------------------------------------------
  //  Synchronizier
  //--------------------------------------------------------------------------------------------------
  always @ (posedge apbclk)
  begin
      gpoFromGTsync_r <= {gpoFromGTsync_r[3:0], gpoFromGT};  
  end   

  assign gpoFromGTsync = gpoFromGTsync_r[3];

  xpm_cdc_sync_rst # (
   .DEST_SYNC_FF (3),
   .INIT          (0)
  ) TXPRERATECHANGE_xpm_internal_sync (
    .src_rst  (TXPRERATECHANGE),
    .dest_rst (TXPRERATECHANGE_sync),
    .dest_clk (apbclk)
  );

  xpm_cdc_sync_rst # (
   .DEST_SYNC_FF (3)
  ) MSTTXRESET_xpm_internal_sync (
    .src_rst  (MSTTXRESET),
    .dest_rst (MSTTXRESET_sync),
    .dest_clk (apbclk)
  );
  xpm_cdc_sync_rst # (
   .DEST_SYNC_FF (3)
  ) TXDATAPATHRESET_xpm_internal_sync (
    .src_rst  (TXDATAPATHRESET),
    .dest_rst (TXDATAPATHRESET_sync),
    .dest_clk (apbclk)
  );
  xpm_cdc_sync_rst # (
   .DEST_SYNC_FF (3)
  ) TXLANEDESKEW_xpm_internal_sync (
    .src_rst  (TXLANEDESKEW),
    .dest_rst (TXLANEDESKEW_sync),
    .dest_clk (apbclk)
  );  
  genvar j;
  generate
      for ( j = 0; j < 8; j = j + 1 ) begin : synch_vec_txrate
      xpm_cdc_sync_rst # (
       .DEST_SYNC_FF (3)
      ) TXRATE_xpm_internal_sync (
        .src_rst  (TXRATE[j]),
        .dest_rst (TXRATE_sync[j]),
        .dest_clk (apbclk)
      );
    end
  endgenerate

  generate
      for ( j = 0; j < 4; j = j + 1 ) begin : synch_vec_txprbssel
      xpm_cdc_sync_rst # (
       .DEST_SYNC_FF (3)
      ) TXPRBS_xpm_internal_sync (
        .src_rst  (TXPRBSSEL[j]),
        .dest_rst (TXPRBSSEL_sync[j]),
        .dest_clk (apbclk)
      );
    end
  endgenerate

  always @(posedge apbclk) begin
    if (rrst) begin 
      gpoFromGTsync_r2 <= 1'b0;
      gpoFromGTsync_r1 <= 1'b0;
    end
    else begin
      gpoFromGTsync_r2 <= gpoFromGTsync_r1;
      gpoFromGTsync_r1 <= gpoFromGTsync;
    end
  end 

  always @(posedge apbclk) begin
    if (rrst) begin 
      MSTTXRESET_r2 <= 1'b0;
      MSTTXRESET_r1 <= 1'b0;
    end
    else begin 
      MSTTXRESET_r2 <= MSTTXRESET_r1;
      MSTTXRESET_r1 <= MSTTXRESET_sync;
    end
  end 
  
  always @(posedge apbclk) begin
    if (rrst) begin 
      TXPRERATECHANGE_r2 <= 1'b0;
      TXPRERATECHANGE_r1 <= 1'b0;
    end
    else begin
      TXPRERATECHANGE_r2 <= TXPRERATECHANGE_r1;
      TXPRERATECHANGE_r1 <= TXPRERATECHANGE_sync;
    end
  end 

  always @(posedge apbclk) begin
    if (rrst) begin 
      TXDATAPATHRESET_r2 <= 1'b0;
      TXDATAPATHRESET_r1 <= 1'b0;
    end
    else begin
      TXDATAPATHRESET_r2 <= TXDATAPATHRESET_r1;
      TXDATAPATHRESET_r1 <= TXDATAPATHRESET_sync;
    end
  end
  
  always @(posedge apbclk) begin
    if (rrst) begin 
      TXLANEDESKEW_r2 <= 1'b0;
      TXLANEDESKEW_r1 <= 1'b0;
    end
    else begin
      TXLANEDESKEW_r2 <= TXLANEDESKEW_r1;
      TXLANEDESKEW_r1 <= TXLANEDESKEW_sync;
    end
  end  

  always @(posedge apbclk) begin
    if (rrst) begin 
      TXRATE_r2 <= 8'h00;
      TXRATE_r1 <= 8'h00;
    end
    else begin
      TXRATE_r2 <= TXRATE_r1;
      TXRATE_r1 <= TXRATE_sync;
    end
  end

  always @(posedge apbclk) begin
    if (rrst) begin 
      txrate_is_zero_r2 <= 1'b0;
      txrate_is_zero_r1 <= 1'b0;
    end
    else begin
      txrate_is_zero_r2 <= txrate_is_zero_r1;
      txrate_is_zero_r1 <= txrate_is_zero;
    end
  end

  always @(posedge apbclk) begin
    if (rrst) begin
      TXPRBSSEL_r1 <= 4'b0000;
      TXPRBSSEL_r2 <= 4'b0000;
    end 
    else begin
      TXPRBSSEL_r1  <= TXPRBSSEL_sync;
      TXPRBSSEL_r2  <= TXPRBSSEL_r1;
    end
  end 

  // 
  always @(posedge apbclk) begin
    if (rrst) begin
      txprbssel_r <= 4'b0000;
      txprbssel_en_r1 <= 1'b0;
      txprbssel_en_r2 <= 1'b0;
    end 
    else begin
      txprbssel_r  <= txprbssel_stable;
      txprbssel_en_r1 <= |txprbssel_r;
      txprbssel_en_r2 <= txprbssel_en_r1;
    end
  end

  always @(posedge apbclk) begin
    if (rrst) begin
      request <= 11'h0;
    end 
    else begin
      if (!MSTTXRESET_r2 && MSTTXRESET_r1) 
        request[1] <= 1'b1;
      else 
        request[1] <= 1'b0;
        
      if (MSTTXRESET_r2 && !MSTTXRESET_r1) 
        request[2] <= 1'b1; 
      else 
        request[2] <= 1'b0;  
        
      if (!TXPRERATECHANGE_r2 && TXPRERATECHANGE_r1) 
        request[3] <= 1'b1;
      else 
        request[3] <= 1'b0;
        
      if (TXPRERATECHANGE_r2 && !TXPRERATECHANGE_r1)
        request[4] <= 1'b1;
      else
        request[4] <= 1'b0;

      if (!TXDATAPATHRESET_r2 && TXDATAPATHRESET_r1) 
        request[5] <= 1'b1;
      else 
        request[5] <= 1'b0;
        
      if (TXDATAPATHRESET_r2 && !TXDATAPATHRESET_r1)
        request[6] <= 1'b1;
      else
        request[6] <= 1'b0;

      if (!TXLANEDESKEW_r2 && TXLANEDESKEW_r1)
        request[7] <= 1'b1;
      else
        request[7] <= 1'b0;    

      if (!txprbssel_en_r2 && txprbssel_en_r1)
        request[8] <= 1'b1;
      else
        request[8] <= 1'b0;

      if (txprbssel_en_r2 && !txprbssel_en_r1)
        request[9] <= 1'b1;
      else
        request[9] <= 1'b0;

      if (!txrate_is_zero_r2 && txrate_is_zero_r1)
        request[10] <= 1'b1;
      else
        request[10] <= 1'b0;

    end
  end

  always @(posedge apbclk) begin
    if (rrst) begin
      for (i = 0; i < 11; i= i+1) begin
        en[i] <= 2'b00;
      end
    end
    else begin
      for (i = 0; i < 11; i= i+1) begin
        if (request[i])
        begin
          //en[i] <= 1'b1;
          en[i] <= {|en[i],1'b1};
        end
      end
      if (!gpoFromGTsync_r2 && gpoFromGTsync_r1)
      begin
        //en[idx] <= 1'b0;
          en[idx] <= {1'b0,&en[idx]};
      end
    end
  end

  //
  // Arbitration FSM - does a round-robin arbritration scheme
  //
  always @(posedge apbclk)
  begin
    if (rrst)
    begin
      idx <= 4'b0000;
      Command <= 4'b0000;
      gpi <= 1'b0;
      arb_state <= ARB_START;
      counter <= 8'd0;
    end
    else
    begin
      case (arb_state)
        ARB_START: begin
          counter <= 8'd0;
          if (en[idx] != 2'b00)
          begin
            Command <= {idx};
            gpi <= 1'b1;
            arb_state <= ARB_WAIT;
          end
          else
          begin
            gpi <= 1'b0; 
            arb_state <= ARB_WAIT_NXT_REQ;
            Command <= 4'b0000;
          end 
        end
        ARB_WAIT: begin
          gpi <= 1'b1;
          if (gpoFromGTsync == 1'b1)
            arb_state <= ARB_REPORT;
          else
            arb_state <= ARB_WAIT;
        end
        ARB_REPORT: begin
          gpi <= 1'b0;
          counter <= 8'd0;
          if (gpoFromGTsync == 1'b0)
            arb_state <= ARB_WAIT_NXT_REQ;
          else
            arb_state <= ARB_REPORT;
        end
        ARB_WAIT_NXT_REQ: begin
          gpi <= 1'b0;
          counter <= counter + 1; 
          if (counter[7])
            arb_state <= ARB_INC;
          else
            arb_state <= ARB_WAIT_NXT_REQ;
        end        
        ARB_INC : begin
          gpi <= 1'b0;
          if (|en[10])
            idx <= 4'b1010;
          else begin
            if (needService && idx != 10)
              idx <= idx + 1;
            else
              idx <= 4'b0000;
          end
          arb_state <= ARB_START;
        end
        default: arb_state <= ARB_START;
        
      endcase
    end
  end

  always @(posedge apbclk) begin
    if (rrst) begin
      needService = 1'b0;
    end
    else begin
      needService = |en[0] | |en[1] | en[2] | en[3] | en[4] | |en[5] | |en[6] | en[7] | en[8] | en[9] | en[10];
    end
  end
  
  always @(posedge apbclk)
  begin
    if (rrst) begin
      gpoState <= 2'b00;
      gpo <= 1'b0;
    end 
    else 
    begin 
      case(gpoState)
      2'b00: begin 
        if (Command == 4'b0011 && gpoFromGTsync) begin 
          gpo <= 1'b1;
          gpoState <= 2'b01; 
        end
        else begin 
          gpoState <= 2'b00; 
          gpo <= 1'b0;
        end
      end 
      2'b01: begin 
        if (Command == 4'b0100 && gpoFromGTsync) begin 
          gpoState <= 2'b00;
          gpo <= 1'b0;
        end 
        else begin
          gpo <= 1'b1;
          gpoState <= 2'b01;
        end 
      end
      default: gpoState <= 2'b00;
      endcase
    end
  end
  
  assign gpoTouser = gpo;
  assign gpiToGT = gpi;

  always @(posedge apbclk)
  begin
    if (rrst)
    begin
      txrate_is_zero <= 1'b0;
      txrate_state <= TXRATE_START;
      txrate_counter <= 4'b0000;
    end
    else
    begin
      case (txrate_state)
        TXRATE_START: begin
          txrate_is_zero <= 1'b0;
          txrate_counter <= 4'b0000;
          if (TXRATE_r2 != TXRATE_r1)
            txrate_state <= TXRATE_STATE1;
          else
            txrate_state <= TXRATE_START;
        end
        TXRATE_STATE1: begin
          txrate_counter <= 4'b0000;
          if (TXRATE_r2 != 8'h00)
            txrate_state <= TXRATE_STATE1;
          else
            txrate_state <= TXRATE_STATE2;
        end
        TXRATE_STATE2: begin
          txrate_counter <= 8'd0;
          if (TXRATE_r2 != 8'h00) 
            txrate_state <= TXRATE_STATE1;
          else begin
            txrate_counter <= txrate_counter + 1; 
            if (txrate_counter[3])
              txrate_state <= TXRATE_STATE3;
            else
              txrate_state <= TXRATE_STATE2;
          end
        end
        TXRATE_STATE3: begin
          txrate_is_zero <= 1'b1;
          txrate_state <= TXRATE_START;
        end
        default: txrate_state <= TXRATE_START;
        
      endcase
    end
  end

  always @(posedge apbclk)
  begin
    if (rrst)
    begin
      txprbs_state <= TXPRBS_START;
      txprbs_counter <= 4'b0000;
      txprbssel_stable <= 4'b0000;
    end
    else
    begin
      case (txprbs_state)
        TXPRBS_START: begin
          if (TXPRBSSEL_r1 == TXPRBSSEL_r2)
            txprbs_counter <= txprbs_counter + 1;
          else
            txprbs_counter <= 0;
          
          if (txprbs_counter[3])
            txprbs_state <= TXPRBS_STATE1;
          else
            txprbs_state <= TXPRBS_START;
        end
        TXPRBS_STATE1: begin
          txprbssel_stable <= TXPRBSSEL_r2;
          txprbs_state <= TXPRBS_START;
          txprbs_counter <= 0;
        end
        default: txprbs_state <= TXPRBS_START;
        
      endcase
    end
  end

endmodule 
