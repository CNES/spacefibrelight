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
-- Auteur(s) : Y.DAURIAC
--
-- Projet : IP SpaceFibre_Light Versal target
--
-- Date de creation : 03/03/2025
--
-- Description : This module manages the MIB signals
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

entity mib_data_link is
  generic(
    G_VC_NUM               : integer := 8                                 --! Number of virtual channel
    );
   port (
    -- MIB parameters interface TOP
    INTERFACE_RESET         : in  std_logic;                             --! Reset the link and all configuration register of the Data Link layer from the TOP
    LINK_RESET              : in  std_logic;                             --! Reset the link from the TOP
    NACK_RST_EN             : in  std_logic;                             --! Enable automatic link reset on NACK reception from the TOP
    NACK_RST_MODE           : in  std_logic;                             --! Up for instant link reset on NACK reception, down for link reset at the end of the current received frame on NACK reception from the TOP
    PAUSE_VC                : in  std_logic_vector(G_VC_NUM downto 0);   --! Pause the corresponding virtual channel after the end of current transmission from the TOP
    CONTINUOUS_VC           : in  std_logic_vector(G_VC_NUM-1 downto 0); --! Enable the corresponding virtual channel continuous mode from the TOP
    -- MIB parameters interface Data-link
    INTERFACE_RESET_DL      : out std_logic;                             --! Reset the link and all configuration register of the Data Link layer to DL
    LINK_RESET_DL           : out std_logic;                             --! Reset the link to DL
    NACK_RST_EN_DL          : out std_logic;                             --! Enable automatic link reset on NACK reception to DL
    NACK_RST_MODE_DL        : out std_logic;                             --! Up for instant link reset on NACK reception, down for link reset at the end of current received frame on NACK reception to DL
    PAUSE_VC_DL             : out std_logic_vector(G_VC_NUM downto 0);   --! Pause the corresponding virtual channel after the end of current transmission to DL
    CONTINUOUS_VC_DL        : out std_logic_vector(G_VC_NUM-1 downto 0); --! Enable the corresponding virtual channel continuous mode to DL
    -- MIB status interface Data-link
    SEQ_NUMBER_TX_DL        : in  std_logic_vector(G_VC_NUM-1 downto 0); --! SEQ_NUMBER in transmission from DL
    SEQ_NUMBER_RX_DL        : in  std_logic_vector(G_VC_NUM-1 downto 0); --! SEQ_NUMBER in reception from DL
    CREDIT_VC_DL            : in  std_logic_vector(G_VC_NUM-1 downto 0); --! Indicates if each corresponding far-end input buffer has credit from DL
    INPUT_BUF_OVF_VC_DL     : in  std_logic_vector(G_VC_NUM-1 downto 0); --! Indicates input buffer overflow from DL
    FCT_CREDIT_OVERFLOW_DL  : in  std_logic_vector(G_VC_NUM-1 downto 0); --! Indicates overflow of each corresponding input buffer from DL
    CRC_LONG_ERROR_DL       : in  std_logic;                             --! CRC long error from DL
    CRC_SHORT_ERROR_DL      : in  std_logic;                             --! CRC short error from DL
    FRAME_ERROR_DL          : in  std_logic;                             --! Frame error from DL
    SEQUENCE_ERROR_DL       : in  std_logic;                             --! Sequence error from DL
    FAR_END_LINK_RESET_DL   : in  std_logic;                             --! Far-end link reset status from DL
    FRAME_FINISHED_DL       : in  std_logic_vector(G_VC_NUM downto 0);   --! Indicates that corresponding channel finished emitting a frame from DL
    FRAME_TX_DL             : in  std_logic_vector(G_VC_NUM downto 0);   --! Indicates that corresponding channel is emitting a frame from DL
    DATA_COUNTER_TX_DL      : in  std_logic_vector(6 downto 0);          --! Indicate the number of data transmitted in last frame emitted from DL
    DATA_COUNTER_RX_DL      : in  std_logic_vector(6 downto 0);          --! Indicate the number of data received in last frame received from DL
    ACK_COUNTER_TX_DL       : in  std_logic_vector(2 downto 0);          --! ACK counter TX from DL
    NACK_COUNTER_TX_DL      : in  std_logic_vector(2 downto 0);          --! NACK counter TX from DL
    FCT_COUNTER_TX_DL       : in  std_logic_vector(3 downto 0);          --! FCT counter TX from DL
    ACK_COUNTER_RX_DL       : in  std_logic_vector(2 downto 0);          --! ACK counter RX from DL
    NACK_COUNTER_RX_DL      : in  std_logic_vector(2 downto 0);          --! NACK counter RX from DL
    FCT_COUNTER_RX_DL       : in  std_logic_vector(3 downto 0);          --! FCT counter RX from DL
    FULL_COUNTER_RX_DL      : in  std_logic_vector(1 downto 0);          --! FULL counter RX from DL
    RETRY_COUNTER_RX_DL     : in  std_logic_vector(1 downto 0);          --! RETRY counter RX from DL
    CURRENT_TIME_SLOT_DL    : in  std_logic_vector(G_VC_NUM-1 downto 0); --! Current time slot from DL
    RESET_PARAM_DL          : in  std_logic;                             --! Reset configuration parameters control from DL
    LINK_RST_ASSERTED_DL    : in  std_logic;                             --! Link has been reseted from DL
    NACK_SEQ_NUM_DL         : in std_logic_vector(7 downto 0);           --! NACK Seq_num received from DL
    ACK_SEQ_NUM_DL          : in std_logic_vector(7 downto 0);           --! ACK Seq_num received from DL
    DATA_PULSE_RX_DL        : in std_logic;                              --! Data received pulse signal from DL
    ACK_PULSE_RX_DL         : in std_logic;                              --! ACK received pulse signal from DL
    NACK_PULSE_RX_DL        : in std_logic;                              --! NACK received pulse signal from DL
    FCT_PULSE_RX_DL         : in std_logic;                              --! FCT received pulse signal from DL
    FULL_PULSE_RX_DL        : in std_logic;                              --! FULL received pulse signal from DL
    RETRY_PULSE_RX_DL       : in std_logic;                              --! RETRY received pulse signal from DL
    -- MIB status interface TOP
    SEQ_NUMBER_TX           : out std_logic_vector(G_VC_NUM-1 downto 0); --! SEQ_NUMBER in transmission to the TOP
    SEQ_NUMBER_RX           : out std_logic_vector(G_VC_NUM-1 downto 0); --! SEQ_NUMBER in reception to the TOP
    CREDIT_VC               : out std_logic_vector(G_VC_NUM-1 downto 0); --! Indicates if each corresponding far-end input buffer has credit to the TOP
    INPUT_BUF_OVF_VC        : out std_logic_vector(G_VC_NUM-1 downto 0); --! Indicates input buffer overflow to the TOP
    FCT_CREDIT_OVERFLOW     : out std_logic_vector(G_VC_NUM-1 downto 0); --! Indicates overflow of each corresponding input buffer to the TOP
    CRC_LONG_ERROR          : out std_logic;                             --! CRC long error to the TOP
    CRC_SHORT_ERROR         : out std_logic;                             --! CRC short error to the TOP
    FRAME_ERROR             : out std_logic;                             --! Frame error to the TOP
    SEQUENCE_ERROR          : out std_logic;                             --! Sequence error to the TOP
    FAR_END_LINK_RESET      : out std_logic;                             --! Far-end link reset status to the TOP
    FRAME_FINISHED          : out std_logic_vector(8 downto 0);          --! Indicates that corresponding channel finished emitting a frame to the TOP
    FRAME_TX                : out std_logic_vector(8 downto 0);          --! Indicates that corresponding channel is emitting a frame to the TOP
    DATA_COUNTER_TX         : out std_logic_vector(6 downto 0);          --! Indicate the number of data transmitted in last frame emitted to the TOP
    DATA_COUNTER_RX         : out std_logic_vector(6 downto 0);          --! Indicate the number of data received in last frame received to the TOP
    ACK_COUNTER_TX          : out std_logic_vector(2 downto 0);          --! ACK counter TX to the TOP
    NACK_COUNTER_TX         : out std_logic_vector(2 downto 0);          --! NACK counter TX to the TOP
    FCT_COUNTER_TX          : out std_logic_vector(3 downto 0);          --! FCT counter TX to the TOP
    ACK_COUNTER_RX          : out std_logic_vector(2 downto 0);          --! ACK counter RX to the TOP
    NACK_COUNTER_RX         : out std_logic_vector(2 downto 0);          --! NACK counter RX to the TOP
    FCT_COUNTER_RX          : out std_logic_vector(3 downto 0);          --! FCT counter RX to the TOP
    FULL_COUNTER_RX         : out std_logic_vector(1 downto 0);          --! FULL counter RX to the TOP
    RETRY_COUNTER_RX        : out std_logic_vector(1 downto 0);          --! RETRY counter RX to the TOP
    CURRENT_TIME_SLOT       : out std_logic_vector(G_VC_NUM-1 downto 0); --! Current time slot to the TOP
    RESET_PARAM             : out std_logic;                             --! Reset configuration parameters control to the TOP
    LINK_RST_ASSERTED       : out std_logic;                             --! Link has been reseted to the TOP
    NACK_SEQ_NUM            : out std_logic_vector(7 downto 0);          --! NACK Seq_num received to the TOP
    ACK_SEQ_NUM             : out std_logic_vector(7 downto 0);          --! ACK Seq_num received to the TOP
    DATA_PULSE_RX           : out std_logic;                             --! Data received pulse signal to the TOP
    ACK_PULSE_RX            : out std_logic;                             --! ACK received pulse signal to the TOP
    NACK_PULSE_RX           : out std_logic;                             --! NACK received pulse signal to the TOP
    FCT_PULSE_RX            : out std_logic;                             --! FCT received pulse signal to the TOP
    FULL_PULSE_RX           : out std_logic;                             --! FULL received pulse signal to the TOP
    RETRY_PULSE_RX          : out std_logic                              --! RETRY received pulse signal to the TOP
   );
