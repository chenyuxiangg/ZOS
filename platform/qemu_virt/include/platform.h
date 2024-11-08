#ifndef __PLATFORM_H__
#define __PLATFORM_H__

/* ======== Register Operat ========*/
#define READ_BYTE(addr)             ({unsigned char val = *(volatile unsigned char *)(addr);val;})
#define WRITE_BYTE(addr, val)       (*(volatile unsigned char *)(addr)=val)
#define CLEAN_BIT(val, bit)         ({val=(~(1 << bit)) & val;val;})
#define SET_BIT(val, bit)           ({val=((1 << bit) | val);val;})

/* ======== UART ======== */
#define UART0_CLOCK             (3686400)
#define UART0_BASE_ADDR         (0x10000000)

#endif