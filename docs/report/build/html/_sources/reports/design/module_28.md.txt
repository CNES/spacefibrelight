[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)

<br>

# Entity - mib_data_link

## Summary

| Name | Location | Description |
| --- | --- | --- |
|mib_data_link|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#29">mib_data_link.vhd#29</linty-anchor>||
## Instantiations

Count: 1

| Name | Location | Description | Details |
| --- | --- | --- | :---: |
| inst_mib_data_link | <linty-anchor href="//src/ip_spacefibre_light_top/spacefibre_light_top.vhd#649">spacefibre_light_top.vhd#649</linty-anchor> |  | [<img title="View Instantiation Details" src="/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Instantiation Details">](module_28/instantiation_1.md) |


## Generics

Count: 1

| Name | Type | Default value | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#31">G_VC_NUM</linty-anchor>|integer|8|Number of virtual channel|
## Ports

Count: 78

| Name | Mode | Type | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#35">INTERFACE_RESET</linty-anchor>|in|std_logic|Reset the link and all configuration register of the Data Link layer from the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#36">LINK_RESET</linty-anchor>|in|std_logic|Reset the link from the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#37">NACK_RST_EN</linty-anchor>|in|std_logic|Enable automatic link reset on NACK reception from the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#38">NACK_RST_MODE</linty-anchor>|in|std_logic|Up for instant link reset on NACK reception, down for link reset at the end of the current received frame on NACK reception from the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#39">PAUSE_VC</linty-anchor>|in|std_logic_vector ( G_VC_NUM downto 0 )|Pause the corresponding virtual channel after the end of current transmission from the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#40">CONTINUOUS_VC</linty-anchor>|in|std_logic_vector ( G_VC_NUM - 1 downto 0 )|Enable the corresponding virtual channel continuous mode from the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#42">INTERFACE_RESET_DL</linty-anchor>|out|std_logic|Reset the link and all configuration register of the Data Link layer to DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#43">LINK_RESET_DL</linty-anchor>|out|std_logic|Reset the link to DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#44">NACK_RST_EN_DL</linty-anchor>|out|std_logic|Enable automatic link reset on NACK reception to DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#45">NACK_RST_MODE_DL</linty-anchor>|out|std_logic|Up for instant link reset on NACK reception, down for link reset at the end of current received frame on NACK reception to DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#46">PAUSE_VC_DL</linty-anchor>|out|std_logic_vector ( G_VC_NUM downto 0 )|Pause the corresponding virtual channel after the end of current transmission to DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#47">CONTINUOUS_VC_DL</linty-anchor>|out|std_logic_vector ( G_VC_NUM - 1 downto 0 )|Enable the corresponding virtual channel continuous mode to DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#49">SEQ_NUMBER_TX_DL</linty-anchor>|in|std_logic_vector ( G_VC_NUM - 1 downto 0 )|SEQ_NUMBER in transmission from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#50">SEQ_NUMBER_RX_DL</linty-anchor>|in|std_logic_vector ( G_VC_NUM - 1 downto 0 )|SEQ_NUMBER in reception from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#51">CREDIT_VC_DL</linty-anchor>|in|std_logic_vector ( G_VC_NUM - 1 downto 0 )|Indicates if each corresponding far-end input buffer has credit from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#52">INPUT_BUF_OVF_VC_DL</linty-anchor>|in|std_logic_vector ( G_VC_NUM - 1 downto 0 )|Indicates input buffer overflow from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#53">FCT_CREDIT_OVERFLOW_DL</linty-anchor>|in|std_logic_vector ( G_VC_NUM - 1 downto 0 )|Indicates overflow of each corresponding input buffer from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#54">CRC_LONG_ERROR_DL</linty-anchor>|in|std_logic|CRC long error from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#55">CRC_SHORT_ERROR_DL</linty-anchor>|in|std_logic|CRC short error from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#56">FRAME_ERROR_DL</linty-anchor>|in|std_logic|Frame error from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#57">SEQUENCE_ERROR_DL</linty-anchor>|in|std_logic|Sequence error from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#58">FAR_END_LINK_RESET_DL</linty-anchor>|in|std_logic|Far-end link reset status from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#59">FRAME_FINISHED_DL</linty-anchor>|in|std_logic_vector ( G_VC_NUM downto 0 )|Indicates that corresponding channel finished emitting a frame from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#60">FRAME_TX_DL</linty-anchor>|in|std_logic_vector ( G_VC_NUM downto 0 )|Indicates that corresponding channel is emitting a frame from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#61">DATA_COUNTER_TX_DL</linty-anchor>|in|std_logic_vector ( 6 downto 0 )|Indicate the number of data transmitted in last frame emitted from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#62">DATA_COUNTER_RX_DL</linty-anchor>|in|std_logic_vector ( 6 downto 0 )|Indicate the number of data received in last frame received from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#63">ACK_COUNTER_TX_DL</linty-anchor>|in|std_logic_vector ( 2 downto 0 )|ACK counter TX from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#64">NACK_COUNTER_TX_DL</linty-anchor>|in|std_logic_vector ( 2 downto 0 )|NACK counter TX from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#65">FCT_COUNTER_TX_DL</linty-anchor>|in|std_logic_vector ( 3 downto 0 )|FCT counter TX from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#66">ACK_COUNTER_RX_DL</linty-anchor>|in|std_logic_vector ( 2 downto 0 )|ACK counter RX from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#67">NACK_COUNTER_RX_DL</linty-anchor>|in|std_logic_vector ( 2 downto 0 )|NACK counter RX from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#68">FCT_COUNTER_RX_DL</linty-anchor>|in|std_logic_vector ( 3 downto 0 )|FCT counter RX from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#69">FULL_COUNTER_RX_DL</linty-anchor>|in|std_logic_vector ( 1 downto 0 )|FULL counter RX from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#70">RETRY_COUNTER_RX_DL</linty-anchor>|in|std_logic_vector ( 1 downto 0 )|RETRY counter RX from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#71">CURRENT_TIME_SLOT_DL</linty-anchor>|in|std_logic_vector ( G_VC_NUM - 1 downto 0 )|Current time slot from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#72">RESET_PARAM_DL</linty-anchor>|in|std_logic|Reset configuration parameters control from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#73">LINK_RST_ASSERTED_DL</linty-anchor>|in|std_logic|Link has been reseted from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#74">NACK_SEQ_NUM_DL</linty-anchor>|in|std_logic_vector ( 7 downto 0 )|NACK Seq_num received from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#75">ACK_SEQ_NUM_DL</linty-anchor>|in|std_logic_vector ( 7 downto 0 )|ACK Seq_num received from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#76">DATA_PULSE_RX_DL</linty-anchor>|in|std_logic|Data received pulse signal from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#77">ACK_PULSE_RX_DL</linty-anchor>|in|std_logic|ACK received pulse signal from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#78">NACK_PULSE_RX_DL</linty-anchor>|in|std_logic|NACK received pulse signal from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#79">FCT_PULSE_RX_DL</linty-anchor>|in|std_logic|FCT received pulse signal from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#80">FULL_PULSE_RX_DL</linty-anchor>|in|std_logic|FULL received pulse signal from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#81">RETRY_PULSE_RX_DL</linty-anchor>|in|std_logic|RETRY received pulse signal from DL|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#83">SEQ_NUMBER_TX</linty-anchor>|out|std_logic_vector ( G_VC_NUM - 1 downto 0 )|SEQ_NUMBER in transmission to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#84">SEQ_NUMBER_RX</linty-anchor>|out|std_logic_vector ( G_VC_NUM - 1 downto 0 )|SEQ_NUMBER in reception to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#85">CREDIT_VC</linty-anchor>|out|std_logic_vector ( G_VC_NUM - 1 downto 0 )|Indicates if each corresponding far-end input buffer has credit to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#86">INPUT_BUF_OVF_VC</linty-anchor>|out|std_logic_vector ( G_VC_NUM - 1 downto 0 )|Indicates input buffer overflow to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#87">FCT_CREDIT_OVERFLOW</linty-anchor>|out|std_logic_vector ( G_VC_NUM - 1 downto 0 )|Indicates overflow of each corresponding input buffer to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#88">CRC_LONG_ERROR</linty-anchor>|out|std_logic|CRC long error to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#89">CRC_SHORT_ERROR</linty-anchor>|out|std_logic|CRC short error to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#90">FRAME_ERROR</linty-anchor>|out|std_logic|Frame error to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#91">SEQUENCE_ERROR</linty-anchor>|out|std_logic|Sequence error to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#92">FAR_END_LINK_RESET</linty-anchor>|out|std_logic|Far-end link reset status to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#93">FRAME_FINISHED</linty-anchor>|out|std_logic_vector ( 8 downto 0 )|Indicates that corresponding channel finished emitting a frame to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#94">FRAME_TX</linty-anchor>|out|std_logic_vector ( 8 downto 0 )|Indicates that corresponding channel is emitting a frame to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#95">DATA_COUNTER_TX</linty-anchor>|out|std_logic_vector ( 6 downto 0 )|Indicate the number of data transmitted in last frame emitted to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#96">DATA_COUNTER_RX</linty-anchor>|out|std_logic_vector ( 6 downto 0 )|Indicate the number of data received in last frame received to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#97">ACK_COUNTER_TX</linty-anchor>|out|std_logic_vector ( 2 downto 0 )|ACK counter TX to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#98">NACK_COUNTER_TX</linty-anchor>|out|std_logic_vector ( 2 downto 0 )|NACK counter TX to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#99">FCT_COUNTER_TX</linty-anchor>|out|std_logic_vector ( 3 downto 0 )|FCT counter TX to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#100">ACK_COUNTER_RX</linty-anchor>|out|std_logic_vector ( 2 downto 0 )|ACK counter RX to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#101">NACK_COUNTER_RX</linty-anchor>|out|std_logic_vector ( 2 downto 0 )|NACK counter RX to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#102">FCT_COUNTER_RX</linty-anchor>|out|std_logic_vector ( 3 downto 0 )|FCT counter RX to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#103">FULL_COUNTER_RX</linty-anchor>|out|std_logic_vector ( 1 downto 0 )|FULL counter RX to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#104">RETRY_COUNTER_RX</linty-anchor>|out|std_logic_vector ( 1 downto 0 )|RETRY counter RX to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#105">CURRENT_TIME_SLOT</linty-anchor>|out|std_logic_vector ( G_VC_NUM - 1 downto 0 )|Current time slot to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#106">RESET_PARAM</linty-anchor>|out|std_logic|Reset configuration parameters control to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#107">LINK_RST_ASSERTED</linty-anchor>|out|std_logic|Link has been reseted to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#108">NACK_SEQ_NUM</linty-anchor>|out|std_logic_vector ( 7 downto 0 )|NACK Seq_num received to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#109">ACK_SEQ_NUM</linty-anchor>|out|std_logic_vector ( 7 downto 0 )|ACK Seq_num received to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#110">DATA_PULSE_RX</linty-anchor>|out|std_logic|Data received pulse signal to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#111">ACK_PULSE_RX</linty-anchor>|out|std_logic|ACK received pulse signal to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#112">NACK_PULSE_RX</linty-anchor>|out|std_logic|NACK received pulse signal to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#113">FCT_PULSE_RX</linty-anchor>|out|std_logic|FCT received pulse signal to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#114">FULL_PULSE_RX</linty-anchor>|out|std_logic|FULL received pulse signal to the TOP|
|<linty-anchor href="//src/module_data_link/mib_data_link.vhd#115">RETRY_PULSE_RX</linty-anchor>|out|std_logic|RETRY received pulse signal to the TOP|


<br>

[Back to Design Hierarchy Report](../design_hierarchy.md#vhdl-entities)