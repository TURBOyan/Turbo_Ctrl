/*
 * init.c
 *
 *  Created on: Oct 27, 2021
 *      Author: jiangyuanyuan
 */

/************************************1-头文件**********************************/
#include "init.h"
/**************************************end*************************************/

/************************************2-宏定义**********************************/

/*************************************end**************************************/

/***********************************3-变量定义*********************************/

/*************************************End**************************************/

/**********************************4-初始化函数********************************/
void bsp_init(void)
{
	Key_Init();
	Led_Init();
	TIM_Init();
	ADC_Init();
	//PMU_Init();
}
/**************************************end*************************************/

/***********************************5-回调函数*********************************/

/**************************************end*************************************/

/*********************************6-API接口函数********************************/

/**************************************end*************************************/