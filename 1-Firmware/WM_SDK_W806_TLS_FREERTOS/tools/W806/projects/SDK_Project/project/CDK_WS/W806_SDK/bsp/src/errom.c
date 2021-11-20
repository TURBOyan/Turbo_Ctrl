/*
 * errom.c
 *
 *  Created on: Oct 27, 2021
 *      Author: jiangyuanyuan
 */

/* Includes ------------------------------------------------------------------*/
#include "errom.h"

/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/*----------------------------------------------------------------------------*/
/* Configure ERROM                                                             */
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
void MY_ERROM_Init(void)
{

}

/* USER CODE BEGIN 2 */
void AT24CXX_WriteOneByte(uint8_t WriteAddr,uint8_t *pData,uint8_t len)
{
	HAL_I2C_Write(&hi2c, DEVICE_ADDR, WriteAddr, pData, len);
}

HAL_StatusTypeDef AT24CXX_ReadOneByte(uint8_t ReadAddr,uint8_t *pData,uint8_t len)
{
	return HAL_I2C_Read(&hi2c, DEVICE_ADDR, ReadAddr, pData, len);
}
/* USER CODE END 2 */

/* USER CODE BEGIN 3 */
void MY_ERROM_Test(void)
{
	char *w_buf = "AT24CXX I2C WRITE THEN READ TEST FOR LONG TIME";
	uint8_t len = strlen(w_buf);
	uint8_t r_buf[50] = {0};
	int i = 0;
	
	for (i = 0; i < len; i++)
	{
		AT24CXX_WriteOneByte(0x00 + i, (uint8_t *)(w_buf + i), 1);
		delay_ms(10);
	}
	memset(r_buf, 0, len);
	if (AT24CXX_ReadOneByte(0x00, r_buf, len) != HAL_OK)
	{
		printf("read failed\r\n");
	}
	if (memcmp(w_buf, r_buf, len))
	{
		printf("err: %s\r\n", r_buf);
	}
	printf("%s\r\n",r_buf);
}
/* USER CODE END 3 */

/************************ (C) COPYRIGHT winnermicro *****END OF FILE****/
