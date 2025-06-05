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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library data_link_lib;
use data_link_lib.data_link_lib.all;

entity data_crc_check_tb is
end data_crc_check_tb;

architecture Behavioral of data_crc_check_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component data_crc_check
        port (
            RST_N                  : in  std_logic;                                           --! Global reset
            CLK                    : in  std_logic;                                           --! Global clock
            -- data_word_identification (DWI) interface
            DATA_DWI               : in  std_logic_vector(C_DATA_LENGTH-1 downto 0);          --! Data parallel from daata_word_id_fsm
            VALID_K_CHARAC_DWI     : in  std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);  --! K charachter valid in the 32-bit DATA_DWI vector
            NEW_WORD_DWI           : in  std_logic;                                           --! New word Flag from data_word_id_fsm
            END_FRAME_DWI          : in  std_logic;                                           --! End frame/control word from data_word_id_fsm
            SEQ_NUM_DWI            : in  std_logic_vector(7 downto 0);                        --! SEQ_NUM from data_word_id_fsm
            CRC_16B_DWI            : in  std_logic_vector(15 downto 0);                       --! 16 bits CRC (data frame)  from data_word_id_fsm
            CRC_8B_DWI             : in  std_logic_vector(7 downto 0);                        --! 8 bits CRC from data_word_id_fsm
            TYPE_FRAME_DWI         : in  std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);    --! Current frame/control word type from data_word_id_fsm
            FRAME_ERR_DWI          : in std_logic;
            -- data_seq_check (DSCHECK) interface
            NEW_WORD_DCCHECK       : out std_logic;                                           --! New word Flag from data_word_id_fsm
            DATA_DCCHECK           : out std_logic_vector(C_DATA_LENGTH-1 downto 0);          --! Data parallel from daata_word_id_fsm
            VALID_K_CHARAC_DCCHECK : out std_logic_vector(C_BYTE_BY_WORD_LENGTH-1 downto 0);  --! K charachter valid in the 32-bit DATA_DCCHECK vector
            END_FRAME_DCCHECK      : out std_logic;                                           --! End frame/control word from data_word_id_fsm
            TYPE_FRAME_DCCHECK     : out std_logic_vector(C_TYPE_FRAME_LENGTH-1 downto 0);    --! Current frame/control word type from data_word_id_fsm
            SEQ_NUM_DCCHECK        : out std_logic_vector(7 downto 0);                        --! SEQ_NUM from data_word_id_fsm
            CRC_ERR_DCCHECK        : out std_logic;                                           --! CRC error flag
            FRAME_ERR_DCCHECK      : out std_logic;
            -- MIB
            CRC_LONG_ERR_DCCHECK   : out std_logic;                                           --! CRC 16 bits error flag
            CRC_SHORT_ERR_DCCHECK  : out std_logic                                            --! CRC 16 bits error flag
          );
    end component;

    -- Inputs
    signal CLK         : STD_LOGIC := '0';
    signal RST_N       : STD_LOGIC := '0';
    signal DATA_FROM_DWI     : STD_LOGIC_VECTOR(31 downto 0);
    signal CRC_16B     : STD_LOGIC_VECTOR(15 downto 0);
    signal TYPE_INCOM_FRAME : STD_LOGIC_VECTOR(3 downto 0);
    signal new_word_dwi  : STD_LOGIC := '0';
    signal end_frame_dwi  : STD_LOGIC := '0';
    -- Outputs
    signal crc_out    : STD_LOGIC_VECTOR(15 downto 0);
    signal CRC_ERR    : STD_LOGIC;
    signal CRC_8B        : STD_LOGIC_VECTOR(7 downto 0);

    -- Clock process definitions
    constant CLOCK_PERIOD : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: data_crc_check   port map (
        RST_N                  => RST_N,
        CLK                    => CLK,
        DATA_DWI               => DATA_FROM_DWI,
        VALID_K_CHARAC_DWI     => "0000",
        NEW_WORD_DWI           => new_word_dwi,
        END_FRAME_DWI          => end_frame_dwi,
        SEQ_NUM_DWI            => "00000000",
        CRC_16B_DWI            => CRC_16B,
        CRC_8B_DWI             => CRC_8B,
        TYPE_FRAME_DWI         => TYPE_INCOM_FRAME,
        FRAME_ERR_DWI          => '0',
        NEW_WORD_DCCHECK       => open,
        DATA_DCCHECK           => open,
        VALID_K_CHARAC_DCCHECK => open,
        END_FRAME_DCCHECK      => open,
        TYPE_FRAME_DCCHECK     => open,
        SEQ_NUM_DCCHECK        => open,
        CRC_ERR_DCCHECK        => open,
        FRAME_ERR_DCCHECK      => open,
        CRC_LONG_ERR_DCCHECK   => open,
        CRC_SHORT_ERR_DCCHECK  => open
    );
    -- Clock process
    CLK_process :process
    begin
        CLK <= '0';
        wait for CLOCK_PERIOD/2;
        CLK <= '1';
        wait for CLOCK_PERIOD/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- RST_N the CRC
        RST_N <= '0';
        wait for 2 * CLOCK_PERIOD;
        RST_N <= '1';
        -- TYPE_INCOM_FRAME <= C_FCT_FRM;
        -- CRC_8B <= x"22";
        wait until rising_edge(CLK);
        -- -- COMMA SDF 0x01 0x00
        -- DATA_FROM_DWI <= x"22" & x"01" & x"00" & C_K28_3_SYMB;
        -- new_word_dwi <= '1';
        -- end_frame_dwi <= '1';
        -- wait until rising_edge(CLK);

        -- end_frame_dwi <= '0';
        -- new_word_dwi <= '0';
        -- CRC_8B <= x"22";
        -- wait until rising_edge(CLK);
        -- wait until rising_edge(CLK);

        -- wait until rising_edge(CLK);
        -- wait until rising_edge(CLK);
        -- wait until rising_edge(CLK);
        --------------------------------------------------------------------------------------
        -------------------------- Test 1: Broadcast frame------------------------------------
        --------------------------------------------------------------------------------------
        -- TYPE_INCOM_FRAME <= "10";

        -- -- Send the frame data
        -- -- COMMA SDF 0x01 0x00
        -- DATA_FROM_DWI <= C_RESERVED_SYMB & C_RESERVED_SYMB & C_SBF_SYMB & C_K28_7_SYMB;
        -- data_valid <= '1';
        -- wait for CLOCK_PERIOD;
        -- data_valid <= '0';
        -- CRC_8B <= x"29";

        -- -- Send the frame data
        -- -- COMMA SDF 0x01 0x00
        -- DATA_FROM_DWI <= C_RESERVED_SYMB & C_RESERVED_SYMB & C_RESERVED_SYMB &C_RESERVED_SYMB;
        -- data_valid <= '1';
        -- wait for CLOCK_PERIOD;
        -- data_valid <= '0';

        -- -- Send the frame data
        -- -- COMMA SDF 0x01 0x00
        -- DATA_FROM_DWI <= x"01" & x"01" & x"01" & x"01";
        -- data_valid <= '1';
        -- wait for CLOCK_PERIOD;
        -- data_valid <= '0';

        -- -- Send the frame data
        -- -- COMMA SDF 0x01 0x00
        -- DATA_FROM_DWI <= x"29" & x"41" & x"00" & C_K28_2_SYMB;
        -- data_valid <= '1';
        -- wait for CLOCK_PERIOD;
        -- data_valid <= '0';

        -- -- Wait for a while to observe the output

        -- wait for 10 * CLOCK_PERIOD;

        -- -- Send the frame data
        -- -- COMMA SDF 0x01 0x00
        -- DATA_FROM_DWI <= x"4F" & x"01" & x"01" & C_K28_3_SYMB;
        -- data_valid <= '1';
        -- wait for CLOCK_PERIOD;
        -- data_valid <= '0';
        -- CRC_8B <= x"4F";

        -- Wait for a while to observe the output

        wait for 10 * CLOCK_PERIOD;
        --------------------------------------------------------------------------------------
        -------------------------- Test 2: Data frame------------------------------------
        --------------------------------------------------------------------------------------
        TYPE_INCOM_FRAME <= C_DATA_FRM;
        CRC_16B <= x"353D";
        -- Send the frame data
        -- COMMA SDF 0x01 0x00
