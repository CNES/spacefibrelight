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

library work;
use work.data_link_lib.all;

entity tb_data_desencapsulation is
    -- No ports
end tb_data_desencapsulation;

architecture Behavioral of tb_data_desencapsulation is

    -- Component declaration for the unit under test (UUT)
    component data_desencapsulation
        generic (
            G_VC_NUM : integer := 8
        );
        port (
            RST_N                  : in  std_logic;
            CLK                    : in  std_logic;
            RD_DATA_DBUFI          : in  std_logic_vector(35 downto 0);
            RD_DATA_EN_DBUFI       : out std_logic;
            RD_DATA_VLD_DBUFI      : in  std_logic;
            FCT_FAR_END_DDES       : out std_logic_vector(G_VC_NUM-1 downto 0);
            WR_MULT                : out vc_multiplier(G_VC_NUM-1 downto 0);
            WR_DATA_DDES           : out vc_data_k_array(G_VC_NUM downto 0);
            WR_DATA_EN_DDES        : out std_logic_vector(G_VC_NUM downto 0)
        );
    end component;

    -- Constants
    constant CLK_PERIOD : time := 10 ns;
    constant C_K28_7_SYMB : std_logic_vector(7 downto 0) := x"FC"; -- Example symbol
    constant C_D16_2_SYMB : std_logic_vector(7 downto 0) := x"FA"; -- Example symbol
    constant C_D29_2_SYMB : std_logic_vector(7 downto 0) := x"FB"; -- Example symbol
    constant C_K28_3_SYMB : std_logic_vector(7 downto 0) := x"7C"; -- Example symbol
    constant C_K28_0_SYMB : std_logic_vector(7 downto 0) := x"1C"; -- Example symbol
    constant C_K28_2_SYMB : std_logic_vector(7 downto 0) := x"5C"; -- Example symbol

    -- Signals
    signal RST_N : std_logic := '0';
    signal CLK : std_logic := '0';
    signal RD_DATA_DBUFI : std_logic_vector(35 downto 0) := (others => '0');
    signal RD_DATA_EN_DBUFI : std_logic;
    signal RD_DATA_VLD_DBUFI : std_logic := '0';
    signal FCT_FAR_END_DDES : std_logic_vector(7 downto 0);
    signal WR_MULT : vc_multiplier(7 downto 0);
    signal WR_DATA_DDES : vc_data_k_array(8 downto 0);
    signal WR_DATA_EN_DDES : std_logic_vector(8 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: data_desencapsulation
        generic map (
            G_VC_NUM => 8
        )
        port map (
            RST_N => RST_N,
            CLK => CLK,
            RD_DATA_DBUFI => RD_DATA_DBUFI,
            RD_DATA_EN_DBUFI => RD_DATA_EN_DBUFI,
            RD_DATA_VLD_DBUFI => RD_DATA_VLD_DBUFI,
            FCT_FAR_END_DDES => FCT_FAR_END_DDES,
            WR_MULT => WR_MULT,
            WR_DATA_DDES => WR_DATA_DDES,
            WR_DATA_EN_DDES => WR_DATA_EN_DDES
        );

    -- Clock process
    clk_process :process
    begin
        CLK <= '0';
        wait for CLK_PERIOD/2;
        CLK <= '1';
        wait for CLK_PERIOD/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset sequence
        RST_N <= '0';
        wait for 2 * CLK_PERIOD;
        RST_N <= '1';

        -- Test 1: SDF Detection
        RD_DATA_DBUFI <= "0001" & "0000000000000000"  & C_D16_2_SYMB & C_K28_7_SYMB ;
        RD_DATA_VLD_DBUFI <= '1';
        wait for CLK_PERIOD;
        RD_DATA_VLD_DBUFI <= '0';
        wait for CLK_PERIOD;

        -- Normal Data
        RD_DATA_DBUFI <= "0000" & "00000000000000000000000000000000";
        RD_DATA_VLD_DBUFI <= '1';
        wait for CLK_PERIOD;
        RD_DATA_VLD_DBUFI <= '0';
        wait for CLK_PERIOD;

        -- Test 1: EDF Detection
        RD_DATA_DBUFI <= "0001" & "000000000000000000000000" & C_K28_0_SYMB ;
        RD_DATA_VLD_DBUFI <= '1';
        wait for CLK_PERIOD;
        RD_DATA_VLD_DBUFI <= '0';
        wait for CLK_PERIOD;

        -- Normal Data
        RD_DATA_DBUFI <= "0000" & "00000000000000000000000000000001";
        RD_DATA_VLD_DBUFI <= '1';
        wait for CLK_PERIOD;
        RD_DATA_VLD_DBUFI <= '0';
        wait for CLK_PERIOD;        

        -- Test 2: SBF Detection
        RD_DATA_DBUFI <= "0001" & "0000000000000000" & C_D29_2_SYMB & C_K28_7_SYMB;
        RD_DATA_VLD_DBUFI <= '1';
        wait for CLK_PERIOD;
        RD_DATA_VLD_DBUFI <= '0';
        wait for CLK_PERIOD;

        -- Normal Data
        RD_DATA_DBUFI <= "0000" & "00000000000000000000000000000010";
        RD_DATA_VLD_DBUFI <= '1';
        wait for CLK_PERIOD;
        RD_DATA_VLD_DBUFI <= '0';
        wait for CLK_PERIOD;       
        
        -- Test 5: EBF Detection
        RD_DATA_DBUFI <= "0001" & "000000000000000000000000" & C_K28_2_SYMB;
        RD_DATA_VLD_DBUFI <= '1';
        wait for CLK_PERIOD;
        RD_DATA_VLD_DBUFI <= '0';
        wait for CLK_PERIOD;

        -- Test 3: FCT Detection
        RD_DATA_DBUFI <= "0001" & "000000000000000000000000" & C_K28_3_SYMB;
        RD_DATA_VLD_DBUFI <= '1';
        wait for CLK_PERIOD;
        RD_DATA_VLD_DBUFI <= '0';
        wait for CLK_PERIOD;

        -- Test 1: SDF Detection for VC 1
        RD_DATA_DBUFI <= "0001" & "0000000100000000" & C_D16_2_SYMB & C_K28_7_SYMB ;
        RD_DATA_VLD_DBUFI <= '1';
        wait for CLK_PERIOD;
        RD_DATA_VLD_DBUFI <= '0';
        wait for CLK_PERIOD;

        -- Test 2: SBF Detection in data
        RD_DATA_DBUFI <= "0001" & "0000000000000000" & C_D29_2_SYMB & C_K28_7_SYMB ;
        RD_DATA_VLD_DBUFI <= '1';
        wait for CLK_PERIOD;
        RD_DATA_VLD_DBUFI <= '0';
        wait for CLK_PERIOD;

        -- Normal Data for Broadcast
        RD_DATA_DBUFI <= "0000" & "00000000000000000000000010101010";
        RD_DATA_VLD_DBUFI <= '1';
        wait for CLK_PERIOD;
        RD_DATA_VLD_DBUFI <= '0';
        wait for CLK_PERIOD;     

        -- Test 5: EBF Detection
        RD_DATA_DBUFI <= "0001" & "000000000000000000000000" & C_K28_2_SYMB;
        RD_DATA_VLD_DBUFI <= '1';
        wait for CLK_PERIOD;
        RD_DATA_VLD_DBUFI <= '0';
        wait for CLK_PERIOD;   
        
        -- Test 6: Normal Data for VC 1
        RD_DATA_DBUFI <= "0000" & "00000000000000000000000000000000";
        RD_DATA_VLD_DBUFI <= '1';
        wait for CLK_PERIOD;
        RD_DATA_VLD_DBUFI <= '0';
        wait for CLK_PERIOD;        

        -- Test 4: EDF Detection
        RD_DATA_DBUFI <= "0001" & "000000000000000000000000" & C_K28_0_SYMB;
        RD_DATA_VLD_DBUFI <= '1';
        wait for CLK_PERIOD;
        RD_DATA_VLD_DBUFI <= '0';
        wait for CLK_PERIOD;

        -- Test 6: Normal Data without Start
        RD_DATA_DBUFI <= "0000" & "00000000000000000000000000000000";
        RD_DATA_VLD_DBUFI <= '1';
        wait for CLK_PERIOD;
        RD_DATA_VLD_DBUFI <= '0';
        wait for CLK_PERIOD;

        -- Wait for some time to observe outputs
        wait for 10 * CLK_PERIOD;

        -- End simulation
        assert false report "Simulation completed" severity failure;
    end process;

end Behavioral;
