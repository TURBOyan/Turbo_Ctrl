/*
 * rtc.h
 *
 *  Created on: Oct 27, 2021
 *      Author: jiangyuanyuan
 */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __RTC_H__
#define __RTC_H__

/* Includes ------------------------------------------------------------------*/
#include "sys.h"

/* USER CODE BEGIN Includes */
#include "pmu.h"
#include "mytask.h"
/* USER CODE END Includes */

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

void MY_RTC_Init(void);
void RTC_Demo(void);
void RTC_Alarm_Demo(void);
void MY_RTC_Task(void);
void MY_RTC_Alarm_Task(void);
/* USER CODE BEGIN Prototypes */
extern RTC_TimeTypeDef time;
/* USER CODE END Prototypes */
#endif /*__ RTC_H__ */

/************************ (C) COPYRIGHT winnermicro *****END OF FILE****/