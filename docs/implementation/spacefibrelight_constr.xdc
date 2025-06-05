############################################################################
##
##  SpaceFibreLight timing constraints
##  Data: 16/04/2025
##
############################################################################
### Create Clock
# Main Clock 150 MHz
create_clock -name clk -period 6.667 [get_ports clk]

# AXI TX clocks 150 MHz
create_clock -name axi_tx_clk0 -period 6.667 [get_ports AXIS_ACLK_TX_DL[0]]
create_clock -name axi_tx_clk1 -period 6.667 [get_ports AXIS_ACLK_TX_DL[1]]
create_clock -name axi_tx_clk2 -period 6.667 [get_ports AXIS_ACLK_TX_DL[2]]
create_clock -name axi_tx_clk3 -period 6.667 [get_ports AXIS_ACLK_TX_DL[3]]
create_clock -name axi_tx_clk4 -period 6.667 [get_ports AXIS_ACLK_TX_DL[4]]
create_clock -name axi_tx_clk5 -period 6.667 [get_ports AXIS_ACLK_TX_DL[5]]
create_clock -name axi_tx_clk6 -period 6.667 [get_ports AXIS_ACLK_TX_DL[6]]
create_clock -name axi_tx_clk7 -period 6.667 [get_ports AXIS_ACLK_TX_DL[7]]
create_clock -name axi_tx_clk8 -period 6.667 [get_ports AXIS_ACLK_TX_DL[8]]

# AXI RX clocks 150 MHz
create_clock -name axi_rx_clk0 -period 6.667 [get_ports AXIS_ACLK_RX_DL[0]]
create_clock -name axi_rx_clk1 -period 6.667 [get_ports AXIS_ACLK_RX_DL[1]]
create_clock -name axi_rx_clk2 -period 6.667 [get_ports AXIS_ACLK_RX_DL[2]]
create_clock -name axi_rx_clk3 -period 6.667 [get_ports AXIS_ACLK_RX_DL[3]]
create_clock -name axi_rx_clk4 -period 6.667 [get_ports AXIS_ACLK_RX_DL[4]]
create_clock -name axi_rx_clk5 -period 6.667 [get_ports AXIS_ACLK_RX_DL[5]]
create_clock -name axi_rx_clk6 -period 6.667 [get_ports AXIS_ACLK_RX_DL[6]]
create_clock -name axi_rx_clk7 -period 6.667 [get_ports AXIS_ACLK_RX_DL[7]]
create_clock -name axi_rx_clk8 -period 6.667 [get_ports AXIS_ACLK_RX_DL[8]]

### Minimum source latency value
# Main Clock 150 MHz
set_clock_latency -source -early 0.9 [get_clocks clk]
# AXI TX clocks 150 MHz
set_clock_latency -source -early 0.9 [get_clocks axi_tx_clk0]
set_clock_latency -source -early 0.9 [get_clocks axi_tx_clk1]
set_clock_latency -source -early 0.9 [get_clocks axi_tx_clk2]
set_clock_latency -source -early 0.9 [get_clocks axi_tx_clk3]
set_clock_latency -source -early 0.9 [get_clocks axi_tx_clk4]
set_clock_latency -source -early 0.9 [get_clocks axi_tx_clk5]
set_clock_latency -source -early 0.9 [get_clocks axi_tx_clk6]
set_clock_latency -source -early 0.9 [get_clocks axi_tx_clk7]
set_clock_latency -source -early 0.9 [get_clocks axi_tx_clk8]
# AXI RX clocks 150 MHz
set_clock_latency -source -early 0.9 [get_clocks axi_rx_clk0]
set_clock_latency -source -early 0.9 [get_clocks axi_rx_clk1]
set_clock_latency -source -early 0.9 [get_clocks axi_rx_clk2]
set_clock_latency -source -early 0.9 [get_clocks axi_rx_clk3]
set_clock_latency -source -early 0.9 [get_clocks axi_rx_clk4]
set_clock_latency -source -early 0.9 [get_clocks axi_rx_clk5]
set_clock_latency -source -early 0.9 [get_clocks axi_rx_clk6]
set_clock_latency -source -early 0.9 [get_clocks axi_rx_clk7]
set_clock_latency -source -early 0.9 [get_clocks axi_rx_clk8]

###  Maximum source latency
# Main Clock 150 MHz
set_clock_latency -source -late 0.9 [get_clocks clk]
# AXI TX clocks 150 MHz
set_clock_latency -source -late 0.9 [get_clocks axi_tx_clk0]
set_clock_latency -source -late 0.9 [get_clocks axi_tx_clk1]
set_clock_latency -source -late 0.9 [get_clocks axi_tx_clk2]
set_clock_latency -source -late 0.9 [get_clocks axi_tx_clk3]
set_clock_latency -source -late 0.9 [get_clocks axi_tx_clk4]
set_clock_latency -source -late 0.9 [get_clocks axi_tx_clk5]
set_clock_latency -source -late 0.9 [get_clocks axi_tx_clk6]
set_clock_latency -source -late 0.9 [get_clocks axi_tx_clk7]
set_clock_latency -source -late 0.9 [get_clocks axi_tx_clk8]
# AXI RX clocks 150 MHz
set_clock_latency -source -late 0.9 [get_clocks axi_rx_clk0]
set_clock_latency -source -late 0.9 [get_clocks axi_rx_clk1]
set_clock_latency -source -late 0.9 [get_clocks axi_rx_clk2]
set_clock_latency -source -late 0.9 [get_clocks axi_rx_clk3]
set_clock_latency -source -late 0.9 [get_clocks axi_rx_clk4]
set_clock_latency -source -late 0.9 [get_clocks axi_rx_clk5]
set_clock_latency -source -late 0.9 [get_clocks axi_rx_clk6]
set_clock_latency -source -late 0.9 [get_clocks axi_rx_clk7]
set_clock_latency -source -late 0.9 [get_clocks axi_rx_clk8]