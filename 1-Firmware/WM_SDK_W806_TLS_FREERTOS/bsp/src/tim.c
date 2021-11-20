/*
 * tim.c
 *
 *  Created on: Oct 27, 2021
 *      Author: jiangyuanyuan
 */

/************************************1-头文件**********************************/
#include "tim.h"
#include "led.h"
/**************************************end*************************************/

/************************************2-宏定义**********************************/

/*************************************end**************************************/

/***********************************3-变量定义*********************************/
TIM_HandleTypeDef htim0;
TIM_HandleTypeDef htim1;
/*************************************End**************************************/

/**********************************4-初始化函数********************************/
void TIM0_Init(void)
{
	htim0.Instance = TIM0;
	htim0.Init.Unit = TIM_UNIT_US;
	htim0.Init.Period = 1000000;
	htim0.Init.AutoReload = TIM_AUTORELOAD_PRELOAD_ENABLE;
	if (HAL_TIM_Base_Init(&htim0) != HAL_OK)
	{
		Error_Handler();
	}
}

void TIM1_Init(void)
{
	htim1.Instance = TIM1;
	htim1.Init.Unit = TIM_UNIT_US;
	htim1.Init.Period = 100000;
	htim1.Init.AutoReload = TIM_AUTORELOAD_PRELOAD_ENABLE;
	if (HAL_TIM_Base_Init(&htim1) != HAL_OK)
	{
		Error_Handler();
	}
}

void HAL_TIM_Base_MspInit(TIM_HandleTypeDef* htim_base)
{
	__HAL_RCC_TIM_CLK_ENABLE();
	HAL_NVIC_SetPriority(TIM_IRQn, 0);
	HAL_NVIC_EnableIRQ(TIM_IRQn);
}

void HAL_TIM_Base_MspDeInit(TIM_HandleTypeDef* htim_base)
{
	// 由于所有的TIM共用一个时钟和中断，所以如果只用了一路TIM，在DeInit时可以关闭时钟和中断，但如果使用了多路TIM，在某一路DeInit时，如果
	// 关闭时钟和中断，会影响其他在运行的TIM
	//	__HAL_RCC_TIM_CLK_DISABLE();
	//	HAL_NVIC_DisableIRQ(TIM_IRQn);
}

/**************************************end*************************************/

/***********************************5-回调函数*********************************/
void HAL_TIM_Callback(TIM_HandleTypeDef *htim)
{
	//printf("%d ", htim->Instance);
	if (htim->Instance == TIM0)
	{
		Led1_Toggle();
	}
	if (htim->Instance == TIM1)
	{
		Led3_Toggle();
	}
}
/**************************************end*************************************/

/*********************************6-API接口函数********************************/
void TIM_Init(void)
{
	TIM0_Init();
	TIM1_Init();
	HAL_TIM_Base_Start_IT(&htim0);
	HAL_TIM_Base_Start_IT(&htim1);
}
/**************************************end*************************************/