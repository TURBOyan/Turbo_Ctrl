/*
 * adc.c
 *
 *  Created on: Oct 27, 2021
 *      Author: jiangyuanyuan
 */
 
 
/************************************1-头文件**********************************/
#include "adc.h"
/**************************************end*************************************/

/************************************2-宏定义**********************************/

/*************************************end**************************************/

/***********************************3-变量定义*********************************/
ADC_HandleTypeDef hadc;
/*************************************End**************************************/

/**********************************4-初始化函数********************************/
void ADC_Init(void)
{
	hadc.Instance = ADC;
	hadc.Init.channel = ADC_CHANNEL_0;
	hadc.Init.freq = 1000;
	
	if (HAL_ADC_Init(&hadc) != HAL_OK)
	{
		Error_Handler();
	}
}

void HAL_ADC_MspInit(ADC_HandleTypeDef* hadc)
{
	if (hadc->Instance == ADC)
	{
		__HAL_RCC_ADC_CLK_ENABLE();
		__HAL_RCC_GPIO_CLK_ENABLE();
		
		//ADC_CHANNEL_0 : PA1
		//ADC_CHANNEL_1 : PA4
		//ADC_CHANNEL_2 : PA3
		//ADC_CHANNEL_3 : PA2
		//ADC_CHANNEL_0_1 : PA1 and PA4
		//ADC_CHANNEL_2_3 : PA3 and PA2
		if (hadc->Init.channel == ADC_CHANNEL_0)
		{
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_1);
		}
		else if (hadc->Init.channel == ADC_CHANNEL_1)
		{
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_4);
		}
		else if (hadc->Init.channel == ADC_CHANNEL_2)
		{
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_3);
		}
		else if (hadc->Init.channel == ADC_CHANNEL_3)
		{
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_2);
		}
		else if (hadc->Init.channel == ADC_CHANNEL_0_1)
		{
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_1);
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_4);
		}
		else if (hadc->Init.channel == ADC_CHANNEL_2_3)
		{
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_3);
			__HAL_AFIO_REMAP_ADC(GPIOA, GPIO_PIN_2);
		}
		
		// 如果用到中断方式需要使能中断
		HAL_NVIC_SetPriority(ADC_IRQn, 0);
		HAL_NVIC_EnableIRQ(ADC_IRQn);
	}
}

void HAL_ADC_MspDeInit(ADC_HandleTypeDef* hadc)
{
	__HAL_RCC_ADC_CLK_DISABLE();
	//ADC_CHANNEL_0 : PA1
	//ADC_CHANNEL_1 : PA4
	//ADC_CHANNEL_2 : PA3
	//ADC_CHANNEL_3 : PA2
	//ADC_CHANNEL_0_1 : PA1 and PA4
	//ADC_CHANNEL_2_3 : PA3 and PA2
	if (hadc->Init.channel == ADC_CHANNEL_0)
	{
		HAL_GPIO_DeInit(GPIOA, GPIO_PIN_1);
	}
	else if (hadc->Init.channel == ADC_CHANNEL_1)
	{
		HAL_GPIO_DeInit(GPIOA, GPIO_PIN_4);
	}
	else if (hadc->Init.channel == ADC_CHANNEL_2)
	{
		HAL_GPIO_DeInit(GPIOA, GPIO_PIN_3);
	}
	else if (hadc->Init.channel == ADC_CHANNEL_3)
	{
		HAL_GPIO_DeInit(GPIOA, GPIO_PIN_2);
	}
	else if (hadc->Init.channel == ADC_CHANNEL_0_1)
	{
		HAL_GPIO_DeInit(GPIOA, GPIO_PIN_1);
		HAL_GPIO_DeInit(GPIOA, GPIO_PIN_4);
	}
	else if (hadc->Init.channel == ADC_CHANNEL_2_3)
	{
		HAL_GPIO_DeInit(GPIOA, GPIO_PIN_3);
		HAL_GPIO_DeInit(GPIOA, GPIO_PIN_2);
	}
	HAL_NVIC_DisableIRQ(ADC_IRQn);
}
/**************************************end*************************************/

