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
-- Author(s) : Y. DAURIAC
--
-- Project : IP SpaceFibreLight
--
-- Creation date : 24/02/2025
--
-- Description : This module permits to enpasulate frames
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_encapsulation is
  generic (
      G_VC_NUM       : integer := 8                                                             --! Number of virtual channel
   );
  port (
    CLK                               : in std_logic;                                           --! Global Clock
    -- data_link_reset (DLRE) interface
    LINK_RESET_DLRE                   : in std_logic;                                           --! Link Reset command
    -- phy_plus_lane (PPL) interface
    LANE_ACTIVE_PPL                   : in std_logic;                                           --! Lane Active flag for the DATA Link Layer
    -- data_mac (DMAC) interface
    DATA_DMAC                         : in std_logic_vector(C_DATA_LENGTH-1 downto 0);          --! Data parallel from data_mac
    VALID_K_CHAR_DMAC                 : in std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);  --! K charachter valid in the 32-bit DATA_DMAC vector
    NEW_WORD_DMAC                     : in std_logic;                                           --! New word flag from data_mac
	  END_PACKET_DMAC                   : in std_logic;                                           --! End frame/control word from data_mac
    TYPE_FRAME_DMAC                   : in std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);    --! Type of the frame associated with DATA_DMAC
    VIRTUAL_CHANNEL_DMAC              : in std_logic_vector (G_VC_NUM-1 downto 0);              --! Virtual channel of the frame associated with DATA_DMAC
    BC_TYPE_DMAC                      : in std_logic_vector (G_VC_NUM-1 downto 0);              --! BROADCAST Type
    BC_CHANNEL_DMAC                   : in std_logic_vector (G_VC_NUM-1 downto 0);              --! BROADCAST Channel (one channel in this implementation)
	  BC_STATUS_DMAC                    : in std_logic_vector (2-1 downto 0);                     --! BOADCAST status
    MULT_CHANNEL_DMAC                 : in std_logic_vector (G_VC_NUM-1 downto 0);              --! Multiplier and Channel field for FCT word
    SEQ_NUM_ACK_DMAC                  : in std_logic_vector(7 downto 0);                        --! SEQ_NUM ACK value
    TRANS_POL_FLG_DMAC                : in std_logic;                                           --! Transmission polarity flag
    -- data_seq_compute (DSCC) interface
    NEW_WORD_DENC                     : out std_logic;                                          --! New word flag to data_seq_compute
    DATA_DENC                         : out std_logic_vector(C_DATA_LENGTH-1 downto 0);         --! Data parallel to data_seq_compute
    VALID_K_CHARAC_DENC               : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0); --! K charachter valid in the 32-bit DATA_DENC vector
    TYPE_FRAME_DENC                   : out std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);   --! Type of the frame associated with DATA_DENC
    END_FRAME_DENC                    : out std_logic;                                          --! End frame/control word associated with DATA_DENC
    SEQ_NUM_ACK_DENC                  : out std_logic_vector(7 downto 0);                       --! SEQ_NUM ACK value
    TRANS_POL_FLG_DENC                : out std_logic                                           --! Transmission polarity flag
  );
end data_encapsulation;

architecture rtl of data_encapsulation is

---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
type data_encapsulation_fsm_type is (
  START_FRAME_ST, --! Start frame state add SDF/SBF/SIF or control word
  TRANSFER_ST,    --! Transfer state : data transfer or control word
  END_FRAME_ST    --! End frame state : add EDF/EBF
  );

signal current_state     : data_encapsulation_fsm_type;
signal current_state_r   : data_encapsulation_fsm_type;
signal sif_done          : std_logic;
signal type_frame_denc_i : std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);
begin
---------------------------------------------------------
-----                  Process                      -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_encapsulation
-- Description: Encapsulates each frame via fsm
---------------------------------------------------------

