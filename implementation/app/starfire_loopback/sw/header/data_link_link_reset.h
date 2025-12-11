/**
 * @brief Data-Link Scenario loopback
 * @author Yvan DAURIAC
 * @date 2025-14-04
*/



#include <stdint.h>
#include <stdbool.h>

int data_link_link_reset_step1(int type_lpb);
int data_link_link_reset_step2(int type_lpb);
void data_link__link_reset_all_step(int type_lpb);