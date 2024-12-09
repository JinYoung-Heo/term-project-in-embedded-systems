#ifndef bluetoothManager_h
#define bluetoothManager_h

void bluetoothConfiguration();
int receivedDataListener();
void RCC_Configuration(void);
void GPIO_Configuration(void);
void USART_Configuration(void);
void USART_SendString(const char *str);

#endif