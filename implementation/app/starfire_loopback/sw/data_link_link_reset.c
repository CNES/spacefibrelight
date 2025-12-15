//##########################################################################
//## COMPANY       : CNES
//##########################################################################
//## TITLE         : data_link_link_reset.c
//## PROJECT       : SPACE FIBRE LIGHT
//##########################################################################

// Standard headers
#include <stdint.h>
#include <stddef.h>
// Driver
#include "gpio.h"
#include "models.h"
// Private
#include "config.h"
#include "data_link_link_reset.h"
// Common
#include "common.h"
#include "shared_header.h"

#define __WORDS_TO_BYTES(x) (((4 * (x)) > 255) ? 255 : (4 * (x)))
//##########################################################################
//## Scenario : Link reset FSM
//##########################################################################

/******************************************************************************/
/**** Step 1: Interface RESET  ************************************************/
/******************************************************************************/
#define STEP1_TESTS_COUNT 2
static const struct test_config step1_test[STEP1_TESTS_COUNT] =
	{
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0xBEEFCAFE,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(64)
			}
		),
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0x4562CAFE,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(64)
			}
		)
	};
int data_link_link_reset_step1(int type_lpb)
{
	uint32_t temp1, temp2;
	uint32_t step1_failed =0;
	printf("\r\n ------------------------------------------------------------------------\r\n");
	printf("\r\n ---------- DATA-LINK--------------------- \r\n");
	printf("\r\n ------ Start scenario: Link Reset -------\r\n");
	printf("\r\n --- Step 1: Check Interface Reset ------- \r\n");

	// Disable Injector and Spy read command
	phy_plus_lane_plus_dl();

	// Perform initialization procedure
	if (type_lpb == 0) // External Loopback
	{
		printf("\r\n --External loopback --\r\n");
		if (initialization_sequence() != OK)
		{
			printf("\r\n Initialization sequence failed. \r\n");

			return;
		}
	}
	else if (type_lpb == 1) // Near-End Loopback
	{
		printf("\r\n --Near-End loopback --\r\n");
		if (initialization_sequence_near_end_lpb() != OK)
		{
			printf("\r\n Initialization sequence failed. \r\n");

			return;
		}
	}

  //Send a packet of 64 words to each virtual channel check that the data are received on Data_Link_Data_Analyzer models
	if (run_test(step1_test)!= OK)
	{
		step1_failed = 1;
		printf("\r\n Test 1: Failed \r\n");
	}
	else{
		printf("\r\n Test 1: OK \r\n");
	}

  //	Assert PAUSE_VC for channel 0
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		PAUSE_VC,
		0x1, /* Channel 0 */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

  //Check that Sequences Counters are different than 0
	temp1 = DL_CONFIGURATOR_DL_STATUS_1_GET(SEQ_NUMBER_TX, *DL_CONFIGURATOR_DL_STATUS_1_PTR);
	if (temp1 == 0)
	{
		printf("\r\n Error: SEQ_NUMBER_TX = 0 \r\n");
		step1_failed = 1;
	}
	else{
		printf("\r\n SEQ_NUMBER_TX = x%x \r\n", temp1);
	}

	temp2 = DL_CONFIGURATOR_DL_STATUS_1_GET(SEQ_NUMBER_RX, *DL_CONFIGURATOR_DL_STATUS_1_PTR);

	if (temp2 == 0)
	{
		printf("\r\n Error: SEQ_NUMBER_RX = 0 \r\n");
		step1_failed = 1;
	}
	else{
		printf("\r\n SEQ_NUMBER_RX = x%x \r\n", temp2);
	}

  //Assert and de-assert Interface Reset
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		INTERFACE_RESET,
		0x1, /* Assert Interface_reset*/
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

	wait_us_clk_150mhz(10);

	if (type_lpb == 1) // Near-End Loopback
	{
		//Near-End loopback asserted
		DL_CONFIGURATOR_PHY_PARAMETER_SET_IN_PLACE
		(
			NEAR_END_SERIAL_LOOPBACK,
			0x1, 
			*DL_CONFIGURATOR_PHY_PARAMETER_PTR
		);
	} 

  //Check Lane state is not active
	if (DL_CONFIGURATOR_LANE_STATUS_GET(LANE_STATE, *DL_CONFIGURATOR_LANE_STATUS_PTR) == LANE_STATE_ACTIVE)
	{
		printf("\r\n Error: LANE_STATE is active \r\n");
		step1_failed = 1;
	}

  //Check PAUSE_VC for channel 0 is de-asserted
	if (DL_CONFIGURATOR_DL_PARAMETER_GET(PAUSE_VC, *DL_CONFIGURATOR_DL_PARAMETER_PTR) != 0)
	{
		printf("\r\n Error: PAUSE_VC = x%x is not reset\r\n", temp1);
		step1_failed = 1;
	}

	//Check Link_reset_asserted is at ‘1’
	if (!DL_CONFIGURATOR_DL_PARAMETER_GET(LINK_RESET_ASSERTED, *DL_CONFIGURATOR_DL_PARAMETER_PTR))
	{
		printf("\r\n Error: LINK_RESET_ASSERTED = x0 not asserted\r\n");
		step1_failed = 1;
	}

	//Clear Link_reset_asserted (not required)
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		LINK_RESET_ASSERTED,
		0x0, /* Clear */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

  //Enable LaneStart
	DL_CONFIGURATOR_LANE_PARAMETER_SET_IN_PLACE(LANESTART, 1, *DL_CONFIGURATOR_LANE_PARAMETER_PTR);
	
  //Wait that LaneState is “Active” (minimum 2 us)
	wait_active();

  //Send a data packet of 64 words to each virtual channel check that the data are received on Data_Link_Data_Analyzer model
	if((run_test(step1_test+1) != OK) || (step1_failed == 1))
	{
		printf("\r\n RESULT : Step 1 FAILED \r\n");
		printf("\r\n ------------------------------------------------------------------------\r\n");
		return 1;
	}
	else
	{
		printf("\r\n RESULT : Step 1 PASS \r\n");
		printf("\r\n ------------------------------------------------------------------------\r\n");
		return 0;
	}
	
}

