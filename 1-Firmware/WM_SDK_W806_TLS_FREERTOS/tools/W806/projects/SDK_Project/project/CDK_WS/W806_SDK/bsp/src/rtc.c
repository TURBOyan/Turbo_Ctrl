/*
 * rtc.c
 *
 *  Created on: Oct 27, 2021
 *      Author: jiangyuanyuan
 */

/* Includes ------------------------------------------------------------------*/
#include "rtc.h"

/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/*----------------------------------------------------------------------------*/
/* Configure RTC                                                            */
/*----------------------------------------------------------------------------*/
/* USER CODE BEGIN 1 */
RTC_TimeTypeDef time;
/* USER CODE END 1 */

/** Configure pins as
        * Analog
        * Input
        * Output
        * EVENT_OUT
        * EXTI
*/
void MY_RTC_Init(void)
{
	hpmu.Instance = PMU;
	hpmu.ClkSource = PMU_CLKSOURCE_32RC;
	HAL_PMU_Init(&hpmu);
	
	#if 0
	RTC_Demo();
	#else
	RTC_Alarm_Demo();
	#endif
}

/* USER CODE BEGIN 2 */
void RTC_Demo(void)
{
	time.Year = 21;
	time.Month = 11;
	time.Date = 1;
	time.Hours = 22;
	time.Minutes = 55;
	time.Seconds = 0;
	HAL_PMU_RTC_Start(&hpmu, &time);
}

void RTC_Alarm_Demo(void)
{
	time.Year = 21;
	time.Month = 11;
	time.Date = 1;
	time.Hours = 22;
	time.Minutes = 55;
	time.Seconds = 0;
	HAL_PMU_RTC_Start(&hpmu, &time);
	
	time.Minutes = 56;
	HAL_PMU_RTC_Alarm_Enable(&hpmu, &time);
}
/* USER CODE END 2 */
void MY_RTC_Task(void)
{
	HAL_PMU_RTC_GetTime(&hpmu, &time);
	printf("%d-%d-%d %d:%d:%d\r\n", (time.Year + 2000), time.Month, time.Date, time.Hours, time.Minutes, time.Seconds);
	tls_os_time_delay(1000);
}

void MY_RTC_Alarm_Task(void)
{
	HAL_PMU_RTC_GetTime(&hpmu, &time);
	printf("%d-%d-%d %d:%d:%d\r\n", (time.Year + 1900), time.Month, time.Date, time.Hours, time.Minutes, time.Seconds);
	tls_os_time_delay(1000);
}

void HAL_PMU_RTC_Callback(PMU_HandleTypeDef *hpmu)
{
	printf("rtc irq callback\r\n");
}
/* USER CODE BEGIN 3 */

/* USER CODE END 3 */

/************************ (C) COPYRIGHT winnermicro *****END OF FILE****/
