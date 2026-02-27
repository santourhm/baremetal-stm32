ENTRY(Reset_Handler)


MEMORY
{
    FLASH (rx) : ORIGIN = 0x0, LENGTH = 128K /* 128K */
    RAM   (rwx) : ORIGIN = 0x20000000, LENGTH = 8K /* 8K */
}

__ram_start__ = ORIGIN(RAM);
__ram_size__  = LENGTH(RAM);
__ram_end__   = __ram_start__ + __ram_size__;

_estack = __ram_end__;

_stacks__ = 0x400;
_heaps__  = 0x200;

SECTIONS
{
    .text :
    {
        . = ALIGN(4);
        
        KEEP(*(.isr_vector_table)) /* here i used the KEEP symbol to confrim including vector table */
        *(.text)
        *(.rodata)
        
        . = ALIGN(4);

        _etext = .; /*end address of the .text section */

    } > FLASH

    .data : 
    {
        . = ALIGN(4); /* align the data to 4 byte access */
        _sdata = . ; /* Start address of the data section */
        
        *(.data)
        *(.data*)
        *(.RamFunc)

        . = ALIGN(4);

        _edata = . ; /* end address of the data section */

    } > RAM AT > FLASH

    _sidata = LOADADDR(.data); /*Physical address of .data  */

    .bss : 
    {
        . = ALIGN(4);
        _sbss = .;
        
        *(.bss)
        . = ALIGN(4) ;
        _ebss = . ; 

    } > RAM 
    
}