p_encapsulation_fsm: process(CLK)
begin
  if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
      DATA_DENC           <= (others => '0');
      VALID_K_CHARAC_DENC <= (others => '0');
      NEW_WORD_DENC       <= '0';
      END_FRAME_DENC      <= '0';
      current_state       <= START_FRAME_ST;
      current_state_r     <= START_FRAME_ST;
      sif_done            <='0';
      type_frame_denc_i   <= (others => '0');
      TYPE_FRAME_DENC     <= (others => '0');
      SEQ_NUM_ACK_DENC    <= (others => '0');
      TRANS_POL_FLG_DENC  <= '0';
    elsif LANE_ACTIVE_PPL= '1' then
      type_frame_denc_i  <= TYPE_FRAME_DMAC;
      TRANS_POL_FLG_DENC <= TRANS_POL_FLG_DMAC;
      current_state_r    <= current_state;
      case current_state is
        when START_FRAME_ST =>
                                TYPE_FRAME_DENC <= TYPE_FRAME_DMAC;
                                END_FRAME_DENC      <= '0';
                                NEW_WORD_DENC       <= '0';
                                sif_done            <= '0';
                                if TYPE_FRAME_DMAC = C_IDLE_FRM and sif_done ='1' then
                                  DATA_DENC           <= DATA_DMAC;
                                  VALID_K_CHARAC_DENC <= VALID_K_CHAR_DMAC;
                                  NEW_WORD_DENC       <= NEW_WORD_DMAC;
                                  if END_PACKET_DMAC ='1' then
                                    sif_done            <= '0';
                                  end if;
                                elsif NEW_WORD_DMAC = '1' then
                                  if TYPE_FRAME_DMAC = C_DATA_FRM then
    			                        	DATA_DENC          <= C_RESERVED_SYMB & VIRTUAL_CHANNEL_DMAC & C_SDF_WORD;
    			                        	VALID_K_CHARAC_DENC <= "0001";
    			                        	NEW_WORD_DENC       <= '1';
                                    END_FRAME_DENC      <= '0';
                                    current_state       <= TRANSFER_ST;
    			                        elsif TYPE_FRAME_DMAC = C_BC_FRM then
    			                        	DATA_DENC           <= BC_TYPE_DMAC & BC_CHANNEL_DMAC & C_SBF_WORD;
    			                        	VALID_K_CHARAC_DENC <= "0001";
    			                        	NEW_WORD_DENC       <= '1';
                                    END_FRAME_DENC      <= '0';
                                    current_state       <= TRANSFER_ST;
    			                        elsif TYPE_FRAME_DMAC = C_IDLE_FRM then
    			                        	DATA_DENC           <= C_RESERVED_SYMB & C_RESERVED_SYMB & C_SIF_WORD;
    			                        	VALID_K_CHARAC_DENC <= "0001";
    			                        	NEW_WORD_DENC       <= '1';
                                    END_FRAME_DENC      <= '0';
                                    current_state       <= START_FRAME_ST;
                                    sif_done            <= '1';
    			                        elsif TYPE_FRAME_DMAC = C_FCT_FRM then
    			                        	DATA_DENC           <= C_RESERVED_SYMB & C_RESERVED_SYMB & MULT_CHANNEL_DMAC & C_K28_3_SYMB;
    			                        	VALID_K_CHARAC_DENC <= "0001";
    			                        	NEW_WORD_DENC       <= '1';
                                    END_FRAME_DENC      <= '1';
                                    current_state       <= START_FRAME_ST;
    			                        elsif TYPE_FRAME_DMAC = C_ACK_FRM then
    			                        	DATA_DENC           <= C_RESERVED_SYMB & C_RESERVED_SYMB & C_ACK_WORD;
    			                        	VALID_K_CHARAC_DENC <= "0001";
    			                        	NEW_WORD_DENC       <= '1';
                                    END_FRAME_DENC      <= '1';
                                    SEQ_NUM_ACK_DENC    <= SEQ_NUM_ACK_DMAC;
                                    current_state       <= START_FRAME_ST;
    			                        elsif TYPE_FRAME_DMAC = C_NACK_FRM then
    			                        	DATA_DENC           <=  C_RESERVED_SYMB & C_RESERVED_SYMB & C_NACK_WORD;
    			                        	VALID_K_CHARAC_DENC <= "0001";
    			                        	NEW_WORD_DENC       <= '1';
                                    END_FRAME_DENC      <= '1';
                                    SEQ_NUM_ACK_DENC    <= SEQ_NUM_ACK_DMAC;
                                    current_state       <= START_FRAME_ST;
    			                        elsif TYPE_FRAME_DMAC = C_FULL_FRM then
    			                        	DATA_DENC      <=  C_RESERVED_SYMB & C_RESERVED_SYMB & C_FULL_WORD;
    			                        	VALID_K_CHARAC_DENC <= "0001";
    			                        	NEW_WORD_DENC       <= '1';
                                    END_FRAME_DENC      <= '1';
                                    current_state       <= START_FRAME_ST;
    			                        end if;
                                end if;
        when TRANSFER_ST    =>
                                END_FRAME_DENC      <= '0';
                                NEW_WORD_DENC       <= '0';
                                TYPE_FRAME_DENC <= TYPE_FRAME_DMAC;
                                if TYPE_FRAME_DMAC = C_DATA_FRM or TYPE_FRAME_DMAC = C_BC_FRM then
                                  if END_PACKET_DMAC = '1' then
    			                          DATA_DENC           <= DATA_DMAC;
    			                          VALID_K_CHARAC_DENC <= VALID_K_CHAR_DMAC;
    			                          NEW_WORD_DENC       <= '1';
                                    current_state       <= END_FRAME_ST;
                                  elsif NEW_WORD_DMAC = '1' or current_state_r= START_FRAME_ST then
                                    DATA_DENC           <= DATA_DMAC;
                                    VALID_K_CHARAC_DENC <= VALID_K_CHAR_DMAC;
                                    NEW_WORD_DENC       <= '1';
                                  end if;
                                elsif NEW_WORD_DMAC = '1' then
    			                        if TYPE_FRAME_DMAC = C_FCT_FRM then
    			                        	DATA_DENC           <= C_RESERVED_SYMB & C_RESERVED_SYMB & MULT_CHANNEL_DMAC & C_K28_3_SYMB;
    			                        	VALID_K_CHARAC_DENC <= "0001";
    			                        	NEW_WORD_DENC       <= '1';
                                    END_FRAME_DENC      <= '1';
    			                        elsif TYPE_FRAME_DMAC = C_ACK_FRM then
    			                        	DATA_DENC           <= C_RESERVED_SYMB & C_RESERVED_SYMB & C_ACK_WORD;
    			                        	VALID_K_CHARAC_DENC <= "0001";
    			                        	NEW_WORD_DENC       <= '1';
                                    END_FRAME_DENC      <= '1';
                                    SEQ_NUM_ACK_DENC    <= SEQ_NUM_ACK_DMAC;
    			                        elsif TYPE_FRAME_DMAC = C_NACK_FRM then
    			                        	DATA_DENC           <=  C_RESERVED_SYMB & C_RESERVED_SYMB & C_NACK_WORD;
    			                        	VALID_K_CHARAC_DENC <= "0001";
    			                        	NEW_WORD_DENC       <= '1';
                                    END_FRAME_DENC      <= '1';
                                    SEQ_NUM_ACK_DENC    <= SEQ_NUM_ACK_DMAC;
    			                        elsif TYPE_FRAME_DMAC = C_FULL_FRM then
    			                        	DATA_DENC      <=  C_RESERVED_SYMB & C_RESERVED_SYMB & C_FULL_WORD;
    			                        	VALID_K_CHARAC_DENC <= "0001";
    			                        	NEW_WORD_DENC       <= '1';
                                    END_FRAME_DENC      <= '1';
    			                        end if;
                                end if;
        when END_FRAME_ST   =>
                                TYPE_FRAME_DENC <= type_frame_denc_i;
                                END_FRAME_DENC  <= '1';
                                current_state   <= START_FRAME_ST;
                                if type_frame_denc_i = C_DATA_FRM then
                                  DATA_DENC           <= C_RESERVED_SYMB & C_RESERVED_SYMB & C_RESERVED_SYMB & C_K28_0_SYMB;
                                  VALID_K_CHARAC_DENC <= "0001";
                                  NEW_WORD_DENC       <= '1';
                                elsif type_frame_denc_i = C_BC_FRM then
                                  DATA_DENC           <= C_RESERVED_SYMB & C_RESERVED_SYMB & "000000" & BC_STATUS_DMAC & C_K28_2_SYMB;
                                  VALID_K_CHARAC_DENC <= "0001";
                                  NEW_WORD_DENC       <= '1';
                                end if;
        when others         =>
                                END_FRAME_DENC      <= '0';
                                NEW_WORD_DENC       <= '0';
                                VALID_K_CHARAC_DENC <= "0000";
      end case;
    end if;
  end if;
end process p_encapsulation_fsm;

end architecture rtl;