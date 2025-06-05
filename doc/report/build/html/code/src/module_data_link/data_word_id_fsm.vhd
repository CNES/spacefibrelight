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
-- Description : This module describe the Data_word_id_fsm function
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_word_id_fsm is
  port (
    CLK                     : in  std_logic;                                           --! Global clock
		-- data_link_reset (DLRE) interface
    LINK_RESET_DLRE         : in  std_logic;                                           --! Link Reset command
    -- PHY PLUS LANE layer interface
    FIFO_RX_DATA_VALID_PPL  : in  std_logic;                                           --! Flag DATA_VALID of the FIFO RX from Lane layer
    FIFO_RX_RD_EN_DL       : out std_logic;                                            --! Flag to read data in FIFO RX
    DATA_RX_PPL             : in  std_logic_vector(C_DATA_LENGTH-1 downto 0);          --! Data parallel from Lane Layer
    VALID_K_CHARAC_PPL      : in  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);  --! K character valid in the 32-bit DATA_RX_PPL vector
    -- data_crc_check (DCCHECK) interface
    TYPE_FRAME_DWI          : out std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);     --! Current frame/control word type
    NEW_WORD_DWI            : out std_logic;                                            --! New word flag associated to DATA_DWI
    END_FRAME_DWI           : out std_logic;                                            --! End frame/control word flag
    DATA_DWI                : out std_logic_vector(C_DATA_LENGTH-1 downto 0);           --! Data parallel to data_crc_check
		VALID_K_CHARAC_DWI      : out  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);  --! K character valid in the 32-bit DATA_DWI vector
    SEQ_NUM_DWI             : out std_logic_vector(7 downto 0);                 				--! SEQ_NUM of the current control word
    CRC_16B_DWI             : out std_logic_vector(15 downto 0);                				--! 16-bit CRC (data frame)  of the current control word
    CRC_8B_DWI              : out std_logic_vector(7 downto 0);                 				--! 8-bit CRC of the current control word
		MULTIPLIER_DWI          : out std_logic_vector(C_MULT_SIZE-1 downto 0);     				--! Multiplier value of the current FCT word
		VC_DWI                  : out std_logic_vector(C_CHANNEL_SIZE-1 downto 0);  				--! Virtual Channel of the current FCT word
		RXNOTHING_ACTIVE_DWI    : out std_logic;                                  					--! RXNOTHING state of the data_word_id_fsm flag
		RXERR_DWI               : out std_logic; 																						--! RXERR flag detection
		RXERR_ALL_DWI           : out std_logic; 																						--! RXERR flag detection during broadcast and data frame status
    -- Error interface
    CRC_ERR_DCCHECK         : in  std_logic;                                            --! CRC error flag from data_crc_check
    SEQ_ERR_DSCHECK         : in  std_logic;                                            --! SEQ_NUM error flag from data_seq_check
    FRAME_ERR_DWI           : out std_logic;                                            --! Frame error flag
		-- MIB
		DATA_COUNTER_RX_DWI     : out  std_logic_vector(6 downto 0);                        --! Data counter RX
    RETRY_COUNTER_RX_DWI    : out  std_logic_vector(1 downto 0);                        --! RETRY counter RX
		DATA_PULSE_RX_DWI       : out std_logic;                                            --! New data received flag
		RETRY_PULSE_RX_DWI      : out std_logic                                             --! New RETRY received flag
  );
end data_word_id_fsm;

architecture rtl of data_word_id_fsm is

---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------

-- Lane Initialisation FSM transition conditions process
   -- Type
type data_word_id_fsm_type is (
   RX_NOTHING_ST,                                                                --! Reset state
   RX_BROADCAST_FRAME_ST,                                                        --! BROADCAST frame State
   RX_IDLE_FRAME_ST,                                                             --! IDLE frame State
   RX_DATA_FRAME_ST,                                                             --! DATA frame State
   RX_BROADCAST_AND_DATA_FRAME_ST                                                --! BROADCAST and DATA frame State
   );
   -- Signals
