<a href="/spacefibrelight/reports/design_hierarchy.html#vhdl-entities">Back to Design Hierarchy Report</a>

<br>

# Entity - data_seq_check

## Summary

| Name | Location | Description |
| --- | --- | --- |
|data_seq_check|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#32">data_seq_check.vhd#32</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_data_seq_check | <linty-anchor href="/src/module_data_link/data_link.vhd#865">data_link.vhd#865</linty-anchor> |  | <a href="/spacefibrelight/reports/design/module_22/instantiation_1.html"><img title="View Instantiation Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details"></a> |


## Generics

Count: 1

| Name | Type | Default value | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#34">G_VC_NUM</linty-anchor>|integer|8|Number of virtual channel|
## Ports

Count: 52

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#37">CLK</linty-anchor>|in|std_logic|Global clock|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#39">LINK_RESET_DLRE</linty-anchor>|in|std_logic|Link Reset command|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#41">DATA_DCCHECK</linty-anchor>|in|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|Data parallel from data_crc_check|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#42">VALID_K_CHARAC_DCCHECK</linty-anchor>|in|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|K character valid in the 32-bit DATA_DCCHECK vector|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#43">NEW_WORD_DCCHECK</linty-anchor>|in|std_logic|New word Flag associated with DATA_DCCHECK vector|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#44">END_FRAME_DCCHECK</linty-anchor>|in|std_logic|End frame/control word from data_crc_check|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#45">TYPE_FRAME_DCCHECK</linty-anchor>|in|std_logic_vector ( C_TYPE_FRAME_LENGTH - 1 downto 0 )|Current frame/control word type from data_crc_check|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#46">SEQ_NUM_DCCHECK</linty-anchor>|in|std_logic_vector ( 7 downto 0 )|SEQ_NUM from data_crc_check|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#47">CRC_ERR_DCCHECK</linty-anchor>|in|std_logic|CRC error flag from data_crc_check|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#48">FRAME_ERR_DCCHECK</linty-anchor>|in|std_logic|Frame error flag from data_crc_check|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#49">MULTIPLIER_DCCHECK</linty-anchor>|in|std_logic_vector ( C_MULT_SIZE - 1 downto 0 )|Multiplier value of the current FCT word|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#50">VC_DCCHECK</linty-anchor>|in|std_logic_vector ( C_CHANNEL_SIZE - 1 downto 0 )|Virtual Channel of the current FCT word|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#51">RXERR_DCCHECK</linty-anchor>|in|std_logic|RXERR flag detection|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#52">RXERR_ALL_DCCHECK</linty-anchor>|in|std_logic|RXERR flag detection during broadcast and data frame status|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#54">NEAR_END_RPF_DERRM</linty-anchor>|in|std_logic|Near-End received polarity flag|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#55">SEQ_NUM_ACK_DSCHECK</linty-anchor>|out|std_logic_vector ( 6 downto 0 )|SEQ_NUM ACK value|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#56">END_FRAME_DSCHECK</linty-anchor>|out|std_logic|End flag of the current frame/control word|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#57">TYPE_FRAME_DSCHECK</linty-anchor>|out|std_logic_vector ( C_TYPE_FRAME_LENGTH - 1 downto 0 )|Current frame/control word type|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#58">TRANS_POL_FLG_DERRM</linty-anchor>|in|std_logic|Transmission polarity flag|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#59">CRC_ERR_DSCHECK</linty-anchor>|out|std_logic|CRC error flag for the current frame/control word|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#60">FRAME_ERR_DSCHECK</linty-anchor>|out|std_logic|Frame error flag for the current frame/control word|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#61">SEQ_NUM_ERR_DSCHECK</linty-anchor>|out|std_logic|SEQ_NUM error for the current frame/control word|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#62">RXERR_DSCHECK</linty-anchor>|out|std_logic|RXERR flag for the current frame/control word|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#64">DATA_DSCHECK</linty-anchor>|out|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|Data parallel to data_mid_buffer (data frame)|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#65">VALID_K_CHARAC_DSCHECK</linty-anchor>|out|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|K character valid in the 32-bit DATA_DSCHECK vector|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#66">NEW_WORD_DSCHECK</linty-anchor>|out|std_logic|New word flag associated with DATA_DSCHECK vector|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#67">END_FRAME_FIFO_DSCHECK</linty-anchor>|out|std_logic|End data frame flag|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#68">FRAME_ERR_DATA_DSCHECK</linty-anchor>|out|std_logic|Frame error flag for the current data frame|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#69">SEQ_NUM_ERR_DATA_DSCHECK</linty-anchor>|out|std_logic|SEQ_NUM error for the current data frame|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#70">CRC_ERR_DATA_DSCHECK</linty-anchor>|out|std_logic|CRC error flag for the current data frame|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#71">RXERR_DATA_DSCHECK</linty-anchor>|out|std_logic|RXERR flag for the current data frame|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#73">DATA_BC_DSCHECK</linty-anchor>|out|std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )|Data parallel to data_mid_buffer_bc (broadcast frame)|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#74">VALID_K_CHARAC_BC_DSCHECK</linty-anchor>|out|std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )|K character valid in the 32-bit DATA_BC_DSCHECK vector|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#75">NEW_WORD_BC_DSCHECK</linty-anchor>|out|std_logic|New word flag associated with DATA_BC_DSCHECK vector|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#76">END_FRAME_FIFO_BC_DSCHECK</linty-anchor>|out|std_logic|End broadcast frame flag|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#77">FRAME_ERR_BC_DSCHECK</linty-anchor>|out|std_logic|Frame error flag for the current broadcast frame|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#78">SEQ_NUM_ERR_BC_DSCHECK</linty-anchor>|out|std_logic|SEQ_NUM error for the current broadcast frame|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#79">CRC_ERR_BC_DSCHECK</linty-anchor>|out|std_logic|CRC error flag for the current broadcast frame|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#80">RXERR_BC_DSCHECK</linty-anchor>|out|std_logic|RXERR flag for the current broadcast frame|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#82">FCT_FAR_END_DSCHECK</linty-anchor>|out|std_logic_vector ( G_VC_NUM - 1 downto 0 )|FCT received flag for each virtual channel|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#83">M_VAL_DSCHECK</linty-anchor>|out|std_logic_vector ( C_M_SIZE - 1 downto 0 )|M value associated with FCT_FAR_END_DSCHECK|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#85">SEQ_NUM_DSCHECK</linty-anchor>|out|std_logic_vector ( 7 downto 0 )|last SEQ_NUM|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#86">NACK_SEQ_NUM_DSCHECK</linty-anchor>|out|std_logic_vector ( 7 downto 0 )|last NACK SEQ_NUM|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#87">ACK_SEQ_NUM_DSCHECK</linty-anchor>|out|std_logic_vector ( 7 downto 0 )|last ACK SEQ_NUM|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#88">ACK_COUNTER_RX_DSCHECK</linty-anchor>|out|std_logic_vector ( 2 downto 0 )|ACK counter RX|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#89">NACK_COUNTER_RX_DSCHECK</linty-anchor>|out|std_logic_vector ( 2 downto 0 )|NACK counter RX|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#90">FCT_COUNTER_RX_DSCHECK</linty-anchor>|out|std_logic_vector ( 3 downto 0 )|FCT counter RX|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#91">FULL_COUNTER_RX_DSCHECK</linty-anchor>|out|std_logic_vector ( 1 downto 0 )|FULL counter RX|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#92">ACK_PULSE_RX_DSCHECK</linty-anchor>|out|std_logic|New ACK received flag|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#93">NACK_PULSE_RX_DSCHECK</linty-anchor>|out|std_logic|New NACK received flag|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#94">FCT_PULSE_RX_DSCHECK</linty-anchor>|out|std_logic|New FCT received flag|
|<linty-anchor href="//src/module_data_link/data_seq_check.vhd#95">FULL_PULSE_RX_DSCHECK</linty-anchor>|out|std_logic|New FULL received flag|


<br>

<a href="/spacefibrelight/reports/design_hierarchy.html#vhdl-entities">Back to Design Hierarchy Report</a>