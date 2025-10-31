CC=arm-none-eabi-gcc
OBJCOPY=arm-none-eabi-objcopy
MACHINE=cortex-m3 
CFLAGS= -c -mcpu=$(MACHINE) -mthumb -mfloat-abi=soft -Wall -O0 -g
LDFLAGS= -mcpu=$(MACHINE) -mthumb -mfloat-abi=soft --specs=nano.specs -T Stm32_ls.ld -Wl,-Map=final.map
#LDFLAGS_SH= -mcpu=$(MACHINE) -mthumb -mfloat-abi=soft --specs=rdimon.specs -T Stm32_ls.ld -Wl,-Map=final.map

all: main.o Stm32_Startup.o syscalls.o final.elf final.hex final.bin
sh: main.o Stm32_Startup.o final_sh.elf
main.o:main.c
	$(CC) $(CFLAGS) -o $@ $^
	
Stm32_Startup.o:Stm32_Startup.c
	$(CC) $(CFLAGS) -o $@ $^

syscalls.o:syscalls.c
	$(CC) $(CFLAGS) -o $@ $^

final.elf:main.o Stm32_Startup.o syscalls.o
	$(CC) $(LDFLAGS) -o $@ $^

final_sh.elf: main.o Stm32_Startup.o
	$(CC) $(LDFLAGS_SH) -o $@ $^

final.hex:final.elf
	$(OBJCOPY) -O ihex $< $@
	
final.bin:final.elf
	$(OBJCOPY) -O binary $< $@
	
clean:
	rm -rf *.o *.elf