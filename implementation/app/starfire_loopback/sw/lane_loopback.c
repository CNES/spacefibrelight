//##########################################################################
//## COMPANY       : CNES
//##########################################################################
//## TITLE         : lane_loopback.c
//## PROJECT       : SPACE FIBRE LIGHT
//##########################################################################
//## AUTHOR        : Elsys-Design (Yvan DAURIAC)
//## CREATED       : 05/12/2024
//##########################################################################
//## DESCRIPTION   : Runs tests for verification of the SpaceFibre_Light IP
//##                 loopback for the layer PHY and LANE
//##########################################################################
//## History       :	V1.0: Creation of the file
//##########################################################################

// Standard headers
#include <stdint.h>
// Driver
#include "gpio.h"
#include "models.h"
// Private
#include "config.h"
#include "lane_loopback.h"
// Common
#include "common.h"
#include "shared_header.h"
//define constant

#define CLEARLINE         0b0000
#define DISABLED          0b0001
#define WAIT              0b0010
#define STARTED           0b0011
#define INVERTRXPOLARITY  0b0100
#define CONNECTING        0b0101
#define CONNECTED         0b0110
#define ACTIVE            0b0111
#define PREPARESTANDBY    0b1000
#define LOSSOFSIGNAL      0b1001

int test_failed=0;