end mib_data_link;

architecture rtl of mib_data_link is

begin
  -- Parameters
  INTERFACE_RESET_DL      <= INTERFACE_RESET;
  LINK_RESET_DL           <= LINK_RESET;
  NACK_RST_EN_DL          <= NACK_RST_EN;
  NACK_RST_MODE_DL        <= NACK_RST_MODE;
  PAUSE_VC_DL             <= PAUSE_VC;
  CONTINUOUS_VC_DL        <= CONTINUOUS_VC;
  -- Status
  SEQ_NUMBER_TX           <= SEQ_NUMBER_TX_DL;
  SEQ_NUMBER_RX           <= SEQ_NUMBER_RX_DL;
  CREDIT_VC               <= CREDIT_VC_DL;
  INPUT_BUF_OVF_VC        <= INPUT_BUF_OVF_VC_DL;
  FCT_CREDIT_OVERFLOW     <= FCT_CREDIT_OVERFLOW_DL;
  CRC_LONG_ERROR          <= CRC_LONG_ERROR_DL;
  CRC_SHORT_ERROR         <= CRC_SHORT_ERROR_DL;
  FRAME_ERROR             <= FRAME_ERROR_DL;
  SEQUENCE_ERROR          <= SEQUENCE_ERROR_DL;
  FAR_END_LINK_RESET      <= FAR_END_LINK_RESET_DL;
  FRAME_FINISHED          <= FRAME_FINISHED_DL;
  FRAME_TX                <= FRAME_TX_DL;
  DATA_COUNTER_TX         <= DATA_COUNTER_TX_DL;
  DATA_COUNTER_RX         <= DATA_COUNTER_RX_DL;
  ACK_COUNTER_TX          <= ACK_COUNTER_TX_DL;
  NACK_COUNTER_TX         <= NACK_COUNTER_TX_DL;
  FCT_COUNTER_TX          <= FCT_COUNTER_TX_DL;
  ACK_COUNTER_RX          <= ACK_COUNTER_RX_DL;
  NACK_COUNTER_RX         <= NACK_COUNTER_RX_DL;
  FCT_COUNTER_RX          <= FCT_COUNTER_RX_DL;
  FULL_COUNTER_RX         <= FULL_COUNTER_RX_DL;
  RETRY_COUNTER_RX        <= RETRY_COUNTER_RX_DL;
  CURRENT_TIME_SLOT       <= CURRENT_TIME_SLOT_DL;
  RESET_PARAM             <= RESET_PARAM_DL;
  LINK_RST_ASSERTED       <= LINK_RST_ASSERTED_DL;
  NACK_SEQ_NUM            <= NACK_SEQ_NUM_DL;
  ACK_SEQ_NUM             <= ACK_SEQ_NUM_DL;
  DATA_PULSE_RX           <= DATA_PULSE_RX_DL;
  ACK_PULSE_RX            <= ACK_PULSE_RX_DL;
  NACK_PULSE_RX           <= NACK_PULSE_RX_DL;
  FCT_PULSE_RX            <= FCT_PULSE_RX_DL;
  FULL_PULSE_RX           <= FULL_PULSE_RX_DL;
  RETRY_PULSE_RX          <= RETRY_PULSE_RX_DL;
end architecture rtl;
