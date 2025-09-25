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
#define configMAX_PRIORITIES                    5
#define configMINIMAL_STACK_SIZE                128
#define configMAX_TASK_NAME_LEN                 16
#define configUSE_16_BIT_TICKS                  0   

/* Memory allocation */
#define configSUPPORT_DYNAMIC_ALLOCATION        1
#define configTOTAL_HEAP_SIZE                   (4 * 1024)

#define configASSERT( x ) if( ( x ) == 0 ) { taskDISABLE_INTERRUPTS(); for( ;; ); }

/* Optional functions */
#define INCLUDE_vTaskDelay                      1

#endif /* FREERTOS_CONFIG_H */