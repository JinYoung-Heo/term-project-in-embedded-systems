#include "buzzerManager.h"
#include "lcdManager.h"
#include "probManager.h"
#include "bluetoothManager.h"
#include <stdbool.h>
#include <stm32f10x.h>
#include "stm32f10x_gpio.h"
#include "stm32f10x_rcc.h"
#include "stm32f10x_usart.h"
#include <stdio.h>


// Function prototypes
void RCC_Configuration(void);
void GPIO_Configuration(void);
void USART_Configuration(void);
void USART_SendString(const char *str);

int main(void) {
    bluetoothConfiguration();
    while(!receivedDataListener){;}
    char* problem = generateAlarmProblem();
    printf("Random problem: %s\n", problem);
    // alarmStart();
    
}