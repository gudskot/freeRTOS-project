# FreeRTOS LED Blinker for STM32L053R8

A bare-metal FreeRTOS project for STM32L053 that controls LEDs and demonstrates basic task creation and scheduling.

## Features
- Uses FreeRTOS for multitasking
- Separate tasks for LEDs
- Delays via FreeRTOS
- Build system: `make`

## Requirements
- Microcontroller: STM32L053xx
- Compiler: `arm-none-eabi-gcc`
- Build system: `makefile`
- FreeRTOS
- Flashing tool: ST-Link

## Project Structure
- src/        # Source files (main.c, system_stm32l0xx.c)
- include/    # Header files (defines, prototypes, FreeRTOSConfig.h)
- FreeRTOS/   # FreeRTOS library (core, tasks)
- linker/     # Linker scripts (MCU memory description)
- startup/    # Vector table
- Makefile    # Build system
- README.md   # Project documentation

## How it works
Creates a task to blink an LED (PA0/PA1)
FreeRTOS manages switching between tasks

## Build and Run
```bash
make        # build
make st-flash  # flash via ST-Link
```
##Screen

https://github.com/user-attachments/assets/690d2554-d32e-4874-8ba9-a73ef0b94e65
