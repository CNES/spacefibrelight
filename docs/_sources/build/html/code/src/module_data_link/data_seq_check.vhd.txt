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
-- Description : This module checks the validity of the SEQ_num
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_seq_check is
  port (
    CLK                       : in std_logic;                                           --! Global clock
		-- data_link_reset (DLRE) interface
		LINK_RESET_DLRE           : in std_logic;                                           --! Link Reset command
    -- data_crc_check (DCCHECK) interface
    DATA_DCCHECK              : in std_logic_vector(C_DATA_LENGTH-1 downto 0);          --! Data parallel from data_crc_check
		VALID_K_CHARAC_DCCHECK    : in std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);  --! K character valid in the 32-bit DATA_DCCHECK vector
		NEW_WORD_DCCHECK          : in std_logic;                                           --! New word Flag associated with DATA_DCCHECK vector
    END_FRAME_DCCHECK         : in std_logic;                                           --! End frame/control word from data_crc_check
    TYPE_FRAME_DCCHECK        : in std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);    --! Current frame/control word type from data_crc_check
    SEQ_NUM_DCCHECK           : in std_logic_vector(7 downto 0);                        --! SEQ_NUM from data_crc_check
		CRC_ERR_DCCHECK           : in std_logic;                                           --! CRC error flag from data_crc_check
		FRAME_ERR_DCCHECK         : in std_logic;																					  --! Frame error flag from data_crc_check
		MULTIPLIER_DCCHECK        : in std_logic_vector(C_MULT_SIZE-1 downto 0);            --! Multiplier value of the current FCT word
		VC_DCCHECK                : in std_logic_vector(C_CHANNEL_SIZE-1 downto 0);         --! Virtual Channel of the current FCT word
		RXERR_DCCHECK             : in std_logic;                                           --! RXERR flag detection
    RXERR_ALL_DCCHECK         : in std_logic;                                           --! RXERR flag detection during broadcast and data frame status
		-- data_err_management (DERRM) interface
		NEAR_END_RPF_DERRM        : in  std_logic;                                          --! Near-End received polarity flag
		SEQ_NUM_ACK_DSCHECK       : out std_logic_vector(6 downto 0);                       --! SEQ_NUM ACK value
		END_FRAME_DSCHECK         : out std_logic;                                          --! End flag of the current frame/control word
		TYPE_FRAME_DSCHECK        : out std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);   --! Current frame/control word type
		TRANS_POL_FLG_DERRM       : in  std_logic;                                          --! Transmission polarity flag
		CRC_ERR_DSCHECK           : out std_logic;                                          --! CRC error flag for the current frame/control word
		FRAME_ERR_DSCHECK         : out std_logic;                                          --! Frame error flag for the current frame/control word
		SEQ_NUM_ERR_DSCHECK       : out std_logic;                                          --! SEQ_NUM error for the current frame/control word
		RXERR_DSCHECK             : out std_logic;                                          --! RXERR flag for the current frame/control word
    -- data_mid_buffer (DMBUF) interface
    DATA_DSCHECK              : out std_logic_vector(C_DATA_LENGTH-1 downto 0);         --! Data parallel to data_mid_buffer (data frame)
		VALID_K_CHARAC_DSCHECK    : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0); --! K character valid in the 32-bit DATA_DSCHECK vector
    NEW_WORD_DSCHECK          : out std_logic;                                          --! New word flag associated with DATA_DSCHECK vector
    END_FRAME_FIFO_DSCHECK    : out std_logic;                                          --! End data frame flag
		FRAME_ERR_DATA_DSCHECK    : out std_logic;                                          --! Frame error flag for the current data frame
    SEQ_NUM_ERR_DATA_DSCHECK  : out std_logic;                                          --! SEQ_NUM error for the current data frame
    CRC_ERR_DATA_DSCHECK      : out std_logic;                                          --! CRC error flag for the current data frame
		RXERR_DATA_DSCHECK        : out std_logic;                                          --! RXERR flag for the current data frame
		-- data_mid_buffer_bc (DMBUFBC) interface
		DATA_BC_DSCHECK           : out std_logic_vector(C_DATA_LENGTH-1 downto 0);         --! Data parallel to data_mid_buffer_bc (broadcast frame)
		VALID_K_CHARAC_BC_DSCHECK : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0); --! K character valid in the 32-bit DATA_BC_DSCHECK vector
    NEW_WORD_BC_DSCHECK       : out std_logic;                                          --! New word flag associated with DATA_BC_DSCHECK vector
    END_FRAME_FIFO_BC_DSCHECK : out std_logic;                                          --! End broadcast frame flag
		FRAME_ERR_BC_DSCHECK      : out std_logic;                                          --! Frame error flag for the current broadcast frame
		SEQ_NUM_ERR_BC_DSCHECK    : out std_logic;                                          --! SEQ_NUM error for the current broadcast frame
		CRC_ERR_BC_DSCHECK        : out std_logic;                                          --! CRC error flag for the current broadcast frame
		RXERR_BC_DSCHECK          : out std_logic;                                          --! RXERR flag for the current broadcast frame
		-- data_out_buff (DOBUF) interface
		FCT_FAR_END_DSCHECK       : out std_logic_vector(C_VC_NUM-1 downto 0);              --! FCT received flag for each virtual channel
		M_VAL_DSCHECK             : out std_logic_vector(C_M_SIZE-1 downto 0);              --! M value associated with FCT_FAR_END_DSCHECK
		-- MIB
		SEQ_NUM_DSCHECK           : out std_logic_vector(7 downto 0);                       --! last SEQ_NUM
		NACK_SEQ_NUM_DSCHECK      : out std_logic_vector(7 downto 0);                       --! last NACK SEQ_NUM
    ACK_SEQ_NUM_DSCHECK       : out std_logic_vector(7 downto 0);                       --! last ACK SEQ_NUM
		ACK_COUNTER_RX_DSCHECK    : out std_logic_vector(2 downto 0);                       --! ACK counter RX
    NACK_COUNTER_RX_DSCHECK   : out std_logic_vector(2 downto 0);                       --! NACK counter RX
    FCT_COUNTER_RX_DSCHECK    : out std_logic_vector(3 downto 0);                       --! FCT counter RX
    FULL_COUNTER_RX_DSCHECK   : out std_logic_vector(1 downto 0);                       --! FULL counter RX
		ACK_PULSE_RX_DSCHECK      : out std_logic;                                          --! New ACK received flag
		NACK_PULSE_RX_DSCHECK     : out std_logic;                                          --! New NACK received flag
		FCT_PULSE_RX_DSCHECK      : out std_logic;                                          --! New FCT received flag
		FULL_PULSE_RX_DSCHECK     : out std_logic                                           --! New FULL received flag
  );
