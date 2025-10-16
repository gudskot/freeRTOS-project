#include <stm32l053xx.h>
#include "FreeRTOS.h"
#include "task.h" 

void _init(void) {};

void Task1(void *pvParameters) {
    while(1) {
        GPIOA->ODR ^= (1 << 0);
        vTaskDelay(60);
    }
}

void Task2(void *pvParameters) {
    while(1) {
        GPIOA->ODR ^= (1 << 1);
        vTaskDelay(60);
    }
}

int main(void) {
    RCC->IOPENR |= RCC_IOPENR_GPIOAEN;

    GPIOA->MODER &= ~(3 << (2 * 0));
    GPIOA->MODER |= (1 << (2 * 0));
    GPIOA->MODER &= ~(3 << (2 * 1));
    GPIOA->MODER |= (1 << (2 * 1));

    xTaskCreate(Task1, "LED1", 128, NULL, 1, NULL);
    xTaskCreate(Task2, "LED2", 128, NULL, 1, NULL);
    
    vTaskStartScheduler();

    while(1);
}