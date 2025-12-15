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
use ieee.numeric_std.all;

Library UNISIM;
use UNISIM.vcomponents.all;
use ieee.std_logic_unsigned.all;

----------------------------------------------------------------------------
entity top_vek280 is 
  port(
       -- System signals
    RESET          : in std_logic;

    ch0_lpddr4_trip1_ca_a : out STD_LOGIC_VECTOR ( 5 downto 0 );
    ch0_lpddr4_trip1_ck_c_a : out STD_LOGIC;
    ch0_lpddr4_trip1_ck_t_a : out STD_LOGIC;
    ch0_lpddr4_trip1_cke_a : out STD_LOGIC;
    ch0_lpddr4_trip1_cs_a : out STD_LOGIC;
    ch0_lpddr4_trip1_dmi_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_trip1_dmi_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_trip1_dq_a : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    ch0_lpddr4_trip1_dq_b : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    ch0_lpddr4_trip1_dqs_c_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_trip1_dqs_c_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_trip1_dqs_t_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_trip1_dqs_t_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_trip1_reset_n : out STD_LOGIC;
    ch1_lpddr4_trip1_ca_a : out STD_LOGIC_VECTOR ( 5 downto 0 );
    ch1_lpddr4_trip1_ck_c_a : out STD_LOGIC;
    ch1_lpddr4_trip1_ck_t_a : out STD_LOGIC;
    ch1_lpddr4_trip1_cke_a : out STD_LOGIC;
    ch1_lpddr4_trip1_cs_a : out STD_LOGIC;
    ch1_lpddr4_trip1_dmi_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_trip1_dmi_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_trip1_dq_a : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    ch1_lpddr4_trip1_dq_b : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    ch1_lpddr4_trip1_dqs_c_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_trip1_dqs_c_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_trip1_dqs_t_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_trip1_dqs_t_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_trip1_reset_n : out STD_LOGIC;
    lpddr4_clk1_clk_n : in STD_LOGIC;
    lpddr4_clk1_clk_p : in STD_LOGIC;

    -- Spacefibre port 
    SPF_GTCLK_p     : in std_logic;
    SPF_GTCLK_n     : in std_logic;

    TX_POS         : out std_logic;                                        -- Positive LVDS serial data send
    TX_NEG         : out std_logic;                                        -- Negative LVDS serial data send
    RX_POS         : in  std_logic;                                        -- Positive LVDS serial data received
    RX_NEG         : in  std_logic;                                         -- Negative LVDS serial data received
  
    --debug blinking led
    Led0            :out std_logic
  
  );
end entity;

architecture rtl of top_vek280 is 
---------------------------
-- COMPONENT DECLARATION --
---------------------------
  component design_1 is
  port (
    CLK_GTY_0 : in STD_LOGIC;
    RX_NEG_0 : in STD_LOGIC;
    RX_POS_0 : in STD_LOGIC;
    TX_NEG_0 : out STD_LOGIC;
    TX_POS_0 : out STD_LOGIC;
    ch0_lpddr4_trip1_ca_a : out STD_LOGIC_VECTOR ( 5 downto 0 );
    ch0_lpddr4_trip1_ck_c_a : out STD_LOGIC;
    ch0_lpddr4_trip1_ck_t_a : out STD_LOGIC;
    ch0_lpddr4_trip1_cke_a : out STD_LOGIC;
    ch0_lpddr4_trip1_cs_a : out STD_LOGIC;
    ch0_lpddr4_trip1_dmi_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_trip1_dmi_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_trip1_dq_a : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    ch0_lpddr4_trip1_dq_b : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    ch0_lpddr4_trip1_dqs_c_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_trip1_dqs_c_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_trip1_dqs_t_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_trip1_dqs_t_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch0_lpddr4_trip1_reset_n : out STD_LOGIC;
    ch1_lpddr4_trip1_ca_a : out STD_LOGIC_VECTOR ( 5 downto 0 );
    ch1_lpddr4_trip1_ck_c_a : out STD_LOGIC;
    ch1_lpddr4_trip1_ck_t_a : out STD_LOGIC;
    ch1_lpddr4_trip1_cke_a : out STD_LOGIC;
    ch1_lpddr4_trip1_cs_a : out STD_LOGIC;
    ch1_lpddr4_trip1_dmi_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_trip1_dmi_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_trip1_dq_a : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    ch1_lpddr4_trip1_dq_b : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    ch1_lpddr4_trip1_dqs_c_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_trip1_dqs_c_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_trip1_dqs_t_a : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_trip1_dqs_t_b : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    ch1_lpddr4_trip1_reset_n : out STD_LOGIC;
    clk_l : out STD_LOGIC;
    lpddr4_clk1_clk_n : in STD_LOGIC;
    lpddr4_clk1_clk_p : in STD_LOGIC;
    reset_n_fpga : out STD_LOGIC_VECTOR ( 0 to 0 );
    reset : in STD_LOGIC
  );
  end component design_1;

 
------------------------
-- SIGNAL DECLARATION --
------------------------
-- System signals
signal clk            : std_logic;

-- CLK GTY signals
signal clk_gtref           : std_logic;

--led display
signal Count : integer:=0;
signal Led_l : std_logic := '0';
signal reset_n_from_fpga : std_logic;