/***********************************5-回调函数*********************************/
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
	
}
/**************************************end*************************************/

/*********************************6-API接口函数********************************/
void Adc_GetValue(ADC_HandleTypeDef* hadc)
{
	static int adc_value[adc_max_channel] = {0,};
	static double value[adc_max_channel] = {0.0,};
	//ADC_CHANNEL_0 : PA1
	//ADC_CHANNEL_1 : PA4
	//ADC_CHANNEL_2 : PA3
	//ADC_CHANNEL_3 : PA2
	//ADC_CHANNEL_0_1 : PA1 and PA4
	//ADC_CHANNEL_2_3 : PA3 and PA2
	if (hadc->Init.channel == ADC_CHANNEL_0)
	{
		adc_value[adc_channel_0] = HAL_ADC_GET_INPUT_VOLTAGE(hadc);
		value[adc_channel_0] = HAL_ADC_GET_INPUT_VOLTAGE(hadc) / 1000.0;
		printf("adc_value[%d] = %dmv\r\n", adc_channel_0 , adc_value[adc_channel_0]);
		printf("value[%d] = %.2fv\r\n", adc_channel_0 , value[adc_channel_0]);
	}
	else if (hadc->Init.channel == ADC_CHANNEL_1)
	{
		adc_value[adc_channel_1] = HAL_ADC_GET_INPUT_VOLTAGE(hadc);
		value[adc_channel_1] = HAL_ADC_GET_INPUT_VOLTAGE(hadc) / 1000.0;
		printf("adc_value[%d] = %dmv\r\n", adc_channel_1 , adc_value[adc_channel_1]);
		printf("value[%d] = %.2fv\r\n", adc_channel_1 , value[adc_channel_1]);
	}
	else if (hadc->Init.channel == ADC_CHANNEL_2)
	{
		adc_value[adc_channel_2] = HAL_ADC_GET_INPUT_VOLTAGE(hadc);
		value[adc_channel_2] = HAL_ADC_GET_INPUT_VOLTAGE(hadc) / 1000.0;
		printf("adc_value[%d] = %dmv\r\n", adc_channel_2 , adc_value[adc_channel_2]);
		printf("value[%d] = %.2fv\r\n", adc_channel_2 , value[adc_channel_2]);
	}
	else if (hadc->Init.channel == ADC_CHANNEL_3)
	{
		adc_value[adc_channel_3] = HAL_ADC_GET_INPUT_VOLTAGE(hadc);
		value[adc_channel_3] = HAL_ADC_GET_INPUT_VOLTAGE(hadc) / 1000.0;
		printf("adc_value[%d] = %dmv\r\n", adc_channel_3 , adc_value[adc_channel_3]);
		printf("value[%d] = %.2fv\r\n", adc_channel_3 , value[adc_channel_3]);
	}
	else if (hadc->Init.channel == ADC_CHANNEL_0_1)
	{
		adc_value[adc_channel_0] = HAL_ADC_GET_INPUT_VOLTAGE(hadc);
		adc_value[adc_channel_1] = HAL_ADC_GET_INPUT_VOLTAGE(hadc);
		printf("adc_value[%d] = %dmv\r\n", adc_channel_0 , adc_value[adc_channel_0]);
		printf("adc_value[%d] = %dmv\r\n", adc_channel_1 , adc_value[adc_channel_1]);
	}
	else if (hadc->Init.channel == ADC_CHANNEL_2_3)
	{
		adc_value[adc_channel_2] = HAL_ADC_GET_INPUT_VOLTAGE(hadc);
		adc_value[adc_channel_3] = HAL_ADC_GET_INPUT_VOLTAGE(hadc);
		value[adc_channel_2] = HAL_ADC_GET_INPUT_VOLTAGE(hadc) / 1000.0;
		value[adc_channel_3] = HAL_ADC_GET_INPUT_VOLTAGE(hadc) / 1000.0;
		printf("adc_value[%d] = %dmv\r\n", adc_channel_2 , adc_value[adc_channel_2]);
		printf("adc_value[%d] = %dmv\r\n", adc_channel_3 , adc_value[adc_channel_3]);
	}
}
/**************************************end*************************************/