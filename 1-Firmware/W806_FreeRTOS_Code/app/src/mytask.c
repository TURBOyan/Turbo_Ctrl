/*
 * mytask.c
 *
 *  Created on: Oct 27, 2021
 *      Author: jiangyuanyuan
 */
 
/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "mytask.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
#define MY_TASK_01_SIZE	1024
#define MY_TASK_02_SIZE	1024
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
/* USER CODE BEGIN Variables */

/* USER CODE END Variables */

/* Private function prototypes -----------------------------------------------*/
/* USER CODE BEGIN FunctionPrototypes */
void My_Task_01(void *sdata);
void My_Task_02(void *sdata);
/* USER CODE END FunctionPrototypes */

/* USER CODE BEGIN GET_IDLE_TASK_MEMORY */
static OS_STK   my_task_01[MY_TASK_01_SIZE];
static OS_STK   my_task_02[MY_TASK_02_SIZE];
/* USER CODE END GET_IDLE_TASK_MEMORY */

/* Create the thread(s) */
/* definition and creation of MX_FREERTOS_Init */
void MX_FREERTOS_Init(void)
{
	tls_os_init(NULL);
	tls_os_task_create(NULL, NULL,
					   My_Task_01,
					   NULL,
					   (void *) my_task_01, 					/** 任务栈的起始地址 */
					   MY_TASK_01_SIZE,                         /** 任务栈的大小     */
					   5, 0);
					   
	tls_os_task_create(NULL, NULL,
					   My_Task_02,
					   NULL,
					   (void *) my_task_02, 					/** 任务栈的起始地址 */
					   MY_TASK_02_SIZE,                         /** 任务栈的大小     */
					   5, 0);
}

/* USER CODE BEGIN Header_My_Task_01 */
/**
  * @brief  Function implementing the My freertos thread.
  * @param  argument: Not used
  * @retval None
  */
/* USER CODE END Header_My_Task_01 */
void My_Task_01(void *sdata)
{
  /* USER CODE BEGIN My_Task_01 */
  uint8_t uctask1 = 0;
  /* Infinite loop */
  for(;;)
  {
	uctask1 ++;
	printf("My_Task_01:%d\r\n",uctask1);
	//APP_TASK(MY_RTC);
	//APP_TASK(MY_RTC_Alarm);
	tls_os_time_delay(1000);
  }
  /* USER CODE END My_Task_01 */
}

/* USER CODE BEGIN Header_My_Task_02 */
/**
  * @brief  Function implementing the My freertos thread.
  * @param  argument: Not used
  * @retval None
  */
/* USER CODE END Header_My_Task_02 */
void My_Task_02(void *sdata)
{
  /* USER CODE BEGIN My_Task_02 */
  uint8_t uctask2 = 0;
  /* Infinite loop */
  for(;;)
  {
	uctask2 ++;
	printf("My_Task_02:%d\r\n",uctask2);
	tls_os_time_delay(2000);
  }
  /* USER CODE END My_Task_02 */
}

/* Private application code --------------------------------------------------*/
/* USER CODE BEGIN Application */
void vApplicationIdleHook( void )
{

}
/* USER CODE END Application */
