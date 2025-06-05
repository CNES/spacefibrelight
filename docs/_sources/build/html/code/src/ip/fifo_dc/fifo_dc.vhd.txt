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
-- Auteur(s)        : Florian TUTZO
--
-- Projet           : Capitalisation
--
-- Date de creation : 10/02/15
--
-- Description      : Module FIFO dual clock
--
---------------------------------------------------------------------------
---------------------------------------------------------------------------
-- DECLARATION DES LIBRAIRIES
---------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


---------------------------------------------------------------------------
-- DECLARATION DE L'ENTITE
---------------------------------------------------------------------------
entity FIFO_DC is
    generic (
        G_DWIDTH                : integer := 8;                                 -- Data bus fifo length
        G_AWIDTH                : integer := 8;                                 -- Address bus fifo length
        G_THRESHOLD_HIGH        : integer := 2**8;                              -- high threshold
        G_THRESHOLD_LOW         : integer := 0                                  -- low threshold
    );
    port (
        RST_N                   : in  std_logic;

        -- Writing port
        WR_CLK                  : in  std_logic;                                -- Clock
        WR_DATA                 : in  std_logic_vector(G_DWIDTH-1 downto 0);    -- Data write bus
        WR_DATA_EN              : in  std_logic;                                -- Write command

        -- Reading port
        RD_CLK                  : in  std_logic;                                -- Clock
        RD_DATA                 : out std_logic_vector(G_DWIDTH-1 downto 0);    -- Data read bus
        RD_DATA_EN              : in  std_logic;                                -- Read command
        RD_DATA_VLD             : out std_logic;                                -- Data valid

        -- Command port
        CMD_FLUSH               : in  std_logic;                                -- fifo flush
        STATUS_BUSY_FLUSH       : out std_logic;                                -- fifo is flushing

        -- Status port
        STATUS_THRESHOLD_HIGH   : out std_logic;                                -- threshold high reached flag (sur WR_CLK)
        STATUS_THRESHOLD_LOW    : out std_logic;                                -- threshold low reached flag (sur RD_CLK)
        STATUS_FULL             : out std_logic;                                -- full fifo flag (sur WR_CLK)
        STATUS_EMPTY            : out std_logic;                                -- empty fifo flag (sur RD_CLK)
        STATUS_LEVEL_WR         : out std_logic_vector(G_AWIDTH-1 downto 0);    -- Niveau de remplissage de la FIFO (sur WR_CLK)
        STATUS_LEVEL_RD         : out std_logic_vector(G_AWIDTH-1 downto 0)     -- Niveau de remplissage de la FIFO (sur RD_CLK)
    );
end entity FIFO_DC;


