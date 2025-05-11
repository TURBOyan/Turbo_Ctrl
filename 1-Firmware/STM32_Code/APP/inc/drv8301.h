#ifndef __DRV8301_H__
#define __DRV8301_H__

#ifdef __cplusplus
extern "C" {
#endif

#include <string.h>
#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>

#define DRV8301_SPI_M1_CS_H  HAL_GPIO_WritePin(SPI_CS_GPIO_Port, SPI_CS_Pin, GPIO_PIN_SET)
#define DRV8301_SPI_M1_CS_L  HAL_GPIO_WritePin(SPI_CS_GPIO_Port, SPI_CS_Pin, GPIO_PIN_RESET)
#define DRV8301_GATE_ENABLE  HAL_GPIO_WritePin(GPIOB, EN_GATE_Pin, GPIO_PIN_SET)
#define DRV8301_GATE_DISABLE HAL_GPIO_WritePin(GPIOB, EN_GATE_Pin, GPIO_PIN_RESET)

typedef enum{
		DRV8301_CtrlMode_Read = 1 << 15,   //!< Read Mode
		DRV8301_CtrlMode_Write = 0 << 15   //!< Write Mode
}CtrlMode_e;

typedef enum
{
		kRegNameStatus1  = 0 << 11,  //!< Status Register 1
		kRegNameStatus2  = 1 << 11,  //!< Status Register 2
		kRegNameControl1 = 2 << 11,  //!< Control Register 1
		kRegNameControl2 = 3 << 11   //!< Control Register 2
}RegName_e;

typedef struct
{
		uint16_t control_register_1;
		uint16_t control_register_2;
}RegisterFile;


bool DRV8301_Config(RegisterFile* pRegs, float requested_gain, float* actual_gain);
int16_t DRV8301_Init(RegisterFile* pRegs);
int16_t DRV8301_Motor_test(int16_t status);

#ifdef __cplusplus
}
#endif

#endif /* __DRV8301_H__ */