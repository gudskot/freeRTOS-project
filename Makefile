TARGET = stm32_project

CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
OBJCOPY = arm-none-eabi-objcopy
SIZE = arm-none-eabi-size

CFLAGS = -mcpu=cortex-m0plus -mthumb -g -Wall -O0 -Wl,-Map=build/project.map \
	-Iinclude \
	-IfreeRTOS/include \
	-IfreeRTOS/portable/GCC/ARM_CM0 \
	-DSTM32L053xx
ASFLAGS = -mcpu=cortex-m0plus -mthumb

BUILD = build
SRC = src
FREERTOS_SRC = freeRTOS
STARTUP = startup
LINKER = linker/linker.ld

OBJECTS = \
	$(BUILD)/startup_stm32l053xx.o \
    $(BUILD)/system_stm32l0xx.o \
    $(BUILD)/list.o \
    $(BUILD)/queue.o \
    $(BUILD)/tasks.o \
    $(BUILD)/port.o \
    $(BUILD)/portasm.o \
    $(BUILD)/heap_4.o \
    $(BUILD)/main.o

all: $(BUILD)/$(TARGET).elf

$(BUILD)/$(TARGET).elf: $(OBJECTS)
	$(CC) $(CFLAGS) $^ -T$(LINKER) -nostartfiles -o $@
	$(OBJCOPY) -O binary $@ $(BUILD)/$(TARGET).bin
	$(SIZE) $@

$(BUILD)/startup_stm32l053xx.o: $(STARTUP)/startup_stm32l053xx.s
	mkdir -p $(BUILD)
	$(AS) $(ASFLAGS) $< -o $@
	
$(BUILD)/system_stm32l0xx.o: $(SRC)/system_stm32l0xx.c
	mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/list.o: $(FREERTOS_SRC)/list.c
	mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/queue.o: $(FREERTOS_SRC)/queue.c
	mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/tasks.o: $(FREERTOS_SRC)/tasks.c
	mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/port.o: $(FREERTOS_SRC)/portable/GCC/ARM_CM0/port.c
	mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/portasm.o: $(FREERTOS_SRC)/portable/GCC/ARM_CM0/portasm.c
	mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/heap_4.o: $(FREERTOS_SRC)/portable/MemMang/heap_4.c
	mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD)/main.o: $(SRC)/main.c
	mkdir -p $(BUILD)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD)

st-flash: $(BUILD)/$(TARGET).bin
	st-flash write $< 0x8000000