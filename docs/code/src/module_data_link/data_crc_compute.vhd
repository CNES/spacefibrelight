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
-- Description : This module calculates the CRC for each frame
----------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_crc_compute is
 	port (
    CLK                   : in  std_logic;                                          --! Global Clock
    -- data_link_reset (DLRE) interface
    LINK_RESET_DLRE       : in  std_logic;                                          --! Link Reset command
    -- phy_plus_lane (PPL) interface
    LANE_ACTIVE_PPL       : in  std_logic;                                          --! Lane Active flag for the DATA Link Layer
   	-- data_seq_compute (DSCOM) interface
		NEW_WORD_DSCOM        : in  std_logic;                                          --! New word flag associated with DATA_DSCOM
		DATA_DSCOM            : in  std_logic_vector(C_DATA_LENGTH-1 downto 0);         --! Data parallel from data_seq_compute
		VALID_K_CHARAC_DSCOM  : in  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0); --! K charachter valid in the 32-bit DATA_DSCOM vector
		TYPE_FRAME_DSCOM      : in  std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);   --! Type of the frame associated with DATA_DSCOM
		END_FRAME_DSCOM       : in  std_logic;                                          --! End frame/control word associated with DATA_DSCOM
		-- FIFO_TX_LANE interface
		FIFO_FULL_TX_LANE     : in  std_logic;                                          --! Fifo TX full flag from the lane layer
		VALID_K_CHARAC_DCCOM  : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0); --! Data parallel to lane layer
		DATA_DCCOM            : out std_logic_vector(C_DATA_LENGTH-1 downto 0);         --! K charachter valid in the 32-bit DATA_DCCOM vector
		NEW_WORD_DCCOM        : out std_logic                                           --! New word Flag associated with DATA_DCCOM
 	);
end data_crc_compute;

architecture rtl of data_crc_compute is
---------------------------------------------------------
-----                  Signal declaration           -----
---------------------------------------------------------
  -- Arrays to identify usefull byte
  type int_array      is array (0 to 3) of integer;
  type int_array_tier is array (0 to 2) of integer;
  type int_array_dem  is array (0 to 1) of integer;
  signal indices                : int_array      := (0, 8, 16, 24);
  signal indices_tier           : int_array_tier := (0, 8, 16);
  signal indices_dem            : int_array_dem  := (0, 8);
  -- CRC 16 Bits compute
  signal crc_reg_16b            : std_logic_vector(16-1 downto 0);
  signal crc_reg_16b_comp       : std_logic_vector(16-1 downto 0);
  signal crc_to_inv_16b         : std_logic;
  -- CRC 8 Bits compute
  signal crc_reg_8b             : std_logic_vector(8-1 downto 0);
  signal crc_reg_8b_comp        : std_logic_vector(8-1 downto 0);
  signal crc_to_inv_8b          : std_logic;
  -- control signals
  signal end_frame_dscom_prev   : std_logic;
  signal new_word_dccom_i       : std_logic;
  signal type_frame_dscom_r     : std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);
  signal data_dscom_r           : std_logic_vector(C_DATA_LENGTH-1 downto 0);
  signal valid_k_charac_dscom_r : std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);
begin


---------------------------------------------------------
-----                     Process                   -----
---------------------------------------------------------
---------------------------------------------------------
-- Process: p_crc_16b
-- Description: Computes the CRC for a data frame
---------------------------------------------------------
p_crc_16b: process(CLK)
	variable crc_var : std_logic_vector(15 downto 0); -- variable used to calculate the CRC
begin
  if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
			crc_reg_16b        <= (others => '1'); -- Reset CRC to seed value
			crc_reg_16b_comp   <= (others => '1'); -- Reset CRC to seed value
			crc_to_inv_16b     <= '0';
		elsif LANE_ACTIVE_PPL= '1' then
			crc_var        := crc_reg_16b_comp;
			crc_to_inv_16b <= '0';
			if (TYPE_FRAME_DSCOM = C_DATA_FRM) then
				if END_FRAME_DSCOM = '1' and NEW_WORD_DSCOM = '1'then -- Last word
					crc_to_inv_16b <='1';
					-- calculates the crc 16-bit byte by byte
					for i in indices_dem'range loop
							crc_var := calculate_crc_16(DATA_DSCOM(7+ indices_dem(i) downto 0 + indices_dem(i)), crc_var);
					end loop;
					crc_reg_16b_comp   <= (others => '1'); -- Reset CRC to seed value
					crc_reg_16b        <= crc_var;
				elsif NEW_WORD_DSCOM = '1' then
					-- calculates the crc 16-bit byte by byte
					for i in indices'range loop
							crc_var := calculate_crc_16(DATA_DSCOM(7+ indices(i) downto 0 + indices(i)), crc_var);
					end loop;
						crc_reg_16b_comp <= crc_var;
				end if;
			end if;
		end if;
	end if;
end process p_crc_16b;
---------------------------------------------------------
-- Process: p_crc_8b
-- Description: Computes the CRC for broadcast frame,
--              FCT, ACK, NACK and SIF
---------------------------------------------------------
p_crc_8b: process(CLK)
	variable crc_var : std_logic_vector(7 downto 0); -- variable used to calculate the CRC
