/**
 * @brief Driver for Spacefibre models
 * @author Emilie Butruille
 * @date 2024-10-03
*/

#ifndef MOD_H
#define MOD_H

#include <stdint.h>
#include <stdbool.h>


/**
 * @brief Register map of the Models
*/

// Offsets for mod_conf_regs
#define MOD_CONF_GLOBAL_REG_OFFSET       0x00  // Global Register
#define MOD_CONF_PARAM_PHY_REG_OFFSET    0x04  // Parameters PHY-Register
#define MOD_CONF_PARAM_LANE_REG_OFFSET   0x08  // Parameters Lane-Register
#define MOD_CONF_STATUS_LANE_REG_OFFSET  0x0C  // Status Lane-Register


#define CONF_LANE_ADDR 0xF0000000
#define GEN_LANE_ADDR  0xF0000100
#define ANA_LANE_ADDR  0xF0000200

enum generation_data
{
	GENERATION_DATA_INCREMENTAL = 0,
	GENERATION_DATA_PRBS = 1,
};

enum data_mode
{
	DATA_MODE_GENERATION_DATA = 0,
	DATA_MODE_CONTROL_WORD = 1,
	DATA_MODE_WRONG_K_CHARACTER = 2,
	DATA_MODE_RESERVED = 3,
};

enum lane_state
{
	LANE_STATE_CLEARLINE        = 0b0000,
	LANE_STATE_DISABLED         = 0b0001,
	LANE_STATE_WAIT             = 0b0010,
	LANE_STATE_STARTED          = 0b0011,
	LANE_STATE_INVERTRXPOLARITY = 0b0100,
	LANE_STATE_CONNECTING       = 0b0101,
	LANE_STATE_CONNECTED        = 0b0110,
	LANE_STATE_ACTIVE           = 0b0111,
	LANE_STATE_PREPARESTANDBY   = 0b1000,
	LANE_STATE_LOSSOFSIGNAL     = 0b1001
};

void print_lane_state (const enum lane_state state);

enum action_result
{
	OK,
	TIMEOUT,
	FAILURE
};

enum action_result wait_for_state
(
	const volatile uint32_t conf_status_register [const static 1],
	const enum lane_state target,
	const unsigned int timeout
);

enum action_result wait_for_states
(
	const volatile uint32_t conf_status_register [const static 1],
	const unsigned int valid_states_count,
	const enum lane_state valid_states [const static valid_states_count],
	const unsigned int timeout
);

// Note to future devs: if you're thinking of using the bitfields and unions,
// make sure you know about bitfield portability issues. If you are using C++,
// know that unions should not be used as a way to do aliasing, unlike in C.
// When in doubt, and for portable code, use the bitmasks to write, not the
// bitfield's reg_value union.
//
// TL;DR: Common practices abuse standards at their own risks. Be wary.
//
// Coding in C11 (anonymous union support).
// I'm generating register access macros through scripting. The result is
// kept in a separate file. The input file is "registers.txt"
#include "bitmask_definitions.h"

// Offsets for mod_gen_regs
#define MOD_GEN_CONFIG_REG_OFFSET        0x00  // Configuration Register
#define MOD_GEN_CONTROL_REG_OFFSET       0x04  // Control Register
#define MOD_GEN_STATUS_REG_OFFSET        0x08  // Status Register
#define MOD_GEN_INIT_VALUE_REG_OFFSET    0x0C  // Initial Value Register

// Offsets for mod_ana_regs
#define MOD_ANA_CONFIG_REG_OFFSET        0x00  // Configuration Register
#define MOD_ANA_CONTROL_REG_OFFSET       0x04  // Control Register
#define MOD_ANA_STATUS_REG_OFFSET        0x08  // Status Register
#define MOD_ANA_INIT_VALUE_REG_OFFSET    0x0C  // Initial Value Register


// Rad/Write functions
void mod_write_all(uint32_t base, uint32_t reg, uint32_t data);
void mod_write(uint32_t base, uint32_t reg, uint32_t mask, uint32_t data);
uint32_t mod_read_all(uint32_t base, uint32_t reg);
uint32_t mod_read(uint32_t base, uint32_t reg, uint32_t mask, uint8_t shift);

// usefull functions
void reset_the_dut(void);
void lane_reset_conf(void);
void phy_plus_lane_olny(void);
void phy_plus_lane_plus_dl(void);
// Common
uint32_t bytearray(uint8_t byte1, uint8_t byte2, uint8_t byte3, uint8_t byte4);

//// CONFIGURATOR////
//// Parameter-PHY Register Masks and Shifts
#define NEAR_END_LOOPBACK_MASK  0x00000001 // Bit 0
#define FAR_END_LOOPBACK_MASK   0x00000002 // Bit 1

