// Standard headers
#include <stdint.h>
// Driver
#include "gpio.h"
#include "models.h"
// Private
#include "config.h"
#include "lane_loopback.h"
#include "data_link_loopback.h"
#include "data_link_link_reset.h"
#include "shared_header.h"
// Common
#include "common.h"

uint32_t exit_code;
#include "xil_printf.h"
#include "xil_io.h"
#include <xparameters.h>

/****** Hardware setup ******/


#define USE_ALT_SCENARIO


/////////////////////////////////////////////////////////////////////////////////
// define MIB test registers for configuration
#define GLOBAL_REG           XPAR_DATALINK_CONFIGURATOR_DATA_LINK_CONFIGURAT_0_BASEADDR
#define PHY_PARAM_REG        GLOBAL_REG+0x4
#define LANE_PARAM_REG       GLOBAL_REG+0x8
#define LANE_STATUS_REG      GLOBAL_REG+0xc
#define DATALINK_PARAM_REG   GLOBAL_REG+0x10
#define DATALINK_STAT1_REG   GLOBAL_REG+0x14
#define DATALINK_STAT2_REG   GLOBAL_REG+0x18
#define DATALINK_QOS1_REG    GLOBAL_REG+0x1c
#define DATALINK_QOS2_REG    GLOBAL_REG+0x20
#define DATALINK_ERR_MGT_REG GLOBAL_REG+0x24


//bit position for GLOBAL_REG
#define RST_DUT_N            0x1
#define LANE_SPY_EN_POS      0x2
#define DATALINK_DISABLE_POS 0x4

//bit value for PHY_PARAM_REG
#define NO_LOOPBACK_VAL 0

//bit position LANE_PARAM_REG
#define LANESTART_POS          0x1
#define AUTOSTART_POS          0x2
#define LANE_RESET_POS         0x4
#define PARALLEL_LOOPBACK_POS  0x8
//FIXME add standbyreason and lanestartpulse

//LANE_STATUS_REG
//TODO

//bit position DATALINK_PARAM_REG
#define DATALINK_POR_POS         0x1
#define LINK_RESET_POS           0x2
#define LINK_RESET_ASSERTED_POS  0x4
#define NACK_RST_EN_POS          0x8
#define NACK_RST_MODE_POS        0x10
//#define PAUSE_ALLVC_VAL         bit 5-13
//#define CONTINUOUS_VC_VAL       bit 14-21
#define RESET_ERROR_FLAG_POS     0x400000




