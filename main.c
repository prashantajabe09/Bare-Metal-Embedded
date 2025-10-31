#include <stdio.h>

unsigned int const temp_var_1 = 1000;
int const temp_var_2 = 120;

unsigned int temp_var_3 = 0;
int temp_var_4 = 0;
unsigned int temp_var_5 = 124;
typedef struct {
	unsigned int CR;
	unsigned int CFGR;
	unsigned int CIR;
	unsigned int APB2RSTR;
	unsigned int APB1RSTR;
	unsigned int AHBENR;
	unsigned int APB2ENR;
	unsigned int APB1ENR;
	unsigned int BDCR;
	unsigned int CSR;
}Typedef_RCC;

typedef struct {
	unsigned int CRL;
	unsigned int CRH;
	unsigned int IDR;
	unsigned int ODR;
	unsigned int BSRR;
	unsigned int BRR;
	unsigned int LCKR;
}Typedef_GPIO;


typedef struct{

	unsigned int temp1;
	unsigned int temp_2;
	int temp3;
}tp_RegDef_t;

tp_RegDef_t arr[50];
#define FLASH_BASE			0x08000000
#define FLASH_OFFSET		0x4000
#define RCC_BASE			0x40021000
Typedef_RCC *RCC = (Typedef_RCC*)RCC_BASE;
Typedef_GPIO *GPIOC = (Typedef_GPIO*)0x40011000;
Typedef_GPIO *GPIOA = (Typedef_GPIO*)0x40010800;

//extern void initialise_monitor_handles(void);

int main(void)
{
	//initialise_monitor_handles();
	printf("Welcome \n");
	RCC->APB2ENR |= (1 << 4); // EN GPIO C CLOCK
	GPIOC->CRH &= ~(15 << 20); // GPIO C Pin 13 Configured.
	GPIOC->CRH |= (1 << 20); // GPIO C Pin 13 Configured.
	while(1)
	{
			GPIOC->ODR |= (1 << 13);
			for (int i = 0; i <100000; i++);
			GPIOC->ODR &= ~(1 << 13);
			for (int i = 0; i < 100000;i++);
	}
}