signal current_state      : data_word_id_fsm_type;
signal current_state_r    : data_word_id_fsm_type;
signal receiving_frame    : std_logic;
signal type_incom_frame   : std_logic_vector(1 downto 0);
signal data_word_cnt      : unsigned(6 downto 0);
signal bc_word_cnt        : unsigned(1 downto 0);
signal retry_counter      : unsigned(1 downto 0);
-- detected signals
signal detected_sdf     : std_logic;
signal detected_edf     : std_logic;
signal detected_sbf     : std_logic;
signal detected_ebf     : std_logic;
signal detected_sif     : std_logic;
signal detected_fct     : std_logic;
signal detected_ack     : std_logic;
signal detected_nack    : std_logic;
signal detected_full    : std_logic;
signal detected_retry   : std_logic;
signal detected_rxerr_i : std_logic;

begin
	--------------------------------------------------------
	--                  Assignement                       --
	--------------------------------------------------------
	DATA_COUNTER_RX_DWI  <= std_logic_vector(data_word_cnt);
	RETRY_COUNTER_RX_DWI <= std_logic_vector(retry_counter);

	detected_sdf         <= '1' when (FIFO_RX_DATA_VALID_PPL ='1' and DATA_RX_PPL(15 downto 0) = C_SDF_WORD   and VALID_K_CHARAC_PPL = "0001")  else '0';                                   -- SDF control word detected
	detected_edf         <= '1' when (FIFO_RX_DATA_VALID_PPL ='1' and DATA_RX_PPL(7 downto 0)  = C_K28_0_SYMB and VALID_K_CHARAC_PPL = "0001")  else '0';                                   -- EDF control word detected
	detected_sbf         <= '1' when (FIFO_RX_DATA_VALID_PPL ='1' and DATA_RX_PPL(15 downto 0) = C_SBF_WORD   and VALID_K_CHARAC_PPL = "0001")  else '0';                                   -- SBF control word detected
	detected_ebf         <= '1' when (FIFO_RX_DATA_VALID_PPL ='1' and DATA_RX_PPL(7 downto 0)  = C_K28_2_SYMB and VALID_K_CHARAC_PPL = "0001")  else '0';                                   -- EBF control word detected
	detected_sif         <= '1' when (FIFO_RX_DATA_VALID_PPL ='1' and DATA_RX_PPL(15 downto 0) = C_SIF_WORD   and VALID_K_CHARAC_PPL = "0001")  else '0';                                   -- SIF control word detected
	detected_fct         <= '1' when (FIFO_RX_DATA_VALID_PPL ='1' and DATA_RX_PPL(7 downto 0)  = C_K28_3_SYMB and VALID_K_CHARAC_PPL = "0001")  else '0';                                   -- FCT control word detected
	detected_ack         <= '1' when (FIFO_RX_DATA_VALID_PPL ='1' and DATA_RX_PPL(15 downto 0) = C_ACK_WORD   and VALID_K_CHARAC_PPL = "0001")  else '0';                                   -- ACK control word detected
	detected_nack        <= '1' when (FIFO_RX_DATA_VALID_PPL ='1' and DATA_RX_PPL(15 downto 0) = C_NACK_WORD  and VALID_K_CHARAC_PPL = "0001")  else '0';                                   -- NACK control word detected
	detected_full        <= '1' when (FIFO_RX_DATA_VALID_PPL ='1' and DATA_RX_PPL(15 downto 0) = C_FULL_WORD  and VALID_K_CHARAC_PPL = "0001")  else '0';                                   -- FULL control word detected
	detected_retry       <= '1' when (FIFO_RX_DATA_VALID_PPL ='1' and DATA_RX_PPL = C_RETRY_WORD              and VALID_K_CHARAC_PPL = "0001")  else '0';                                   -- RETRY control word detected
	detected_rxerr_i     <= '1' when (FIFO_RX_DATA_VALID_PPL ='1' and DATA_RX_PPL = C_RXERR_WORD              and VALID_K_CHARAC_PPL = "0001" and current_state /= RX_NOTHING_ST) else '0'; -- RXERR control word detected

