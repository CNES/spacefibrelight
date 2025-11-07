<a href="/spacefibrelight/reports/design_hierarchy.html#vhdl-packages">Back to Design Hierarchy Report</a>

<br>

# Package - data_link_lib

## Summary

| Name | Location | Description |
| --- | --- | --- |
|data_link_lib|<linty-anchor href="//src/pkg_data_link.vhd#32">pkg_data_link.vhd#32</linty-anchor>||


## Constants

Count: 53

| Name | Type | Default value | Description |
| --- | --- | --- | --- |
|<linty-anchor href="//src/pkg_data_link.vhd#34">C_CAPA_LINK_RST</linty-anchor>|integer|0|Link Reset bitfield in lane capability vector|
|<linty-anchor href="//src/pkg_data_link.vhd#35">C_CAPA_LANE_START</linty-anchor>|integer|1|Lane Start bitfield in lane capability vector|
|<linty-anchor href="//src/pkg_data_link.vhd#36">C_CAPA_DATA_SCRAM</linty-anchor>|integer|2|Data Scrambled bitfield in lane capability vector|
|<linty-anchor href="//src/pkg_data_link.vhd#37">C_CAPA_MULTI_LANE</linty-anchor>|integer|3|Multi-Lane bitfield in lane capability vector|
|<linty-anchor href="//src/pkg_data_link.vhd#38">C_CAPA_ROUTING_SW</linty-anchor>|integer|4|Routing Switch bitfield in lane capability vector|
|<linty-anchor href="//src/pkg_data_link.vhd#40">C_OUT_BUF_SIZE</linty-anchor>|integer|7|fifo depth = 2**7= 128 words of 32 bits|
|<linty-anchor href="//src/pkg_data_link.vhd#41">C_FCT_CC_SIZE</linty-anchor>|integer|8|FCT credit counter size: 4x64xM = 256|
|<linty-anchor href="//src/pkg_data_link.vhd#42">C_FCT_CC_MAX</linty-anchor>|unsigned|to_unsigned ( 255 , C_FCT_CC_SIZE )|FCT credit counter size: 4x64xM = 256|
|<linty-anchor href="//src/pkg_data_link.vhd#43">C_M_SIZE</linty-anchor>|integer|4|Size of M which is multiplier +1|
|<linty-anchor href="//src/pkg_data_link.vhd#44">C_MULT_SIZE</linty-anchor>|integer|3|Size of multiplier|
|<linty-anchor href="//src/pkg_data_link.vhd#45">C_CHANNEL_SIZE</linty-anchor>|integer|5|Channel number field|
|<linty-anchor href="//src/pkg_data_link.vhd#47">C_MID_BUF_SIZE</linty-anchor>|integer|7|fifo depth = 2**7= 128 words of 32 bits for the middle buffer (data)|
|<linty-anchor href="//src/pkg_data_link.vhd#48">C_MID_BUF_BC_SIZE</linty-anchor>|integer|3|fifo depth = 2**3= 8 words of 32 bits for the middle buffer (broadcast)|
|<linty-anchor href="//src/pkg_data_link.vhd#50">C_IN_BUF_SIZE</linty-anchor>|integer|8|fifo depth = 2**8= 256 words of 32 bits for the input buffer|
|<linty-anchor href="//src/pkg_data_link.vhd#52">C_DATA_LENGTH</linty-anchor>|integer|32|Data width|
|<linty-anchor href="//src/pkg_data_link.vhd#53">C_BYTE_BY_WORD_LENGTH</linty-anchor>|integer|4|Number of byte in a word|
|<linty-anchor href="//src/pkg_data_link.vhd#54">C_DATA_K_WIDTH</linty-anchor>|integer|C_DATA_LENGTH + C_BYTE_BY_WORD_LENGTH|Data + k character width|
|<linty-anchor href="//src/pkg_data_link.vhd#55">C_TYPE_FRAME_LENGTH</linty-anchor>|integer|4|Type of frame vector width|
|<linty-anchor href="//src/pkg_data_link.vhd#56">C_MAX_DATA_FRAME</linty-anchor>|unsigned ( 7 downto 0 )|to_unsigned ( 65 , 8 )|Maximum number of words in a Data frame|
|<linty-anchor href="//src/pkg_data_link.vhd#57">C_MAX_IDLE_FRAME</linty-anchor>|unsigned ( 7 downto 0 )|to_unsigned ( 64 , 8 )|Maximum number of words in an Idle frame|
|<linty-anchor href="//src/pkg_data_link.vhd#58">C_WORD_BC_FRAME</linty-anchor>|unsigned ( 1 downto 0 )|to_unsigned ( 2 , 2 )|Number of words in a Broadcast frame|
|<linty-anchor href="//src/pkg_data_link.vhd#59">C_BYTE_WIDTH</linty-anchor>|integer|8|Byte width|
|<linty-anchor href="//src/pkg_data_link.vhd#61">C_DATA_FRM</linty-anchor>|std_logic_vector ( 3 downto 0 )|"0001"|DATA Frame|
|<linty-anchor href="//src/pkg_data_link.vhd#62">C_BC_FRM</linty-anchor>|std_logic_vector ( 3 downto 0 )|"0010"|BROADCAST Frame|
|<linty-anchor href="//src/pkg_data_link.vhd#63">C_IDLE_FRM</linty-anchor>|std_logic_vector ( 3 downto 0 )|"0011"|IDLE Frame|
|<linty-anchor href="//src/pkg_data_link.vhd#64">C_FCT_FRM</linty-anchor>|std_logic_vector ( 3 downto 0 )|"0100"|FCT Frame|
|<linty-anchor href="//src/pkg_data_link.vhd#65">C_ACK_FRM</linty-anchor>|std_logic_vector ( 3 downto 0 )|"0101"|ACK Frame|
|<linty-anchor href="//src/pkg_data_link.vhd#66">C_NACK_FRM</linty-anchor>|std_logic_vector ( 3 downto 0 )|"0110"|NACK Frame|
|<linty-anchor href="//src/pkg_data_link.vhd#67">C_FULL_FRM</linty-anchor>|std_logic_vector ( 3 downto 0 )|"0111"|FULL Frame|
|<linty-anchor href="//src/pkg_data_link.vhd#68">C_RETRY_FRM</linty-anchor>|std_logic_vector ( 3 downto 0 )|"1000"|RETRY Frame|
|<linty-anchor href="//src/pkg_data_link.vhd#70">C_EEP_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"FE"|K30.7 EEP|
|<linty-anchor href="//src/pkg_data_link.vhd#71">C_EOP_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"FD"|K29.7 EOP|
|<linty-anchor href="//src/pkg_data_link.vhd#72">C_K28_7_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"FC"|K28.7 Comma|
|<linty-anchor href="//src/pkg_data_link.vhd#73">C_K28_3_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"7C"|K28.3 FCT|
|<linty-anchor href="//src/pkg_data_link.vhd#74">C_K28_2_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"5C"|K28.2 EBF|
|<linty-anchor href="//src/pkg_data_link.vhd#75">C_K28_0_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"1C"|K28.0 EDF|
|<linty-anchor href="//src/pkg_data_link.vhd#76">C_FILL_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"FB"|K27.7|
|<linty-anchor href="//src/pkg_data_link.vhd#77">C_SBF_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"5D"|D29.2 SBF|
|<linty-anchor href="//src/pkg_data_link.vhd#78">C_NACK_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"BB"|D27.5|
|<linty-anchor href="//src/pkg_data_link.vhd#79">C_SDF_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"50"|D16.2|
|<linty-anchor href="//src/pkg_data_link.vhd#80">C_FULL_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"6F"|D15.3|
|<linty-anchor href="//src/pkg_data_link.vhd#81">C_RETRY_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"87"|D7.4|
|<linty-anchor href="//src/pkg_data_link.vhd#82">C_SIF_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"84"|D4.2 SIF|
|<linty-anchor href="//src/pkg_data_link.vhd#83">C_ACK_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"A2"|D2.5|
|<linty-anchor href="//src/pkg_data_link.vhd#84">C_RESERVED_SYMB</linty-anchor>|std_logic_vector ( 07 downto 00 )|x"00"|D0.0|
|<linty-anchor href="//src/pkg_data_link.vhd#86">C_SDF_WORD</linty-anchor>|std_logic_vector ( 15 downto 00 )|C_SDF_SYMB & C_K28_7_SYMB|2 first bytes of a Start of Data Frame word|
|<linty-anchor href="//src/pkg_data_link.vhd#87">C_SBF_WORD</linty-anchor>|std_logic_vector ( 15 downto 00 )|C_SBF_SYMB & C_K28_7_SYMB|2 first bytes of a Start of Broadcast Frame word|
|<linty-anchor href="//src/pkg_data_link.vhd#88">C_SIF_WORD</linty-anchor>|std_logic_vector ( 15 downto 00 )|C_SIF_SYMB & C_K28_7_SYMB|2 first bytes of a Start of Idle Frame word|
|<linty-anchor href="//src/pkg_data_link.vhd#89">C_ACK_WORD</linty-anchor>|std_logic_vector ( 15 downto 00 )|C_ACK_SYMB & C_K28_7_SYMB|2 first bytes of a ACK word|
|<linty-anchor href="//src/pkg_data_link.vhd#90">C_NACK_WORD</linty-anchor>|std_logic_vector ( 15 downto 00 )|C_NACK_SYMB & C_K28_7_SYMB|2 first bytes of a NACK word|
|<linty-anchor href="//src/pkg_data_link.vhd#91">C_FULL_WORD</linty-anchor>|std_logic_vector ( 15 downto 00 )|C_FULL_SYMB & C_K28_7_SYMB|2 first bytes of a FULL word|
|<linty-anchor href="//src/pkg_data_link.vhd#92">C_RETRY_WORD</linty-anchor>|std_logic_vector|C_RESERVED_SYMB & C_RESERVED_SYMB & C_RETRY_SYMB & C_K28_7_SYMB|Retry word|
|<linty-anchor href="//src/pkg_data_link.vhd#93">C_RXERR_WORD</linty-anchor>|std_logic_vector|C_RESERVED_SYMB & C_RESERVED_SYMB & C_RESERVED_SYMB & C_RESERVED_SYMB|RXERR word|


