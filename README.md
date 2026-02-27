### LINKER SCRIPT

**Memory directive (MEMORY) :**
 is the part where we specify the memory structure of the microcontroller like the start/end address of each section , lentgh 
 ```
    MEMORY
    {
        name (ex: RAM , SRAM, FLASH ) (attributes(ex=rw [read-write] , rx , rwx)) : ORIGIN = origin, LENGTH = length
    }

 ``` 
    • name: An identifier we give to the memory region
    • attributes: This specifies the access permissions for the region, such as read, write, and
    execute permissions
    • ORIGIN: This defines the start address of the memory region
    • LENGTH: This specifies the size of the memory region


**Section definitions**

    the section of the codes `.text` , variables (intialized .data , unintailzied   `.bss` (block started by symbol)) also read-only data .rodata like constant declarations, .heap , .stack for dynamic allocation 

**The sections directive (SECTIONS)**

     This directive defines the mapping and ordering of sections from input files into the output file

     ```
     SECTION 
     {
        .output_section_name address :
        {
            input_section informations
        } > memory_region [AT>load_address] [ALIGN (expression)] [:phdr_expression] [=fill_expression]
     }
     ```

    1. input_section_information: this determines which input sections from .obj files should be included in the .output_section_name , *(.text) to say all .text sections from the .obj files

    2. >memory_region : this specify the memory region where the section shouled be stored

    3. [AT>load_address]: this tries to specify the load address of the section 

**The KEEP directive**
    
    keep durective ensures that the unused sections , functions appears in the binary file 

    ```
        KEEP(*(.isr_table_vector))
    ```

**The ALIGN directive**

    __.__ is the location counter  which is a built-in variable that points on the address of the linking process 


**__attribute__** 

    we use this to till the complier that the specifc function or symbol is effected by some properties of the linker 

**weak** 

    we use this to till the linker that if you find a function that is strongly declared try to use it instead of using a default declaration


**alias("Default_Handler"):** 

    means we replace the weak function with a default function 

    example :

    
    ```
    void NMI_Handler() __attribute__((weak,alias("Default_Handler")))
    ```
    we replace NMI_Handler with Default_Handler if we dont strongly define 
    NMI_Handler 


    