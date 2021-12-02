/*
 * iic.c
 *
 *  Created on: Oct 27, 2021
 *      Author: jiangyuanyuan
 */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __IIC_H__
#define __IIC_H__

/* Includes ------------------------------------------------------------------*/
#include "sys.h"

/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

void MY_IIC_Init(void);

/* USER CODE BEGIN Prototypes */
extern I2C_HandleTypeDef hi2c;
/* USER CODE END Prototypes */
#endif /*__ IIC_H__ */

/************************ (C) COPYRIGHT winnermicro *****END OF FILE****/