---------------------------------------------------------------------------
-- DECLARATION DE L'ARCHITECTURE
---------------------------------------------------------------------------
architecture RTL of FIFO_DC is

   ---------------------------------------------------------------------------
   -- DECLARATION DES CONSTANTES
   ---------------------------------------------------------------------------
    constant RAM_DEPTH            : integer := 2**G_AWIDTH;

   ---------------------------------------------------------------------------
   -- DECLARATION DES TYPES
   ---------------------------------------------------------------------------
    type t_ram is array(0 to RAM_DEPTH-1) of std_logic_vector(G_DWIDTH-1 downto 0);

   ---------------------------------------------------------------------------
   -- DECLARATION DES SIGNAUX
   ---------------------------------------------------------------------------
    -- ram
    signal ram                  : t_ram;

    -- pointer memory
    signal ptr_wr               : unsigned(G_AWIDTH-1 downto 0);
    signal ptr_wr_inc           : unsigned(G_AWIDTH-1 downto 0);
    signal ptr_wr_inc2          : unsigned(G_AWIDTH-1 downto 0);

    signal ptr_rd               : unsigned(G_AWIDTH-1 downto 0);
    signal ptr_rd_inc           : unsigned(G_AWIDTH-1 downto 0);

    -- Use for switch of clock domain
    signal ptr_wr_gray          : unsigned(G_AWIDTH-1 downto 0);
    signal ptr_rd_gray          : unsigned(G_AWIDTH-1 downto 0);

    signal ptr_wr_in_rd         : unsigned(G_AWIDTH-1 downto 0);
    signal ptr_rd_in_wr         : unsigned(G_AWIDTH-1 downto 0);

    -- ram level
    signal ram_level            : unsigned(G_AWIDTH-1 downto 0);

    signal cmd_flush_req        : std_logic;
    signal cmd_flush_inv        : std_logic;
    signal cmd_flush_inv_wr     : std_logic;
    signal cmd_flush_inv_rd     : std_logic;
    signal flush_ack_inv_wr     : std_logic;
    signal flush_ack_inv_wr_r   : std_logic;
    signal flush_ack_inv_rd     : std_logic;
    signal flush_ack_inv_rd_r   : std_logic;
    signal flush_ack_wr         : std_logic;
    signal flush_ack_rd         : std_logic;

    -- Command signals
    signal wr_en                : std_logic;
    signal rd_en                : std_logic;

    -- Status signals
    signal full                 : std_logic;
    signal full_prev            : std_logic;
    signal empty                : std_logic;

    ---------------------------------------------------------------------------
    -- DECLARATION DES FONCTIONS
    ---------------------------------------------------------------------------
    function binary_to_gray_code (data : unsigned(G_AWIDTH-1 downto 0)) return unsigned is
    begin
        return data(data'high) & (data(data'high downto 1) xor data(data'high-1 downto 0));
    end function binary_to_gray_code;

    function gray_to_binary_code (data_gray : unsigned(G_AWIDTH-1 downto 0)) return unsigned is
        variable data : unsigned (data_gray'range);
    begin
        data(data'high) := data_gray(data'high);
        for i in data'high-1 downto 0 loop
            data(i) := data(i+1) xor data_gray(i);
        end loop;
        return data;
    end function gray_to_binary_code;



begin

    ---------------------------------------------------------------------------
    -- assign status
    ---------------------------------------------------------------------------
    STATUS_FULL         <= full or (full_prev and WR_DATA_EN);
    STATUS_EMPTY        <= empty;
    STATUS_BUSY_FLUSH   <= cmd_flush_req;

    ram_level           <= ptr_wr - ptr_rd;


    ---------------------------------------------------------------------------
    ---------------------------------------------------------------------------
    -- Writing
    ---------------------------------------------------------------------------
    ---------------------------------------------------------------------------

    -- Increasing of writing pointer
    ptr_wr_inc          <= ptr_wr + 1;
    ptr_wr_inc2         <= ptr_wr + 2;

    wr_en               <= WR_DATA_EN and not (full or cmd_flush_req);


    ---------------------------------------------------------------------------
    -- process : p_wr_ram
    -- Description : writing in the RAM_DP when the write command is asserted
    ---------------------------------------------------------------------------
    P_WR_RAM : process (WR_CLK)
        variable ptr_wr_i : integer;
    begin
        if rising_edge(WR_CLK) then
            if wr_en = '1' then
                ptr_wr_i        := to_integer(ptr_wr);
                ram(ptr_wr_i)   <= WR_DATA;
            end if;
        end if;
    end process;


    ---------------------------------------------------------------------------
    -- process : p_wr_inc_ptr
    -- Description :-increasing the ptr_wr when the write command is asserted
    --              -reset pointer when flush FIFO and then send ack
    ---------------------------------------------------------------------------
    P_WR_INC_PTR : process (RST_N, WR_CLK)
    begin
        if RST_N = '0' then
            ptr_wr          <= (others => '0');
            cmd_flush_inv_wr<= '0';
            flush_ack_inv_wr<= '0';
        elsif rising_edge(WR_CLK) then
            cmd_flush_inv_wr<= cmd_flush_inv;
            if (cmd_flush_inv_wr xor cmd_flush_inv) = '1' then
                ptr_wr          <= (others => '0');
                flush_ack_inv_wr<= not flush_ack_inv_wr;
            end if;
            if wr_en = '1' then
                ptr_wr  <= ptr_wr_inc;
            end if;
        end if;
    end process;


    ----------------------------------------------------------------------------
    -- process : p_rd_in_wr_ptr
    -- Description : get the ptr_rd_gray and conversion to binary code
    ----------------------------------------------------------------------------
    P_RD_IN_WR_PTR : process (RST_N, WR_CLK)
    begin
        if RST_N = '0' then
            ptr_rd_in_wr    <= (others => '0');
        elsif rising_edge(WR_CLK) then
            if cmd_flush_req = '1' then
                ptr_rd_in_wr    <= (others => '0');
            else
                ptr_rd_in_wr    <= gray_to_binary_code(ptr_rd_gray);
            end if;
        end if;
    end process;


    ----------------------------------------------------------------------------
    -- process : p_wr_ptr_gray
    -- Description : conversion of ptr_wr to gray code
    ----------------------------------------------------------------------------
    P_WR_PTR_GRAY : process (RST_N, WR_CLK)
    begin
        if RST_N = '0' then
            ptr_wr_gray <= (others => '0');
        elsif rising_edge(WR_CLK) then
            ptr_wr_gray <= binary_to_gray_code(ptr_wr);
        end if;
    end process;


    ----------------------------------------------------------------------------
    -- process : p_wr_status
    -- Description : This process manages the fallowing status :
    --              - full
    --              - threshold high
    ----------------------------------------------------------------------------
    P_WR_STATUS : process (RST_N, WR_CLK)
    begin
        if RST_N = '0' then
            full                    <= '0';
            full_prev               <= '0';
            STATUS_THRESHOLD_HIGH   <= '0';
        elsif rising_edge(WR_CLK) then
            -- Full management
            if ptr_wr_inc = ptr_rd_in_wr then
                full        <= '1';
            elsif ptr_wr_inc2 = ptr_rd_in_wr then
                full_prev   <= '1';
            elsif ptr_wr  /= ptr_rd_in_wr or cmd_flush_req = '1' then
                full        <= '0';
                full_prev   <= '0';
            end if;

            -- threshold management
            if ram_level >= G_THRESHOLD_HIGH or full = '1' then
                STATUS_THRESHOLD_HIGH   <= '1';
            else
                STATUS_THRESHOLD_HIGH   <= '0';
            end if;
        end if;
    end process;



    ---------------------------------------------------------------------------
    ---------------------------------------------------------------------------
    -- Reading
    ---------------------------------------------------------------------------
    ---------------------------------------------------------------------------

    -- Increasing of reading pointer
    ptr_rd_inc          <= ptr_rd + 1;
    rd_en               <= RD_DATA_EN and not(empty or cmd_flush_req);


    ---------------------------------------------------------------------------
    -- process : p_rd_ram
    -- Description : reading in the RAM_DP when the rdite command is asserted
    ---------------------------------------------------------------------------
    P_RD_RAM : process (RST_N, RD_CLK)
        variable ptr_rd_i : integer;
    begin
        if RST_N = '0' then
            RD_DATA_VLD <= '0';
            RD_DATA     <= (others => '0');
        elsif rising_edge(RD_CLK) then
            RD_DATA_VLD <= '0';
            if  rd_en = '1' then
                ptr_rd_i    := to_integer(ptr_rd);
                RD_DATA     <= ram(ptr_rd_i);
                RD_DATA_VLD <= '1';
            end if;
        end if;
    end process;


    ---------------------------------------------------------------------------
    -- process : p_rd_inc_ptr
    -- Description :-increasing the ptr_rd when the rdite command is asserted
    --              -reset pointer when flush FIFO and then send ack
    ---------------------------------------------------------------------------
    P_RD_INC_PTR : process (RST_N, RD_CLK)
    begin
        if RST_N = '0' then
            ptr_rd          <= (others => '0');
            cmd_flush_inv_rd<= '0';
            flush_ack_inv_rd<= '0';
        elsif rising_edge(RD_CLK) then
            cmd_flush_inv_rd<= cmd_flush_inv;
            if (cmd_flush_inv_rd xor cmd_flush_inv) = '1' then
                ptr_rd          <= (others => '0');
                flush_ack_inv_rd<= not flush_ack_inv_rd;
            end if;
            if rd_en = '1' then
                ptr_rd  <= ptr_rd_inc;
            end if;
        end if;
    end process;


    ----------------------------------------------------------------------------
    -- process : p_wr_in_rd_ptr
    -- Description : get the ptr_rd_gray and conversion to binary code
    ----------------------------------------------------------------------------
    P_WR_IN_RD_PTR : process (RST_N, RD_CLK)
    begin
        if RST_N = '0' then
            ptr_wr_in_rd    <= (others => '0');
        elsif rising_edge(RD_CLK) then
            if cmd_flush_req = '1' then
                ptr_wr_in_rd    <= (others => '0');
            else
                ptr_wr_in_rd    <= gray_to_binary_code(ptr_wr_gray);
            end if;
        end if;
    end process;


    ----------------------------------------------------------------------------
    -- process : p_rd_ptr_gray
    -- Description : conversion of ptr_rd to gray code
    ----------------------------------------------------------------------------
    P_RD_PTR_GRAY : process (RST_N, RD_CLK)
    begin
        if RST_N = '0' then
            ptr_rd_gray <= (others => '0');
        elsif rising_edge(RD_CLK) then
            ptr_rd_gray <= binary_to_gray_code(ptr_rd);
        end if;
    end process;


    ----------------------------------------------------------------------------
    -- process : p_rd_status
    -- Description : This process manages the fallowing status :
    --              - empty
    --              - threshold low
    ----------------------------------------------------------------------------
    P_RD_STATUS : process (RST_N, RD_CLK)
    begin
        if RST_N = '0' then
            empty               <= '1';
            STATUS_THRESHOLD_LOW<= '0';
        elsif rising_edge(RD_CLK) then
            -- Empty management
            if (ptr_rd_inc = ptr_wr_in_rd and rd_en = '1') or cmd_flush_req = '1' then
                empty    <= '1';
            elsif ptr_rd /= ptr_wr_in_rd then
                empty    <= '0';
            end if;

            -- threshold management
            if ram_level <= G_THRESHOLD_LOW and full = '0' then
                STATUS_THRESHOLD_LOW<= '1';
            else
                STATUS_THRESHOLD_LOW<= '0';
            end if;
        end if;
    end process;


    ---------------------------------------------------------------------------
    -- PROCESS : P_STATUS_LEVEL_WR
    -- Description : indicates the filling level of the FIFO
    ---------------------------------------------------------------------------
    P_STATUS_LEVEL_WR : process (RST_N, WR_CLK)
    begin
       if RST_N = '0' then
          STATUS_LEVEL_WR   <= (others => '0');
       elsif rising_edge(WR_CLK) then
          STATUS_LEVEL_WR   <= std_logic_vector(ram_level);
       end if;
    end process;


    ---------------------------------------------------------------------------
    -- PROCESS : P_STATUS_LEVEL_RD
    -- Description : indicates the filling level of the FIFO
    ---------------------------------------------------------------------------
    P_STATUS_LEVEL_RD : process (RST_N, RD_CLK)
    begin
       if RST_N = '0' then
          STATUS_LEVEL_RD   <= (others => '0');
       elsif rising_edge(RD_CLK) then
          STATUS_LEVEL_RD   <= std_logic_vector(ram_level);
       end if;
    end process;



    ---------------------------------------------------------------------------
    ---------------------------------------------------------------------------
    -- FLUSH
    ---------------------------------------------------------------------------
    ---------------------------------------------------------------------------

    ---------------------------------------------------------------------------
    -- process : p_flush
    -- Description : - command of reset FIFO pointers
    ---------------------------------------------------------------------------
    P_FLUSH : process (RST_N, WR_CLK)
    begin
        if RST_N = '0' then
            cmd_flush_req       <= '0';
            cmd_flush_inv       <= '0';
            flush_ack_inv_wr_r  <= '0';
            flush_ack_inv_rd_r  <= '0';
            flush_ack_wr        <= '0';
            flush_ack_rd        <= '0';
        elsif rising_edge(WR_CLK) then

            -- From WR clock domain
            flush_ack_inv_wr_r  <= flush_ack_inv_wr;

            -- from RD clock domain
            flush_ack_inv_rd_r  <= flush_ack_inv_rd;

            if CMD_FLUSH = '1' then
                cmd_flush_req   <= '1';
                cmd_flush_inv   <= not cmd_flush_inv;
            end if;

            -- ACK from WR clock dommain
            if (flush_ack_inv_wr xor flush_ack_inv_wr_r) = '1' then
                flush_ack_wr    <= '1';
            end if;

            -- ACK from RD clock domain
            if (flush_ack_inv_rd xor flush_ack_inv_rd_r) = '1' then
                flush_ack_rd    <= '1';
            end if;

            -- Flush is finished
            if flush_ack_wr = '1' and flush_ack_rd = '1' and CMD_FLUSH  = '0' then
                flush_ack_rd    <= '0';
                flush_ack_wr    <= '0';
                cmd_flush_req   <= '0';
            end if;
        end if;
    end process;


end architecture;
