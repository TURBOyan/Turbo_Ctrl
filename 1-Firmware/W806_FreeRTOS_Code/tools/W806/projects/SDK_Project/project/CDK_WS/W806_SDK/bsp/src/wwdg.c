/*
 * wwdg.c
 *
 *  Created on: Oct 27, 2021
 *      Author: jiangyuanyuan
 */

/* Includes ------------------------------------------------------------------*/
#include "wwdg.h"

/* USER CODE BEGIN 0 */
WDG_HandleTypeDef hwdg;
/* USER CODE END 0 */

/*----------------------------------------------------------------------------*/
/* Configure WWDG                                                             */
/*----------------------------------------------------------------------------*/
/* USER CODE BEGIN 1 */

/* USER CODE END 1 */

/** Configure pins as
        * Analog
        * Input
        * Output
        * EVENT_OUT
        * EXTI
*/
void MY_WWDG_Init(void)
{
	hwdg.Instance = WDG;
	hwdg.Init.Reload = 5 * 1000 * 1000; // 5s
	if (HAL_WDG_Init(&hwdg) != HAL_OK)
	{
		Error_Handler();
	}
}

/* USER CODE BEGIN 2 */
void HAL_WDG_MspInit(WDG_HandleTypeDef* hwdg)
{
	if(hwdg->Instance == WDG)
	{
		HAL_NVIC_SetPriority(WDG_IRQn, 0);
		HAL_NVIC_EnableIRQ(WDG_IRQn);
	}
}
/* USER CODE END 2 */

/* USER CODE BEGIN 3 */

/* USER CODE END 3 */

/************************ (C) COPYRIGHT winnermicro *****END OF FILE****/
