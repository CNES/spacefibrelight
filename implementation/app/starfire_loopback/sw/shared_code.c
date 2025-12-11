// Standard headers
#include <stddef.h>
// Driver
#include "gpio.h"
#include "models.h"
// Private
#include "config.h"
#include "lane_loopback.h"
// Common
#include "common.h"
#include "shared_header.h"

#define DEFAULT_TIMEOUT 2000000U

static enum action_result initialize (void)
{
	printf("\r\n Sets the DUT Lane initialisation FSM to Started state.\r\n");

	reset_the_dut();
	lane_reset_conf();

	DL_CONFIGURATOR_LANE_PARAMETER_SET_IN_PLACE(LANESTART, 1, *DL_CONFIGURATOR_LANE_PARAMETER_PTR);

	return
		wait_for_state
		(
			DL_CONFIGURATOR_LANE_STATUS_PTR,
			LANE_STATE_STARTED,
			DEFAULT_TIMEOUT
		);
}

static enum action_result initialize_near_end_lpb (void)
{
	uint32_t temp2;
	printf("\r\n Sets the DUT Lane initialisation FSM to Started state.\r\n");

	reset_the_dut();
  
	//Near-End loopback asserted
	DL_CONFIGURATOR_PHY_PARAMETER_SET_IN_PLACE
	(
		NEAR_END_SERIAL_LOOPBACK,
		0x1, 
		*DL_CONFIGURATOR_PHY_PARAMETER_PTR
	);

	lane_reset_conf();

	DL_CONFIGURATOR_LANE_PARAMETER_SET_IN_PLACE(LANESTART, 1, *DL_CONFIGURATOR_LANE_PARAMETER_PTR);

	return
		wait_for_state
		(
			DL_CONFIGURATOR_LANE_STATUS_PTR,
			LANE_STATE_STARTED,
			DEFAULT_TIMEOUT
		);
}

static enum action_result initialize_parallel_lpb (void)
{
	uint32_t temp2;
	printf("\r\n Sets the DUT Lane initialisation FSM to Started state.\r\n");

	reset_the_dut();
  
	//Parallel loopback asserted
	DL_CONFIGURATOR_LANE_PARAMETER_SET_IN_PLACE
	(
		PARALLEL_LOOPBACK_ENABLES,
		0x1, 
		*DL_CONFIGURATOR_LANE_PARAMETER_PTR
	);

	lane_reset_conf();

	DL_CONFIGURATOR_LANE_PARAMETER_SET_IN_PLACE(LANESTART, 1, *DL_CONFIGURATOR_LANE_PARAMETER_PTR);

	return
		wait_for_state
		(
			DL_CONFIGURATOR_LANE_STATUS_PTR,
			LANE_STATE_STARTED,
			DEFAULT_TIMEOUT
		);
}
// _ prefix to avoid name collision
static enum action_result _wait_for_started_to_active (void)
{
	// The order matters.
	const enum lane_state valid_states[3] =
		{LANE_STATE_ACTIVE, LANE_STATE_CONNECTED, LANE_STATE_CONNECTING};

	wait(1023);
	
	// The set of allowed states shrinks at each iteration.
	for (int i = 3; i >= 1; i--)
	{
		if
		(
			wait_for_states
			(
				DL_CONFIGURATOR_LANE_STATUS_PTR,
				i,
				valid_states,
				DEFAULT_TIMEOUT
			)
			!= OK
		)
		{
			return TIMEOUT;
		}
	}

	return OK;
}

static enum action_result wait_test_end
(
	const struct test_config test [const static 1]
)
{
	unsigned int timer = 0;
	for (;;)
	{
		timer++;
		bool completed = true;

		if (timer >= 40000)
		{
			printf("\r\n wait_end_test timeout\r\n");

			for (uint32_t i = 0; i < CHANNEL_COUNT; ++i)
			{
				if (!(test->enable_mask & (1 << i)))
				{
					continue;
				}

				if (!DL_GENERATOR_STATUS_GET(TEST_END, *DL_GENERATOR_X_STATUS_PTR(i)))
				{
					printf("\r\n Generator channel x%x not ended\r\n", i);
				}

				if (!DL_ANALYZER_STATUS_GET(TEST_END, *DL_ANALYZER_X_STATUS_PTR(i)))
				{
					printf("\r\n Analyzer channel x%x not ended\r\n", i);
				}
			}

			return TIMEOUT;
		}

		for (uint32_t i = 0; i < CHANNEL_COUNT; ++i)
		{
			if (!(test->enable_mask & (1 << i)))
			{
				continue;
			}

			if
			(
				!DL_GENERATOR_STATUS_GET(TEST_END, *DL_GENERATOR_X_STATUS_PTR(i))
				|| !DL_ANALYZER_STATUS_GET(TEST_END, *DL_ANALYZER_X_STATUS_PTR(i))
			)
			{
				completed = false;

				break;
			}
		}

		if (completed)
		{
			return OK;
		}
	}
}