begin
	if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
			crc_reg_8b      <= (others => '0'); -- Reset CRC to seed value
			crc_reg_8b_comp <= (others => '0'); -- Reset CRC to seed value
			crc_to_inv_8b   <= '0';
		elsif LANE_ACTIVE_PPL= '1' then
			crc_var       := crc_reg_8b_comp;
			crc_to_inv_8b <= '0';
			if TYPE_FRAME_DSCOM = C_BC_FRM then -- Broadcast frame
				if END_FRAME_DSCOM = '1'and NEW_WORD_DSCOM = '1'then -- Last word
				crc_to_inv_8b <= '1';
				 -- calculates the crc 8-bit byte by byte
				 for i in indices_tier'range loop
					 crc_var := calculate_crc_8(DATA_DSCOM(7+ indices_tier(i) downto 0 + indices_tier(i)), crc_var);
				 end loop;
				 crc_reg_8b_comp <= (others => '0'); -- Reset CRC to seed value
				 crc_reg_8b      <= crc_var;
				elsif NEW_WORD_DSCOM = '1' then
				 -- calculates the crc 8-bit byte by byte
				 for i in indices'range loop
						 crc_var := calculate_crc_8(DATA_DSCOM(7+ indices(i) downto 0 + indices(i)), crc_var);
				 end loop;
				crc_reg_8b_comp <= crc_var;
				end if;
			elsif END_FRAME_DSCOM = '1'and NEW_WORD_DSCOM = '1'then -- Control word
				crc_to_inv_8b <= '1';
				 -- calculates the crc 8-bit byte by byte
				 for i in indices_tier'range loop
					 crc_var := calculate_crc_8(DATA_DSCOM(7+ indices_tier(i) downto 0 + indices_tier(i)), crc_var);
				 end loop;
				 crc_reg_8b_comp <= (others => '0'); -- Reset CRC to seed value
				 crc_reg_8b      <= crc_var;
			elsif DATA_DSCOM(15 downto 0) = C_SIF_WORD and VALID_K_CHARAC_DSCOM = "0001" and NEW_WORD_DSCOM = '1'then -- SIF
				crc_to_inv_8b <= '1';
				 -- calculates the crc 8_bit byte by byte
				 for i in indices_tier'range loop
					 crc_var := calculate_crc_8(DATA_DSCOM(7+ indices_tier(i) downto 0 + indices_tier(i)), crc_var);
				 end loop;
				 crc_reg_8b_comp <= (others => '0'); -- Reset CRC to seed value
				 crc_reg_8b      <= crc_var;
			end if;
		end if;
	end if;
end process p_crc_8b;



---------------------------------------------------------
-- Process: p_crc_inv
-- Description: Last operation of the CRC calculation
--              (Bit-by-bit inversion)
---------------------------------------------------------
p_crc_inv: process(CLK)
	variable crc_var_16b : std_logic_vector(15 downto 0);
	variable crc_var_8b  : std_logic_vector(7 downto 0);
begin
	if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
			DATA_DCCOM             <= (others => '0');
			valid_k_charac_dscom_r <= (others => '0');
			VALID_K_CHARAC_DCCOM   <= (others => '0');
			type_frame_dscom_r     <= (others => '0');
			data_dscom_r           <= (others => '0');
			new_word_dccom_i       <= '0';
			NEW_WORD_DCCOM         <= '0';
		elsif LANE_ACTIVE_PPL= '1' then
			new_word_dccom_i       <= NEW_WORD_DSCOM;
			valid_k_charac_dscom_r <= VALID_K_CHARAC_DSCOM;
			VALID_K_CHARAC_DCCOM   <= valid_k_charac_dscom_r;
			type_frame_dscom_r     <= TYPE_FRAME_DSCOM;
			data_dscom_r           <= DATA_DSCOM;
			NEW_WORD_DCCOM         <=  new_word_dccom_i;
			if type_frame_dscom_r = C_DATA_FRM  and new_word_dccom_i = '1' then -- Data frame
	  	  if crc_to_inv_16b = '1' then
					-- Bit-by-bit inversion
			  	for i in 0 to 15 loop
			  		crc_var_16b(i) := crc_reg_16b(15 - i);
			  	end loop;
					DATA_DCCOM <= crc_var_16b & data_dscom_r (15 downto 0);
				else
					DATA_DCCOM <= data_dscom_r;
				end if;
			elsif new_word_dccom_i = '1' then -- Other than data frame
				if crc_to_inv_8b = '1' then
					-- Bit-by-bit inversion
					for i in 0 to 7 loop
						crc_var_8b(i) := crc_reg_8b(7 - i);
					end loop;
					DATA_DCCOM <= crc_var_8b & data_dscom_r (23 downto 0);
				else
					DATA_DCCOM <= data_dscom_r;
				end if;
			else
				DATA_DCCOM <= data_dscom_r;
			end if;
		else
			NEW_WORD_DCCOM         <= '0';
			new_word_dccom_i       <= '0';
		end if;
	end if;
end process p_crc_inv;
---------------------------------------------------------
-- Process: p_end_frame_prev
-- Description: Copy END_FRAME_DSCOM
---------------------------------------------------------
p_end_frame_prev: process(CLK)
begin
	if rising_edge(CLK)  then
    if LINK_RESET_DLRE ='1' then
		  end_frame_dscom_prev <= '0';
	  elsif LANE_ACTIVE_PPL= '1' then
		  end_frame_dscom_prev <= END_FRAME_DSCOM;
		end if;
	end if;
end process p_end_frame_prev;

end architecture rtl;