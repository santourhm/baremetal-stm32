GCC := arm-none-eabi-gcc 

GFALGS := -c 

MACHINE := -machine lm3s811evb -nographic -kernel 

LINKER := linker.ld

C_SRC := $(wildcard .c)
S_SRC := $(wildcard .s)

BUILDDIR ?= build 
BINARYFILE = qemu.bin

all : $(BINARYFILE)

$(BINARYFILE) : %.elf 
	$(GCC) -nostdlib $(LINKER) -T 


$(BUILDDIR)/%.o : %.c 
	$(GCC) $(GFALGS) 