/******************************************************************************/
/**** Step 2: Link RESET  *****************************************************/
/******************************************************************************/
#define STEP2_TESTS_COUNT 2
static const struct test_config step2_test[STEP2_TESTS_COUNT] =
	{
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0xBEEF5622,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(64)
			}
		),
		BASIC_CONFIG
		(
			NO_BROADCAST_CHANS,
			0xBEEF1111,
			{
				.packet_number = 1,
				.packet_size = __WORDS_TO_BYTES(64)
			}
		)
	};

int data_link_link_reset_step2(int type_lpb)
{
	uint32_t temp1, temp2;
	uint32_t step2_failed =0;
	printf("\r\n ------------------------------------------------------------------------\r\n");
	printf("\r\n ---------- DATA-LINK--------------------- \r\n");
	printf("\r\n ------ Start scenario: Link Reset -------\r\n");
	printf("\r\n --- Step 2: Check link reset  ----------- \r\n");
	// Disable Injector and Spy read command
	phy_plus_lane_plus_dl();

	// Perform initialization procedure
	if (type_lpb == 0) // External Loopback
	{
		printf("\r\n --External loopback --\r\n");
		if (initialization_sequence() != OK)
		{
			printf("\r\n Initialization sequence failed. \r\n");

			return;
		}
	}
	else if (type_lpb == 1) // Near-End Loopback
	{
		printf("\r\n --Near-End loopback --\r\n");
		if (initialization_sequence_near_end_lpb() != OK)
		{
			printf("\r\n Initialization sequence failed. \r\n");

			return;
		}
	}
	// Send a data packet of 64 words to each virtual channel check that the data are received on Data_Link_Data_Analyzer models
	if (run_test(step2_test) != OK)
	{
		printf("\r\n Test 1:  Failed \r\n");
		step2_failed = 1;
	}
	else{
		printf("\r\n Test 1: OK \r\n");
	}

  //	Assert PAUSE_VC for channel 0
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		PAUSE_VC,
		0x1, /* Channel 0 */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

  //Check that Sequences Counters are different than 0
	temp1 = DL_CONFIGURATOR_DL_STATUS_1_GET(SEQ_NUMBER_TX,*DL_CONFIGURATOR_DL_STATUS_1_PTR);
	if (temp1 == 0)
	{
		printf("\r\n Error: SEQ_NUMBER_TX = 0 \r\n");
		step2_failed = 1;
	}
	else{
		printf("\r\n SEQ_NUMBER_TX = x%x \r\n", temp1);
	}

	temp2 = DL_CONFIGURATOR_DL_STATUS_1_GET(SEQ_NUMBER_RX,*DL_CONFIGURATOR_DL_STATUS_1_PTR);
	if (temp2 == 0)
	{
		printf("\r\n Error: SEQ_NUMBER_RX = 0 \r\n");
		step2_failed = 1;
	}
	else{
		printf("\r\n SEQ_NUMBER_RX = x%x \r\n", temp2);
	}

  //Assert and de-assert Link Reset
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		LINK_RESET,
		0x1, /* Assert Link_reset*/
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);


	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		LINK_RESET,
		0x0,/* De-assert Link_reset*/
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

  //Check Lane state is not active
	if (DL_CONFIGURATOR_LANE_STATUS_GET(LANE_STATE, *DL_CONFIGURATOR_LANE_STATUS_PTR) == LANE_STATE_ACTIVE)
	{
		printf("\r\n Error: LANE_STATE is active \r\n");
		step2_failed = 1;
	}

  wait_us_clk_150mhz(2);

  //Check PAUSE_VC for channel 0 is still asserted
	temp1= DL_CONFIGURATOR_DL_PARAMETER_GET(PAUSE_VC, *DL_CONFIGURATOR_DL_PARAMETER_PTR);
	if (temp1 != 1)
	{
		printf("\r\n Error: PAUSE_VC = x%x is reset\r\n", temp1);
		step2_failed = 1;
	}
	
  //	De-assert PAUSE_VC for channel 0
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		PAUSE_VC,
		0x0, /* Channel 0 */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

  //Check Link_reset_asserted is at ‘1’
	temp1 = DL_CONFIGURATOR_DL_PARAMETER_GET(LINK_RESET_ASSERTED, *DL_CONFIGURATOR_DL_PARAMETER_PTR);
	if (temp1 != 1)
	{
		printf("\r\n Error: LINK_RESET_ASSERTED = x%x not asserted\r\n", temp1);
		step2_failed = 1;
	}
  //Clear Link_reset_asserted
	DL_CONFIGURATOR_DL_PARAMETER_SET_IN_PLACE
	(
		LINK_RESET_ASSERTED,
		0x0, /* Clear */
		*DL_CONFIGURATOR_DL_PARAMETER_PTR
	);

  //Wait that LaneState is “Active” (minimum 2 us)
	wait_active();

  //Send a data packet of 64 words to each virtual channel check that the data are received on Data_Link_Data_Analyzer models
	if((run_test(step2_test+1) != OK) || (step2_failed == 1))
	{
		printf("\r\n RESULT : Step 2 FAILED \r\n");
		printf("\r\n ------------------------------------------------------------------------\r\n");
		return 1;
	}
	else
	{
		printf("\r\n RESULT : Step 2 PASS \r\n");
		printf("\r\n ------------------------------------------------------------------------\r\n");
		return 0;
	}
}

/******************************************************************************/
/**** Function with all steps**************************************************/
/******************************************************************************/
void data_link__link_reset_all_step (int type_lpb)
{
	int step1, step2;
  step1 = data_link_link_reset_step1(type_lpb);
  step2 = data_link_link_reset_step2(type_lpb);
	if( (step1 != 0) || (step2 != 0)){
		printf("\r\n RESULT : ALL STEPS FAILED \r\n");
		printf("\r\n ------------------------------------------------------------------------\r\n");
	}
	else{
		printf("\r\n RESULT : ALL STEPS PASS \r\n");
		printf("\r\n ------------------------------------------------------------------------\r\n");
	}
}