void wait_for_started_to_active(void){

    wait(1023);//await Timer(32*1023*SpaceFibre_serial_port_period_ps_int, units = "ps")
    
    uint32_t temp,cpt_timeout =0;
    temp = DL_CONFIGURATOR_LANE_STATUS_GET(LANE_STATE, *DL_CONFIGURATOR_LANE_STATUS_PTR);
    //Check that Lane initialisatiion FSM is in Connecting State
    while  ((((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) !=  CONNECTING) && (((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) != CONNECTED) && (((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) != ACTIVE)){
      temp = DL_CONFIGURATOR_LANE_STATUS_GET(LANE_STATE, *DL_CONFIGURATOR_LANE_STATUS_PTR);
      if (cpt_timeout == 5000){
       printf("\r\n FSM CONNECTING NOT REACHED: TIMEOUT ss %x \r\n", temp);
       printf("\r\n HARD RESET REQUESTED\r\n", temp);
       while (1){
        
       }
      }
      wait(1);
      cpt_timeout ++;
    }     

    temp = DL_CONFIGURATOR_LANE_STATUS_GET(LANE_STATE, *DL_CONFIGURATOR_LANE_STATUS_PTR);
    //Check that Lane initialisatiion FSM is in Connected State
    while  ((((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) != CONNECTED) && (((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) != ACTIVE)){
      temp = DL_CONFIGURATOR_LANE_STATUS_GET(LANE_STATE, *DL_CONFIGURATOR_LANE_STATUS_PTR);
      if (cpt_timeout == 5000){
       printf("\r\n FSM CONNECTED NOT REACHED: TIMEOUT\r\n", temp);
       printf("\r\n HARD RESET REQUESTED\r\n", temp);
       while (1){
        
       }
      }
      cpt_timeout ++;
    }   

    //Check that Lane initialisatiion FSM is in Active State
    while  (((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) != ACTIVE){
      temp = DL_CONFIGURATOR_LANE_STATUS_GET(LANE_STATE, *DL_CONFIGURATOR_LANE_STATUS_PTR);
      if (cpt_timeout == 5000){
       printf("\r\n FSM ACTIVE NOT REACHED: TIMEOUT\r\n", temp);
       printf("\r\n HARD RESET REQUESTED\r\n", temp);
       while (1){
        
       }
      }
      cpt_timeout ++;
    }   
}

uint32_t wait_end_test(void){
    uint32_t test_end_gen = mod_read(MODEL_GENERATOR_ADDR, MOD_GEN_STATUS_REG_OFFSET, TEST_END_MASK, TEST_END_SHIFT);
    uint32_t test_end_ana = mod_read(MODEL_ANALYZER_ADDR, MOD_ANA_STATUS_REG_OFFSET, TEST_END_MASK, TEST_END_SHIFT);
    int timer = 0;
    while ((test_end_gen == 0) || (test_end_ana == 0)){
        test_end_gen = mod_read(MODEL_GENERATOR_ADDR, MOD_GEN_STATUS_REG_OFFSET, TEST_END_MASK, TEST_END_SHIFT);
        test_end_ana = mod_read(MODEL_ANALYZER_ADDR, MOD_ANA_STATUS_REG_OFFSET, TEST_END_MASK, TEST_END_SHIFT);
        timer = timer + 1;
        if (timer >= 20000){
           printf("\r\n timeout\r\n");
           if (test_end_gen == 0) {
              printf("\r\n Generator not ended\r\n");
              return (uint32_t) 200;
           }
           else if(test_end_ana == 0){
              printf("\r\n Analyzer not ended\r\n");
              return (uint32_t) 200;
           }
        }
    }
    uint32_t result = mod_read(MODEL_ANALYZER_ADDR, MOD_ANA_STATUS_REG_OFFSET, ERROR_COUNTER_MASK, ERROR_COUNTER_SHIFT);
    if (result != 0){
        printf("\r\n nb error %x\r\n",result );
    }
    return result;
    
}

void started_to_active(void){ 
    printf("\r\nSets the DUT Lane initialisation FSM to Active state from Started, checking each of state it goes through.\r\n");

    //Check that Lane initialisatiion FSM is in Connecting State
    uint32_t temp = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_STATUS_LANE_REG_OFFSET);
    if (((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) != CONNECTING){
      test_failed = 1;
    }     


    temp = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_STATUS_LANE_REG_OFFSET);
    //Check that Lane initialisatiion FSM is in Connected State
    if (((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) != CONNECTED){
      test_failed = 1;
    }      


    //Check that Lane initialisatiion FSM is in Active State
    temp = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_STATUS_LANE_REG_OFFSET);
    if (((temp & LANE_STATE_MASK)>>LANE_STATE_SHIFT) != ACTIVE){
      test_failed = 1;
    }    
    printf("\r\nSets the DUT Lane initialisation FSM to Active state from Started, checking each of state it goes through.\r\n");
}



int lane_loopback_step1(void){
    uint32_t data_lane_gen_config, data_lane_ana_config,  data_lane_gen_seed, data_lane_ana_seed, data_lane_ana_control, data_lane_gen_control, error_cnt, temp;
	printf("\r\n Start scenraio loopback\r\n");
    printf("\r\n Step 1: Parallel loopback START \r\n");
	
    ///////////////////////////////////////////////
	//Step 1: Check lane layer parallel loopback //
    ///////////////////////////////////////////////       
	int step_1_failed = 0;
    phy_plus_lane_olny();

    ///With loopback during init
    initialization_sequence_parallel_lpb();
    //Incremental data generation

    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x84,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);


    //Configure Lane_Analizer
    data_lane_ana_config = bytearray(0x84,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x34);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);
    
    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);
    
    data_lane_gen_control = bytearray(0x01,0x00,0X00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);

    wait_us_clk_150mhz(60);

    //Pull until Test End
    error_cnt = wait_end_test();

    if ((error_cnt != 0)){
        step_1_failed = 1; 
        printf("\r\nstep 1.1 result: FAILED\r\n");
        printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        printf("\r\nstep 1.1 result: PASS\r\n");
    }

    ////PRBS data generation 
    // seed 0x00000000
   
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analizer
    data_lane_ana_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0xFF,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0xFF,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_1_failed = 1; 
        printf("\r\nstep 1.2 result: FAILED\r\n");
        printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        printf("\r\nstep 1.2 result: PASS\r\n");
    }

     // seed 0x00000001
   //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analizer
    data_lane_ana_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);                                                    
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_1_failed = 1; 
        printf("\r\nstep 1.3 result: FAILED\r\n");
        printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        printf("\r\nstep 1.3 result: PASS\r\n");
    }

    // seed 0x02000000
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x82,0x20,0x00,0x01);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analizer
    data_lane_ana_config = bytearray(0x82,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x02);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x02);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_1_failed = 1; 
        printf("\r\nstep 1.4 result: FAILED\r\n");
        printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        printf("\r\nstep 1.4 result: PASS\r\n");
    }

    // seed 0x03000000 
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0xA1,0x08,0x00,0x01);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analizer
    data_lane_ana_config = bytearray(0xA1,0x08,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x03);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x03);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();


    if (error_cnt != 0){
        step_1_failed = 1; 
        printf("\r\nstep 1.5 result: FAILED\r\n");
        printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        printf("\r\nstep 1.5 result: PASS\r\n");
    }
    printf("\r\n Step 1: Parallel loopback END \r\n");

    // Disable parallel loopback
    mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_PARAM_LANE_REG_OFFSET, PARALLEL_LOOPBACK_MASK, 0 << PARALLEL_LOOPBACK_SHIFT);

    //print results of test
    printf("\r\n TEST RESULTS Scenario Loopback:");
    if (step_1_failed == 0){
        printf("\r\n Step 1 parallel loopback result: PASS\r\n");
        printf("\r\n ------------------------------------------------------------------------\r\n");
        return 0;
    }
    else{
        printf("\r\n Step 1 parallel loopback result: FAILED\r\n");
        printf("\r\n ------------------------------------------------------------------------\r\n");
        return 1;
    }
}

