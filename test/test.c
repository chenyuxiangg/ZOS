#include "uart.h"

int main(int argc, char* argv[])
{
	drv_uart_init();
	drv_uart_write("hello,riscv!\n");
	while(1);
	return 0;
}
