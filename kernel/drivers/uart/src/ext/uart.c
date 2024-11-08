#include "uart.h"
#include "hal_uart.h"

void drv_uart_init(void)
{
    hal_uart_set_irq_en(0);
    hal_uart_set_baudrate(9600);
    hal_uart_set_data_len(8);
}

void drv_uart_set_params(const UART_PARAMS params)
{

}

void drv_uart_write(const char *str)
{
    hal_uart_write(str);
}