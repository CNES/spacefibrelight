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

module extended_phy_layer_gtwiz_versal_0_0_gt_quad_base_0_rx_function 
(
  input apbclk, 
  input reset, 
  input wire MSTRXRESET,
  input wire RXPRERATECHANGE,
  input wire RXDATAPATHRESET,
  input wire [7:0] RXRATE,
  input wire gpoFromGT,
  
  output reg [3:0] Command, 
  output wire gpiToGT,
  output wire gpoTouser
); 

  reg   [7:0]  request;
  reg   gpoFromGTsync_r2, gpoFromGTsync_r1;
  reg   MSTRXRESET_r2, MSTRXRESET_r1;
  reg   RXPRERATECHANGE_r2, RXPRERATECHANGE_r1;
  reg   RXDATAPATHRESET_r2, RXDATAPATHRESET_r1;
  reg   [7:0] RXRATE_r2, RXRATE_r1; 
  reg   rxrate_is_zero, rxrate_is_zero_r1, rxrate_is_zero_r2;
  reg   gpi;
  reg   gpo;
  reg   [7:0] request_r;
  reg [1:0] en [7:0];
  reg   [2:0] idx = 3'b000;
  
  //
  // Arbitration state machine encodings
  //
  localparam [4:0] ARB_START            = 5'd1;
  localparam [4:0] ARB_WAIT             = 5'd2;
  localparam [4:0] ARB_REPORT           = 5'd4;
  localparam [4:0] ARB_WAIT_NXT_REQ     = 5'd8;  
  localparam [4:0] ARB_INC              = 5'd16;
    
  localparam [4:0] RXRATE_START         = 5'd1;
  localparam [4:0] RXRATE_STATE1        = 5'd2;
  localparam [4:0] RXRATE_STATE2        = 5'd4;
  localparam [4:0] RXRATE_STATE3        = 5'd8;

  reg [4:0] arb_state = ARB_START;    
  reg [4:0] rxrate_state = RXRATE_START; 
  reg [3:0] rrst_r;
  wire rrst;
  integer i;
  reg [7:0] counter;
  reg [3:0] rxrate_counter;
  reg [1:0] gpoState;
  (* ASYNC_REG = "TRUE", SHIFT_EXTRACT = "NO" *) reg [3:0] gpoFromGTsync_r; 
  wire gpoFromGTsync;
  wire RXPRERATECHANGE_sync;
  wire MSTRXRESET_sync;
  wire RXDATAPATHRESET_sync;
  wire [7:0] RXRATE_sync; 
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
  ) RXPRERATECHANGE_xpm_internal_sync (
    .src_rst  (RXPRERATECHANGE),
    .dest_rst (RXPRERATECHANGE_sync),
    .dest_clk (apbclk)
  );

  xpm_cdc_sync_rst # (
   .DEST_SYNC_FF (3)
  ) MSTRXRESET_xpm_internal_sync (
    .src_rst  (MSTRXRESET),
    .dest_rst (MSTRXRESET_sync),
    .dest_clk (apbclk)
  );
  xpm_cdc_sync_rst # (
   .DEST_SYNC_FF (3)
  ) RXDATAPATHRESET_xpm_internal_sync (
    .src_rst  (RXDATAPATHRESET),
    .dest_rst (RXDATAPATHRESET_sync),
    .dest_clk (apbclk)
  );

  genvar j;
  generate
      for ( j = 0; j < 8; j = j + 1 ) begin : synch_vec_rxrate
      xpm_cdc_sync_rst # (
       .DEST_SYNC_FF (3)
      ) RXRATE_xpm_internal_sync (
        .src_rst  (RXRATE[j]),
        .dest_rst (RXRATE_sync[j]),
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
      MSTRXRESET_r2 <= 1'b0;
      MSTRXRESET_r1 <= 1'b0;
    end
    else begin 
      MSTRXRESET_r2 <= MSTRXRESET_r1;
      MSTRXRESET_r1 <= MSTRXRESET_sync;
    end
  end 
  
  always @(posedge apbclk) begin
    if (rrst) begin 
      RXPRERATECHANGE_r2 <= 1'b0;
      RXPRERATECHANGE_r1 <= 1'b0;
    end
    else begin
      RXPRERATECHANGE_r2 <= RXPRERATECHANGE_r1;
      RXPRERATECHANGE_r1 <= RXPRERATECHANGE_sync;
    end
  end 

  always @(posedge apbclk) begin
    if (rrst) begin 
      RXDATAPATHRESET_r2 <= 1'b0;
      RXDATAPATHRESET_r1 <= 1'b0;
    end
    else begin
      RXDATAPATHRESET_r2 <= RXDATAPATHRESET_r1;
      RXDATAPATHRESET_r1 <= RXDATAPATHRESET_sync;
    end
  end

  always @(posedge apbclk) begin
    if (rrst) begin 
      RXRATE_r2 <= 8'h00;
      RXRATE_r1 <= 8'h00;
    end
    else begin
      RXRATE_r2 <= RXRATE_r1;
      RXRATE_r1 <= RXRATE_sync;
    end
  end

  always @(posedge apbclk) begin
    if (rrst) begin 
      rxrate_is_zero_r2 <= 1'b0;
      rxrate_is_zero_r1 <= 1'b0;
    end
    else begin
      rxrate_is_zero_r2 <= rxrate_is_zero_r1;
      rxrate_is_zero_r1 <= rxrate_is_zero;
    end
  end

  always @(posedge apbclk) begin
    if (rrst) begin
      request <= 8'h0;
    end 
    else begin
      if (!MSTRXRESET_r2 && MSTRXRESET_r1) 
        request[1] <= 1'b1;
      else 
        request[1] <= 1'b0;
        
      if (MSTRXRESET_r2 && !MSTRXRESET_r1) 
        request[2] <= 1'b1; 
      else 
        request[2] <= 1'b0;  
        
      if (!RXPRERATECHANGE_r2 && RXPRERATECHANGE_r1) 
        request[3] <= 1'b1;
      else 
        request[3] <= 1'b0;
        
      if (RXPRERATECHANGE_r2 && !RXPRERATECHANGE_r1)
        request[4] <= 1'b1;
      else
        request[4] <= 1'b0;

      if (!RXDATAPATHRESET_r2 && RXDATAPATHRESET_r1) 
        request[5] <= 1'b1;
      else 
        request[5] <= 1'b0;
        
      if (RXDATAPATHRESET_r2 && !RXDATAPATHRESET_r1)
        request[6] <= 1'b1;
      else
        request[6] <= 1'b0;

      if (!rxrate_is_zero_r2 && rxrate_is_zero_r1)
        request[7] <= 1'b1;
      else
        request[7] <= 1'b0;

    end
  end

  always @(posedge apbclk) begin
    if (rrst) begin
      //en <= 8'h0;
      for (i = 0; i < 8; i= i+1) begin
        en[i] <= 2'b00;
      end
    end
    else begin
      for (i = 0; i < 8; i= i+1) begin
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
      idx <= 3'b000;
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
            Command <= {1'b0,idx};
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
          if (|en[7])
            idx <= 3'b111;
          else begin
            if (needService && idx != 7)
              idx <= idx + 1;
            else
              idx <= 3'b000;
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
      needService = |en[0] | |en[1] | en[2] | en[3] | en[4] | |en[5] | |en[6] | en[7];
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
      rxrate_is_zero <= 1'b0;
      rxrate_state <= RXRATE_START;
      rxrate_counter <= 4'b0000;
    end
    else
    begin
      case (rxrate_state)
        RXRATE_START: begin
          rxrate_is_zero <= 1'b0;
          rxrate_counter <= 4'b0000;
          if (RXRATE_r2 != RXRATE_r1)
            rxrate_state <= RXRATE_STATE1;
          else
            rxrate_state <= RXRATE_START;
        end
        RXRATE_STATE1: begin
          rxrate_counter <= 4'b0000;
          if (RXRATE_r2 != 8'h00)
            rxrate_state <= RXRATE_STATE1;
          else
            rxrate_state <= RXRATE_STATE2;
        end
        RXRATE_STATE2: begin
          rxrate_counter <= 8'd0;
          if (RXRATE_r2 != 8'h00) 
            rxrate_state <= RXRATE_STATE1;
          else begin
            rxrate_counter <= rxrate_counter + 1; 
            if (rxrate_counter[3])
              rxrate_state <= RXRATE_STATE3;
            else
              rxrate_state <= RXRATE_STATE2;
          end
        end
        RXRATE_STATE3: begin
          rxrate_is_zero <= 1'b1;
          rxrate_state <= RXRATE_START;
        end
        default: rxrate_state <= RXRATE_START;
        
      endcase
    end
  end

endmodule 