---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_fsm_data_word_id_transition
-- Description: Data Word Identification FSM transition
--              conditions process
---------------------------------------------------------

p_fsm_data_word_id_transition : process(CLK)
begin
	if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
      current_state          <= RX_NOTHING_ST;
      current_state_r        <= RX_NOTHING_ST;
      FRAME_ERR_DWI          <= '0';
			RXNOTHING_ACTIVE_DWI   <= '0';
	    RXERR_DWI              <= '0';
			RXERR_ALL_DWI          <= '0';
		else
		  FRAME_ERR_DWI         <= '0';
      current_state_r       <= current_state;
			RXNOTHING_ACTIVE_DWI  <= '0';
			RXERR_DWI             <= '0';
			RXERR_ALL_DWI         <= '0';
      case current_state is
         when RX_NOTHING_ST                  => if LINK_RESET_DLRE = '1' then
                                                   current_state  <= RX_NOTHING_ST;
                                                elsif detected_sbf ='1' then
                                                   current_state  <= RX_BROADCAST_FRAME_ST;
                                                elsif detected_sdf ='1' then
                                                   current_state  <= RX_DATA_FRAME_ST;
                                                elsif detected_sif ='1' then
                                                   current_state  <= RX_IDLE_FRAME_ST;
                                                end if;
         when RX_DATA_FRAME_ST               => if LINK_RESET_DLRE = '1' or detected_edf = '1' or detected_retry = '1' or CRC_ERR_DCCHECK = '1' or SEQ_ERR_DSCHECK = '1' then
                                                  current_state  <= RX_NOTHING_ST;
				                                        elsif detected_rxerr_i = '1' then
																									RXNOTHING_ACTIVE_DWI <= '1';
																									RXERR_DWI            <= '1';
																									current_state        <= RX_NOTHING_ST;
                                                elsif detected_sdf = '1' or detected_sif = '1' or detected_ebf = '1' or data_word_cnt >= C_MAX_DATA_FRAME then
																									RXNOTHING_ACTIVE_DWI   <= '1';
                                                  FRAME_ERR_DWI          <= '1';
                                                  current_state          <= RX_NOTHING_ST;
                                                elsif detected_sbf ='1' then
                                                  current_state  <= RX_BROADCAST_AND_DATA_FRAME_ST;
                                                end if;
         when RX_BROADCAST_FRAME_ST          => if LINK_RESET_DLRE = '1' or (detected_ebf = '1' and bc_word_cnt = C_WORD_BC_FRAME) or detected_retry = '1' or CRC_ERR_DCCHECK = '1' or SEQ_ERR_DSCHECK = '1' then
                                                  current_state  <= RX_NOTHING_ST;
				                                        elsif detected_rxerr_i = '1' then
																									RXNOTHING_ACTIVE_DWI  <= '1';
																									RXERR_DWI             <= '1';
																									current_state         <= RX_NOTHING_ST;
                                                elsif detected_sdf = '1' or detected_sbf = '1' or detected_sif = '1' or detected_edf = '1' or (detected_ebf = '1' and bc_word_cnt /= C_WORD_BC_FRAME) or bc_word_cnt >= C_WORD_BC_FRAME then
                                                  RXNOTHING_ACTIVE_DWI  <= '1';
																									FRAME_ERR_DWI         <= '1';
                                                  current_state         <= RX_NOTHING_ST;
                                                end if;

         when RX_BROADCAST_AND_DATA_FRAME_ST => if LINK_RESET_DLRE = '1' or detected_retry = '1' or CRC_ERR_DCCHECK = '1' or SEQ_ERR_DSCHECK = '1' then
                                                  current_state  <= RX_NOTHING_ST;
				                                        elsif detected_rxerr_i = '1' then
																									RXNOTHING_ACTIVE_DWI  <= '1';
																									RXERR_ALL_DWI         <= '1';
																									RXERR_DWI             <= '1';
																									current_state         <= RX_NOTHING_ST;
                                                elsif (detected_ebf = '1' and bc_word_cnt = C_WORD_BC_FRAME) then
                                                   current_state  <= RX_DATA_FRAME_ST;
                                                elsif detected_sdf = '1' or detected_sbf = '1' or detected_sif = '1' or detected_edf = '1' or (detected_ebf = '1' and bc_word_cnt /= C_WORD_BC_FRAME) or bc_word_cnt > C_WORD_BC_FRAME then
                                                  RXNOTHING_ACTIVE_DWI <= '1';
																									FRAME_ERR_DWI        <= '1';
                                                   current_state       <= RX_NOTHING_ST;
                                                end if;

         when RX_IDLE_FRAME_ST               => if LINK_RESET_DLRE = '1' or detected_rxerr_i = '1' or detected_retry = '1' or CRC_ERR_DCCHECK = '1' or SEQ_ERR_DSCHECK = '1' then
                                                  current_state   <= RX_NOTHING_ST;
                                                elsif detected_sbf ='1' then
                                                   current_state  <= RX_BROADCAST_FRAME_ST;
                                                elsif detected_sdf ='1' then
                                                   current_state  <= RX_DATA_FRAME_ST;
                                                elsif detected_edf = '1' or detected_ebf = '1' or data_word_cnt > C_MAX_IDLE_FRAME then
                                                   FRAME_ERR_DWI  <= '1';
                                                   current_state  <= RX_NOTHING_ST;
                                                end if;
         when others                          => current_state  <= RX_NOTHING_ST;
      end case;
		end if;
  end if;
