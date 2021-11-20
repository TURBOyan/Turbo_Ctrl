/*
 * errom.h
 *
 *  Created on: Oct 27, 2021
 *      Author: jiangyuanyuan
 */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __ERROM_H__
#define __ERROM_H__

/* Includes ------------------------------------------------------------------*/
#include "sys.h"

/* USER CODE BEGIN Includes */
#include "iic.h"
#include "delay.h"
/* USER CODE END Includes */

/* USER CODE BEGIN Private defines */
#define AT24C01		127
#define AT24C02		255
#define AT24C04		511
#define AT24C08		1023
#define AT24C16		2047
#define AT24C32		4095
#define AT24C64	    8191
#define AT24C128	16383
#define AT24C256	32767  
//W806开发板使用的是C16，所以定义EE_TYPE为AT24C16
#define DEVICE_ADDR	0xA0
/* USER CODE END Private defines */

void MY_ERROM_Init(void);

/* USER CODE BEGIN Prototypes */
void AT24CXX_WriteOneByte(uint8_t WriteAddr,uint8_t *pData,uint8_t len);
HAL_StatusTypeDef AT24CXX_ReadOneByte(uint8_t ReadAddr,uint8_t *pData,uint8_t len);
void MY_ERROM_Test(void);
/* USER CODE END Prototypes */
#endif /*__ ERROM_H__ */

/************************ (C) COPYRIGHT winnermicro *****END OF FILE****/