## Types

Count: 5

| Name | Definition | Description |
| --- | --- | --- |
|<linty-anchor href="//src/pkg_data_link.vhd#97">int_array</linty-anchor>|array ( natural range <> ) of integer||
|<linty-anchor href="//src/pkg_data_link.vhd#98">vc_data_array</linty-anchor>|array ( natural range <> ) of std_logic_vector ( C_DATA_LENGTH - 1 downto 0 )||
|<linty-anchor href="//src/pkg_data_link.vhd#99">vc_k_array</linty-anchor>|array ( natural range <> ) of std_logic_vector ( C_BYTE_BY_WORD_LENGTH - 1 downto 0 )||
|<linty-anchor href="//src/pkg_data_link.vhd#100">vc_data_k_array</linty-anchor>|array ( natural range <> ) of std_logic_vector ( C_DATA_LENGTH + C_BYTE_BY_WORD_LENGTH - 1 downto 0 )||
|<linty-anchor href="//src/pkg_data_link.vhd#101">vc_m_val_array</linty-anchor>|array ( natural range <> ) of std_logic_vector ( C_M_SIZE - 1 downto 0 )||


## Subtypes

Count: 0



## Functions

Count: 3

| Name | Returned type | Description | Details |
| --- | --- | --- | :---: |
|<linty-anchor href="//src/pkg_data_link.vhd#105">calculate_crc_16</linty-anchor>|STD_LOGIC_VECTOR|Calcluates the crc 16 bits|<a href="/spacefibrelight/reports/design/package_2/function_1.html"><img title="View Function Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Function Details"></a>|
|<linty-anchor href="//src/pkg_data_link.vhd#106">calculate_crc_8</linty-anchor>|STD_LOGIC_VECTOR|Calcluates the crc 8 bits|<a href="/spacefibrelight/reports/design/package_2/function_2.html"><img title="View Function Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Function Details"></a>|
|<linty-anchor href="//src/pkg_data_link.vhd#107">calculate_idle</linty-anchor>|STD_LOGIC_VECTOR|Calcluates Idle data|<a href="/spacefibrelight/reports/design/package_2/function_3.html"><img title="View Function Details" src="/spacefibrelight/_static/images/icon_details.png" style="max-height: 25px; width: auto;" alt="View Function Details"></a>|


## Procedures

Count: 0



## Global Signals

Count: 0



## Global Variables

Count: 0



## Component Definitions

Count: 0



<br>

<a href="/spacefibrelight/reports/design_hierarchy.html#vhdl-packages">Back to Design Hierarchy Report</a>