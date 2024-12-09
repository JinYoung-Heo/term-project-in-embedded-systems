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
void USART_Configuration(void);
void USART_SendString(const char *str);

void bluetoothConfiguration(){
    // Configure system clocks
    RCC_Configuration();
    
    // Configure GPIO pins
    GPIO_Configuration();
    
    // Configure USART
    USART_Configuration();
}
int receivedDataListener(){
    // Check if data is received
    if (USART_GetFlagStatus(USART1, USART_FLAG_RXNE) == SET) {
        // Read the received data
        uint16_t received = USART_ReceiveData(USART1);
        return received;
        // Echo back the received data
        // USART_SendData(USART1, received);
        // Wait until transmission is complete
        // while (USART_GetFlagStatus(USART1, USART_FLAG_TXE) == RESET);
    }
    return 0;
}

// int main(void) {
//     // Configure system clocks
//     RCC_Configuration();
    
//     // Configure GPIO pins
//     GPIO_Configuration();
    
//     // Configure USART
//     USART_Configuration();
    
//     // Send a welcome message
//     USART_SendString("STM32 Bluetooth Module Ready\r\n");
    
    
// }

// Configure the system clocks
void RCC_Configuration(void) {
    // Enable clocks for GPIOA and USART1
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA | RCC_APB2Periph_USART1, ENABLE);
}

// Configure GPIO pins
void GPIO_Configuration(void) {
    GPIO_InitTypeDef GPIO_InitStructure;
    
    // Configure USART1 Tx (PA9) as alternate function push-pull
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_9;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_Init(GPIOA, &GPIO_InitStructure);
    
    // Configure USART1 Rx (PA10) as input floating
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
    GPIO_Init(GPIOA, &GPIO_InitStructure);
}

// Configure USART
void USART_Configuration(void) {
    USART_InitTypeDef USART_InitStructure;
    
    // Configure USART1 settings
    USART_InitStructure.USART_BaudRate = 9600; // Set baud rate (adjust for your module)
    USART_InitStructure.USART_WordLength = USART_WordLength_8b;
    USART_InitStructure.USART_StopBits = USART_StopBits_1;
    USART_InitStructure.USART_Parity = USART_Parity_No;
    USART_InitStructure.USART_HardwareFlowControl = USART_HardwareFlowControl_None;
    USART_InitStructure.USART_Mode = USART_Mode_Rx | USART_Mode_Tx;
    
    // Initialize USART1
    USART_Init(USART1, &USART_InitStructure);
    
    // Enable USART1
    USART_Cmd(USART1, ENABLE);
}

// Send a string via USART
void USART_SendString(const char *str) {
    while (*str) {
        USART_SendData(USART1, *str++);
        
        // Wait until the data is transmitted
        while (USART_GetFlagStatus(USART1, USART_FLAG_TXE) == RESET);
    }
}