begin

-- CLOCK for GTY
   IBUFDS_GTE5_I : IBUFDS_GTE5
   generic map (
     REFCLK_EN_TX_PATH   => '0', 
     REFCLK_ICNTL_RX     => 0, 
     REFCLK_HROW_CK_SEL  => 0
    )
   port map (
     O   => clk_gtref, 
     I   => SPF_GTCLK_p, 
     IB  => SPF_GTCLK_n, 
     CEB => '0'
     );

-- block design
design_1_i: component design_1
     port map (
      CLK_GTY_0 => clk_gtref,
      RESET=>RESET,
      RX_NEG_0 => RX_NEG,
      RX_POS_0 => RX_POS,
      TX_NEG_0 => TX_NEG,
      TX_POS_0 => TX_POS,
      clk_l => clk, -- this is the fabric clock from cips
      reset_n_fpga(0) => reset_n_from_fpga, -- this this the fabric reset
      ch0_lpddr4_trip1_ca_a(5 downto 0) => ch0_lpddr4_trip1_ca_a(5 downto 0),
      ch0_lpddr4_trip1_ck_c_a => ch0_lpddr4_trip1_ck_c_a,
      ch0_lpddr4_trip1_ck_t_a => ch0_lpddr4_trip1_ck_t_a,
      ch0_lpddr4_trip1_cke_a => ch0_lpddr4_trip1_cke_a,
      ch0_lpddr4_trip1_cs_a => ch0_lpddr4_trip1_cs_a,
      ch0_lpddr4_trip1_dmi_a(1 downto 0) => ch0_lpddr4_trip1_dmi_a(1 downto 0),
      ch0_lpddr4_trip1_dmi_b(1 downto 0) => ch0_lpddr4_trip1_dmi_b(1 downto 0),
      ch0_lpddr4_trip1_dq_a(15 downto 0) => ch0_lpddr4_trip1_dq_a(15 downto 0),
      ch0_lpddr4_trip1_dq_b(15 downto 0) => ch0_lpddr4_trip1_dq_b(15 downto 0),
      ch0_lpddr4_trip1_dqs_c_a(1 downto 0) => ch0_lpddr4_trip1_dqs_c_a(1 downto 0),
      ch0_lpddr4_trip1_dqs_c_b(1 downto 0) => ch0_lpddr4_trip1_dqs_c_b(1 downto 0),
      ch0_lpddr4_trip1_dqs_t_a(1 downto 0) => ch0_lpddr4_trip1_dqs_t_a(1 downto 0),
      ch0_lpddr4_trip1_dqs_t_b(1 downto 0) => ch0_lpddr4_trip1_dqs_t_b(1 downto 0),
      ch0_lpddr4_trip1_reset_n => ch0_lpddr4_trip1_reset_n,
      ch1_lpddr4_trip1_ca_a(5 downto 0) => ch1_lpddr4_trip1_ca_a(5 downto 0),
      ch1_lpddr4_trip1_ck_c_a => ch1_lpddr4_trip1_ck_c_a,
      ch1_lpddr4_trip1_ck_t_a => ch1_lpddr4_trip1_ck_t_a,
      ch1_lpddr4_trip1_cke_a => ch1_lpddr4_trip1_cke_a,
      ch1_lpddr4_trip1_cs_a => ch1_lpddr4_trip1_cs_a,
      ch1_lpddr4_trip1_dmi_a(1 downto 0) => ch1_lpddr4_trip1_dmi_a(1 downto 0),
      ch1_lpddr4_trip1_dmi_b(1 downto 0) => ch1_lpddr4_trip1_dmi_b(1 downto 0),
      ch1_lpddr4_trip1_dq_a(15 downto 0) => ch1_lpddr4_trip1_dq_a(15 downto 0),
      ch1_lpddr4_trip1_dq_b(15 downto 0) => ch1_lpddr4_trip1_dq_b(15 downto 0),
      ch1_lpddr4_trip1_dqs_c_a(1 downto 0) => ch1_lpddr4_trip1_dqs_c_a(1 downto 0),
      ch1_lpddr4_trip1_dqs_c_b(1 downto 0) => ch1_lpddr4_trip1_dqs_c_b(1 downto 0),
      ch1_lpddr4_trip1_dqs_t_a(1 downto 0) => ch1_lpddr4_trip1_dqs_t_a(1 downto 0),
      ch1_lpddr4_trip1_dqs_t_b(1 downto 0) => ch1_lpddr4_trip1_dqs_t_b(1 downto 0),
      ch1_lpddr4_trip1_reset_n => ch1_lpddr4_trip1_reset_n,
      lpddr4_clk1_clk_n => lpddr4_clk1_clk_n,
      lpddr4_clk1_clk_p => lpddr4_clk1_clk_p
    );

--
process (clk,reset_n_from_fpga)
begin
    if reset_n_from_fpga='0' then
            Count <= 0;
            Led_l <= '0';
    elsif rising_edge(clk) then
        if (Count < 75000000) then       -- clk � 150Mh, we need half clock to get 500ms led
            Count <= Count + 1;
            Led_l <= Led_l;
        else
            Count <= 0;
            Led_l <= not Led_l;
        end if;
    end if;
end process;

    
    Led0 <= Led_l;


end architecture rtl;
