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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_receive_error is
end tb_receive_error;

architecture testbench of tb_receive_error is
    -- Component Declaration
    component receive_error
        Port (
            CLK                      : in std_logic;
            RST_N                    : in std_logic; 
            TYPE_FRAME_DWI           : in std_logic_vector (3 downto 0);
            RX_ERR                   : in std_logic;  
            TYPE_FRAME_CRC           : in std_logic_vector (3 downto 0);              
            CRC_ERR                  : in std_logic; 
            TYPE_FRAME_SEQ           : in std_logic_vector (3 downto 0);
            END_FRAME                : in std_logic;
            SEQ_ERR                  : in std_logic;
            FAR_END                  : in std_logic;
            ACK_REQUEST              : out std_logic; 
            NACK_REQUEST             : out std_logic; 
            TRANSCEIVE_POLARITY_FLAG : out std_logic; 
            REQ_ACK_DONE             : in std_logic;
            RECEIVE_POLARITY_FLAG    : out std_logic
            );
    end component;

    -- Signals for testbench
    signal CLK              : std_logic := '0';
    signal RST_N            : std_logic := '0';
    signal s_type_frame_dwi : std_logic_vector (3 downto 0) := "0000";
    signal s_type_frame_crc : std_logic_vector (3 downto 0) := "0000";
    signal s_type_frame_seq : std_logic_vector (3 downto 0) := "0000";
    signal s_rx_err         : std_logic := '0'; 
    signal s_crc_err        : std_logic := '0'; 
    signal s_seq_err        : std_logic := '0'; 
    signal s_far_end        : std_logic := '0'; 
    signal s_end_frame      : std_logic := '0';
    signal s_done           : std_logic := '0';
    signal s_ack_request    : std_logic := '0';
    signal s_nack_request   : std_logic := '0';

    -- Clock period definition
    constant CLK_PERIOD : time := 10 ns;
    
    constant C_DATA_FRM  :std_logic_vector(3 downto 0):= "0001"; -- DATA Frame
    constant C_BC_FRM    :std_logic_vector(3 downto 0):= "0010"; -- BROADCAST Frame
    constant C_IDLE_FRM  :std_logic_vector(3 downto 0):= "0011"; -- IDLE Frame
    constant C_FCT_FRM   :std_logic_vector(3 downto 0):= "0100"; -- FCT Frame
    constant C_ACK_FRM   :std_logic_vector(3 downto 0):= "0101"; -- ACK Frame
    constant C_NACK_FRM  :std_logic_vector(3 downto 0):= "0110"; -- NACK Frame
    constant C_FULL_FRM  :std_logic_vector(3 downto 0):= "0111"; -- FULL Frame
    constant C_RETRY_FRM :std_logic_vector(3 downto 0):= "1000"; -- RETRY Frame

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: receive_error
        port map (
            CLK                      => CLK,
            RST_N                    => RST_N,
            TYPE_FRAME_DWI           => s_type_frame_dwi,
            RX_ERR                   => s_rx_err,
            TYPE_FRAME_CRC           => s_type_frame_crc,
            CRC_ERR                  => s_crc_err,
            TYPE_FRAME_SEQ           => s_type_frame_seq,
            END_FRAME                => s_end_frame,
            SEQ_ERR                  => s_seq_err,
            FAR_END                  => s_far_end,
            ACK_REQUEST              => s_ack_request,
            NACK_REQUEST             => s_nack_request,
            TRANSCEIVE_POLARITY_FLAG => open,
            REQ_ACK_DONE             => s_done,
            RECEIVE_POLARITY_FLAG    => open
        );

    -- Clock process
    clk_process : process
    begin
        while now < 1500 ns loop -- Stop simulation after 1000 ns
            CLK <= '0';
            wait for CLK_PERIOD / 2;
            CLK <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;
    
    -- Stimulus process
    stim_proc: process
    begin        
        -- Reset the FSM
        RST_N <= '0';
        wait for CLK_PERIOD; 
        wait for CLK_PERIOD; 
        wait for CLK_PERIOD; 
        wait for CLK_PERIOD; 
        wait for CLK_PERIOD; 
        wait for CLK_PERIOD; 
        wait for CLK_PERIOD; 
        wait for CLK_PERIOD/2;
        RST_N <= '1';
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD;
        wait for CLK_PERIOD/2;
        wait for 4 ns;
        
       
