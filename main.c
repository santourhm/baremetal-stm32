#include <stdint.h>

#define UART0_DR *((volatile uint32_t *)(0x4000C000 ))
static char c = 'c';
int main()
{
    
    UART0_DR = '!';
    UART0_DR = c  ;
    UART0_DR = 'K';
    UART0_DR = '\n';
    
    while (1);

    return 0;
}