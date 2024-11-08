#ifndef __UART_H__
#define __UART_H__

typedef struct {

} UART_PARAMS;

void drv_uart_init(void);
void drv_uart_set_params(const UART_PARAMS params);
void drv_uart_write(const char *str);
void hal_uart_set_data_len(unsigned char data_len);

#endif