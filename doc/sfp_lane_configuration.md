This README explains how to change the channel without changing the quad for the GTY IP from Xilinx in the context of the SpaceFibre Light project

## Design

First, in the IP configuration itself, in the `Quad Interface Mapping` section, you need to change the channels from 0 to 3 as well as the clock sources, as shown in the following image:
![](assets/Quad_config.png)

Next, in the `Structural Options` section, you need to change ch0_loopback and hsclk0_lcplllock.
![](assets/Structural_Option.png)

In `phy_plus_lane.vhd`,  changes in the component `extended_phy_layer_gtwiz_versal_0_0` declaration to keep only the selected channel

```
component extended_phy_layer_gtwiz_versal_0_0 is
  port (
------------------beginning of conditionnal port -------------------------------------------
-- these ports might change depending on the channel you are using
   -- CHANNEL 0
   -- QUAD0_TX0_outclk : out STD_LOGIC;
   -- QUAD0_RX0_outclk : out STD_LOGIC;
   -- QUAD0_TX0_usrclk : in STD_LOGIC;
   -- QUAD0_RX0_usrclk : in STD_LOGIC;
   -- QUAD0_ch0_loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );
   
   -- CHANNEL 1
   -- QUAD0_TX1_outclk : out STD_LOGIC;
   -- QUAD0_RX1_outclk : out STD_LOGIC;
   -- QUAD0_TX1_usrclk : in STD_LOGIC;
   -- QUAD0_RX1_usrclk : in STD_LOGIC;
   -- QUAD0_ch1_loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );

   -- CHANNEL 2
   -- QUAD0_TX2_outclk : out STD_LOGIC;
   -- QUAD0_RX2_outclk : out STD_LOGIC;
   -- QUAD0_TX2_usrclk : in STD_LOGIC;
   -- QUAD0_RX2_usrclk : in STD_LOGIC;
   -- QUAD0_ch2_loopback : in STD_LOGIC_VECTOR ( 2 downto 0 );

   -- CHANNEL 3
    QUAD0_TX3_outclk : out STD_LOGIC;
    QUAD0_RX3_outclk : out STD_LOGIC;
    QUAD0_TX3_usrclk : in STD_LOGIC;
    QUAD0_RX3_usrclk : in STD_LOGIC;
    QUAD0_ch3_loopback : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    ------------ End of conditionnal port ---------------
```

In `phy_plus_lane.vhd`,  changes in the component `extended_phy_layer_gtwiz_versal_0_0` instanciation `gtwiz_versal_0`: 

```vhdl
  ------------------------------------------------------------------------------
   -- Instance of extended_phy_layer module
   ------------------------------------------------------------------------------
-- some port depends on GTYP configuration for channel----
gtwiz_versal_0: extended_phy_layer_gtwiz_versal_0_0
     port map (
--------------- beginning of conditionnal port map ------------
      --CHANNEL 0
      --QUAD0_RX0_outclk => open,
      --QUAD0_RX0_usrclk => clk_tx,
      --QUAD0_TX0_outclk => QUAD0_TX0_outclk,
      --QUAD0_TX0_usrclk => clk_tx,
      --QUAD0_ch0_loopback(2 downto 0) => QUAD0_ch0_loopback,

      --CHANNEL 1
      --QUAD0_RX1_outclk => open,
      --QUAD0_RX1_usrclk => clk_tx,
      --QUAD0_TX1_outclk => QUAD0_TX0_outclk,
      --QUAD0_TX1_usrclk => clk_tx,
      --QUAD0_ch1_loopback(2 downto 0) => QUAD0_ch0_loopback,
   
      --CHANNEL 2
      --QUAD0_RX2_outclk => open,
      --QUAD0_RX2_usrclk => clk_tx,
      --QUAD0_TX2_outclk => QUAD0_TX0_outclk,
      --QUAD0_TX2_usrclk => clk_tx,
      --QUAD0_ch2_loopback(2 downto 0) => QUAD0_ch0_loopback,

      --CHANNEL 3
      QUAD0_RX3_outclk => open,
      QUAD0_RX3_usrclk => clk_tx,
      QUAD0_TX3_outclk => QUAD0_TX0_outclk,
      QUAD0_TX3_usrclk => clk_tx,
      QUAD0_ch3_loopback(2 downto 0) => QUAD0_ch0_loopback,
    ------------ End of conditionnal port map---------------
```

in the declaration section change the constant `lane_number` to match your new channel:
```
--- Depending on the GTYP lane you use some port may change 
-- FIXME : some generic associated with a generate for each component flavour
--         might be added for a full configuation from xilinx IP gui
--         this is not done for now because it will introduce lots of code dupplication
--         not wanted for now as the IP is still in validation.
--         It is worth noted that VHDL cannot dynamlically create port (or assign them)

constant lane_number : integer :=3; -- from 0 to 3
```

This will automatically adapt in the code the following part:
```vhdl
QUAD0_rxp(lane_number)               <= RX_POS;
QUAD0_rxn(lane_number)               <= RX_NEG;
TX_POS                     <= QUAD0_txp(lane_number);
TX_NEG                     <= QUAD0_txn(lane_number);
```


## Simulation
In order to rerun the simulation tests after the channel change, please follow the procedure below.

### mem file
 After place and route:
1. select `top_vek280.vhd` as simulation top level

2. click on `simulation -> post place and route timing` (you can use TCL command `launch_simulation -mode post-implementation -type timing`)
   This will populate the folder `<vivado_project>/<vivado_project>.ip_user_files`

3. For each scenario:
  1. Retrieve the `extended_phy_layer_gtwiz_versal_0_0_gt_quad_base_0.mem` file from the vivado project folder, here: `vivado_project/vivado_project.ip_user_files/mem_init_files/extended_phy_layer_gtwiz_versal_0_0_gt_quad_base_0.mem`

  2. Copy it into all the scenario directories. For example, for the 'lane_loopback' scenario, it should be placed in the corresponding director: `sim/scenario/lane_loopback/extended_phy_layer_gtwiz_versal_0_0_gt_quad_base_0.mem`

### Verilog model
To Update IP verilog model:
1. locate to spacefibrelight gen IP folder: `<vivado_project>/<vivado_project>.gen/sources_1/bd/design_1/ip/design_1_spacefibrelight_0_0`
2. copy the following file in the simulation folder: `sim/libraries/cores/extended_phy_layer_gtwiz_versal_0_0`
  - from folder `dc7d/` (this folder name is supposed to change)
    ```
    extended_phy_layer_gtwiz_versal_0_0_inst.v
    extended_phy_layer_gtwiz_versal_0_0_intf_quad_map.v
    extended_phy_layer_gtwiz_versal_0_0_powergood_logic.v
    extended_phy_layer_gtwiz_versal_0_0_quad_top.v
    extended_phy_layer_gtwiz_versal_0_0_reset_ip.v
    ```
  - from folder `dc7d/sim`
    ```
    extended_phy_layer_gtwiz_versal_0_0.v
    ```
  - from folder `dc7d/ip_0`
    ```
    extended_phy_layer_gtwiz_versal_0_0_gt_quad_base_0_inst.v
    extended_phy_layer_gtwiz_versal_0_0_gt_quad_base_0_rx_function.v
    extended_phy_layer_gtwiz_versal_0_0_gt_quad_base_0_tx_function.v
    extended_phy_layer_gtwiz_versal_0_0_gt_quad_base_0_rules_output.vh
    ```
  - from folder `dc7d/ip_0/sim`
    ```
    extended_phy_layer_gtwiz_versal_0_0_gt_quad_base_0.v
    ``` 