int lane_loopback_step2(void){
    uint32_t data_lane_gen_config, data_lane_ana_config,  data_lane_gen_seed, data_lane_ana_seed, data_lane_ana_control, data_lane_gen_control, error_cnt, temp;
	printf("\r\n Start scenraio loopback\r\n");	

    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    /////        Step 2: Check phy layer near-end serial loopback        /////
    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    printf("\r\n Step 2: Near-End Loopback START \r\n");
    uint32_t step_2_failed = 0;
    phy_plus_lane_olny();

    //###########################
    //#With loopback during init
    //###########################
    initialization_sequence_near_end_lpb();

	uint32_t  temp2 = *DL_CONFIGURATOR_LANE_PARAMETER_PTR;
	printf("\r\n DL_CONFIGURATOR_LANE_PARAMETER_PTR : %x \n", temp2);
    //Incremental data generation

    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x84,0x20,0x00,0x00);// 4 frames, 104 bytes, incremental
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0x84,0x20,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_2_failed = 1; 
        printf("\r\nstep 2.1 result: FAILED\r\n");
        printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        printf("\r\nstep 2.1 result: PASS\r\n");
    }

    //PRBS data generation

    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x9F,0x20,0x00,0x01);// 31 frames, 104 bytes, prbs
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_2_failed = 1; 
        printf("\r\nstep 2.2 result: FAILED\r\n");
        printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        printf("\r\nstep 2.2 result: PASS\r\n");
    }

    //// seed 0x00000001
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x9F,0x20,0x00,0x01);// 31 frames, 104 bytes, prbs
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_2_failed = 1; 
        printf("\r\nstep 2.3 result: FAILED\r\n");
        printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        printf("\r\nstep 2.3 result: PASS\r\n");
    }

    //// seed 0x02000000
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x82,0x20,0x00,0x01);// 2 frames, 104 bytes, prbs
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0x82,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x02);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x02);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_2_failed = 1; 
        printf("\r\nstep 2.4 result: FAILED\r\n");
        printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        printf("\r\nstep 2.4 result: PASS\r\n");
    }

    //// seed 0x03000000
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0xA1,0x08,0x00,0x01);// 1 frames, 69 bytes, prbs
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0xA1,0x08,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x03);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x03);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_2_failed = 1; 
        printf("\r\nstep 2.5 result: FAILED\r\n");
        printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        printf("\r\nstep 2.5 result: PASS\r\n");
    }
    printf("\r\n Step 2 END \r\n");
    mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_PARAM_PHY_REG_OFFSET, NEAR_END_LOOPBACK_MASK, 0 << NEAR_END_LOOPBACK_SHIFT);
    //print results of test
    printf("\r\n TEST RESULTS Scenario Loopback:");
    if (step_2_failed == 0){
        printf("\r\n Step 2 near-end loopback result: PASS\r\n");
        printf("\r\n ------------------------------------------------------------------------\r\n");
        return 0;
    }
    else{
        printf("\r\n Step 2 near-end loopback result: FAILED\r\n");
        printf("\r\n ------------------------------------------------------------------------\r\n");
        return 1;
    }
}

