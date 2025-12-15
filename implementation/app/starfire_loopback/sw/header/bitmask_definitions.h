#pragma once

//add xilinx register definition
#include <xparameters.h>

// Generated using https://github.com/nsensfel/bitmask-generator
#include <stdint.h>

#define __TO_PTR(x) ((volatile uint32_t *)(x))

// Bitfield behaviors are implementation defined. Don't use them unless
// the user knows their compiler behaves in an intuitive way.
#ifndef __USE_OF_BITFIELDS_UNION_IS_SAFE
	#define __USE_OF_BITFIELDS_UNION_IS_SAFE 0
#endif

// Parsing registers.txt...
/******************************************************************************/
/** DL_ANALYZER ***************************************************************/
/******************************************************************************/
#define DL_ANALYZER_0_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error
#define DL_ANALYZER_1_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error
#define DL_ANALYZER_2_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error
#define DL_ANALYZER_3_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error
#define DL_ANALYZER_4_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error
#define DL_ANALYZER_5_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error
#define DL_ANALYZER_6_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error
#define DL_ANALYZER_7_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error
#define DL_ANALYZER_8_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error

#define DL_ANALYZER_X_ADDR(x) \
	(DL_ANALYZER_0_ADDR + ((DL_ANALYZER_1_ADDR - DL_ANALYZER_0_ADDR) * (x)))

/** CONFIGURATION *************************************************************/
#define DL_ANALYZER_CONFIGURATION_ADDR_OFFSET 0x0U
#define DL_ANALYZER_X_CONFIGURATION_ADDR(x) \
	(DL_ANALYZER_X_ADDR(x) + DL_ANALYZER_CONFIGURATION_ADDR_OFFSET)
#define DL_ANALYZER_X_CONFIGURATION_PTR(x) \
	__TO_PTR(DL_ANALYZER_X_CONFIGURATION_ADDR(x))

struct dl_analyzer_configuration
{
	union
	{
		struct
		{
			uint32_t packet_number:5;
			uint32_t packet_size:9;
			uint32_t interpacket_delay:10;
			uint32_t generation_data:1;
			uint32_t data_mode:2;
			uint32_t _reserved:5;
		};
		uint32_t reg_value;
	};
};