end data_seq_check;

architecture rtl of data_seq_check is
---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------

signal seq_num_cnt    : unsigned(6 downto 0);
signal ack_counter    : unsigned(2 downto 0);
signal nack_counter   : unsigned(2 downto 0);
signal fct_counter    : unsigned(3 downto 0);
signal full_counter   : unsigned(1 downto 0);

begin
--------------------------------------------------------
--                  Assignements                     ---
--------------------------------------------------------
	SEQ_NUM_ACK_DSCHECK      <= std_logic_vector(seq_num_cnt);
	ACK_COUNTER_RX_DSCHECK   <= std_logic_vector(ack_counter);
	NACK_COUNTER_RX_DSCHECK  <= std_logic_vector(nack_counter);
	FCT_COUNTER_RX_DSCHECK   <= std_logic_vector(fct_counter);
	FULL_COUNTER_RX_DSCHECK  <= std_logic_vector(full_counter);
---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_seq_num
-- Description: Checks the SEQ_NUM for each frame
---------------------------------------------------------
p_seq_num: process(CLK)
begin
  if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
	  	seq_num_cnt               <= (others => '0'); -- Reset seq_num_cnt	on link reset
    	SEQ_NUM_ERR_DSCHECK       <= '0';
			SEQ_NUM_DSCHECK           <= (others => '0');
			FRAME_ERR_DSCHECK         <= '0';
			TYPE_FRAME_DSCHECK        <= (others => '0');
			CRC_ERR_DSCHECK           <= '0';
			NEW_WORD_DSCHECK          <= '0';
			DATA_DSCHECK              <= (others => '0');
			VALID_K_CHARAC_DSCHECK    <= (others => '0');
			END_FRAME_FIFO_DSCHECK    <= '0';
			END_FRAME_DSCHECK         <= '0';
			FRAME_ERR_DATA_DSCHECK    <= '0';
    	SEQ_NUM_ERR_DATA_DSCHECK  <= '0';
    	CRC_ERR_DATA_DSCHECK      <= '0';
			RXERR_DATA_DSCHECK        <= '0';
			NEW_WORD_BC_DSCHECK       <= '0';
			DATA_BC_DSCHECK           <= (others => '0');
			VALID_K_CHARAC_BC_DSCHECK <= (others => '0');
			END_FRAME_FIFO_BC_DSCHECK <= '0';
			FRAME_ERR_BC_DSCHECK      <= '0';
    	SEQ_NUM_ERR_BC_DSCHECK    <= '0';
    	CRC_ERR_BC_DSCHECK        <= '0';
			RXERR_BC_DSCHECK          <= '0';
			FCT_FAR_END_DSCHECK       <= (others => '0');
    	M_VAL_DSCHECK             <= (others => '0');
			RXERR_DSCHECK             <= '0';
			NACK_SEQ_NUM_DSCHECK      <= (others => '0');
			ACK_SEQ_NUM_DSCHECK       <= (others => '0');
			ACK_PULSE_RX_DSCHECK      <= '0';
    	NACK_PULSE_RX_DSCHECK     <= '0';
    	FCT_PULSE_RX_DSCHECK      <= '0';
    	FULL_PULSE_RX_DSCHECK     <= '0';
			ack_counter               <= (others =>'0');
			nack_counter              <= (others =>'0');
			fct_counter               <= (others =>'0');
			full_counter              <= (others =>'0');
		else
			SEQ_NUM_ERR_DSCHECK     <= '0';
			-- Transmission signals to data_err_management
			CRC_ERR_DSCHECK          <= CRC_ERR_DCCHECK;
			TYPE_FRAME_DSCHECK       <= TYPE_FRAME_DCCHECK;
    	FRAME_ERR_DSCHECK        <= FRAME_ERR_DCCHECK;
			SEQ_NUM_DSCHECK          <= SEQ_NUM_DCCHECK;
			RXERR_DSCHECK            <= RXERR_DCCHECK;
			-- Data Frame signals
			DATA_DSCHECK              <= (others => '0');
			VALID_K_CHARAC_DSCHECK    <= (others => '0');
			NEW_WORD_DSCHECK          <= '0';
			END_FRAME_FIFO_DSCHECK    <= '0';
			END_FRAME_DSCHECK         <= '0';
			FRAME_ERR_DATA_DSCHECK    <= '0';
    	SEQ_NUM_ERR_DATA_DSCHECK  <= '0';
    	CRC_ERR_DATA_DSCHECK      <= '0';
			RXERR_DATA_DSCHECK        <= '0';
			-- Broadcast frame signals
			NEW_WORD_BC_DSCHECK       <= '0';
			DATA_BC_DSCHECK           <= (others => '0');
			VALID_K_CHARAC_BC_DSCHECK <= (others => '0');
			END_FRAME_FIFO_BC_DSCHECK <= '0';
			FRAME_ERR_BC_DSCHECK      <= '0';
    	SEQ_NUM_ERR_BC_DSCHECK    <= '0';
    	CRC_ERR_BC_DSCHECK        <= '0';
			RXERR_BC_DSCHECK          <= '0';
			-- FCT Signals
			FCT_FAR_END_DSCHECK       <= (others => '0');
    	M_VAL_DSCHECK             <= (others => '0');
			-- Pulse signals
			ACK_PULSE_RX_DSCHECK      <= '0';
    	NACK_PULSE_RX_DSCHECK     <= '0';
    	FCT_PULSE_RX_DSCHECK      <= '0';
    	FULL_PULSE_RX_DSCHECK     <= '0';
			-- SEQ_NUM verification
	  	if TYPE_FRAME_DCCHECK = C_DATA_FRM  then -- DATA frame
				RXERR_DATA_DSCHECK        <= RXERR_DCCHECK or RXERR_ALL_DCCHECK;
				FRAME_ERR_DATA_DSCHECK    <= FRAME_ERR_DCCHECK;
				CRC_ERR_DATA_DSCHECK      <= CRC_ERR_DCCHECK;
				if END_FRAME_DCCHECK = '1' and FRAME_ERR_DCCHECK = '0' then -- End of frame
					if SEQ_NUM_DCCHECK /= (NEAR_END_RPF_DERRM & std_logic_vector(seq_num_cnt+1)) then -- SEQ_NUM error
						SEQ_NUM_ERR_DSCHECK       <= '1';
						SEQ_NUM_ERR_DATA_DSCHECK  <= '1';
						END_FRAME_FIFO_DSCHECK    <= END_FRAME_DCCHECK;
						END_FRAME_DSCHECK         <= END_FRAME_DCCHECK;
						NEW_WORD_DSCHECK          <= NEW_WORD_DCCHECK;
					elsif CRC_ERR_DCCHECK ='1' then -- CRC error
						SEQ_NUM_ERR_DSCHECK       <= '0';
						SEQ_NUM_ERR_DATA_DSCHECK  <= '0';
						END_FRAME_FIFO_DSCHECK    <= END_FRAME_DCCHECK;
						END_FRAME_DSCHECK         <= END_FRAME_DCCHECK;
						NEW_WORD_DSCHECK          <= NEW_WORD_DCCHECK;
					else -- DATA frame valid
						seq_num_cnt               <= seq_num_cnt+1;
						SEQ_NUM_ERR_DSCHECK       <= '0';
						SEQ_NUM_ERR_DATA_DSCHECK  <= '0';
						NEW_WORD_DSCHECK          <= NEW_WORD_DCCHECK;
						DATA_DSCHECK              <= DATA_DCCHECK;
						VALID_K_CHARAC_DSCHECK    <= VALID_K_CHARAC_DCCHECK;
						END_FRAME_FIFO_DSCHECK    <= END_FRAME_DCCHECK;
						END_FRAME_DSCHECK         <= END_FRAME_DCCHECK;
    	  	end if;
				else -- Receiving frame
					NEW_WORD_DSCHECK          <= NEW_WORD_DCCHECK;
					DATA_DSCHECK              <= DATA_DCCHECK;
					VALID_K_CHARAC_DSCHECK    <= VALID_K_CHARAC_DCCHECK;
					END_FRAME_FIFO_DSCHECK    <= END_FRAME_DCCHECK;
					END_FRAME_DSCHECK         <= END_FRAME_DCCHECK;
				end if;
			elsif TYPE_FRAME_DCCHECK = C_BC_FRM then -- BROADCAST frame
				RXERR_BC_DSCHECK     <= RXERR_DCCHECK or RXERR_ALL_DCCHECK;
				FRAME_ERR_BC_DSCHECK <= FRAME_ERR_DCCHECK;
    	  CRC_ERR_BC_DSCHECK   <= CRC_ERR_DCCHECK;
				if END_FRAME_DCCHECK = '1' and FRAME_ERR_DCCHECK = '0' then -- End of frame
				  if SEQ_NUM_DCCHECK /= (NEAR_END_RPF_DERRM & std_logic_vector(seq_num_cnt+1)) then -- SEQ_NUM error
				  	SEQ_NUM_ERR_DSCHECK       <= '1';
				  	SEQ_NUM_ERR_BC_DSCHECK    <= '1';
				  	END_FRAME_FIFO_BC_DSCHECK <= END_FRAME_DCCHECK;
				  	END_FRAME_DSCHECK         <= END_FRAME_DCCHECK;
						NEW_WORD_BC_DSCHECK       <= NEW_WORD_DCCHECK;
				  elsif CRC_ERR_DCCHECK ='1' then -- CRC error
				  	SEQ_NUM_ERR_DSCHECK       <= '0';
				  	SEQ_NUM_ERR_BC_DSCHECK    <= '0';
				  	END_FRAME_FIFO_BC_DSCHECK <= END_FRAME_DCCHECK;
				  	END_FRAME_DSCHECK         <= END_FRAME_DCCHECK;
						NEW_WORD_BC_DSCHECK       <= NEW_WORD_DCCHECK;
				  else -- BROADCAST frame valid 
				  	seq_num_cnt               <= seq_num_cnt+1;
				  	SEQ_NUM_ERR_DSCHECK       <= '0';
				  	SEQ_NUM_ERR_BC_DSCHECK    <= '0';
				  	NEW_WORD_BC_DSCHECK       <= NEW_WORD_DCCHECK;
				  	DATA_BC_DSCHECK           <= DATA_DCCHECK;
				  	VALID_K_CHARAC_BC_DSCHECK <= VALID_K_CHARAC_DCCHECK;
				  	END_FRAME_FIFO_BC_DSCHECK <= END_FRAME_DCCHECK;
				  	END_FRAME_DSCHECK         <= END_FRAME_DCCHECK;
				  end if;
				else -- Receiving frame
					NEW_WORD_BC_DSCHECK       <= NEW_WORD_DCCHECK;
					DATA_BC_DSCHECK           <= DATA_DCCHECK;
					VALID_K_CHARAC_BC_DSCHECK <= VALID_K_CHARAC_DCCHECK;
					END_FRAME_FIFO_BC_DSCHECK <= END_FRAME_DCCHECK;
					END_FRAME_DSCHECK         <= END_FRAME_DCCHECK;
				end if;
			elsif TYPE_FRAME_DCCHECK = C_FCT_FRM and END_FRAME_DCCHECK = '1' then -- FCT verification
				if SEQ_NUM_DCCHECK /= (NEAR_END_RPF_DERRM & std_logic_vector(seq_num_cnt+1)) then -- SEQ_NUM error
					SEQ_NUM_ERR_DSCHECK    <= '1';
					END_FRAME_DSCHECK      <= END_FRAME_DCCHECK;
				elsif CRC_ERR_DCCHECK ='1' then -- CRC error
					SEQ_NUM_ERR_DSCHECK  <= '0';
					END_FRAME_DSCHECK    <= END_FRAME_DCCHECK;
				else -- FCT valid 
					FCT_PULSE_RX_DSCHECK <= '1';
					fct_counter          <= fct_counter + 1;
					seq_num_cnt                                           <= seq_num_cnt+1;
					SEQ_NUM_ERR_DSCHECK                                   <= '0';
					END_FRAME_DSCHECK                                     <= END_FRAME_DCCHECK;
					FCT_FAR_END_DSCHECK(to_integer(unsigned(VC_DCCHECK))) <= '1';
					M_VAL_DSCHECK                                         <= std_logic_vector(unsigned('0' & MULTIPLIER_DCCHECK)+1);
				end if;
	  	elsif TYPE_FRAME_DCCHECK = C_IDLE_FRM   and END_FRAME_DCCHECK = '1'then -- IDLE verification
				if SEQ_NUM_DCCHECK /= (NEAR_END_RPF_DERRM & std_logic_vector(seq_num_cnt))  and FRAME_ERR_DCCHECK = '0' then -- SEQ_NUM error
					SEQ_NUM_ERR_DSCHECK    <= '1';
					END_FRAME_DSCHECK      <= END_FRAME_DCCHECK;
				else -- SEQ_NUM valid => IDLE valid
					SEQ_NUM_ERR_DSCHECK    <= '0';
					END_FRAME_DSCHECK      <= END_FRAME_DCCHECK;
    	  end if;
			elsif TYPE_FRAME_DCCHECK = C_FULL_FRM  and END_FRAME_DCCHECK = '1'then -- FULL verification
				if SEQ_NUM_DCCHECK /= (NEAR_END_RPF_DERRM & std_logic_vector(seq_num_cnt)) then -- SEQ_NUM error
					SEQ_NUM_ERR_DSCHECK    <= '1';
					END_FRAME_DSCHECK      <= END_FRAME_DCCHECK;
				else -- SEQ_NUM valid => FULL valid
					SEQ_NUM_ERR_DSCHECK    <= '0';
					END_FRAME_DSCHECK      <= END_FRAME_DCCHECK;
					if (CRC_ERR_DCCHECK='0') then
					  full_counter          <= full_counter + 1;
						FULL_PULSE_RX_DSCHECK <= '1';
					end if;
    	  end if;
			elsif (TYPE_FRAME_DCCHECK = C_NACK_FRM or TYPE_FRAME_DCCHECK = C_ACK_FRM) and  END_FRAME_DCCHECK = '1'then -- ACK/ NACK verification
				if SEQ_NUM_DCCHECK(7) /= TRANS_POL_FLG_DERRM then -- SEQ_NUM error
					SEQ_NUM_ERR_DSCHECK    <= '1';
					END_FRAME_DSCHECK      <= END_FRAME_DCCHECK;
				else
					SEQ_NUM_ERR_DSCHECK    <= '0';
					END_FRAME_DSCHECK      <= END_FRAME_DCCHECK;
					if CRC_ERR_DCCHECK ='0' then -- ACK/NACK valid
					  if TYPE_FRAME_DCCHECK = C_NACK_FRM then -- Update  (MIB)
					  	NACK_SEQ_NUM_DSCHECK  <= SEQ_NUM_DCCHECK;
							nack_counter          <= nack_counter + 1;
							NACK_PULSE_RX_DSCHECK <= '1';
					  else                                    -- Update (MIB)
					  	ACK_SEQ_NUM_DSCHECK  <= SEQ_NUM_DCCHECK;
							ack_counter          <= ack_counter + 1;
							ACK_PULSE_RX_DSCHECK <= '1';
					  end if;
					end if;
				end if;
			else
				SEQ_NUM_ERR_DSCHECK    <= '0';
				NEW_WORD_DSCHECK       <= NEW_WORD_DCCHECK;
				DATA_DSCHECK           <= DATA_DCCHECK;
				VALID_K_CHARAC_DSCHECK <= VALID_K_CHARAC_DCCHECK;
				END_FRAME_FIFO_DSCHECK <= END_FRAME_DCCHECK;
				END_FRAME_DSCHECK      <= END_FRAME_DCCHECK;
	  	end if;
		end if;
	end if;
end process p_seq_num;

end architecture rtl;