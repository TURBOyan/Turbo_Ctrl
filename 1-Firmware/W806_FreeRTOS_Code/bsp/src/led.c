#include "led.h"

/**************变量定义******************/

/*****************End********************/

/***********LED初始化函数定义*************/
void Led_Init(void)
{
	GPIO_InitTypeDef GPIO_InitStruct = {0};
	__HAL_RCC_GPIO_CLK_ENABLE();

	GPIO_InitStruct.Pin = GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2;
	GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT;
	GPIO_InitStruct.Pull = GPIO_NOPULL;
	HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);
	HAL_GPIO_WritePin(GPIOB, GPIO_PIN_0 | GPIO_PIN_1 | GPIO_PIN_2, GPIO_PIN_SET);
}
/*****************End********************/

/**************API函数定义***************/
void Led1_Control(uint8_t sw)
{
	if(sw == ON)
	{
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_0, GPIO_PIN_RESET);
	}
	else
	{
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_0, GPIO_PIN_SET);
	}
}

void Led2_Control(uint8_t sw)
{
	if(sw == ON)
	{
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_1, GPIO_PIN_RESET);
	}
	else
	{
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_1, GPIO_PIN_SET);
	}
}

void Led3_Control(uint8_t sw)
{
	if(sw == ON)
	{
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_2, GPIO_PIN_RESET);
	}
	else
	{
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_2, GPIO_PIN_SET);
	}
}

void Led1_Toggle(void)
{
	HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_0);
}

void Led2_Toggle(void)
{
	HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_1);
}

void Led3_Toggle(void)
{
	HAL_GPIO_TogglePin(GPIOB, GPIO_PIN_2);
}
/*****************End********************/