/*
 * flash.h
 *
 *  Created on: Oct 27, 2021
 *      Author: jiangyuanyuan
 */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __FLASH_H__
#define __FLASH_H__

/* Includes ------------------------------------------------------------------*/
#include "sys.h"

/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* USER CODE BEGIN Private defines */
#define FLASH_ADDR_LEN 5000
#define TEST_FLASH_ADDR 0x80000
/* USER CODE END Private defines */

extern void MY_Flash_Test(void);

/* USER CODE BEGIN Prototypes */

/* USER CODE END Prototypes */
#endif /*__ FLASH_H__ */

/************************ (C) COPYRIGHT winnermicro *****END OF FILE****/