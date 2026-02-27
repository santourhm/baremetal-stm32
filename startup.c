#include <stdint.h>

extern uint32_t _sdata; 
extern uint32_t _edata; 
extern uint32_t _ebss;
extern uint32_t _sbss;
extern uint32_t _sidata;
extern uint32_t _estack;

extern void main();



void Default_Handler()
{
    while (1);
}

void Reset_Handler()
{
    uint32_t * s  = (uint32_t *) &_sidata ;
    uint32_t * d  = (uint32_t *) &_sdata ;

    while (d <  &_edata) /* .data from FLASH to RAM */
        *(d++) = *(s++); 
    
    d = (uint32_t*) &(_sbss);
    
    while (d < &(_ebss) )  /* init .bss with zeros  */
        *(d++) =  0;
    
    main();
}


void HardFault_Handler() __attribute__((weak, alias("Default_Handler")));
void NMI_Handler() __attribute__((weak, alias("Default_Handler")));
void MemManage_Handler() __attribute__((weak, alias("Default_Handler")));
void BusFault_Handler() __attribute__((weak, alias("Default_Handler")));


uint32_t vtable[] __attribute__((section(".isr_vector_table"))) = {
    (uint32_t)&_estack,
    (uint32_t)&Reset_Handler,
    (uint32_t)&NMI_Handler,
    (uint32_t)&HardFault_Handler,
    (uint32_t)&MemManage_Handler,
    (uint32_t)&BusFault_Handler
};
