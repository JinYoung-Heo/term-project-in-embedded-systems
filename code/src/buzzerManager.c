#include <lcdManager.h>
#include <buzzerManager.h>
#include <probManager.h>
#include <bluetoothManager.h>
#include <stdbool.h>
#include "stm32f10x.h"
#include "stm32f10x_gpio.h"
#include "stm32f10x_rcc.h"
#include "stm32f10x_usart.h"

// Function prototypes
void RCC_Configuration(void);
void GPIO_Configuration(void);

void buzzerConfiguration(){
    // Configure system clocks
    RCC_Configuration();

    // Configure GPIO pins
    GPIO_Configuration();
}

void buzzerOn(){
    GPIO_SetBits(GPIOE, GPIO_Pin_0);
}

void buzzerOff(){
    GPIO_ResetBits(GPIOE, GPIO_Pin_0);
}

// Configure the system clocks
void RCC_Configuration(void) {
    // Enable clocks for GPIOA and USART1
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOE, ENABLE);
}

// Configure GPIO pins
void GPIO_Configuration(void) {
    GPIO_InitTypeDef GPIO_InitStructure;
    
    // Configure GPIOE pin 0 as push-pull output
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(GPIOE, &GPIO_InitStructure);
}