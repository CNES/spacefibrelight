-----------------------------------------------------------------------------------
-- #                          Copyright CNES 2025                                 #
-- #                                                                              #
-- # This source describes Open Hardware and is licensed under the CERN-OHL-W v2. #
-- #                                                                              #
-- # You may redistribute and modify this documentation and make products         #
-- # using it under the terms of the CERN-OHL-W v2 (https:/cern.ch/cern-ohl).     #
-- #                                                                              #
-- # This documentation is distributed WITHOUT ANY EXPRESS OR IMPLIED             #
-- # WARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY                 #
-- # AND FITNESS FOR A PARTICULAR PURPOSE.                                        #
-- #                                                                              #
-- # Please see the CERN-OHL-W v2 for applicable conditions.                      #
-----------------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Auteur(s) : J.PIQUEMAL
--
-- Projet : IP SpaceFibre_Light Versal target
--
-- Date de creation : 03/09/2024
--
-- Description : This module implement the Physical and Lane layer of an IP
-- SpaceFibre Light.
-- The Physical layer is carried by an Xilinx IP
-- The Lane layer is carried by owner's code and an Xilinx IP
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity mib_phy_plus_lane is
   port (
      -- Parameters From USERAPP/TOP
      LANE_START                       : in  std_logic;                       --! Asserts or de-asserts LaneStart for the lane
      AUTOSTART                        : in  std_logic;                       --! Asserts or de-asserts AutoStart for the lane
      LANE_RESET                       : in  std_logic;                       --! Asserts or de-asserts LaneReset for the lane
      PARALLEL_LOOPBACK_EN             : in  std_logic;                       --! Enables or disables the parallel loopback for the lane
      STANDBY_REASON                   : in  std_logic_vector(07 downto 00);  --! In case of error, pauses communication
      NEAR_END_SERIAL_LB_EN            : in  std_logic;                       --! Enables or disables the near-end serial loopback for the lane
      FAR_END_SERIAL_LB_EN             : in  std_logic;                       --! Enables or disables the far-end serial loopback for the lane
      -- Status To USERAPP/TOP
      LANE_STATE                       : out std_logic_vector(03 downto 00);  --! Indicates the current state of the Lane Initialization state machine in a lane
      RX_ERROR_CNT                     : out std_logic_vector(07 downto 00);  --! Counter of error detected on the RX link
      RX_ERROR_OVF                     : out std_logic;                       --! Overflow flag of the RX_ERROR_CNT
      LOSS_SIGNAL                      : out std_logic;                       --! Set when no signal is received on RX link.
      FAR_END_CAPA                     : out std_logic_vector(07 downto 00);  --! Capabilities field (INT3 flags)
      RX_POLARITY                      : out std_logic;                       --! Set when the receiver polarity is inverted.

      -- Parameters to Module PHY+LANE
      LANE_START_TO_MOD                : out std_logic;                       --! Asserts or de-asserts LaneStart for the lane
      AUTOSTART_TO_MOD                 : out std_logic;                       --! Asserts or de-asserts AutoStart for the lane
      LANE_RESET_TO_MOD                : out std_logic;                       --! Asserts or de-asserts LaneReset for the lane
      PARALLEL_LOOPBACK_EN_TO_MOD      : out std_logic;                       --! Enables or disables the parallel loopback for the lane
      STANDBY_REASON_TO_MOD            : out std_logic_vector(07 downto 00);  --! In case of error, pauses communication
      NEAR_END_SERIAL_LB_EN_TO_MOD     : out std_logic;                       --! Enables or disables the near-end serial loopback for the lane
      FAR_END_SERIAL_LB_EN_TO_MOD      : out std_logic;                       --! Enables or disables the far-end serial loopback for the lane
      -- Status from Module PHY+LANE
      LANE_STATE_FROM_MOD              : in  std_logic_vector(03 downto 00);  --! Indicates the current state of the Lane Initialization state machine in a lane
      RX_ERROR_CNT_FROM_MOD            : in  std_logic_vector(07 downto 00);  --! Counter of error detected on the RX link
      RX_ERROR_OVF_FROM_MOD            : in  std_logic;                       --! Overflow flag of the RX_ERROR_CNT
      LOSS_SIGNAL_FROM_MOD             : in  std_logic;                       --! Set when no signal is received on RX link
      FAR_END_CAPA_FROM_MOD            : in  std_logic_vector(07 downto 00);  --! Capabilities field (INT3 flags)
      RX_POLARITY_FROM_MOD             : in  std_logic                        --! Set when the receiver polarity is inverted
   );
end mib_phy_plus_lane;

architecture rtl of mib_phy_plus_lane is

begin



   -- Parameters
   LANE_START_TO_MOD             <= LANE_START;
   AUTOSTART_TO_MOD              <= AUTOSTART;
   LANE_RESET_TO_MOD             <= LANE_RESET;
   PARALLEL_LOOPBACK_EN_TO_MOD   <= PARALLEL_LOOPBACK_EN;
   STANDBY_REASON_TO_MOD         <= STANDBY_REASON;
   NEAR_END_SERIAL_LB_EN_TO_MOD  <= NEAR_END_SERIAL_LB_EN;
   FAR_END_SERIAL_LB_EN_TO_MOD   <= FAR_END_SERIAL_LB_EN;
   -- Status
   LANE_STATE                    <= LANE_STATE_FROM_MOD;
   RX_ERROR_CNT                  <= RX_ERROR_CNT_FROM_MOD;
   RX_ERROR_OVF                  <= RX_ERROR_OVF_FROM_MOD;
   LOSS_SIGNAL                   <= LOSS_SIGNAL_FROM_MOD;
   FAR_END_CAPA                  <= FAR_END_CAPA_FROM_MOD;
   RX_POLARITY                   <= RX_POLARITY_FROM_MOD;



end architecture rtl;
