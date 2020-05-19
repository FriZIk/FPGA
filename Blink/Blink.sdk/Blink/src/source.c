#include "xparameters.h" // Содержит адреса и номера устройств на шине  AXI
#include "xgpio.h"		 // Функции ввода/вывода

XGpio gpio;

int main()
{
	u32 i = 0; 		// Для задержки(таймера)
	u32 led = 0;	// Состоание светодиода

	XGpio_Initialize(&gpio,XPAR_GPIO_0_DEVICE_ID);
	xil_printf("1");

	while(1)
	{
		i++;
		if(i == 1000000)
		{
			led = !led;
			XGpio_DiscreteWrite(&gpio,1,led);
			i = 0;
		}
	}
	return 0;
}