#define DL_ANALYZER_CONFIGURATION_GET(NAME, reg) \
	(((reg) & DL_ANALYZER_CONFIGURATION_##NAME##_MASK) >> DL_ANALYZER_CONFIGURATION_##NAME##_OFFSET)

#define DL_ANALYZER_CONFIGURATION_SET(NAME, val, reg) \
	( \
		((reg) & ~(DL_ANALYZER_CONFIGURATION_##NAME##_MASK)) \
		| \
		( \
			((val) & (DL_ANALYZER_CONFIGURATION_##NAME##_MASK)) \
			<< (DL_ANALYZER_CONFIGURATION_##NAME##_OFFSET) \
		) \
	)

#define DL_ANALYZER_CONFIGURATION_SET_IN_PLACE(NAME, val, reg) \
	(reg) = \
		( \
			((reg) & ~(DL_ANALYZER_CONFIGURATION_##NAME##_MASK)) \
			| \
			( \
				((val) & (DL_ANALYZER_CONFIGURATION_##NAME##_MASK)) \
				<< (DL_ANALYZER_CONFIGURATION_##NAME##_OFFSET) \
			) \
		)

#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define DL_ANALYZER_CONFIGURATION_TO_UINT32_T(s) ((s).reg_value)
	#define DL_ANALYZER_CONFIGURATION_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define DL_ANALYZER_CONFIGURATION_TO_UINT32_T(s) \
    ( \
        (((s).packet_number << DL_ANALYZER_CONFIGURATION_PACKET_NUMBER_OFFSET) & DL_ANALYZER_CONFIGURATION_PACKET_NUMBER_MASK) \
        | (((s).packet_size << DL_ANALYZER_CONFIGURATION_PACKET_SIZE_OFFSET) & DL_ANALYZER_CONFIGURATION_PACKET_SIZE_MASK) \
        | (((s).interpacket_delay << DL_ANALYZER_CONFIGURATION_INTERPACKET_DELAY_OFFSET) & DL_ANALYZER_CONFIGURATION_INTERPACKET_DELAY_MASK) \
        | (((s).generation_data << DL_ANALYZER_CONFIGURATION_GENERATION_DATA_OFFSET) & DL_ANALYZER_CONFIGURATION_GENERATION_DATA_MASK) \
        | (((s).data_mode << DL_ANALYZER_CONFIGURATION_DATA_MODE_OFFSET) & DL_ANALYZER_CONFIGURATION_DATA_MODE_MASK) \
    )

	#define DL_ANALYZER_CONFIGURATION_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->packet_number = DL_ANALYZER_CONFIGURATION_GET(PACKET_NUMBER, u)); \
			((s_ptr)->packet_size = DL_ANALYZER_CONFIGURATION_GET(PACKET_SIZE, u)); \
			((s_ptr)->interpacket_delay = DL_ANALYZER_CONFIGURATION_GET(INTERPACKET_DELAY, u)); \
			((s_ptr)->generation_data = DL_ANALYZER_CONFIGURATION_GET(GENERATION_DATA, u)); \
			((s_ptr)->data_mode = DL_ANALYZER_CONFIGURATION_GET(DATA_MODE, u)); \
		}
#endif

// Bits 0-4: PACKET_NUMBER
#define DL_ANALYZER_CONFIGURATION_PACKET_NUMBER_OFFSET 0U
#define DL_ANALYZER_CONFIGURATION_PACKET_NUMBER_MASK 0x1FU

// Bits 5-13: PACKET_SIZE
#define DL_ANALYZER_CONFIGURATION_PACKET_SIZE_OFFSET 5U
#define DL_ANALYZER_CONFIGURATION_PACKET_SIZE_MASK 0x3FE0U

// Bits 14-23: INTERPACKET_DELAY
#define DL_ANALYZER_CONFIGURATION_INTERPACKET_DELAY_OFFSET 14U
#define DL_ANALYZER_CONFIGURATION_INTERPACKET_DELAY_MASK 0xFFC000U

// Bit 24: GENERATION_DATA
#define DL_ANALYZER_CONFIGURATION_GENERATION_DATA_OFFSET 24U
#define DL_ANALYZER_CONFIGURATION_GENERATION_DATA_MASK 0x1000000U

// Bits 25-26: DATA_MODE
#define DL_ANALYZER_CONFIGURATION_DATA_MODE_OFFSET 25U
#define DL_ANALYZER_CONFIGURATION_DATA_MODE_MASK 0x6000000U


/** CONTROL *******************************************************************/
#define DL_ANALYZER_CONTROL_ADDR_OFFSET 0x4U
#define DL_ANALYZER_X_CONTROL_ADDR(x) \
	(DL_ANALYZER_X_ADDR(x) + DL_ANALYZER_CONTROL_ADDR_OFFSET)
#define DL_ANALYZER_X_CONTROL_PTR(x) \
	__TO_PTR(DL_ANALYZER_X_CONTROL_ADDR(x))

struct dl_analyzer_control
{
	union
	{
		struct
		{
			uint32_t model_start:1;
			uint32_t _reserved:31;
		};
		uint32_t reg_value;
	};
};

#define DL_ANALYZER_CONTROL_GET(NAME, reg) \
	(((reg) & DL_ANALYZER_CONTROL_##NAME##_MASK) >> DL_ANALYZER_CONTROL_##NAME##_OFFSET)

#define DL_ANALYZER_CONTROL_SET(NAME, val, reg) \
	( \
		((reg) & ~(DL_ANALYZER_CONTROL_##NAME##_MASK)) \
		| \
		( \
			((val) & (DL_ANALYZER_CONTROL_##NAME##_MASK)) \
			<< (DL_ANALYZER_CONTROL_##NAME##_OFFSET) \
		) \
	)

#define DL_ANALYZER_CONTROL_SET_IN_PLACE(NAME, val, reg) \
	(reg) = \
		( \
			((reg) & ~(DL_ANALYZER_CONTROL_##NAME##_MASK)) \
			| \
			( \
				((val) & (DL_ANALYZER_CONTROL_##NAME##_MASK)) \
				<< (DL_ANALYZER_CONTROL_##NAME##_OFFSET) \
			) \
		)

#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define DL_ANALYZER_CONTROL_TO_UINT32_T(s) ((s).reg_value)
	#define DL_ANALYZER_CONTROL_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define DL_ANALYZER_CONTROL_TO_UINT32_T(s) \
		( \
			DL_ANALYZER_CONTROL_SET \
			( \
				MODEL_START, \
				(s).model_start, \
				0 \
			) \
		)
	#define DL_ANALYZER_CONTROL_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->model_start = DL_ANALYZER_CONTROL_GET(MODEL_START, u)); \
		}
#endif

// Bit 0: MODEL_START
#define DL_ANALYZER_CONTROL_MODEL_START_OFFSET 0U
#define DL_ANALYZER_CONTROL_MODEL_START_MASK 0x1U


/** STATUS ********************************************************************/
#define DL_ANALYZER_STATUS_ADDR_OFFSET 0x8U
#define DL_ANALYZER_X_STATUS_ADDR(x) \
	(DL_ANALYZER_X_ADDR(x) + DL_ANALYZER_STATUS_ADDR_OFFSET)
#define DL_ANALYZER_X_STATUS_PTR(x) \
	__TO_PTR(DL_ANALYZER_X_STATUS_ADDR(x))

struct dl_analyzer_status
{
	union
	{
		struct
		{
			uint32_t busy:1;
			uint32_t test_end:1;
			uint32_t error_counter:8;
			uint32_t _reserved:22;
		};
		uint32_t reg_value;
	};
};

#define DL_ANALYZER_STATUS_GET(NAME, reg) \
	(((reg) & DL_ANALYZER_STATUS_##NAME##_MASK) >> DL_ANALYZER_STATUS_##NAME##_OFFSET)

#define DL_ANALYZER_STATUS_SET(NAME, val, reg) \
	( \
		((reg) & ~(DL_ANALYZER_STATUS_##NAME##_MASK)) \
		| \
		( \
			((val) & (DL_ANALYZER_STATUS_##NAME##_MASK)) \
			<< (DL_ANALYZER_STATUS_##NAME##_OFFSET) \
		) \
	)

#define DL_ANALYZER_STATUS_SET_IN_PLACE(NAME, val, reg) \
	(reg) = \
		( \
			((reg) & ~(DL_ANALYZER_STATUS_##NAME##_MASK)) \
			| \
			( \
				((val) & (DL_ANALYZER_STATUS_##NAME##_MASK)) \
				<< (DL_ANALYZER_STATUS_##NAME##_OFFSET) \
			) \
		)

#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define DL_ANALYZER_STATUS_TO_UINT32_T(s) ((s).reg_value)
	#define DL_ANALYZER_STATUS_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define DL_ANALYZER_STATUS_TO_UINT32_T(s) \
		( \
			DL_ANALYZER_STATUS_SET \
			( \
				BUSY, \
				(s).busy, \
				DL_ANALYZER_STATUS_SET \
				( \
					TEST_END, \
					(s).test_end, \
					DL_ANALYZER_STATUS_SET \
					( \
						ERROR_COUNTER, \
						(s).error_counter, \
						0 \
					) \
				) \
			) \
		)
	#define DL_ANALYZER_STATUS_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->busy = DL_ANALYZER_STATUS_GET(BUSY, u)); \
			((s_ptr)->test_end = DL_ANALYZER_STATUS_GET(TEST_END, u)); \
			((s_ptr)->error_counter = DL_ANALYZER_STATUS_GET(ERROR_COUNTER, u)); \
		}
#endif

// Bit 0: BUSY
#define DL_ANALYZER_STATUS_BUSY_OFFSET 0U
#define DL_ANALYZER_STATUS_BUSY_MASK 0x1U

// Bit 1: TEST_END
#define DL_ANALYZER_STATUS_TEST_END_OFFSET 1U
#define DL_ANALYZER_STATUS_TEST_END_MASK 0x2U

// Bits 2-9: ERROR_COUNTER
#define DL_ANALYZER_STATUS_ERROR_COUNTER_OFFSET 2U
#define DL_ANALYZER_STATUS_ERROR_COUNTER_MASK 0x3FCU


/** INITIAL_VALUE *************************************************************/
#define DL_ANALYZER_INITIAL_VALUE_ADDR_OFFSET 0xCU
#define DL_ANALYZER_X_INITIAL_VALUE_ADDR(x) \
	(DL_ANALYZER_X_ADDR(x) + DL_ANALYZER_INITIAL_VALUE_ADDR_OFFSET)
#define DL_ANALYZER_X_INITIAL_VALUE_PTR(x) \
	__TO_PTR(DL_ANALYZER_X_INITIAL_VALUE_ADDR(x))

/******************************************************************************/

/******************************************************************************/
/** DL_GENERATOR **************************************************************/
/******************************************************************************/
#define DL_GENERATOR_0_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error
#define DL_GENERATOR_1_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error
#define DL_GENERATOR_2_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error
#define DL_GENERATOR_3_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error
#define DL_GENERATOR_4_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error
#define DL_GENERATOR_5_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error
#define DL_GENERATOR_6_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error
#define DL_GENERATOR_7_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error
#define DL_GENERATOR_8_ADDR XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR // this feature is not available in this design => mapping to bram to avoid compile error

#define DL_GENERATOR_X_ADDR(x) \
	(DL_GENERATOR_0_ADDR + ((DL_GENERATOR_1_ADDR - DL_GENERATOR_0_ADDR) * (x)))

/** CONFIGURATION *************************************************************/
#define DL_GENERATOR_CONFIGURATION_ADDR_OFFSET 0x0U
#define DL_GENERATOR_X_CONFIGURATION_ADDR(x) \
	(DL_GENERATOR_X_ADDR(x) + DL_GENERATOR_CONFIGURATION_ADDR_OFFSET)
#define DL_GENERATOR_X_CONFIGURATION_PTR(x) \
	__TO_PTR(DL_GENERATOR_X_CONFIGURATION_ADDR(x))

struct dl_generator_configuration
{
	union
	{
		struct
		{
			uint32_t packet_number:5;
			uint32_t packet_size:9;
			uint32_t interpacket_delay:10;
			uint32_t generation_data:1;
			uint32_t data_mode:2;
			uint32_t _reserved:5;
		};
		uint32_t reg_value;
	};
};

#define DL_GENERATOR_CONFIGURATION_GET(NAME, reg) \
	(((reg) & DL_GENERATOR_CONFIGURATION_##NAME##_MASK) >> DL_GENERATOR_CONFIGURATION_##NAME##_OFFSET)

#define DL_GENERATOR_CONFIGURATION_SET(NAME, val, reg) \
	( \
		((reg) & ~(DL_GENERATOR_CONFIGURATION_##NAME##_MASK)) \
		| \
		( \
			((val) & (DL_GENERATOR_CONFIGURATION_##NAME##_MASK)) \
			<< (DL_GENERATOR_CONFIGURATION_##NAME##_OFFSET) \
		) \
	)

#define DL_GENERATOR_CONFIGURATION_SET_IN_PLACE(NAME, val, reg) \
	(reg) = \
		( \
			((reg) & ~(DL_GENERATOR_CONFIGURATION_##NAME##_MASK)) \
			| \
			( \
				((val) & (DL_GENERATOR_CONFIGURATION_##NAME##_MASK)) \
				<< (DL_GENERATOR_CONFIGURATION_##NAME##_OFFSET) \
			) \
		)

#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define DL_GENERATOR_CONFIGURATION_TO_UINT32_T(s) ((s).reg_value)
	#define DL_GENERATOR_CONFIGURATION_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define DL_GENERATOR_CONFIGURATION_TO_UINT32_T(s) \
	    ( \
	        (((s).packet_number << DL_GENERATOR_CONFIGURATION_PACKET_NUMBER_OFFSET) & DL_GENERATOR_CONFIGURATION_PACKET_NUMBER_MASK) \
	        | (((s).packet_size << DL_GENERATOR_CONFIGURATION_PACKET_SIZE_OFFSET) & DL_GENERATOR_CONFIGURATION_PACKET_SIZE_MASK) \
	        | (((s).interpacket_delay << DL_GENERATOR_CONFIGURATION_INTERPACKET_DELAY_OFFSET) & DL_GENERATOR_CONFIGURATION_INTERPACKET_DELAY_MASK) \
	        | (((s).generation_data << DL_GENERATOR_CONFIGURATION_GENERATION_DATA_OFFSET) & DL_GENERATOR_CONFIGURATION_GENERATION_DATA_MASK) \
	        | (((s).data_mode << DL_GENERATOR_CONFIGURATION_DATA_MODE_OFFSET) & DL_GENERATOR_CONFIGURATION_DATA_MODE_MASK) \
	    )

	
	#define DL_GENERATOR_CONFIGURATION_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->packet_number = DL_GENERATOR_CONFIGURATION_GET(PACKET_NUMBER, u)); \
			((s_ptr)->packet_size = DL_GENERATOR_CONFIGURATION_GET(PACKET_SIZE, u)); \
			((s_ptr)->interpacket_delay = DL_GENERATOR_CONFIGURATION_GET(INTERPACKET_DELAY, u)); \
			((s_ptr)->generation_data = DL_GENERATOR_CONFIGURATION_GET(GENERATION_DATA, u)); \
			((s_ptr)->data_mode = DL_GENERATOR_CONFIGURATION_GET(DATA_MODE, u)); \
		}
#endif

// Bits 0-4: PACKET_NUMBER
#define DL_GENERATOR_CONFIGURATION_PACKET_NUMBER_OFFSET 0U
#define DL_GENERATOR_CONFIGURATION_PACKET_NUMBER_MASK 0x1FU

// Bits 5-13: PACKET_SIZE
#define DL_GENERATOR_CONFIGURATION_PACKET_SIZE_OFFSET 5U
#define DL_GENERATOR_CONFIGURATION_PACKET_SIZE_MASK 0x3FE0U

// Bits 14-23: INTERPACKET_DELAY
#define DL_GENERATOR_CONFIGURATION_INTERPACKET_DELAY_OFFSET 14U
#define DL_GENERATOR_CONFIGURATION_INTERPACKET_DELAY_MASK 0xFFC000U

// Bit 24: GENERATION_DATA
#define DL_GENERATOR_CONFIGURATION_GENERATION_DATA_OFFSET 24U
#define DL_GENERATOR_CONFIGURATION_GENERATION_DATA_MASK 0x1000000U

// Bits 25-26: DATA_MODE
#define DL_GENERATOR_CONFIGURATION_DATA_MODE_OFFSET 25U
#define DL_GENERATOR_CONFIGURATION_DATA_MODE_MASK 0x6000000U


/** CONTROL *******************************************************************/
#define DL_GENERATOR_CONTROL_ADDR_OFFSET 0x4U
#define DL_GENERATOR_X_CONTROL_ADDR(x) \
	(DL_GENERATOR_X_ADDR(x) + DL_GENERATOR_CONTROL_ADDR_OFFSET)
#define DL_GENERATOR_X_CONTROL_PTR(x) \
	__TO_PTR(DL_GENERATOR_X_CONTROL_ADDR(x))

struct dl_generator_control
{
	union
	{
		struct
		{
			uint32_t model_start:1;
			uint32_t _reserved:31;
		};
		uint32_t reg_value;
	};
};

#define DL_GENERATOR_CONTROL_GET(NAME, reg) \
	(((reg) & DL_GENERATOR_CONTROL_##NAME##_MASK) >> DL_GENERATOR_CONTROL_##NAME##_OFFSET)

#define DL_GENERATOR_CONTROL_SET(NAME, val, reg) \
	( \
		((reg) & ~(DL_GENERATOR_CONTROL_##NAME##_MASK)) \
		| \
		( \
			((val) & (DL_GENERATOR_CONTROL_##NAME##_MASK)) \
			<< (DL_GENERATOR_CONTROL_##NAME##_OFFSET) \
		) \
	)

#define DL_GENERATOR_CONTROL_SET_IN_PLACE(NAME, val, reg) \
	(reg) = \
		( \
			((reg) & ~(DL_GENERATOR_CONTROL_##NAME##_MASK)) \
			| \
			( \
				((val) & (DL_GENERATOR_CONTROL_##NAME##_MASK)) \
				<< (DL_GENERATOR_CONTROL_##NAME##_OFFSET) \
			) \
		)

#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define DL_GENERATOR_CONTROL_TO_UINT32_T(s) ((s).reg_value)
	#define DL_GENERATOR_CONTROL_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define DL_GENERATOR_CONTROL_TO_UINT32_T(s) \
		( \
			DL_GENERATOR_CONTROL_SET \
			( \
				MODEL_START, \
				(s).model_start, \
				0 \
			) \
		)
	#define DL_GENERATOR_CONTROL_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->model_start = DL_GENERATOR_CONTROL_GET(MODEL_START, u)); \
		}
#endif

// Bit 0: MODEL_START
#define DL_GENERATOR_CONTROL_MODEL_START_OFFSET 0U
#define DL_GENERATOR_CONTROL_MODEL_START_MASK 0x1U


/** STATUS ********************************************************************/
#define DL_GENERATOR_STATUS_ADDR_OFFSET 0x8U
#define DL_GENERATOR_X_STATUS_ADDR(x) \
	(DL_GENERATOR_X_ADDR(x) + DL_GENERATOR_STATUS_ADDR_OFFSET)
#define DL_GENERATOR_X_STATUS_PTR(x) \
	__TO_PTR(DL_GENERATOR_X_STATUS_ADDR(x))

struct dl_generator_status
{
	union
	{
		struct
		{
			uint32_t busy:1;
			uint32_t test_end:1;
			uint32_t error_counter:8;
			uint32_t _reserved:22;
		};
		uint32_t reg_value;
	};
};

#define DL_GENERATOR_STATUS_GET(NAME, reg) \
	(((reg) & DL_GENERATOR_STATUS_##NAME##_MASK) >> DL_GENERATOR_STATUS_##NAME##_OFFSET)

#define DL_GENERATOR_STATUS_SET(NAME, val, reg) \
	( \
		((reg) & ~(DL_GENERATOR_STATUS_##NAME##_MASK)) \
		| \
		( \
			((val) & (DL_GENERATOR_STATUS_##NAME##_MASK)) \
			<< (DL_GENERATOR_STATUS_##NAME##_OFFSET) \
		) \
	)

#define DL_GENERATOR_STATUS_SET_IN_PLACE(NAME, val, reg) \
	(reg) = \
		( \
			((reg) & ~(DL_GENERATOR_STATUS_##NAME##_MASK)) \
			| \
			( \
				((val) & (DL_GENERATOR_STATUS_##NAME##_MASK)) \
				<< (DL_GENERATOR_STATUS_##NAME##_OFFSET) \
			) \
		)

#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define DL_GENERATOR_STATUS_TO_UINT32_T(s) ((s).reg_value)
	#define DL_GENERATOR_STATUS_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define DL_GENERATOR_STATUS_TO_UINT32_T(s) \
		( \
			DL_GENERATOR_STATUS_SET \
			( \
				BUSY, \
				(s).busy, \
				DL_GENERATOR_STATUS_SET \
				( \
					TEST_END, \
					(s).test_end, \
					DL_GENERATOR_STATUS_SET \
					( \
						ERROR_COUNTER, \
						(s).error_counter, \
						0 \
					) \
				) \
			) \
		)
	#define DL_GENERATOR_STATUS_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->busy = DL_GENERATOR_STATUS_GET(BUSY, u)); \
			((s_ptr)->test_end = DL_GENERATOR_STATUS_GET(TEST_END, u)); \
			((s_ptr)->error_counter = DL_GENERATOR_STATUS_GET(ERROR_COUNTER, u)); \
		}
#endif

// Bit 0: BUSY
#define DL_GENERATOR_STATUS_BUSY_OFFSET 0U
#define DL_GENERATOR_STATUS_BUSY_MASK 0x1U

// Bit 1: TEST_END
#define DL_GENERATOR_STATUS_TEST_END_OFFSET 1U
#define DL_GENERATOR_STATUS_TEST_END_MASK 0x2U

// Bits 2-9: ERROR_COUNTER
#define DL_GENERATOR_STATUS_ERROR_COUNTER_OFFSET 2U
#define DL_GENERATOR_STATUS_ERROR_COUNTER_MASK 0x3FCU


/** INITIAL_VALUE *************************************************************/
#define DL_GENERATOR_INITIAL_VALUE_ADDR_OFFSET 0xCU
#define DL_GENERATOR_X_INITIAL_VALUE_ADDR(x) \
	(DL_GENERATOR_X_ADDR(x) + DL_GENERATOR_INITIAL_VALUE_ADDR_OFFSET)
#define DL_GENERATOR_X_INITIAL_VALUE_PTR(x) \
	__TO_PTR(DL_GENERATOR_X_INITIAL_VALUE_ADDR(x))

/******************************************************************************/

/******************************************************************************/
/** DL_CONFIGURATOR ***********************************************************/
/******************************************************************************/
#define DL_CONFIGURATOR_ADDR XPAR_DATALINK_CONFIGURATOR_DATA_LINK_CONFIGURAT_0_BASEADDR

/** GLOBAL ********************************************************************/
#define DL_CONFIGURATOR_GLOBAL_ADDR_OFFSET 0x0U
#define DL_CONFIGURATOR_GLOBAL_ADDR \
	(DL_CONFIGURATOR_ADDR + DL_CONFIGURATOR_GLOBAL_ADDR_OFFSET)
#define DL_CONFIGURATOR_GLOBAL_PTR \
	__TO_PTR(DL_CONFIGURATOR_GLOBAL_ADDR)

struct dl_configurator_global
{
	union
	{
		struct
		{
			uint32_t rst_dut_n:1;
			uint32_t _reserved:31;
		};
		uint32_t reg_value;
	};
};

#define DL_CONFIGURATOR_GLOBAL_GET(NAME, reg) \
	(((reg) & DL_CONFIGURATOR_GLOBAL_##NAME##_MASK) >> DL_CONFIGURATOR_GLOBAL_##NAME##_OFFSET)

#define DL_CONFIGURATOR_GLOBAL_SET(NAME, val, reg) \
	( \
		((reg) & ~(DL_CONFIGURATOR_GLOBAL_##NAME##_MASK)) \
		| \
		( \
			((val) & (DL_CONFIGURATOR_GLOBAL_##NAME##_MASK)) \
			<< (DL_CONFIGURATOR_GLOBAL_##NAME##_OFFSET) \
		) \
	)

#define DL_CONFIGURATOR_GLOBAL_SET_IN_PLACE(NAME, val, reg) \
	(reg) = \
		( \
			((reg) & ~(DL_CONFIGURATOR_GLOBAL_##NAME##_MASK)) \
			| \
			( \
				((val) & (DL_CONFIGURATOR_GLOBAL_##NAME##_MASK)) \
				<< (DL_CONFIGURATOR_GLOBAL_##NAME##_OFFSET) \
			) \
		)

#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define DL_CONFIGURATOR_GLOBAL_TO_UINT32_T(s) ((s).reg_value)
	#define DL_CONFIGURATOR_GLOBAL_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define DL_CONFIGURATOR_GLOBAL_TO_UINT32_T(s) \
		( \
			DL_CONFIGURATOR_GLOBAL_SET \
			( \
				RST_DUT_N, \
				(s).rst_dut_n, \
				0 \
			) \
		)
	#define DL_CONFIGURATOR_GLOBAL_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->rst_dut_n = DL_CONFIGURATOR_GLOBAL_GET(RST_DUT_N, u)); \
		}
#endif

// Bit 0: RST_DUT_N
#define DL_CONFIGURATOR_GLOBAL_RST_DUT_N_OFFSET 0U
#define DL_CONFIGURATOR_GLOBAL_RST_DUT_N_MASK 0x1U


/** PHY_PARAMETER *************************************************************/
#define DL_CONFIGURATOR_PHY_PARAMETER_ADDR_OFFSET 0x4U
#define DL_CONFIGURATOR_PHY_PARAMETER_ADDR \
	(DL_CONFIGURATOR_ADDR + DL_CONFIGURATOR_PHY_PARAMETER_ADDR_OFFSET)
#define DL_CONFIGURATOR_PHY_PARAMETER_PTR \
	__TO_PTR(DL_CONFIGURATOR_PHY_PARAMETER_ADDR)

struct dl_configurator_phy_parameter
{
	union
	{
		struct
		{
			uint32_t near_end_serial_loopback:1;
			uint32_t far_end_serial_loopback:1;
			uint32_t _reserved:30;
		};
		uint32_t reg_value;
	};
};

#define DL_CONFIGURATOR_PHY_PARAMETER_GET(NAME, reg) \
	(((reg) & DL_CONFIGURATOR_PHY_PARAMETER_##NAME##_MASK) >> DL_CONFIGURATOR_PHY_PARAMETER_##NAME##_OFFSET)

#define DL_CONFIGURATOR_PHY_PARAMETER_SET(NAME, val, reg) \
    ( \
        ((reg) & ~(DL_CONFIGURATOR_PHY_PARAMETER_##NAME##_MASK)) \
        | \
        ( \
            ((val) & (DL_CONFIGURATOR_PHY_PARAMETER_##NAME##_MASK)) \
            << (DL_CONFIGURATOR_PHY_PARAMETER_##NAME##_OFFSET) \
        ) \
    )
#define DL_CONFIGURATOR_PHY_PARAMETER_SET_IN_PLACE(NAME, val, reg) \
    (reg) = DL_CONFIGURATOR_PHY_PARAMETER_SET(NAME, val, reg)


#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define DL_CONFIGURATOR_PHY_PARAMETER_TO_UINT32_T(s) ((s).reg_value)
	#define DL_CONFIGURATOR_PHY_PARAMETER_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define DL_CONFIGURATOR_PHY_PARAMETER_TO_UINT32_T(s) \
		( \
			DL_CONFIGURATOR_PHY_PARAMETER_SET \
			( \
				NEAR_END_SERIAL_LOOPBACK, \
				(s).near_end_serial_loopback, \
				DL_CONFIGURATOR_PHY_PARAMETER_SET \
				( \
					FAR_END_SERIAL_LOOPBACK, \
					(s).far_end_serial_loopback, \
					0 \
				) \
			) \
		)
	#define DL_CONFIGURATOR_PHY_PARAMETER_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->near_end_serial_loopback = DL_CONFIGURATOR_PHY_PARAMETER_GET(NEAR_END_SERIAL_LOOPBACK, u)); \
			((s_ptr)->far_end_serial_loopback = DL_CONFIGURATOR_PHY_PARAMETER_GET(FAR_END_SERIAL_LOOPBACK, u)); \
		}
#endif

// Bit 0: NEAR_END_SERIAL_LOOPBACK
#define DL_CONFIGURATOR_PHY_PARAMETER_NEAR_END_SERIAL_LOOPBACK_OFFSET 0U
#define DL_CONFIGURATOR_PHY_PARAMETER_NEAR_END_SERIAL_LOOPBACK_MASK 0x1U

// Bit 1: FAR_END_SERIAL_LOOPBACK
#define DL_CONFIGURATOR_PHY_PARAMETER_FAR_END_SERIAL_LOOPBACK_OFFSET 1U
#define DL_CONFIGURATOR_PHY_PARAMETER_FAR_END_SERIAL_LOOPBACK_MASK 0x2U


/** LANE_PARAMETER ************************************************************/
#define DL_CONFIGURATOR_LANE_PARAMETER_ADDR_OFFSET 0x8U
#define DL_CONFIGURATOR_LANE_PARAMETER_ADDR \
	(DL_CONFIGURATOR_ADDR + DL_CONFIGURATOR_LANE_PARAMETER_ADDR_OFFSET)
#define DL_CONFIGURATOR_LANE_PARAMETER_PTR \
	__TO_PTR(DL_CONFIGURATOR_LANE_PARAMETER_ADDR)

struct dl_configurator_lane_parameter
{
	union
	{
		struct
		{
			uint32_t lanestart:1;
			uint32_t autostart:1;
			uint32_t lanereset:1;
			uint32_t parallel_loopback_enables:1;
			uint32_t standbyreason:8;
			uint32_t lanestart_pulse:1;
			uint32_t _reserved:19;
		};
		uint32_t reg_value;
	};
};

#define DL_CONFIGURATOR_LANE_PARAMETER_GET(NAME, reg) \
	(((reg) & DL_CONFIGURATOR_LANE_PARAMETER_##NAME##_MASK) >> DL_CONFIGURATOR_LANE_PARAMETER_##NAME##_OFFSET)

#define DL_CONFIGURATOR_LANE_PARAMETER_SET(NAME, val, reg) \
    ( \
        ((reg) & ~(DL_CONFIGURATOR_LANE_PARAMETER_##NAME##_MASK)) \
        | \
        (((val) << DL_CONFIGURATOR_LANE_PARAMETER_##NAME##_OFFSET) & DL_CONFIGURATOR_LANE_PARAMETER_##NAME##_MASK) \
    )

#define DL_CONFIGURATOR_LANE_PARAMETER_SET_IN_PLACE(NAME, val, reg) \
    (reg) = DL_CONFIGURATOR_LANE_PARAMETER_SET(NAME, val, reg)


#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define DL_CONFIGURATOR_LANE_PARAMETER_TO_UINT32_T(s) ((s).reg_value)
	#define DL_CONFIGURATOR_LANE_PARAMETER_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define DL_CONFIGURATOR_LANE_PARAMETER_TO_UINT32_T(s) \
		( \
			DL_CONFIGURATOR_LANE_PARAMETER_SET \
			( \
				LANESTART, \
				(s).lanestart, \
				DL_CONFIGURATOR_LANE_PARAMETER_SET \
				( \
					AUTOSTART, \
					(s).autostart, \
					DL_CONFIGURATOR_LANE_PARAMETER_SET \
					( \
						LANERESET, \
						(s).lanereset, \
						DL_CONFIGURATOR_LANE_PARAMETER_SET \
						( \
							PARALLEL_LOOPBACK_ENABLES, \
							(s).parallel_loopback_enables, \
							DL_CONFIGURATOR_LANE_PARAMETER_SET \
							( \
								STANDBYREASON, \
								(s).standbyreason, \
								DL_CONFIGURATOR_LANE_PARAMETER_SET \
								( \
									LANESTART_PULSE, \
									(s).lanestart_pulse, \
									0 \
								) \
							) \
						) \
					) \
				) \
			) \
		)
	#define DL_CONFIGURATOR_LANE_PARAMETER_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->lanestart = DL_CONFIGURATOR_LANE_PARAMETER_GET(LANESTART, u)); \
			((s_ptr)->autostart = DL_CONFIGURATOR_LANE_PARAMETER_GET(AUTOSTART, u)); \
			((s_ptr)->lanereset = DL_CONFIGURATOR_LANE_PARAMETER_GET(LANERESET, u)); \
			((s_ptr)->parallel_loopback_enables = DL_CONFIGURATOR_LANE_PARAMETER_GET(PARALLEL_LOOPBACK_ENABLES, u)); \
			((s_ptr)->standbyreason = DL_CONFIGURATOR_LANE_PARAMETER_GET(STANDBYREASON, u)); \
			((s_ptr)->lanestart_pulse = DL_CONFIGURATOR_LANE_PARAMETER_GET(LANESTART_PULSE, u)); \
		}
#endif

// Bit 0: LANESTART
#define DL_CONFIGURATOR_LANE_PARAMETER_LANESTART_OFFSET 0U
#define DL_CONFIGURATOR_LANE_PARAMETER_LANESTART_MASK 0x1U

// Bit 1: AUTOSTART
#define DL_CONFIGURATOR_LANE_PARAMETER_AUTOSTART_OFFSET 1U
#define DL_CONFIGURATOR_LANE_PARAMETER_AUTOSTART_MASK 0x2U

// Bit 2: LANERESET
#define DL_CONFIGURATOR_LANE_PARAMETER_LANERESET_OFFSET 2U
#define DL_CONFIGURATOR_LANE_PARAMETER_LANERESET_MASK 0x4U

// Bit 3: PARALLEL_LOOPBACK_ENABLES
#define DL_CONFIGURATOR_LANE_PARAMETER_PARALLEL_LOOPBACK_ENABLES_OFFSET 3U
#define DL_CONFIGURATOR_LANE_PARAMETER_PARALLEL_LOOPBACK_ENABLES_MASK 0x8U

// Bits 4-11: STANDBYREASON
#define DL_CONFIGURATOR_LANE_PARAMETER_STANDBYREASON_OFFSET 4U
#define DL_CONFIGURATOR_LANE_PARAMETER_STANDBYREASON_MASK 0xFF0U

// Bit 12: LANESTART_PULSE
#define DL_CONFIGURATOR_LANE_PARAMETER_LANESTART_PULSE_OFFSET 12U
#define DL_CONFIGURATOR_LANE_PARAMETER_LANESTART_PULSE_MASK 0x1000U


/** LANE_STATUS ***************************************************************/
#define DL_CONFIGURATOR_LANE_STATUS_ADDR_OFFSET 0xCU
#define DL_CONFIGURATOR_LANE_STATUS_ADDR \
	(DL_CONFIGURATOR_ADDR + DL_CONFIGURATOR_LANE_STATUS_ADDR_OFFSET)
#define DL_CONFIGURATOR_LANE_STATUS_PTR \
	__TO_PTR(DL_CONFIGURATOR_LANE_STATUS_ADDR)

struct dl_configurator_lane_status
{
	union
	{
		struct
		{
			uint32_t lane_state:4;
			uint32_t rx_error_counter:8;
			uint32_t rx_error_overflow:1;
			uint32_t far_end_lost_signal:1;
			uint32_t far_end_capabilities:8;
			uint32_t rx_polarity:1;
			uint32_t _reserved:9;
		};
		uint32_t reg_value;
	};
};

#define DL_CONFIGURATOR_LANE_STATUS_GET(NAME, reg) \
	(((reg) & DL_CONFIGURATOR_LANE_STATUS_##NAME##_MASK) >> DL_CONFIGURATOR_LANE_STATUS_##NAME##_OFFSET)

#define DL_CONFIGURATOR_LANE_STATUS_SET(NAME, val, reg) \
	( \
		((reg) & ~(DL_CONFIGURATOR_LANE_STATUS_##NAME##_MASK)) \
		| \
		( \
			((val) & (DL_CONFIGURATOR_LANE_STATUS_##NAME##_MASK)) \
			<< (DL_CONFIGURATOR_LANE_STATUS_##NAME##_OFFSET) \
		) \
	)

#define DL_CONFIGURATOR_LANE_STATUS_SET_IN_PLACE(NAME, val, reg) \
	(reg) = \
		( \
			((reg) & ~(DL_CONFIGURATOR_LANE_STATUS_##NAME##_MASK)) \
			| \
			( \
				((val) & (DL_CONFIGURATOR_LANE_STATUS_##NAME##_MASK)) \
				<< (DL_CONFIGURATOR_LANE_STATUS_##NAME##_OFFSET) \
			) \
		)

#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define DL_CONFIGURATOR_LANE_STATUS_TO_UINT32_T(s) ((s).reg_value)
	#define DL_CONFIGURATOR_LANE_STATUS_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define DL_CONFIGURATOR_LANE_STATUS_TO_UINT32_T(s) \
		( \
			DL_CONFIGURATOR_LANE_STATUS_SET \
			( \
				LANE_STATE, \
				(s).lane_state, \
				DL_CONFIGURATOR_LANE_STATUS_SET \
				( \
					RX_ERROR_COUNTER, \
					(s).rx_error_counter, \
					DL_CONFIGURATOR_LANE_STATUS_SET \
					( \
						RX_ERROR_OVERFLOW, \
						(s).rx_error_overflow, \
						DL_CONFIGURATOR_LANE_STATUS_SET \
						( \
							FAR_END_LOST_SIGNAL, \
							(s).far_end_lost_signal, \
							DL_CONFIGURATOR_LANE_STATUS_SET \
							( \
								FAR_END_CAPABILITIES, \
								(s).far_end_capabilities, \
								DL_CONFIGURATOR_LANE_STATUS_SET \
								( \
									RX_POLARITY, \
									(s).rx_polarity, \
									0 \
								) \
							) \
						) \
					) \
				) \
			) \
		)
	#define DL_CONFIGURATOR_LANE_STATUS_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->lane_state = DL_CONFIGURATOR_LANE_STATUS_GET(LANE_STATE, u)); \
			((s_ptr)->rx_error_counter = DL_CONFIGURATOR_LANE_STATUS_GET(RX_ERROR_COUNTER, u)); \
			((s_ptr)->rx_error_overflow = DL_CONFIGURATOR_LANE_STATUS_GET(RX_ERROR_OVERFLOW, u)); \
			((s_ptr)->far_end_lost_signal = DL_CONFIGURATOR_LANE_STATUS_GET(FAR_END_LOST_SIGNAL, u)); \
			((s_ptr)->far_end_capabilities = DL_CONFIGURATOR_LANE_STATUS_GET(FAR_END_CAPABILITIES, u)); \
			((s_ptr)->rx_polarity = DL_CONFIGURATOR_LANE_STATUS_GET(RX_POLARITY, u)); \
		}
#endif

// Bits 0-3: LANE_STATE
#define DL_CONFIGURATOR_LANE_STATUS_LANE_STATE_OFFSET 0U
#define DL_CONFIGURATOR_LANE_STATUS_LANE_STATE_MASK 0xFU

// Bits 4-11: RX_ERROR_COUNTER
#define DL_CONFIGURATOR_LANE_STATUS_RX_ERROR_COUNTER_OFFSET 4U
#define DL_CONFIGURATOR_LANE_STATUS_RX_ERROR_COUNTER_MASK 0xFF0U

// Bit 12: RX_ERROR_OVERFLOW
#define DL_CONFIGURATOR_LANE_STATUS_RX_ERROR_OVERFLOW_OFFSET 12U
#define DL_CONFIGURATOR_LANE_STATUS_RX_ERROR_OVERFLOW_MASK 0x1000U

// Bit 13: FAR_END_LOST_SIGNAL
#define DL_CONFIGURATOR_LANE_STATUS_FAR_END_LOST_SIGNAL_OFFSET 13U
#define DL_CONFIGURATOR_LANE_STATUS_FAR_END_LOST_SIGNAL_MASK 0x2000U

// Bits 14-21: FAR_END_CAPABILITIES
#define DL_CONFIGURATOR_LANE_STATUS_FAR_END_CAPABILITIES_OFFSET 14U
#define DL_CONFIGURATOR_LANE_STATUS_FAR_END_CAPABILITIES_MASK 0x3FC000U

// Bit 22: RX_POLARITY
#define DL_CONFIGURATOR_LANE_STATUS_RX_POLARITY_OFFSET 22U
#define DL_CONFIGURATOR_LANE_STATUS_RX_POLARITY_MASK 0x400000U


/** DL_PARAMETER **************************************************************/
#define DL_CONFIGURATOR_DL_PARAMETER_ADDR_OFFSET 0x10U
#define DL_CONFIGURATOR_DL_PARAMETER_ADDR \
	(DL_CONFIGURATOR_ADDR + DL_CONFIGURATOR_DL_PARAMETER_ADDR_OFFSET)
#define DL_CONFIGURATOR_DL_PARAMETER_PTR \
	__TO_PTR(DL_CONFIGURATOR_DL_PARAMETER_ADDR)

struct dl_configurator_dl_parameter
{
	union
	{
		struct
		{
			uint32_t interface_reset:1;
			uint32_t link_reset:1;
			uint32_t link_reset_asserted:1;
			uint32_t nack_rst_en:1;
			uint32_t nack_rst_mode:1;
			uint32_t pause_vc:9;
			uint32_t continuous_vc:8;
			uint32_t reset_error_flag:1;
			uint32_t _reserved:9;
		};
		uint32_t reg_value;
	};
};

#define DL_CONFIGURATOR_DL_PARAMETER_GET(NAME, reg) \
	(((reg) & DL_CONFIGURATOR_DL_PARAMETER_##NAME##_MASK) >> DL_CONFIGURATOR_DL_PARAMETER_##NAME##_OFFSET)

#define DL_CONFIGURATOR_DL_PARAMETER_SET(NAME, val, reg) \
	( \
		((reg) & ~(DL_CONFIGURATOR_DL_PARAMETER_##NAME##_MASK)) \
		| \
		( \
			((val) & (DL_CONFIGURATOR_DL_PARAMETER_##NAME##_MASK)) \
			<< (DL_CONFIGURATOR_DL_PARAMETER_##NAME##_OFFSET) \
		) \
	)

#define DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE(NAME, val, reg) \
	(reg) = \
		( \
			((reg) & ~(DL_CONFIGURATOR_DL_PARAMETER_##NAME##_MASK)) \
			| \
			( \
				((val) << (DL_CONFIGURATOR_DL_PARAMETER_##NAME##_OFFSET)) \
			    & (DL_CONFIGURATOR_DL_PARAMETER_##NAME##_MASK) \
			) \
		)

#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define DL_CONFIGURATOR_DL_PARAMETER_TO_UINT32_T(s) ((s).reg_value)
	#define DL_CONFIGURATOR_DL_PARAMETER_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define DL_CONFIGURATOR_DL_PARAMETER_TO_UINT32_T(s) \
		( \
			DL_CONFIGURATOR_DL_PARAMETER_SET \
			( \
				INTERFACE_RESET, \
				(s).interface_reset, \
				DL_CONFIGURATOR_DL_PARAMETER_SET \
				( \
					LINK_RESET, \
					(s).link_reset, \
					DL_CONFIGURATOR_DL_PARAMETER_SET \
					( \
						LINK_RESET_ASSERTED, \
						(s).link_reset_asserted, \
						DL_CONFIGURATOR_DL_PARAMETER_SET \
						( \
							NACK_RST_EN, \
							(s).nack_rst_en, \
							DL_CONFIGURATOR_DL_PARAMETER_SET \
							( \
								NACK_RST_MODE, \
								(s).nack_rst_mode, \
								DL_CONFIGURATOR_DL_PARAMETER_SET \
								( \
									PAUSE_VC, \
									(s).pause_vc, \
									DL_CONFIGURATOR_DL_PARAMETER_SET \
									( \
										CONTINUOUS_VC, \
										(s).continuous_vc, \
										DL_CONFIGURATOR_DL_PARAMETER_SET \
										( \
											RESET_ERROR_FLAG, \
											(s).reset_error_flag, \
											0 \
										) \
									) \
								) \
							) \
						) \
					) \
				) \
			) \
		)
	#define DL_CONFIGURATOR_DL_PARAMETER_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->interface_reset = DL_CONFIGURATOR_DL_PARAMETER_GET(INTERFACE_RESET, u)); \
			((s_ptr)->link_reset = DL_CONFIGURATOR_DL_PARAMETER_GET(LINK_RESET, u)); \
			((s_ptr)->link_reset_asserted = DL_CONFIGURATOR_DL_PARAMETER_GET(LINK_RESET_ASSERTED, u)); \
			((s_ptr)->nack_rst_en = DL_CONFIGURATOR_DL_PARAMETER_GET(NACK_RST_EN, u)); \
			((s_ptr)->nack_rst_mode = DL_CONFIGURATOR_DL_PARAMETER_GET(NACK_RST_MODE, u)); \
			((s_ptr)->pause_vc = DL_CONFIGURATOR_DL_PARAMETER_GET(PAUSE_VC, u)); \
			((s_ptr)->continuous_vc = DL_CONFIGURATOR_DL_PARAMETER_GET(CONTINUOUS_VC, u)); \
			((s_ptr)->reset_error_flag = DL_CONFIGURATOR_DL_PARAMETER_GET(RESET_ERROR_FLAG, u)); \
		}
#endif

// Bit 0: INTERFACE_RESET
#define DL_CONFIGURATOR_DL_PARAMETER_INTERFACE_RESET_OFFSET 0U
#define DL_CONFIGURATOR_DL_PARAMETER_INTERFACE_RESET_MASK 0x1U

// Bit 1: LINK_RESET
#define DL_CONFIGURATOR_DL_PARAMETER_LINK_RESET_OFFSET 1U
#define DL_CONFIGURATOR_DL_PARAMETER_LINK_RESET_MASK 0x2U

// Bit 2: LINK_RESET_ASSERTED
#define DL_CONFIGURATOR_DL_PARAMETER_LINK_RESET_ASSERTED_OFFSET 2U
#define DL_CONFIGURATOR_DL_PARAMETER_LINK_RESET_ASSERTED_MASK 0x4U

// Bit 3: NACK_RST_EN
#define DL_CONFIGURATOR_DL_PARAMETER_NACK_RST_EN_OFFSET 3U
#define DL_CONFIGURATOR_DL_PARAMETER_NACK_RST_EN_MASK 0x8U

// Bit 4: NACK_RST_MODE
#define DL_CONFIGURATOR_DL_PARAMETER_NACK_RST_MODE_OFFSET 4U
#define DL_CONFIGURATOR_DL_PARAMETER_NACK_RST_MODE_MASK 0x10U

// Bits 5-13: PAUSE_VC
#define DL_CONFIGURATOR_DL_PARAMETER_PAUSE_VC_OFFSET 5U
#define DL_CONFIGURATOR_DL_PARAMETER_PAUSE_VC_MASK 0x3FE0U

// Bits 14-21: CONTINUOUS_VC
#define DL_CONFIGURATOR_DL_PARAMETER_CONTINUOUS_VC_OFFSET 14U
#define DL_CONFIGURATOR_DL_PARAMETER_CONTINUOUS_VC_MASK 0x3FC000U

// Bit 22: RESET_ERROR_FLAG
#define DL_CONFIGURATOR_DL_PARAMETER_RESET_ERROR_FLAG_OFFSET 22U
#define DL_CONFIGURATOR_DL_PARAMETER_RESET_ERROR_FLAG_MASK 0x400000U


/** DL_STATUS_1 ***************************************************************/
#define DL_CONFIGURATOR_DL_STATUS_1_ADDR_OFFSET 0x14U
#define DL_CONFIGURATOR_DL_STATUS_1_ADDR \
	(DL_CONFIGURATOR_ADDR + DL_CONFIGURATOR_DL_STATUS_1_ADDR_OFFSET)
#define DL_CONFIGURATOR_DL_STATUS_1_PTR \
	__TO_PTR(DL_CONFIGURATOR_DL_STATUS_1_ADDR)

struct dl_configurator_dl_status_1
{
	union
	{
		struct
		{
			uint32_t seq_number_tx:8;
			uint32_t seq_number_rx:8;
			uint32_t credit_vc:8;
			uint32_t fct_credit_overflow:8;
		};
		uint32_t reg_value;
	};
};


#define DL_CONFIGURATOR_DL_STATUS_1_GET(NAME, reg) \
  (((reg) & DL_CONFIGURATOR_DL_STATUS_1_##NAME##_MASK) >> DL_CONFIGURATOR_DL_STATUS_1_##NAME##_OFFSET)


#define DL_CONFIGURATOR_DL_STATUS_1_SET(NAME, val, reg) \
	( \
		((reg) & ~(DL_CONFIGURATOR_DL_STATUS_1_##NAME##_MASK)) \
		| \
		( \
			((val) & (DL_CONFIGURATOR_DL_STATUS_1_##NAME##_MASK)) \
			<< (DL_CONFIGURATOR_DL_STATUS_1_##NAME##_OFFSET) \
		) \
	)

#define DL_CONFIGURATOR_DL_STATUS_1_SET_IN_PLACE(NAME, val, reg) \
	(reg) = \
		( \
			((reg) & ~(DL_CONFIGURATOR_DL_STATUS_1_##NAME##_MASK)) \
			| \
			( \
				((val) & (DL_CONFIGURATOR_DL_STATUS_1_##NAME##_MASK)) \
				<< (DL_CONFIGURATOR_DL_STATUS_1_##NAME##_OFFSET) \
			) \
		)

#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define DL_CONFIGURATOR_DL_STATUS_1_TO_UINT32_T(s) ((s).reg_value)
	#define DL_CONFIGURATOR_DL_STATUS_1_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define DL_CONFIGURATOR_DL_STATUS_1_TO_UINT32_T(s) \
		( \
			DL_CONFIGURATOR_DL_STATUS_1_SET \
			( \
				SEQ_NUMBER_TX, \
				(s).seq_number_tx, \
				DL_CONFIGURATOR_DL_STATUS_1_SET \
				( \
					SEQ_NUMBER_RX, \
					(s).seq_number_rx, \
					DL_CONFIGURATOR_DL_STATUS_1_SET \
					( \
						CREDIT_VC, \
						(s).credit_vc, \
						DL_CONFIGURATOR_DL_STATUS_1_SET \
						( \
							FCT_CREDIT_OVERFLOW, \
							(s).fct_credit_overflow, \
							0 \
						) \
					) \
				) \
			) \
		)
	#define DL_CONFIGURATOR_DL_STATUS_1_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->seq_number_tx = DL_CONFIGURATOR_DL_STATUS_1_GET(SEQ_NUMBER_TX, u)); \
			((s_ptr)->seq_number_rx = DL_CONFIGURATOR_DL_STATUS_1_GET(SEQ_NUMBER_RX, u)); \
			((s_ptr)->credit_vc = DL_CONFIGURATOR_DL_STATUS_1_GET(CREDIT_VC, u)); \
			((s_ptr)->fct_credit_overflow = DL_CONFIGURATOR_DL_STATUS_1_GET(FCT_CREDIT_OVERFLOW, u)); \
		}
#endif

// Bits 0-7: SEQ_NUMBER_TX
#define DL_CONFIGURATOR_DL_STATUS_1_SEQ_NUMBER_TX_OFFSET 0U
#define DL_CONFIGURATOR_DL_STATUS_1_SEQ_NUMBER_TX_MASK 0xFFU

// Bits 8-15: SEQ_NUMBER_RX
#define DL_CONFIGURATOR_DL_STATUS_1_SEQ_NUMBER_RX_OFFSET 8U
#define DL_CONFIGURATOR_DL_STATUS_1_SEQ_NUMBER_RX_MASK 0xFF00U

// Bits 16-23: CREDIT_VC
#define DL_CONFIGURATOR_DL_STATUS_1_CREDIT_VC_OFFSET 16U
#define DL_CONFIGURATOR_DL_STATUS_1_CREDIT_VC_MASK 0xFF0000U

// Bits 24-31: FCT_CREDIT_OVERFLOW
#define DL_CONFIGURATOR_DL_STATUS_1_FCT_CREDIT_OVERFLOW_OFFSET 24U
#define DL_CONFIGURATOR_DL_STATUS_1_FCT_CREDIT_OVERFLOW_MASK 0xFF000000U


/** DL_STATUS_2 ***************************************************************/
#define DL_CONFIGURATOR_DL_STATUS_2_ADDR_OFFSET 0x18U
#define DL_CONFIGURATOR_DL_STATUS_2_ADDR \
	(DL_CONFIGURATOR_ADDR + DL_CONFIGURATOR_DL_STATUS_2_ADDR_OFFSET)
#define DL_CONFIGURATOR_DL_STATUS_2_PTR \
	__TO_PTR(DL_CONFIGURATOR_DL_STATUS_2_ADDR)

struct dl_configurator_dl_status_2
{
	union
	{
		struct
		{
			uint32_t crc_long_error:1;
			uint32_t crc_short_error:1;
			uint32_t frame_error:1;
			uint32_t sequence_error:1;
			uint32_t far_end_link_reset:1;
			uint32_t input_buffer_overflow:8;
			uint32_t _reserved:19;
		};
		uint32_t reg_value;
	};
};

#define DL_CONFIGURATOR_DL_STATUS_2_GET(NAME, reg) \
	(((reg) & DL_CONFIGURATOR_DL_STATUS_2_##NAME##_MASK) >> DL_CONFIGURATOR_DL_STATUS_2_##NAME##_OFFSET)

#define DL_CONFIGURATOR_DL_STATUS_2_SET(NAME, val, reg) \
	( \
		((reg) & ~(DL_CONFIGURATOR_DL_STATUS_2_##NAME##_MASK)) \
		| \
		( \
			((val) & (DL_CONFIGURATOR_DL_STATUS_2_##NAME##_MASK)) \
			<< (DL_CONFIGURATOR_DL_STATUS_2_##NAME##_OFFSET) \
		) \
	)

#define DL_CONFIGURATOR_DL_STATUS_2_SET_IN_PLACE(NAME, val, reg) \
	(reg) = \
		( \
			((reg) & ~(DL_CONFIGURATOR_DL_STATUS_2_##NAME##_MASK)) \
			| \
			( \
				((val) & (DL_CONFIGURATOR_DL_STATUS_2_##NAME##_MASK)) \
				<< (DL_CONFIGURATOR_DL_STATUS_2_##NAME##_OFFSET) \
			) \
		)

#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define DL_CONFIGURATOR_DL_STATUS_2_TO_UINT32_T(s) ((s).reg_value)
	#define DL_CONFIGURATOR_DL_STATUS_2_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define DL_CONFIGURATOR_DL_STATUS_2_TO_UINT32_T(s) \
		( \
			DL_CONFIGURATOR_DL_STATUS_2_SET \
			( \
				CRC_LONG_ERROR, \
				(s).crc_long_error, \
				DL_CONFIGURATOR_DL_STATUS_2_SET \
				( \
					CRC_SHORT_ERROR, \
					(s).crc_short_error, \
					DL_CONFIGURATOR_DL_STATUS_2_SET \
					( \
						FRAME_ERROR, \
						(s).frame_error, \
						DL_CONFIGURATOR_DL_STATUS_2_SET \
						( \
							SEQUENCE_ERROR, \
							(s).sequence_error, \
							DL_CONFIGURATOR_DL_STATUS_2_SET \
							( \
								FAR_END_LINK_RESET, \
								(s).far_end_link_reset, \
								DL_CONFIGURATOR_DL_STATUS_2_SET \
								( \
									INPUT_BUFFER_OVERFLOW, \
									(s).input_buffer_overflow, \
									0 \
								) \
							) \
						) \
					) \
				) \
			) \
		)
	#define DL_CONFIGURATOR_DL_STATUS_2_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->crc_long_error = DL_CONFIGURATOR_DL_STATUS_2_GET(CRC_LONG_ERROR, u)); \
			((s_ptr)->crc_short_error = DL_CONFIGURATOR_DL_STATUS_2_GET(CRC_SHORT_ERROR, u)); \
			((s_ptr)->frame_error = DL_CONFIGURATOR_DL_STATUS_2_GET(FRAME_ERROR, u)); \
			((s_ptr)->sequence_error = DL_CONFIGURATOR_DL_STATUS_2_GET(SEQUENCE_ERROR, u)); \
			((s_ptr)->far_end_link_reset = DL_CONFIGURATOR_DL_STATUS_2_GET(FAR_END_LINK_RESET, u)); \
			((s_ptr)->input_buffer_overflow = DL_CONFIGURATOR_DL_STATUS_2_GET(INPUT_BUFFER_OVERFLOW, u)); \
		}
#endif

// Bit 0: CRC_LONG_ERROR
#define DL_CONFIGURATOR_DL_STATUS_2_CRC_LONG_ERROR_OFFSET 0U
#define DL_CONFIGURATOR_DL_STATUS_2_CRC_LONG_ERROR_MASK 0x1U

// Bit 1: CRC_SHORT_ERROR
#define DL_CONFIGURATOR_DL_STATUS_2_CRC_SHORT_ERROR_OFFSET 1U
#define DL_CONFIGURATOR_DL_STATUS_2_CRC_SHORT_ERROR_MASK 0x2U

// Bit 2: FRAME_ERROR
#define DL_CONFIGURATOR_DL_STATUS_2_FRAME_ERROR_OFFSET 2U
#define DL_CONFIGURATOR_DL_STATUS_2_FRAME_ERROR_MASK 0x4U

// Bit 3: SEQUENCE_ERROR
#define DL_CONFIGURATOR_DL_STATUS_2_SEQUENCE_ERROR_OFFSET 3U
#define DL_CONFIGURATOR_DL_STATUS_2_SEQUENCE_ERROR_MASK 0x8U

// Bit 4: FAR_END_LINK_RESET
#define DL_CONFIGURATOR_DL_STATUS_2_FAR_END_LINK_RESET_OFFSET 4U
#define DL_CONFIGURATOR_DL_STATUS_2_FAR_END_LINK_RESET_MASK 0x10U

// Bits 5-12: INPUT_BUFFER_OVERFLOW
#define DL_CONFIGURATOR_DL_STATUS_2_INPUT_BUFFER_OVERFLOW_OFFSET 5U
#define DL_CONFIGURATOR_DL_STATUS_2_INPUT_BUFFER_OVERFLOW_MASK 0x1FE0U


/** DL_QOS_1 ******************************************************************/
#define DL_CONFIGURATOR_DL_QOS_1_ADDR_OFFSET 0x1CU
#define DL_CONFIGURATOR_DL_QOS_1_ADDR \
	(DL_CONFIGURATOR_ADDR + DL_CONFIGURATOR_DL_QOS_1_ADDR_OFFSET)
#define DL_CONFIGURATOR_DL_QOS_1_PTR \
	__TO_PTR(DL_CONFIGURATOR_DL_QOS_1_ADDR)

struct dl_configurator_dl_qos_1
{
	union
	{
		struct
		{
			uint32_t frame_finished:9;
			uint32_t frame_tx:9;
			uint32_t data_counter_tx:7;
			uint32_t data_counter_rx:7;
		};
		uint32_t reg_value;
	};
};

#define DL_CONFIGURATOR_DL_QOS_1_GET(NAME, reg) \
	(((reg) & DL_CONFIGURATOR_DL_QOS_1_##NAME##_MASK) >> DL_CONFIGURATOR_DL_QOS_1_##NAME##_OFFSET)

#define DL_CONFIGURATOR_DL_QOS_1_SET(NAME, val, reg) \
	( \
		((reg) & ~(DL_CONFIGURATOR_DL_QOS_1_##NAME##_MASK)) \
		| \
		( \
			((val) & (DL_CONFIGURATOR_DL_QOS_1_##NAME##_MASK)) \
			<< (DL_CONFIGURATOR_DL_QOS_1_##NAME##_OFFSET) \
		) \
	)

#define DL_CONFIGURATOR_DL_QOS_1_SET_IN_PLACE(NAME, val, reg) \
	(reg) = \
		( \
			((reg) & ~(DL_CONFIGURATOR_DL_QOS_1_##NAME##_MASK)) \
			| \
			( \
				((val) & (DL_CONFIGURATOR_DL_QOS_1_##NAME##_MASK)) \
				<< (DL_CONFIGURATOR_DL_QOS_1_##NAME##_OFFSET) \
			) \
		)

#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define DL_CONFIGURATOR_DL_QOS_1_TO_UINT32_T(s) ((s).reg_value)
	#define DL_CONFIGURATOR_DL_QOS_1_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define DL_CONFIGURATOR_DL_QOS_1_TO_UINT32_T(s) \
		( \
			DL_CONFIGURATOR_DL_QOS_1_SET \
			( \
				FRAME_FINISHED, \
				(s).frame_finished, \
				DL_CONFIGURATOR_DL_QOS_1_SET \
				( \
					FRAME_TX, \
					(s).frame_tx, \
					DL_CONFIGURATOR_DL_QOS_1_SET \
					( \
						DATA_COUNTER_TX, \
						(s).data_counter_tx, \
						DL_CONFIGURATOR_DL_QOS_1_SET \
						( \
							DATA_COUNTER_RX, \
							(s).data_counter_rx, \
							0 \
						) \
					) \
				) \
			) \
		)
	#define DL_CONFIGURATOR_DL_QOS_1_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->frame_finished = DL_CONFIGURATOR_DL_QOS_1_GET(FRAME_FINISHED, u)); \
			((s_ptr)->frame_tx = DL_CONFIGURATOR_DL_QOS_1_GET(FRAME_TX, u)); \
			((s_ptr)->data_counter_tx = DL_CONFIGURATOR_DL_QOS_1_GET(DATA_COUNTER_TX, u)); \
			((s_ptr)->data_counter_rx = DL_CONFIGURATOR_DL_QOS_1_GET(DATA_COUNTER_RX, u)); \
		}
#endif

// Bits 0-8: FRAME_FINISHED
#define DL_CONFIGURATOR_DL_QOS_1_FRAME_FINISHED_OFFSET 0U
#define DL_CONFIGURATOR_DL_QOS_1_FRAME_FINISHED_MASK 0x1FFU

// Bits 9-17: FRAME_TX
#define DL_CONFIGURATOR_DL_QOS_1_FRAME_TX_OFFSET 9U
#define DL_CONFIGURATOR_DL_QOS_1_FRAME_TX_MASK 0x3FE00U

// Bits 18-24: DATA_COUNTER_TX
#define DL_CONFIGURATOR_DL_QOS_1_DATA_COUNTER_TX_OFFSET 18U
#define DL_CONFIGURATOR_DL_QOS_1_DATA_COUNTER_TX_MASK 0x1FC0000U

// Bits 25-31: DATA_COUNTER_RX
#define DL_CONFIGURATOR_DL_QOS_1_DATA_COUNTER_RX_OFFSET 25U
#define DL_CONFIGURATOR_DL_QOS_1_DATA_COUNTER_RX_MASK 0xFE000000U


/** DL_QOS_2 ******************************************************************/
#define DL_CONFIGURATOR_DL_QOS_2_ADDR_OFFSET 0x20U
#define DL_CONFIGURATOR_DL_QOS_2_ADDR \
	(DL_CONFIGURATOR_ADDR + DL_CONFIGURATOR_DL_QOS_2_ADDR_OFFSET)
#define DL_CONFIGURATOR_DL_QOS_2_PTR \
	__TO_PTR(DL_CONFIGURATOR_DL_QOS_2_ADDR)

struct dl_configurator_dl_qos_2
{
	union
	{
		struct
		{
			uint32_t ack_counter_tx:3;
			uint32_t nack_counter_tx:3;
			uint32_t fct_counter_tx:3;
			uint32_t ack_counter_rx:3;
			uint32_t nack_counter_rx:3;
			uint32_t fct_counter_rx:3;
			uint32_t full_counter_rx:3;
			uint32_t retry_counter_rx:3;
			uint32_t current_time_slot:3;
			uint32_t _reserved:5;
		};
		uint32_t reg_value;
	};
};

#define DL_CONFIGURATOR_DL_QOS_2_GET(NAME, reg) \
	(((reg) & DL_CONFIGURATOR_DL_QOS_2_##NAME##_MASK) >> DL_CONFIGURATOR_DL_QOS_2_##NAME##_OFFSET)

#define DL_CONFIGURATOR_DL_QOS_2_SET(NAME, val, reg) \
	( \
		((reg) & ~(DL_CONFIGURATOR_DL_QOS_2_##NAME##_MASK)) \
		| \
		( \
			((val) & (DL_CONFIGURATOR_DL_QOS_2_##NAME##_MASK)) \
			<< (DL_CONFIGURATOR_DL_QOS_2_##NAME##_OFFSET) \
		) \
	)

#define DL_CONFIGURATOR_DL_QOS_2_SET_IN_PLACE(NAME, val, reg) \
	(reg) = \
		( \
			((reg) & ~(DL_CONFIGURATOR_DL_QOS_2_##NAME##_MASK)) \
			| \
			( \
				((val) & (DL_CONFIGURATOR_DL_QOS_2_##NAME##_MASK)) \
				<< (DL_CONFIGURATOR_DL_QOS_2_##NAME##_OFFSET) \
			) \
		)

#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define DL_CONFIGURATOR_DL_QOS_2_TO_UINT32_T(s) ((s).reg_value)
	#define DL_CONFIGURATOR_DL_QOS_2_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define DL_CONFIGURATOR_DL_QOS_2_TO_UINT32_T(s) \
		( \
			DL_CONFIGURATOR_DL_QOS_2_SET \
			( \
				ACK_COUNTER_TX, \
				(s).ack_counter_tx, \
				DL_CONFIGURATOR_DL_QOS_2_SET \
				( \
					NACK_COUNTER_TX, \
					(s).nack_counter_tx, \
					DL_CONFIGURATOR_DL_QOS_2_SET \
					( \
						FCT_COUNTER_TX, \
						(s).fct_counter_tx, \
						DL_CONFIGURATOR_DL_QOS_2_SET \
						( \
							ACK_COUNTER_RX, \
							(s).ack_counter_rx, \
							DL_CONFIGURATOR_DL_QOS_2_SET \
							( \
								NACK_COUNTER_RX, \
								(s).nack_counter_rx, \
								DL_CONFIGURATOR_DL_QOS_2_SET \
								( \
									FCT_COUNTER_RX, \
									(s).fct_counter_rx, \
									DL_CONFIGURATOR_DL_QOS_2_SET \
									( \
										FULL_COUNTER_RX, \
										(s).full_counter_rx, \
										DL_CONFIGURATOR_DL_QOS_2_SET \
										( \
											RETRY_COUNTER_RX, \
											(s).retry_counter_rx, \
											DL_CONFIGURATOR_DL_QOS_2_SET \
											( \
												CURRENT_TIME_SLOT, \
												(s).current_time_slot, \
												0 \
											) \
										) \
									) \
								) \
							) \
						) \
					) \
				) \
			) \
		)
	#define DL_CONFIGURATOR_DL_QOS_2_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->ack_counter_tx = DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_TX, u)); \
			((s_ptr)->nack_counter_tx = DL_CONFIGURATOR_DL_QOS_2_GET(NACK_COUNTER_TX, u)); \
			((s_ptr)->fct_counter_tx = DL_CONFIGURATOR_DL_QOS_2_GET(FCT_COUNTER_TX, u)); \
			((s_ptr)->ack_counter_rx = DL_CONFIGURATOR_DL_QOS_2_GET(ACK_COUNTER_RX, u)); \
			((s_ptr)->nack_counter_rx = DL_CONFIGURATOR_DL_QOS_2_GET(NACK_COUNTER_RX, u)); \
			((s_ptr)->fct_counter_rx = DL_CONFIGURATOR_DL_QOS_2_GET(FCT_COUNTER_RX, u)); \
			((s_ptr)->full_counter_rx = DL_CONFIGURATOR_DL_QOS_2_GET(FULL_COUNTER_RX, u)); \
			((s_ptr)->retry_counter_rx = DL_CONFIGURATOR_DL_QOS_2_GET(RETRY_COUNTER_RX, u)); \
			((s_ptr)->current_time_slot = DL_CONFIGURATOR_DL_QOS_2_GET(CURRENT_TIME_SLOT, u)); \
		}
#endif

// Bits 0-2: ACK_COUNTER_TX
#define DL_CONFIGURATOR_DL_QOS_2_ACK_COUNTER_TX_OFFSET 0U
#define DL_CONFIGURATOR_DL_QOS_2_ACK_COUNTER_TX_MASK 0x7U

// Bits 3-5: NACK_COUNTER_TX
#define DL_CONFIGURATOR_DL_QOS_2_NACK_COUNTER_TX_OFFSET 3U
#define DL_CONFIGURATOR_DL_QOS_2_NACK_COUNTER_TX_MASK 0x38U

// Bits 6-9: FCT_COUNTER_TX
#define DL_CONFIGURATOR_DL_QOS_2_FCT_COUNTER_TX_OFFSET 6U
#define DL_CONFIGURATOR_DL_QOS_2_FCT_COUNTER_TX_MASK 0x3C0U

// Bits 10-12: ACK_COUNTER_RX
#define DL_CONFIGURATOR_DL_QOS_2_ACK_COUNTER_RX_OFFSET 10U
#define DL_CONFIGURATOR_DL_QOS_2_ACK_COUNTER_RX_MASK 0x1C00U

// Bits 13-15: NACK_COUNTER_RX
#define DL_CONFIGURATOR_DL_QOS_2_NACK_COUNTER_RX_OFFSET 13U
#define DL_CONFIGURATOR_DL_QOS_2_NACK_COUNTER_RX_MASK 0xE000U

// Bits 16-19: FCT_COUNTER_RX
#define DL_CONFIGURATOR_DL_QOS_2_FCT_COUNTER_RX_OFFSET 16U
#define DL_CONFIGURATOR_DL_QOS_2_FCT_COUNTER_RX_MASK 0xF0000U

// Bits 20-21: FULL_COUNTER_RX
#define DL_CONFIGURATOR_DL_QOS_2_FULL_COUNTER_RX_OFFSET 20U
#define DL_CONFIGURATOR_DL_QOS_2_FULL_COUNTER_RX_MASK 0x300000U

// Bits 22-23: RETRY_COUNTER_RX
#define DL_CONFIGURATOR_DL_QOS_2_RETRY_COUNTER_RX_OFFSET 22U
#define DL_CONFIGURATOR_DL_QOS_2_RETRY_COUNTER_RX_MASK 0xC00000U

// Bits 24-31: CURRENT_TIME_SLOT
#define DL_CONFIGURATOR_DL_QOS_2_CURRENT_TIME_SLOT_OFFSET 24U
#define DL_CONFIGURATOR_DL_QOS_2_CURRENT_TIME_SLOT_MASK 0xFF000000U

/******************************************************************************/

/******************************************************************************/
/** LANE_ANALYZER *************************************************************/
/******************************************************************************/
#define LANE_ANALYZER_ADDR XPAR_LANE_ANALYZER_LANE_ANALYZER_0_BASEADDR

/** CONFIGURATION *************************************************************/
#define LANE_ANALYZER_CONFIGURATION_ADDR_OFFSET 0x0U
#define LANE_ANALYZER_CONFIGURATION_ADDR \
	(LANE_ANALYZER_ADDR + LANE_ANALYZER_CONFIGURATION_ADDR_OFFSET)
#define LANE_ANALYZER_CONFIGURATION_PTR \
	__TO_PTR(LANE_ANALYZER_CONFIGURATION_ADDR)

struct lane_analyzer_configuration
{
	union
	{
		struct
		{
			uint32_t frame_number:5;
			uint32_t frame_size:9;
			uint32_t interpacket_delay:10;
			uint32_t generation_data:1;
			uint32_t data_mode:2;
			uint32_t _reserved:5;
		};
		uint32_t reg_value;
	};
};

#define LANE_ANALYZER_CONFIGURATION_GET(NAME, reg) \
	(((reg) & LANE_ANALYZER_CONFIGURATION_##NAME##_MASK) >> LANE_ANALYZER_CONFIGURATION_##NAME##_OFFSET)

#define LANE_ANALYZER_CONFIGURATION_SET(NAME, val, reg) \
	( \
		((reg) & ~(LANE_ANALYZER_CONFIGURATION_##NAME##_MASK)) \
		| \
		( \
			((val) & (LANE_ANALYZER_CONFIGURATION_##NAME##_MASK)) \
			<< (LANE_ANALYZER_CONFIGURATION_##NAME##_OFFSET) \
		) \
	)

#define LANE_ANALYZER_CONFIGURATION_SET_IN_PLACE(NAME, val, reg) \
	(reg) = \
		( \
			((reg) & ~(LANE_ANALYZER_CONFIGURATION_##NAME##_MASK)) \
			| \
			( \
				((val) & (LANE_ANALYZER_CONFIGURATION_##NAME##_MASK)) \
				<< (LANE_ANALYZER_CONFIGURATION_##NAME##_OFFSET) \
			) \
		)

#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define LANE_ANALYZER_CONFIGURATION_TO_UINT32_T(s) ((s).reg_value)
	#define LANE_ANALYZER_CONFIGURATION_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define LANE_ANALYZER_CONFIGURATION_TO_UINT32_T(s) \
		( \
			LANE_ANALYZER_CONFIGURATION_SET \
			( \
				FRAME_NUMBER, \
				(s).frame_number, \
				LANE_ANALYZER_CONFIGURATION_SET \
				( \
					FRAME_SIZE, \
					(s).frame_size, \
					LANE_ANALYZER_CONFIGURATION_SET \
					( \
						INTERPACKET_DELAY, \
						(s).interpacket_delay, \
						LANE_ANALYZER_CONFIGURATION_SET \
						( \
							GENERATION_DATA, \
							(s).generation_data, \
							LANE_ANALYZER_CONFIGURATION_SET \
							( \
								DATA_MODE, \
								(s).data_mode, \
								0 \
							) \
						) \
					) \
				) \
			) \
		)
	#define LANE_ANALYZER_CONFIGURATION_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->frame_number = LANE_ANALYZER_CONFIGURATION_GET(FRAME_NUMBER, u)); \
			((s_ptr)->frame_size = LANE_ANALYZER_CONFIGURATION_GET(FRAME_SIZE, u)); \
			((s_ptr)->interpacket_delay = LANE_ANALYZER_CONFIGURATION_GET(INTERPACKET_DELAY, u)); \
			((s_ptr)->generation_data = LANE_ANALYZER_CONFIGURATION_GET(GENERATION_DATA, u)); \
			((s_ptr)->data_mode = LANE_ANALYZER_CONFIGURATION_GET(DATA_MODE, u)); \
		}
#endif

// Bits 0-4: FRAME_NUMBER
#define LANE_ANALYZER_CONFIGURATION_FRAME_NUMBER_OFFSET 0U
#define LANE_ANALYZER_CONFIGURATION_FRAME_NUMBER_MASK 0x1FU

// Bits 5-13: FRAME_SIZE
#define LANE_ANALYZER_CONFIGURATION_FRAME_SIZE_OFFSET 5U
#define LANE_ANALYZER_CONFIGURATION_FRAME_SIZE_MASK 0x3FE0U

// Bits 14-23: INTERPACKET_DELAY
#define LANE_ANALYZER_CONFIGURATION_INTERPACKET_DELAY_OFFSET 14U
#define LANE_ANALYZER_CONFIGURATION_INTERPACKET_DELAY_MASK 0xFFC000U

// Bit 24: GENERATION_DATA
#define LANE_ANALYZER_CONFIGURATION_GENERATION_DATA_OFFSET 24U
#define LANE_ANALYZER_CONFIGURATION_GENERATION_DATA_MASK 0x1000000U

// Bits 25-26: DATA_MODE
#define LANE_ANALYZER_CONFIGURATION_DATA_MODE_OFFSET 25U
#define LANE_ANALYZER_CONFIGURATION_DATA_MODE_MASK 0x6000000U


/** CONTROL *******************************************************************/
#define LANE_ANALYZER_CONTROL_ADDR_OFFSET 0x4U
#define LANE_ANALYZER_CONTROL_ADDR \
	(LANE_ANALYZER_ADDR + LANE_ANALYZER_CONTROL_ADDR_OFFSET)
#define LANE_ANALYZER_CONTROL_PTR \
	__TO_PTR(LANE_ANALYZER_CONTROL_ADDR)

struct lane_analyzer_control
{
	union
	{
		struct
		{
			uint32_t model_start:1;
			uint32_t _reserved:31;
		};
		uint32_t reg_value;
	};
};

#define LANE_ANALYZER_CONTROL_GET(NAME, reg) \
	(((reg) & LANE_ANALYZER_CONTROL_##NAME##_MASK) >> LANE_ANALYZER_CONTROL_##NAME##_OFFSET)

#define LANE_ANALYZER_CONTROL_SET(NAME, val, reg) \
	( \
		((reg) & ~(LANE_ANALYZER_CONTROL_##NAME##_MASK)) \
		| \
		( \
			((val) & (LANE_ANALYZER_CONTROL_##NAME##_MASK)) \
			<< (LANE_ANALYZER_CONTROL_##NAME##_OFFSET) \
		) \
	)

#define LANE_ANALYZER_CONTROL_SET_IN_PLACE(NAME, val, reg) \
	(reg) = \
		( \
			((reg) & ~(LANE_ANALYZER_CONTROL_##NAME##_MASK)) \
			| \
			( \
				((val) & (LANE_ANALYZER_CONTROL_##NAME##_MASK)) \
				<< (LANE_ANALYZER_CONTROL_##NAME##_OFFSET) \
			) \
		)

#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define LANE_ANALYZER_CONTROL_TO_UINT32_T(s) ((s).reg_value)
	#define LANE_ANALYZER_CONTROL_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define LANE_ANALYZER_CONTROL_TO_UINT32_T(s) \
		( \
			LANE_ANALYZER_CONTROL_SET \
			( \
				MODEL_START, \
				(s).model_start, \
				0 \
			) \
		)
	#define LANE_ANALYZER_CONTROL_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->model_start = LANE_ANALYZER_CONTROL_GET(MODEL_START, u)); \
		}
#endif

// Bit 0: MODEL_START
#define LANE_ANALYZER_CONTROL_MODEL_START_OFFSET 0U
#define LANE_ANALYZER_CONTROL_MODEL_START_MASK 0x1U


/** STATUS ********************************************************************/
#define LANE_ANALYZER_STATUS_ADDR_OFFSET 0x8U
#define LANE_ANALYZER_STATUS_ADDR \
	(LANE_ANALYZER_ADDR + LANE_ANALYZER_STATUS_ADDR_OFFSET)
#define LANE_ANALYZER_STATUS_PTR \
	__TO_PTR(LANE_ANALYZER_STATUS_ADDR)

struct lane_analyzer_status
{
	union
	{
		struct
		{
			uint32_t busy:1;
			uint32_t test_end:1;
			uint32_t error_counter:8;
			uint32_t lane_capabilities:8;
			uint32_t _reserved:14;
		};
		uint32_t reg_value;
	};
};

#define LANE_ANALYZER_STATUS_GET(NAME, reg) \
	(((reg) & LANE_ANALYZER_STATUS_##NAME##_MASK) >> LANE_ANALYZER_STATUS_##NAME##_OFFSET)

#define LANE_ANALYZER_STATUS_SET(NAME, val, reg) \
	( \
		((reg) & ~(LANE_ANALYZER_STATUS_##NAME##_MASK)) \
		| \
		( \
			((val) & (LANE_ANALYZER_STATUS_##NAME##_MASK)) \
			<< (LANE_ANALYZER_STATUS_##NAME##_OFFSET) \
		) \
	)

#define LANE_ANALYZER_STATUS_SET_IN_PLACE(NAME, val, reg) \
	(reg) = \
		( \
			((reg) & ~(LANE_ANALYZER_STATUS_##NAME##_MASK)) \
			| \
			( \
				((val) & (LANE_ANALYZER_STATUS_##NAME##_MASK)) \
				<< (LANE_ANALYZER_STATUS_##NAME##_OFFSET) \
			) \
		)

#if (__USE_OF_BITFIELDS_UNION_IS_SAFE == 1)
	#define LANE_ANALYZER_STATUS_TO_UINT32_T(s) ((s).reg_value)
	#define LANE_ANALYZER_STATUS_TO_STRUCT(u, s_ptr) ((s_ptr)->reg_value = u)
#else
	#define LANE_ANALYZER_STATUS_TO_UINT32_T(s) \
		( \
			LANE_ANALYZER_STATUS_SET \
			( \
				BUSY, \
				(s).busy, \
				LANE_ANALYZER_STATUS_SET \
				( \
					TEST_END, \
					(s).test_end, \
					LANE_ANALYZER_STATUS_SET \
					( \
						ERROR_COUNTER, \
						(s).error_counter, \
						LANE_ANALYZER_STATUS_SET \
						( \
							LANE_CAPABILITIES, \
							(s).lane_capabilities, \
							0 \
						) \
					) \
				) \
			) \
		)
	#define LANE_ANALYZER_STATUS_TO_STRUCT(u, s_ptr) \
		{ \
			((s_ptr)->busy = LANE_ANALYZER_STATUS_GET(BUSY, u)); \
			((s_ptr)->test_end = LANE_ANALYZER_STATUS_GET(TEST_END, u)); \
			((s_ptr)->error_counter = LANE_ANALYZER_STATUS_GET(ERROR_COUNTER, u)); \
			((s_ptr)->lane_capabilities = LANE_ANALYZER_STATUS_GET(LANE_CAPABILITIES, u)); \
		}
#endif

// Bit 0: BUSY
#define LANE_ANALYZER_STATUS_BUSY_OFFSET 0U
#define LANE_ANALYZER_STATUS_BUSY_MASK 0x1U

// Bit 1: TEST_END
#define LANE_ANALYZER_STATUS_TEST_END_OFFSET 1U
#define LANE_ANALYZER_STATUS_TEST_END_MASK 0x2U

// Bits 2-9: ERROR_COUNTER
#define LANE_ANALYZER_STATUS_ERROR_COUNTER_OFFSET 2U
#define LANE_ANALYZER_STATUS_ERROR_COUNTER_MASK 0x3FCU

// Bits 10-17: LANE_CAPABILITIES
#define LANE_ANALYZER_STATUS_LANE_CAPABILITIES_OFFSET 10U
#define LANE_ANALYZER_STATUS_LANE_CAPABILITIES_MASK 0x3FC00U


/** INITIAL_VALUE *************************************************************/
#define LANE_ANALYZER_INITIAL_VALUE_ADDR_OFFSET 0xCU
#define LANE_ANALYZER_INITIAL_VALUE_ADDR \
	(LANE_ANALYZER_ADDR + LANE_ANALYZER_INITIAL_VALUE_ADDR_OFFSET)
#define LANE_ANALYZER_INITIAL_VALUE_PTR \
	__TO_PTR(LANE_ANALYZER_INITIAL_VALUE_ADDR)

/******************************************************************************/

// Completed with 0 error(s) and 0 warning(s).