--        DATA_FROM_DWI <= C_RESERVED_SYMB & x"01" & C_SDF_SYMB & C_K28_7_SYMB;
        DATA_FROM_DWI <= x"000050FC";
        new_word_dwi <= '1';
        wait for CLOCK_PERIOD;
        --CRC_16B <= x"35" & x"3D";

        -- Send the frame data
        -- COMMA SDF 0x01 0x00
        DATA_FROM_DWI <= C_FILL_SYMB & C_FILL_SYMB & C_EOP_SYMB &C_RESERVED_SYMB;
        new_word_dwi <= '1';
        wait for CLOCK_PERIOD;

        -- Send the frame data
        -- COMMA SDF 0x01 0x00
        DATA_FROM_DWI <= x"35" & x"3D" & x"7D" & C_K28_0_SYMB;
        new_word_dwi <= '1';
        end_frame_dwi <= '1';
        wait for CLOCK_PERIOD;
        new_word_dwi <= '0';

        -- DATA_FROM_DWI <= (others =>'0');

        -- -- Wait for a while to observe the output
        -- wait for 10 * CLOCK_PERIOD;

        -- -- Send the frame data
        -- -- COMMA SDF 0x01 0x00
        -- DATA_FROM_DWI <= C_RESERVED_SYMB & x"01" & C_SDF_SYMB & C_K28_7_SYMB;
        -- data_valid <= '1';
        -- wait for CLOCK_PERIOD;
        -- data_valid <= '0';
        -- CRC_16B <= x"B7" & x"A1";

        -- -- Send the frame data
        -- -- COMMA SDF 0x01 0x00
        -- DATA_FROM_DWI <= C_EOP_SYMB & x"02" & x"01" & C_RESERVED_SYMB;
        -- data_valid <= '1';
        -- wait for CLOCK_PERIOD;
        -- data_valid <= '0';

        -- -- Send the frame data
        -- -- COMMA SDF 0x01 0x00
        -- DATA_FROM_DWI <= x"B7" & x"A1" & x"7E" & C_K28_0_SYMB;
        -- data_valid <= '1';
        -- wait for CLOCK_PERIOD;
        -- data_valid <= '0';

        -- End of stimulus process
        wait;
    end process;

end Behavioral;
