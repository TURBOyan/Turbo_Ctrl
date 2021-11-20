/*
 * pmu.c
 *
 *  Created on: Oct 27, 2021
 *      Author: jiangyuanyuan
 */

/************************************1-头文件**********************************/
#include "pmu.h"
/**************************************end*************************************/

/************************************2-宏定义**********************************/

/*************************************end**************************************/

/***********************************3-变量定义*********************************/
PMU_HandleTypeDef hpmu;
/*************************************End**************************************/

/**********************************4-初始化函数********************************/
void PMU_Sleep_Tim0(void)
{
	HAL_PMU_TIMER0_Start(&hpmu, 5);
	while (1)
	{
		HAL_PMU_Enter_Sleep(&hpmu);
		printf(".");
	}
}

void PMU_Sleep_IO(void)
{
	HAL_PMU_Enter_Sleep(&hpmu);
}

void PMU_Standby_Tim0(void)
{
	HAL_PMU_TIMER0_Start(&hpmu, 5);
	HAL_PMU_Enter_Standby(&hpmu);
}

void PMU_Standby_IO(void)
{
	HAL_PMU_Enter_Standby(&hpmu);
}

void PMU_Init(void)
{
	hpmu.Instance = PMU;
	hpmu.ClkSource = PMU_CLKSOURCE_32RC;
	
	HAL_PMU_Init(&hpmu);
	PMU_Standby_IO();
}

void HAL_PMU_MspInit(PMU_HandleTypeDef *hpmu)
{
	HAL_NVIC_EnableIRQ(PMU_IRQn);
}

void HAL_PMU_MspDeInit(PMU_HandleTypeDef *hpmu)
{
	HAL_NVIC_DisableIRQ(PMU_IRQn);
}
/**************************************end*************************************/

/***********************************5-回调函数*********************************/
void HAL_PMU_Tim0_Callback(PMU_HandleTypeDef *hpmu)
{
	printf("pmu tim0 callback\r\n");
}

void HAL_PMU_IO_Callback(PMU_HandleTypeDef *hpmu)
{
	printf("pmu io callback\r\n");
}
/**************************************end*************************************/

/*********************************6-API接口函数********************************/

/**************************************end*************************************/