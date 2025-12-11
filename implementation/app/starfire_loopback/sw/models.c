/**
 * @brief Driver for Spacefibre models
 * @author Emilie Butruille
 * @date 2024-10-03
*/

#include "models.h"
#include "config.h"
#include "common.h"

void print_lane_state (const enum lane_state state)
{
	switch (state)
	{
		case LANE_STATE_CLEARLINE:
			printf("CLEARLINE");
			break;

		case LANE_STATE_DISABLED:
			printf("DISABLED");
			break;

		case LANE_STATE_WAIT:
			printf("WAIT");
			break;

		case LANE_STATE_STARTED:
			printf("STARTED");
			break;

		case LANE_STATE_INVERTRXPOLARITY:
			printf("INVERTRXPOLARITY");
			break;

		case LANE_STATE_CONNECTING:
			printf("CONNECTING");
			break;

		case LANE_STATE_CONNECTED:
			printf("CONNECTED");
			break;

		case LANE_STATE_ACTIVE:
			printf("ACTIVE");
			break;

		case LANE_STATE_PREPARESTANDBY:
			printf("PREPARESTANDBY");
			break;

		case LANE_STATE_LOSSOFSIGNAL:
			printf("LOSSOFSIGNAL");
			break;

		default:
			printf("UNKNOWN STATE (x%x)", (int) state);
			break;
	}
}

enum action_result wait_for_state
(
	const volatile uint32_t conf_status_register [const static 1],
	const enum lane_state target,
	const unsigned int timeout
)
{
	unsigned int timer = 0;

	while (DL_CONFIGURATOR_LANE_STATUS_GET(LANE_STATE, *conf_status_register) != target)
	{
		timer += 1;

		if (timer >= timeout)
		{
			printf("\r\n Could not reach LANE STATE ");
			print_lane_state(target);
			printf(". Stuck in ");
			print_lane_state(DL_CONFIGURATOR_LANE_STATUS_GET(LANE_STATE, *conf_status_register));
			printf(": timed out after %x attempts.\r\n", timer);

			return TIMEOUT;
		}

		wait(1);
	}

	printf("\r\n Reached LANE STATE \r\n");
	print_lane_state(target);
	printf("\r\n");

	return OK;
}

enum action_result wait_for_states
(
	const volatile uint32_t conf_status_register [const static 1],
	const unsigned int valid_states_count,
	const enum lane_state valid_states [const static valid_states_count],
	const unsigned int timeout
)
{
	unsigned int timer = 0;
	enum lane_state current_state;

	for (;;)
	{
		current_state = DL_CONFIGURATOR_LANE_STATUS_GET(LANE_STATE, *conf_status_register);

		for (unsigned int i = 0; i < valid_states_count; ++i)
		{
			if (current_state == valid_states[i])
			{
				printf("\r\n Reached LANE STATE \r\n");
				print_lane_state(current_state);
				printf("\r\n");

				return OK;
			}
		}

		timer += 1;

		if (timer >= timeout)
		{
			printf("\r\n Could not reach LANE STATEs ");

			for (unsigned int i = 0; i < valid_states_count; ++i)
			{
				print_lane_state(valid_states[i]);
				printf(" ");
			}

			printf(". Stuck in ");
			print_lane_state(DL_CONFIGURATOR_LANE_STATUS_GET(LANE_STATE, *conf_status_register));
			printf(": timed out after %x attempts.\r\n", timer);

			return TIMEOUT;
		}

		wait(1);
	}
}


void mod_write_all(uint32_t base, uint32_t reg, uint32_t data){
    volatile uint32_t* reg_ptr = (volatile uint32_t*)((uint8_t*)base + reg);
    *reg_ptr = data;
}

void mod_write(uint32_t base, uint32_t reg, uint32_t mask, uint32_t data){
    uint32_t* reg_ptr = (uint32_t*)((uint8_t*)base + reg);
    uint32_t temp = *reg_ptr;
    temp = mod_read_all(base, reg);
    temp &= ~mask;                 // Efface les bits du champ concerné
    temp |= (data & mask); // Insère la nouvelle valeur au bon endroit
    *reg_ptr = temp;
}

uint32_t mod_read_all(uint32_t base, uint32_t reg){
    return *(volatile uint32_t*)(base + reg);
}

uint32_t mod_read(uint32_t base, uint32_t reg, uint32_t mask, uint8_t shift){
    // Lire la valeur brute à l'adresse donnée
    uint32_t raw_value = *(volatile uint32_t*)((uint8_t*)base + reg);
    // Appliquer le masque et le décalage
    return (raw_value & mask) >> shift;;
}


void reset_the_dut(void){
  mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_GLOBAL_REG_OFFSET, RST_DUT_N_MASK, 0 << RST_DUT_N_SHIFT);
  wait_us_clk_150mhz(20);
  mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_GLOBAL_REG_OFFSET, RST_DUT_N_MASK, 1 << RST_DUT_N_SHIFT);

}
void lane_reset_conf(void){
    mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_PARAM_LANE_REG_OFFSET, LANERESET_MASK, 1 << LANERESET_SHIFT);
    wait_us_clk_150mhz(3);
    mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_PARAM_LANE_REG_OFFSET, LANERESET_MASK, 0 << LANERESET_SHIFT);
}

// Common
uint32_t bytearray(uint8_t byte1, uint8_t byte2, uint8_t byte3, uint8_t byte4) {
    // Assemble les octets en little-endian (le moins significatif en premier)
    return (uint32_t)byte1 | ((uint32_t)byte2 << 8) | ((uint32_t)byte3 << 16) | ((uint32_t)byte4 << 24);
}

void phy_plus_lane_olny(void){
	uint32_t temp;
	temp = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_GLOBAL_REG_OFFSET);
	printf("\r\n Global Register before spy and INJ: %x r\n", temp);

	mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_GLOBAL_REG_OFFSET, INJECTOR_EN_MASK, 1 << INJECTOR_EN_SHIFT);
	mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_GLOBAL_REG_OFFSET, SPY_EN_MASK, 1 << SPY_EN_SHIFT);

	temp = mod_read_all(MODEL_CONFIGURATOR_ADDR, MOD_CONF_GLOBAL_REG_OFFSET);
	printf("\r\n Global Register: %x r\n", temp);

}
void phy_plus_lane_plus_dl(void){
	mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_GLOBAL_REG_OFFSET, INJECTOR_EN_MASK, 0 << INJECTOR_EN_SHIFT);
	mod_write(MODEL_CONFIGURATOR_ADDR, MOD_CONF_GLOBAL_REG_OFFSET, SPY_EN_MASK, 0 << SPY_EN_SHIFT);
}