#define NEAR_END_LOOPBACK_SHIFT  0
#define FAR_END_LOOPBACK_SHIFT   1
//// Parameter Register Masks and Shifts
#define LANESTART_MASK           0x00000001 // Bit 0
#define AUTOSTART_MASK           0x00000002 // Bit 1
#define LANERESET_MASK           0x00000004 // Bit 2
#define PARALLEL_LOOPBACK_MASK   0x00000008 // Bit 3
#define STANDBYREASON_MASK       0x00000FF0 // Bits 4-11
#define LANESTART_PULSE_MASK     0x00001000 // Bit 12

#define LANESTART_SHIFT           0
#define AUTOSTART_SHIFT           1
#define LANERESET_SHIFT           2
#define PARALLEL_LOOPBACK_SHIFT   3
#define STANDBYREASON_SHIFT       4
#define LANESTART_PULSE_SHIFT     12
//// Parameter Status Register Masks and Shifts
#define LANE_STATE_MASK           0x0000000F // Bits 0-3
#define RX_ERROR_COUNTER_MASK     0x00000FF0 // Bits 4-11
#define RX_ERROR_OVERFLOW_MASK    0x00001000 // Bit 12
#define FAR_END_LOST_SIGNAL_MASK  0x00002000 // Bit 13
#define FAR_END_CAPABILITIES_MASK 0x003FC000 // Bits 14-21
#define RX_POLARITY_MASK          0x00400000 // Bit 22

#define LANE_STATE_SHIFT           0
#define RX_ERROR_COUNTER_SHIFT     4
#define RX_ERROR_OVERFLOW_SHIFT    12
#define FAR_END_LOST_SIGNAL_SHIFT  13
#define FAR_END_CAPABILITIES_SHIFT 14
#define RX_POLARITY_SHIFT          22
//// Global register Register Masks and Shifts
#define RST_DUT_N_MASK   0x00000001 // Bit 0
#define INJECTOR_EN_MASK 0x00000002 // Bit 1
#define SPY_EN_MASK      0x00000004 // Bit 2

#define RST_DUT_N_SHIFT           0
#define INJECTOR_EN_SHIFT         1
#define SPY_EN_SHIFT              2
//// GENERATOR////
//// Configuration register Masks and Shifts
#define FRAME_NUMBER_MASK       0x0000001F // Bits 0-4
#define FRAME_SIZE_MASK         0x000003E0 // Bits 5-13
#define INTER_PACKET_DELAY_MASK 0x00FFC000 // Bits 14-23
#define GENERATION_DATA_MASK    0x01000000 // Bit 24
#define DATA_MODE_MASK          0x06000000 // Bits 25-26

#define FRAME_NUMBER_SHIFT       0
#define FRAME_SIZE_SHIFT         5
#define INTER_PACKET_DELAY_SHIFT 14
#define GENERATION_DATA_SHIFT    24
#define DATA_MODE_SHIFT          25
//// Conttrol register Masks and Shifts
#define MODEL_START_MASK        0x00000001 // Bit 0
#define LANE_RESET_MASK         0x00000002 // Bit 1
#define LANE_CAPABILITIES_MASK  0x000003FC // Bits 2-9

#define MODEL_START_SHIFT        0
#define LANE_RESET_SHIFT         1
#define LANE_CAPABILITIES_SHIFT  2
//// Status register Masks and Shifts
#define BUSY_MASK               0x00000001 // Bit 0
#define TEST_END_MASK           0x00000002 // Bit 1
#define ERROR_COUNTER_MASK      0x000003FC // Bits 2-9

#define BUSY_SHIFT               0
#define TEST_END_SHIFT           1
#define ERROR_COUNTER_SHIFT      2
//// Initial value register Masks and Shifts
#define INITIAL_VALUE_MASK   0xFFFFFFFF 

#define INITIAL_VALUE_SHIFT  0       

//// ANALYZER////
//// Configuration register Masks and Shifts
#define FRAME_NUMBER_MASK       0x0000001F
#define FRAME_SIZE_MASK         0x00003FE0
#define INTER_PACKET_DELAY_MASK 0x00FFC000
#define GENERATION_DATA_MASK    0x01000000
#define DATA_MODE_MASK          0x06000000

#define FRAME_NUMBER_SHIFT       0
#define FRAME_SIZE_SHIFT         5
#define INTER_PACKET_DELAY_SHIFT 14
#define GENERATION_DATA_SHIFT    24
#define DATA_MODE_SHIFT          25
//// Conttrol register Masks and Shifts
#define MODEL_START_MASK         0x00000001 

#define MODEL_START_SHIFT         0
//// Status register Masks and Shifts
#define BUSY_MASK                0x00000001 // Bit 0
#define TEST_END_MASK            0x00000002 // Bit 1
#define ERROR_COUNTER_MASK       0x000003FC // Bits 2-9
#define LANE_CAPABILITIES_MASK   0x0003FC00 // Bits 10-17

#define BUSY_SHIFT                0
#define TEST_END_SHIFT            1
#define ERROR_COUNTER_SHIFT       2
#define LANE_CAPABILITIES_SHIFT   10
//// Initial value register Masks and Shifts
#define INITIAL_VALUE_MASK   0xFFFFFFFF 

#define INITIAL_VALUE_SHIFT  0       


#endif