int lane_loopback_step3(void){
    uint32_t data_lane_gen_config, data_lane_ana_config,  data_lane_gen_seed, data_lane_ana_seed, data_lane_ana_control, data_lane_gen_control, error_cnt, temp;
	printf("\r\n Start scenraio loopback\r\n");	

    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    /////        Step 3: Check phy layer near-end serial loopback        /////
    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////
    printf("\r\n Step 3: EXTERNAL Loopback START \r\n");
    uint32_t step_3_failed = 0;
    phy_plus_lane_olny();

    initialization_sequence();
    //###########################
    //#With loopback during init
    //###########################

    //Incremental data generation

    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x84,0x20,0x00,0x00);// 4 frames, 104 bytes, incremental
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0x84,0x20,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_3_failed = 1; 
        printf("\r\nstep 3.1 result: FAILED\r\n");
        printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        printf("\r\nstep 3.1 result: PASS\r\n");
    }

    //PRBS data generation

    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x9F,0x20,0x00,0x01);// 31 frames, 104 bytes, prbs
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_3_failed = 1; 
        printf("\r\nstep 3.2 result: FAILED\r\n");
        printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        printf("\r\nstep 3.2 result: PASS\r\n");
    }

    //// seed 0x00000001
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x9F,0x20,0x00,0x01);// 31 frames, 104 bytes, prbs
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0x9F,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_3_failed = 1; 
        printf("\r\nstep 3.3 result: FAILED\r\n");
        printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        printf("\r\nstep 3.3 result: PASS\r\n");
    }

    //// seed 0x02000000
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0x82,0x20,0x00,0x01);// 2 frames, 104 bytes, prbs
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0x82,0x20,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x02);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x02);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();

    if (error_cnt != 0){
        step_3_failed = 1; 
        printf("\r\nstep 3.4 result: FAILED\r\n");
        printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        printf("\r\nstep 3.4 result: PASS\r\n");
    }

    //// seed 0x03000000
    //Configure Lane_Generator
    data_lane_gen_config = bytearray(0xA1,0x08,0x00,0x01);// 1 frames, 69 bytes, prbs
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONFIG_REG_OFFSET, data_lane_gen_config);

    //Configure Lane_Analyzer
    data_lane_ana_config = bytearray(0xA1,0x08,0x00,0x01);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONFIG_REG_OFFSET, data_lane_ana_config);

    //Seed of Lane_Generator
    data_lane_gen_seed = bytearray(0x00,0x00,0x00,0x04);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_INIT_VALUE_REG_OFFSET, data_lane_gen_seed);

    //Seed of Lane_Analyzer
    data_lane_ana_seed = bytearray(0x00,0x00,0x00,0x04);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_INIT_VALUE_REG_OFFSET, data_lane_ana_seed);

    // Start Test
    data_lane_ana_control = bytearray( 0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_ANALYZER_ADDR, MOD_ANA_CONTROL_REG_OFFSET, data_lane_ana_control);

    data_lane_gen_control = bytearray(0x01,0x00,0x00,0x00);
    mod_write_all(MODEL_GENERATOR_ADDR, MOD_GEN_CONTROL_REG_OFFSET, data_lane_gen_control);
    
    //Pull until Test End
    error_cnt = wait_end_test();


    if (error_cnt != 0){
        step_3_failed = 1; 
        printf("\r\nstep 3.5 result: FAILED\r\n");
        printf("\r\n number of error : %x\r\n", error_cnt);
    }
    else{
        printf("\r\nstep 3.5 result: PASS\r\n");
    }
    printf("\r\n Step 3 END \r\n");
    //print results of test
    printf("\r\n TEST RESULTS Scenario Loopback:");
    if (step_3_failed == 0){
        printf("\r\n Step 3 External loopback result: PASS\r\n");
        printf("\r\n ------------------------------------------------------------------------\r\n");
        return 0;
    }
    else{
        printf("\r\n Step 3 External loopback result: FAILED\r\n");
        printf("\r\n ------------------------------------------------------------------------\r\n");
        return 1;
    }
}


/******************************************************************************/
/**** Function wiath all steps*************************************************/
/******************************************************************************/
void lane_loopback_all_step (void)
{
  int step1, step2, step3;
  step1 = lane_loopback_step1();
  step2 = lane_loopback_step2();
  step3 = lane_loopback_step3();

	if( (step1 != 0) || (step2 != 0) || (step3 != 0)){
		printf("\r\n RESULT : ALL STEPS FAILED \r\n");
		printf("\r\n ------------------------------------------------------------------------\r\n");
	}
	else{
		printf("\r\n RESULT : ALL STEPS PASS \r\n");
		printf("\r\n ------------------------------------------------------------------------\r\n");
	}
}