void initiate_test (const struct test_config test [const static 1])
{
	uint32_t temp;
	for (uint32_t i = 0; i < CHANNEL_COUNT; ++i)
	{
		if (test->enable_mask & (1 << i))
		{
			*DL_ANALYZER_X_CONFIGURATION_PTR(i) =
				DL_ANALYZER_CONFIGURATION_TO_UINT32_T(test->ana_conf[i]);
			
			*DL_GENERATOR_X_CONFIGURATION_PTR(i) =
				DL_GENERATOR_CONFIGURATION_TO_UINT32_T(test->gen_conf[i]);

			*DL_ANALYZER_X_INITIAL_VALUE_PTR(i) = test->ana_init[i];

			*DL_GENERATOR_X_INITIAL_VALUE_PTR(i) = test->gen_init[i];
		}
	}
	for (uint32_t i = 0; i < CHANNEL_COUNT; ++i)
	{
		if (test->enable_mask & (1 << i))
		{
			DL_ANALYZER_CONTROL_SET_IN_PLACE(MODEL_START, 1, *DL_ANALYZER_X_CONTROL_PTR(i));
			DL_GENERATOR_CONTROL_SET_IN_PLACE(MODEL_START, 1, *DL_GENERATOR_X_CONTROL_PTR(i));
		}
	}
}

enum action_result finalize_test
(
	const struct test_config test [const static 1]
)
{
	uint32_t error_counter = 0;
	if (wait_test_end(test) == OK)
	{
		const bool expect_errors = test->expect_errors;

		for (uint32_t i = 0; i < CHANNEL_COUNT; ++i)
		{
			if (!(test->enable_mask & (1 << i)))
			{
				continue;
			}

			uint32_t local_errors_count =
				DL_ANALYZER_STATUS_GET(ERROR_COUNTER, *DL_ANALYZER_X_STATUS_PTR(i));

			if
			(
				((local_errors_count > 0) && !expect_errors)
				|| ((local_errors_count == 0) && expect_errors)
			)
			{
				printf
				(
					"\r\n Issue: test completed with x%x errors out on channel x%x (%s).\r\n",
					local_errors_count,
					i,
					(expect_errors ? "errors expected" : "no errors expected")
				);
			}

			error_counter += local_errors_count;
		}
		if
		(
			((error_counter == 0) && !expect_errors)
			|| ((error_counter > 0) && expect_errors)
		)
		{
			return OK;
		}
	}

	return TIMEOUT;
}

enum action_result run_test (const struct test_config test [const static 1])
{
	initiate_test(test);

	return finalize_test(test);
}

enum action_result run_test_gen_only (const struct test_config test [const static 1])
{
	initiate_test_gen_only(test);

	return finalize_test(test);
}

void initiate_test_gen_only (const struct test_config test [const static 1])
{
	uint32_t temp;
	for (uint32_t i = 0; i < CHANNEL_COUNT; ++i)
	{
		if (test->enable_mask & (1 << i))
		{

			*DL_GENERATOR_X_CONFIGURATION_PTR(i) =
				DL_GENERATOR_CONFIGURATION_TO_UINT32_T(test->gen_conf[i]);
		
			temp=DL_GENERATOR_CONFIGURATION_TO_UINT32_T(test->gen_conf[i]);
			printf("\r\n  run DL_GENERATOR_CONFIGURATION_TO_UINT32_T %x \r\n", temp);

			*DL_GENERATOR_X_INITIAL_VALUE_PTR(i) = test->gen_init[i];
		}
	}
	for (uint32_t i = 0; i < CHANNEL_COUNT; ++i)
	{
		if (test->enable_mask & (1 << i))
		{
			DL_GENERATOR_CONTROL_SET_IN_PLACE(MODEL_START, 1, *DL_GENERATOR_X_CONTROL_PTR(i));
		}
	}
}


enum action_result initialization_sequence (void)
{
	if
	(
		(initialize() != OK)
		|| (_wait_for_started_to_active() != OK)
	)
	{
		return TIMEOUT;
	}

	return OK;
}

enum action_result initialization_sequence_near_end_lpb(void)
{
	if
	(
		(initialize_near_end_lpb() != OK)
		|| (_wait_for_started_to_active() != OK)
	)
	{
		return TIMEOUT;
	}

	return OK;
}


enum action_result initialization_sequence_parallel_lpb(void)
{
	if
	(
		(initialize_parallel_lpb() != OK)
		|| (_wait_for_started_to_active() != OK)
	)
	{
		return TIMEOUT;
	}

	return OK;
}

enum action_result wait_active (void)
{
	if
	(
		(_wait_for_started_to_active() != OK)
	)
	{
		return TIMEOUT;
	}

	return OK;
}

enum action_result run_tests
(
	const unsigned int test_count,
	const struct test_config test [const static test_count]
)
{
	unsigned int successes = 0;
	for (unsigned int i = 0; i < test_count; ++i)
	{
		switch (run_test(test + i))
		{
			case OK:
				printf("\r\n  success Test %x.\r\n", i);
				successes++;
				break;

			case TIMEOUT:
				printf("\r\nTest x%x timed out.\r\n", i);
				break;

			case FAILURE:
				printf("\r\nTest x%x failed.\r\n", i);
				break;
		}
	}

	printf
	(
		"\r\nTest suite: x%x out of x%x tests succeeded.\r\n",
		successes,
		test_count
	);

	return OK;
}

enum action_result init_and_run_tests
(
	const unsigned int test_count,
	const struct test_config test [const static test_count],
	int type_lpb
)
{
	if (type_lpb == 0) // External Loopback
	{
		printf("\r\n --External loopback --\r\n");
		if (initialization_sequence() != OK)
		{
			printf("\r\n Initialization sequence failed. \r\n");

			return TIMEOUT;
		}
	}
	else if (type_lpb == 1) // Near-End Loopback
	{
		printf("\r\n --Near-End loopback --\r\n");
		if (initialization_sequence_near_end_lpb() != OK)
		{
			printf("\r\n Initialization sequence failed. \r\n");

			return TIMEOUT;
		}
	}

	return run_tests(test_count, test);
}
