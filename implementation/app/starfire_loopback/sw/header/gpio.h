#ifndef GPIO_H_
#define GPIO_H_

#include <stdint.h>
#include <stdbool.h>

/**
 * @brief Register map of the GPIO debug registers
*/
typedef struct gpio_dbg_regs{
    volatile uint32_t din;	// 0x00
    volatile uint32_t dout;     // 0x04
} gpio_dbg_t;

/**
 * @brief Register map of the GPIO registers
*/
typedef struct gpio_regs{
    volatile uint32_t din;	// 0x00
    volatile uint32_t dout;     // 0x04
} gpio_t;


// GPIO
static inline void gpio_write_dout(gpio_t* gpio_addr, uint32_t data)
{
    gpio_addr->dout = data;
}

static inline uint32_t gpio_read_dout(gpio_t* gpio_addr)
{
    return gpio_addr->dout;
}

static inline uint32_t gpio_read_din(gpio_t* gpio_addr)
{
    return gpio_addr->din;
}


// GPIO debug
static inline void gpio_write_dout_debug(gpio_dbg_t* gpio_dbg_addr, uint32_t data)
{
    gpio_dbg_addr->dout = data;
}

static inline uint32_t gpio_read_dout_debug(gpio_dbg_t* gpio_dbg_addr)
{
    return gpio_dbg_addr->dout;
}
#endif