int main(void) 
{	int val;

	printf("INIT IP --\r\n");

	printf("disable global IP reset --\r\n");
	Xil_Out32(GLOBAL_REG,RST_DUT_N);


	printf("reset LINK --\r\n");
	Xil_Out32(DATALINK_PARAM_REG,DATALINK_POR_POS);
	printf("release reset LINK --\r\n");
	Xil_Out32(DATALINK_PARAM_REG,0);

	printf("disable automatic reset on nack --\r\n");
	val=Xil_In32(DATALINK_PARAM_REG);
	Xil_Out32(DATALINK_PARAM_REG,val&~NACK_RST_EN_POS);

	printf("reset LANE --\r\n");
	Xil_Out32(LANE_PARAM_REG,LANE_RESET_POS);

	printf("release reset LANE --\r\n");
	Xil_Out32(LANE_PARAM_REG,0);


while(1){
	printf("start LANE --\r\n");
	Xil_Out32(LANE_PARAM_REG,LANESTART_POS);

	printf("stop LANE --\r\n");
	Xil_Out32(LANE_PARAM_REG,0);

	printf("reset LANE --\r\n");
	Xil_Out32(LANE_PARAM_REG,LANE_RESET_POS);

	printf("release reset LANE --\r\n");
	Xil_Out32(LANE_PARAM_REG,0);
}


	
	printf("\r\nSEQ_SFB: -- Start --\r\n");
  printf("\r\n Choose your program: \r\n");
	printf("\r\n   - 0 = [PHY + LANE] LOOPBACK scenario ALL steps\r\n");
	printf("\r\n   - 1 = [PHY + LANE] LOOPBACK scenario step 1 (Parallel Loopback) only\r\n");
	printf("\r\n   - 2 = [PHY + LANE] LOOPBACK scenario step 2 (Near-End Loopback) only \r\n");
	printf("\r\n   - 3 = [PHY + LANE] LOOPBACK scenario step 3 (External Loopback) only \r\n");
	printf("\r\n   - 4 = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) ALL steps\r\n");
	printf("\r\n   - 5 = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) Step 1 only \r\n");
	printf("\r\n   - 6 = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) Step 2 only \r\n");
	printf("\r\n   - 7 = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) Step 3 only \r\n");
	printf("\r\n   - 8 = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) Step 4 only \r\n");
	printf("\r\n   - 9 = [PHY + LANE + DATA-LINK]: LINK RESET scenario (External Loopback) ALL steps\r\n");
	printf("\r\n   - A = [PHY + LANE + DATA-LINK]: LINK RESET scenario (External Loopback) Step 1 only \r\n");
	printf("\r\n   - B = [PHY + LANE + DATA-LINK]: LINK RESET scenario (External Loopback) Step 2 only \r\n");
	printf("\r\n   - C = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) ALL steps\r\n");
	printf("\r\n   - D = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) Step 1 only \r\n");
	printf("\r\n   - E = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) Step 2 only \r\n");
	printf("\r\n   - F = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) Step 3 only \r\n");
	printf("\r\n   - G = [PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) Step 4 only \r\n");
	printf("\r\n   - H = [PHY + LANE + DATA-LINK]: LINK RESET scenario (Near-End Loopback) ALL steps\r\n");
	printf("\r\n   - I = [PHY + LANE + DATA-LINK]: LINK RESET scenario (Near-End Loopback) Step 1 only \r\n");
	printf("\r\n   - J = [PHY + LANE + DATA-LINK]: LINK RESET scenario (Near-End Loopback) Step 2 only \r\n");
	while(1) {
		char temp = inbyte();
		if (temp == '0'){ //[PHY + LANE] LOOPBACK scenario ALL steps
			lane_loopback_all_step();
		}
		if (temp == '1'){ //[PHY + LANE] LOOPBACK scenario step 1 (Parallel Loopback) only
			lane_loopback_step1();
		}
		if (temp == '2'){ //[PHY + LANE] LOOPBACK scenario step 2 (Near-End Loopback) only
			lane_loopback_step2();
		}
		if (temp == '3'){ //[PHY + LANE] LOOPBACK scenario step 3 (External Loopback) only 
			lane_loopback_step3();
		}
		if (temp == '4'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) ALL steps
			data_link_lpb_all_step(0);
		}
		if (temp == '5'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) Step 1 only 
			data_link_lpb_step1(0);
		}
		if (temp == '6'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) Step 2 only 
			data_link_lpb_step2(0);
		}
		if (temp == '7'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) Step 3 only 
			data_link_lpb_step3(0);
		}
		if (temp == '8'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (External Loopback) Step 4 only 
			data_link_lpb_step4(0);
		}
		if (temp == '9'){ //[PHY + LANE + DATA-LINK]: LINK RESET scenario (External Loopback) ALL steps
			data_link__link_reset_all_step(0);
		}
		if (temp == 'A'){ //[PHY + LANE + DATA-LINK]: LINK RESET scenario (External Loopback) Step 1 only
			data_link_link_reset_step1(0);
		}
		if (temp == 'B'){ //[PHY + LANE + DATA-LINK]: LINK RESET scenario (External Loopback) Step 2 only
			data_link_link_reset_step2(0);
		}
		if (temp == 'C'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) ALL steps
			data_link_lpb_all_step(1);
		}
		if (temp == 'D'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) Step 1 only 
			data_link_lpb_step1(1);
		}
		if (temp == 'E'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) Step 2 only
			data_link_lpb_step2(1);
		}
		if (temp == 'F'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) Step 3 only
			data_link_lpb_step3(1);
		}
		if (temp == 'G'){ //[PHY + LANE + DATA-LINK]: LOOPBACK scenario (Near-End Loopback) Step 4 only
			data_link_lpb_step4(1);
		}
		if (temp == 'H'){ //[PHY + LANE + DATA-LINK]: LINK RESET scenario (Near-End Loopback) ALL steps
			data_link__link_reset_all_step(1);
		}
		if (temp == 'I'){ //[PHY + LANE + DATA-LINK]: LINK RESET scenario (Near-End Loopback) Step 1 only
			data_link_link_reset_step1(1);
		}
		if (temp == 'J'){ //[PHY + LANE + DATA-LINK]: LINK RESET scenario (Near-End Loopback) Step 2 only
			data_link_link_reset_step2(1);
		}
		
	}

	return 0;
}