end process p_fsm_data_word_id_transition;
---------------------------------------------------------
-- Process: p_comb_state
-- Description: Data Word Identification FSM action on
--              state process
---------------------------------------------------------
p_comb_state : process(CLK)
begin
	if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
	  	receiving_frame    <= '0';
	  	type_incom_frame   <= (others =>'0');
	  	data_word_cnt      <= (others =>'0');
	  	bc_word_cnt        <= (others =>'0');
		else
			if current_state = RX_NOTHING_ST then
			  receiving_frame      <= '0';
			  data_word_cnt        <= (others =>'0');
			  bc_word_cnt          <= (others =>'0');
			elsif current_state = RX_DATA_FRAME_ST then
			  receiving_frame      <= '1';
			  type_incom_frame     <= "01"; -- receiving data frame
			  if (current_state_r = RX_IDLE_FRAME_ST) then
			    data_word_cnt      <= to_unsigned(1,data_word_cnt'length);
			  else
					if (FIFO_RX_DATA_VALID_PPL ='1' and detected_fct ='0' and detected_ack ='0' and detected_nack ='0' and detected_full ='0') then
			    	data_word_cnt    <= data_word_cnt + 1;
					end if;
			  end if;
				bc_word_cnt          <= (others =>'0');
			elsif current_state = RX_BROADCAST_FRAME_ST then
			  receiving_frame      <= '1';
			  type_incom_frame     <= "10"; -- receiving broadcast frame
				if (FIFO_RX_DATA_VALID_PPL ='1' and detected_fct ='0' and detected_ack ='0' and detected_nack ='0' and detected_full ='0') then
			  	bc_word_cnt          <= bc_word_cnt + 1;
				end if;
			  data_word_cnt        <= (others =>'0');
			elsif current_state = RX_BROADCAST_AND_DATA_FRAME_ST then
			  receiving_frame      <= '1';
			  type_incom_frame     <= "10"; -- receiving broadcast frame
				if (FIFO_RX_DATA_VALID_PPL ='1' and detected_fct ='0' and detected_ack ='0' and detected_nack ='0' and detected_full ='0') then
			  	bc_word_cnt          <= bc_word_cnt + 1;
				end if;
			elsif current_state = RX_IDLE_FRAME_ST then
			  receiving_frame      <= '1';
			  type_incom_frame     <= "11"; -- receiving idle frame
				if (FIFO_RX_DATA_VALID_PPL ='1') and DATA_RX_PPL(15 downto 0) = C_SIF_WORD and VALID_K_CHARAC_PPL = "0001" then
					data_word_cnt        <= (others => '0');
				elsif (FIFO_RX_DATA_VALID_PPL ='1' and detected_fct ='0' and detected_ack ='0' and detected_nack ='0' and detected_full ='0') then
					data_word_cnt        <= data_word_cnt + 1;
				end if;
			end if;
		end if;
	end if;
end process p_comb_state;
---------------------------------------------------------
-- Process: p_data_word_detection
-- Description: Words detection and output assignement
---------------------------------------------------------
p_data_word_detection : process(CLK)
begin
	if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
			NEW_WORD_DWI       <= '0';
    	SEQ_NUM_DWI        <= (others=> '0');
    	CRC_16B_DWI        <= (others=> '0');
    	CRC_8B_DWI         <= (others=> '0');
			TYPE_FRAME_DWI     <= (others=> '0');
			DATA_DWI           <= (others=> '0');
			VALID_K_CHARAC_DWI <= (others=> '0');
    	END_FRAME_DWI      <= '0';
			MULTIPLIER_DWI     <= (others=> '0');
			VC_DWI             <= (others=> '0');
			retry_counter      <= (others =>'0');
			DATA_PULSE_RX_DWI  <='0';
    	RETRY_PULSE_RX_DWI <='0';
		else
    	END_FRAME_DWI      <= '0';
			DATA_PULSE_RX_DWI  <='0';
    	RETRY_PULSE_RX_DWI <='0';
			-- Frame treatment
	  	if (FIFO_RX_DATA_VALID_PPL ='1') then
				if DATA_RX_PPL(15 downto 0) = C_SDF_WORD and VALID_K_CHARAC_PPL = "0001" then -- SDF control word detected
	  			TYPE_FRAME_DWI     <= C_DATA_FRM;
	  			NEW_WORD_DWI       <= '1';
					DATA_DWI           <= DATA_RX_PPL;
					VALID_K_CHARAC_DWI <= VALID_K_CHARAC_PPL;
					DATA_PULSE_RX_DWI  <='1';
	  		elsif DATA_RX_PPL(7 downto 0) = C_K28_0_SYMB and VALID_K_CHARAC_PPL = "0001" and current_state /= RX_NOTHING_ST then -- EDF control word detected
	  			TYPE_FRAME_DWI 		 <= C_DATA_FRM;
	  			NEW_WORD_DWI   		 <= '1';
    	    END_FRAME_DWI  		 <= '1';
					DATA_DWI       		 <= DATA_RX_PPL;
	  			SEQ_NUM_DWI    		 <= DATA_RX_PPL(15 downto 8);
	  			CRC_16B_DWI    		 <= DATA_RX_PPL(31 downto 16);
					VALID_K_CHARAC_DWI <= VALID_K_CHARAC_PPL;
					DATA_PULSE_RX_DWI  <='1';
	  		elsif DATA_RX_PPL(15 downto 0) = C_SBF_WORD and VALID_K_CHARAC_PPL = "0001" then -- SBF control word detected
	  			TYPE_FRAME_DWI 		 <= C_BC_FRM;
	  			NEW_WORD_DWI   		 <= '1';
					DATA_DWI       		 <= DATA_RX_PPL;
					VALID_K_CHARAC_DWI <= VALID_K_CHARAC_PPL;
					DATA_PULSE_RX_DWI  <='1';
	  		elsif DATA_RX_PPL(7 downto 0) = C_K28_2_SYMB and VALID_K_CHARAC_PPL = "0001" and current_state /= RX_NOTHING_ST then -- EBF control word detected
	  			TYPE_FRAME_DWI		 <= C_BC_FRM;
	  			NEW_WORD_DWI  		 <= '1';
    	    END_FRAME_DWI 		 <= '1';
					DATA_DWI      		 <= DATA_RX_PPL;
	  			SEQ_NUM_DWI   		 <= DATA_RX_PPL(23 downto 16);
	  			CRC_8B_DWI    		 <= DATA_RX_PPL(31 downto 24);
					VALID_K_CHARAC_DWI <= VALID_K_CHARAC_PPL;
					DATA_PULSE_RX_DWI  <='1';
	  		elsif DATA_RX_PPL(15 downto 0) = C_SIF_WORD and VALID_K_CHARAC_PPL = "0001" then -- SIF control word detected
	  			TYPE_FRAME_DWI 		 <= C_IDLE_FRM;
	  			NEW_WORD_DWI   		 <= '1';
    	    END_FRAME_DWI  		 <= '1';
					DATA_DWI       		 <= DATA_RX_PPL;
	  			SEQ_NUM_DWI    		 <= DATA_RX_PPL(23 downto 16);
	  			CRC_8B_DWI     		 <= DATA_RX_PPL(31 downto 24);
					VALID_K_CHARAC_DWI <= VALID_K_CHARAC_PPL;
	  		elsif DATA_RX_PPL(7 downto 0) = C_K28_3_SYMB and VALID_K_CHARAC_PPL = "0001" then -- FCT control word detected
	  			TYPE_FRAME_DWI 		 <= C_FCT_FRM;
	  			NEW_WORD_DWI   		 <= '1';
    	    END_FRAME_DWI  		 <= '1';
					DATA_DWI       		 <= DATA_RX_PPL;
	  			SEQ_NUM_DWI    		 <= DATA_RX_PPL(23 downto 16);
	  			CRC_8B_DWI     		 <= DATA_RX_PPL(31 downto 24);
					VALID_K_CHARAC_DWI <= VALID_K_CHARAC_PPL;
					MULTIPLIER_DWI     <= DATA_RX_PPL(15 downto 13);
    	    VC_DWI             <= DATA_RX_PPL(12 downto 8);
	  		elsif DATA_RX_PPL(15 downto 0) = C_ACK_WORD and VALID_K_CHARAC_PPL = "0001" then -- ACK control word detected
	  		  TYPE_FRAME_DWI 		 <= C_ACK_FRM;
	  		  NEW_WORD_DWI   		 <= '1';
    	    END_FRAME_DWI  		 <= '1';
					DATA_DWI       		 <= DATA_RX_PPL;
	  		  SEQ_NUM_DWI    		 <= DATA_RX_PPL(23 downto 16);
	  		  CRC_8B_DWI     		 <= DATA_RX_PPL(31 downto 24);
					VALID_K_CHARAC_DWI <= VALID_K_CHARAC_PPL;
	  		elsif DATA_RX_PPL(15 downto 0) = C_NACK_WORD and VALID_K_CHARAC_PPL = "0001" then -- NACK control word detected
	  		  TYPE_FRAME_DWI 		 <= C_NACK_FRM;
	  		  NEW_WORD_DWI   		 <= '1';
    	    END_FRAME_DWI  		 <= '1';
					DATA_DWI       		 <= DATA_RX_PPL;
	  		  SEQ_NUM_DWI    		 <= DATA_RX_PPL(23 downto 16);
	  		  CRC_8B_DWI     		 <= DATA_RX_PPL(31 downto 24);
					VALID_K_CHARAC_DWI <= VALID_K_CHARAC_PPL;
	  		elsif DATA_RX_PPL(15 downto 0) = C_FULL_WORD and VALID_K_CHARAC_PPL = "0001" then -- FULL control word detected
	  		  TYPE_FRAME_DWI     <= C_FULL_FRM;
	  		  NEW_WORD_DWI       <= '1';
    	    END_FRAME_DWI      <= '1';
					DATA_DWI           <= DATA_RX_PPL;
	  		  SEQ_NUM_DWI        <= DATA_RX_PPL(23 downto 16);
	  		  CRC_8B_DWI         <= DATA_RX_PPL(31 downto 24);
					VALID_K_CHARAC_DWI <= VALID_K_CHARAC_PPL;
	  		elsif DATA_RX_PPL = C_RETRY_WORD and VALID_K_CHARAC_PPL = "0001" then -- RETRY control word detected
	  		  TYPE_FRAME_DWI 		 <= C_RETRY_FRM;
	  		  NEW_WORD_DWI   		 <= '1';
					DATA_DWI       		 <= DATA_RX_PPL;
	  		  SEQ_NUM_DWI    		 <= DATA_RX_PPL(23 downto 16);
	  		  CRC_8B_DWI     		 <= DATA_RX_PPL(31 downto 24);
					VALID_K_CHARAC_DWI <= VALID_K_CHARAC_PPL;
					retry_counter      <= retry_counter + 1;
    	    RETRY_PULSE_RX_DWI <='1';
	  		elsif DATA_RX_PPL = C_RXERR_WORD and VALID_K_CHARAC_PPL = "0001" and current_state /= RX_IDLE_FRAME_ST and current_state /= RX_NOTHING_ST then -- RXERR control word detected
    	    NEW_WORD_DWI   <= '1';
				elsif DATA_RX_PPL = C_RXERR_WORD and VALID_K_CHARAC_PPL = "0001" then -- RXERR control word detected
    	    NEW_WORD_DWI   <= '0';
				elsif current_state = RX_IDLE_FRAME_ST or current_state= RX_NOTHING_ST then
						DATA_DWI           <= (others=> '0');
						VALID_K_CHARAC_DWI <= (others=> '0');
						NEW_WORD_DWI       <= '0';
    	  elsif current_state = RX_DATA_FRAME_ST then
					TYPE_FRAME_DWI 		 <= C_DATA_FRM;
    	    DATA_DWI           <= DATA_RX_PPL;
					VALID_K_CHARAC_DWI <= VALID_K_CHARAC_PPL;
    	    NEW_WORD_DWI       <= '1';
					DATA_PULSE_RX_DWI  <='1';
				elsif current_state = RX_BROADCAST_AND_DATA_FRAME_ST or current_state = RX_BROADCAST_FRAME_ST then
					TYPE_FRAME_DWI 		 <= C_BC_FRM;
    	    DATA_DWI           <= DATA_RX_PPL;
					VALID_K_CHARAC_DWI <= VALID_K_CHARAC_PPL;
    	    NEW_WORD_DWI       <= '1';
					DATA_PULSE_RX_DWI  <='1';
				else
					DATA_DWI           <= (others=> '0');
					VALID_K_CHARAC_DWI <= (others=> '0');
    	    NEW_WORD_DWI       <= '0';
	  		end if;
    	else
    	  NEW_WORD_DWI     <= '0';
	  	end if;
		end if;
	end if;
end process p_data_word_detection;

---------------------------------------------------------
-- Process: p_fifo_rd_ppl
-- Description: Read frames from the fifo
---------------------------------------------------------
p_fifo_rd_ppl: process(CLK)
begin
	if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
			FIFO_RX_RD_EN_DL <= '0';
		else
			FIFO_RX_RD_EN_DL <= '1';
		end if;
	end if;
end process p_fifo_rd_ppl;

end architecture rtl;