-- Test 1 : d�tection des erreurs, priorit� entre les requ�tes, types de trames, fsm

        -- Cas 1: Erreur SEQ_ERR 
        -- Resultat attendu : NACK, RPF = 1, TPF = 0, error_negative
        s_type_frame_seq <= C_FCT_FRM; -- Trame de contr�le
        s_seq_err <= '1';
        s_far_end <= '1';
        wait for CLK_PERIOD;
        s_seq_err <= '0';
        
        -- Cas 2: Erreur RX_ERR 
        -- Resultat attendu : NACK, RPF = 1, TPF = 0, error_negative
        s_type_frame_dwi <= C_DATA_FRM; -- Trame DATA
        s_rx_err <= '1';
        wait for CLK_PERIOD;
        s_rx_err <= '0';
   
        -- Cas 2: Erreur CRC_ERR
        -- Resultat attendu : NACK, RPF = 1, TPF = 0, error_negative
        s_type_frame_crc <= C_BC_FRM; -- Trame BROADCAST
        s_crc_err <= '1';
        wait for CLK_PERIOD;
        s_crc_err <= '0';

        -- Cas 3: Erreur SEQ_ERR
        -- Resultat attendu : NACK, RPF = 0, TPF = 1, error_positive
        s_type_frame_seq <= C_FCT_FRM; -- Trame de contr�le
        s_seq_err <= '1';
        wait for CLK_PERIOD;
        s_seq_err <= '0';

        -- Cas 4: Fin de trame correcte 
        -- Resultat attendu : ACK, RPF = 0, TPF = 0, valid_positive
        s_end_frame <= '1';
        wait for CLK_PERIOD;
        s_end_frame <= '0';
        
        -- Cas 5: Erreur de rx
        -- Resultat attendu : NACK, RPF = 1, TPF = 0, error_negative
        s_type_frame_dwi <= C_DATA_FRM; -- Trame DATA
        s_rx_err <= '1';
        wait for CLK_PERIOD;
        s_rx_err <= '0';
        
        -- Cas 6: Fin de trame correcte 
        -- Resultat attendu : ACK, RPF = 1, TPF = 1, valid_negative
        s_end_frame <= '1';
        wait for CLK_PERIOD;
        s_end_frame <= '0';
        
        wait for 50 ns;

-- Test 2 : Gestion du done et cas critiques
    -- choisir la requete de ack ou de nack
    -- et choisir entre les 5 choix pour g�n�rer le done dans diff�rentes cnditions 

        -- Requete de ack
        s_type_frame_seq <= C_FCT_FRM; 
        s_end_frame <= '1';
        wait for CLK_PERIOD;
        s_end_frame <= '0';
--       -- Requete de nack
--        s_type_frame_dwi <= C_DATA_FRM; 
--        s_rx_err <= '1';
--        wait for CLK_PERIOD;
--        s_rx_err <= '0';
        
--        -- Choix 1
--        -- Attente du done
--        wait for CLK_PERIOD; 
--        wait for CLK_PERIOD; 
--        wait for CLK_PERIOD; 
--        wait for CLK_PERIOD;
--        -- Generation du done de la requete de ack
--        s_done <= '1';
--        wait for CLK_PERIOD;
--        s_done <= '0';

        -- Choix 2        
        -- NACK 1 cycle avant le done 
        -- Resultat attendu : NACK request doit etre � 0 apr�s le done 
        wait for CLK_PERIOD;
        -- Requete de nack
        s_type_frame_seq <= C_DATA_FRM; -- Trame DATA
        s_seq_err <= '1';
        s_far_end <= '1';
        wait for CLK_PERIOD; 
        s_seq_err <= '0';
        s_far_end <= '0';
        wait for CLK_PERIOD; 
        wait for CLK_PERIOD; 
        -- Generation du done de la requete de ack
        s_done <= '1';
        wait for CLK_PERIOD;
        s_done <= '0';
        
        -- Choix 3
        -- ACK 1 cycle avant le done 
        -- Resultat attendu : ACK request doit etre � 0 apr�s le done 
--        wait for CLK_PERIOD;
--        -- Requete de nack
--        s_type_frame_seq <= C_DATA_FRM; -- Trame DATA
--        s_end_frame <= '1';
--        wait for CLK_PERIOD; 
--        s_end_frame <= '0';
--        wait for CLK_PERIOD; 
--        wait for CLK_PERIOD; 
--        -- Generation du done de la requete de ack
--        s_done <= '1';
--        wait for CLK_PERIOD;
--        s_done <= '0';

--        -- Choix 4        
--        -- NACK et done simultan� 
--        -- Resultat attendu : NACK request doit rest� � 1 apr�s le done 
--        wait for CLK_PERIOD;
--        wait for CLK_PERIOD; 
--        -- Requete de nack
--        s_type_frame_seq <= C_DATA_FRM; -- Trame DATA
--        s_seq_err <= '1';
--        s_far_end <= '1';
--        wait for CLK_PERIOD; 
--        s_seq_err <= '0';
--        s_far_end <= '0';
--        wait for CLK_PERIOD; 
--        -- Generation du done de la requete de ack
--        s_done <= '1';
--        wait for CLK_PERIOD;
--        s_done <= '0';

--        -- Choix 5
--      -- ACK et done simultan� 
--      -- Resultat attendu : ACK request doit rest� � 1 apr�s le done 
--        wait for CLK_PERIOD;
--        wait for CLK_PERIOD; 
--        -- Requete de nack
--        s_type_frame_seq <= C_DATA_FRM; -- Trame DATA
--        s_end_frame <= '1';
--        wait for CLK_PERIOD; 
--        s_end_frame <= '0';
--        wait for CLK_PERIOD; 
--        -- Generation du done de la requete de ack
--        s_done <= '1';
--        wait for CLK_PERIOD;
--        s_done <= '0';

        -- Stop simulation
        wait;
    end process;

end testbench;

