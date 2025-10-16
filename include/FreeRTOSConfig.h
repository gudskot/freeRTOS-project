#ifndef FREERTOS_CONFIG_H
#define FREERTOS_CONFIG_H

#include "stm32l053xx.h"

/* Scheduler */
#define configENABLE_MPU                        0
#define configUSE_PREEMPTION                    1
#define configUSE_IDLE_HOOK                     0
#define configUSE_TICK_HOOK                     0
#define configCPU_CLOCK_HZ                      SystemCoreClock
#define configSYSTICK_CLOCK_HZ                  SystemCoreClock
#define configTICK_RATE_HZ                      1000
#define configMAX_PRIORITIES                    1
#define configUSE_16_BIT_TICKS                  0   

/* Memory allocation */
#define configMINIMAL_STACK_SIZE                128
#define configTOTAL_HEAP_SIZE                   (4 * 1024)

/* Optional functions */
#define INCLUDE_vTaskDelay                      1

#endif /* FREERTOS_CONFIG_H */