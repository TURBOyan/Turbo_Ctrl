#include "drv8301.h"
#include "utils.h"

#include "stm32f0xx_hal.h"

#include "spi.h"


static inline uint16_t build_ctrl_word(const CtrlMode_e ctrlMode,
																			 const RegName_e regName,
																			 const uint16_t data) {
		return ctrlMode | regName | (data & 0x07FF);
}

int16_t DRV8301_ReadReg(const RegName_e regName, uint16_t* data)
{
	int16_t ret = 0;
	uint16_t tx_buf_=0, rx_buf_=0;
	tx_buf_ = build_ctrl_word(DRV8301_CtrlMode_Read, regName, 0);
	DRV8301_SPI_M1_CS_L;
	ret = HAL_SPI_TransmitReceive(&hspi1, (uint8_t *)(&tx_buf_), (uint8_t *)(&rx_buf_), 1, 1000);
	if (ret != HAL_OK)
	{
		printf("HAL_SPI_TransmitReceive Err:0x%X\n\r",ret);
		return -1;
	}
	DRV8301_SPI_M1_CS_H;
	
	delay_us(1);
	
	tx_buf_ = build_ctrl_word(DRV8301_CtrlMode_Read, regName, 0);
	rx_buf_ = 0xffff;
	DRV8301_SPI_M1_CS_L;
	ret = HAL_SPI_TransmitReceive(&hspi1, (uint8_t *)(&tx_buf_), (uint8_t *)(&rx_buf_), 1, 1000);
	if (ret != HAL_OK)
	{
		printf("HAL_SPI_TransmitReceive Err:0x%X\n\r",ret);
		return -1;
	}
	DRV8301_SPI_M1_CS_H;

	delay_us(1);

	if (rx_buf_ == 0xbeef) {
			return -3;
	}

	if (data) {
			*data = rx_buf_ & 0x07FF;
	}
	
	return 0;
}

int16_t DRV8301_WriteReg(const RegName_e regName, const uint16_t data)
{
	int16_t ret = 0;
	uint16_t tx_buf_=0, rx_buf_=0;
	// Do blocking write
	tx_buf_ = build_ctrl_word(DRV8301_CtrlMode_Write, regName, data);
	DRV8301_SPI_M1_CS_L;
	ret = HAL_SPI_TransmitReceive(&hspi1, (uint8_t *)(&tx_buf_), (uint8_t *)(&rx_buf_), 1, 1000);
	if (ret != HAL_OK)
	{
		printf("HAL_SPI_TransmitReceive Err:0x%X\n\r",ret);
		return -1;
	}
	DRV8301_SPI_M1_CS_H;
	delay_us(1);

	return 0;
}

bool DRV8301_Config(RegisterFile* pRegs, float requested_gain, float* actual_gain)
{
    // Calculate gain setting: Snap down to have equal or larger range as
    // requested or largest possible range otherwise

    // for reference:
    // 20V/V on 500uOhm gives a range of +/- 150A
    // 40V/V on 500uOhm gives a range of +/- 75A
    // 20V/V on 666uOhm gives a range of +/- 110A
    // 40V/V on 666uOhm gives a range of +/- 55A

    uint16_t gain_setting = 3;
    float gain_choices[] = {10.0f, 20.0f, 40.0f, 80.0f};
    while (gain_setting && (gain_choices[gain_setting] > requested_gain)) {
        gain_setting--;
    }

    if (actual_gain) {
        *actual_gain = gain_choices[gain_setting];
    }

    RegisterFile new_config;

    new_config.control_register_1 =
          (21 << 6) // Overcurrent set to approximately 150A at 100degC. This may need tweaking.
        | (0b01 << 4) // OCP_MODE: latch shut down
        | (0b0 << 3) // 6x PWM mode
        | (0b0 << 2) // don't reset latched faults
        | (0b00 << 0); // gate-drive peak current: 1.7A

    new_config.control_register_2 =
          (0b0 << 6) // OC_TOFF: cycle by cycle
        | (0b00 << 4) // calibration off (normal operation)
        | (gain_setting << 2) // select gain
        | (0b00 << 0); // report both over temperature and over current on nOCTW pin

    int16_t regs_equal = (pRegs->control_register_1 == new_config.control_register_1)
											&& (pRegs->control_register_2 == new_config.control_register_2);

    if (!regs_equal)
		{
				memcpy((void*)pRegs, (const void*)&new_config, (uint32_t)sizeof(new_config));
        DRV8301_GATE_ENABLE;
    }
		
		//printf("DRV8301_Config success\n\r");

    return 0;
}

int16_t DRV8301_Init(RegisterFile* pRegs)
{
	int16_t ret = 0;
	uint16_t val;
	
	DRV8301_GATE_DISABLE;
	delay_us(100*1000);
	DRV8301_GATE_ENABLE;
	delay_us(100);

	int16_t wrote_regs =  DRV8301_WriteReg(kRegNameControl1, pRegs->control_register_1)
											+ DRV8301_WriteReg(kRegNameControl1, pRegs->control_register_1)
											+ DRV8301_WriteReg(kRegNameControl1, pRegs->control_register_1)
											+ DRV8301_WriteReg(kRegNameControl1, pRegs->control_register_1)
											+ DRV8301_WriteReg(kRegNameControl1, pRegs->control_register_1)
											+ DRV8301_WriteReg(kRegNameControl2, pRegs->control_register_2);
	if(wrote_regs != 0)
	{
			return -1;
	}
	
	delay_us(100);

	ret = DRV8301_ReadReg(kRegNameControl1, &val);
	if(val != pRegs->control_register_1)
	{
		printf("set kRegNameControl1 Error,ret:%d actual:0x%X expect:0x%X\n\r",ret, val, pRegs->control_register_1);
		return -2;
	}
	
	ret = DRV8301_ReadReg(kRegNameControl2, &val);
	if(val != pRegs->control_register_2)
	{
		printf("set kRegNameControl2 Error,ret:%d actual:0x%X expect:0x%X\n\r",ret, val, pRegs->control_register_2);
		return -3;
	}
	
	printf("DRV8301_Init success\n\r");

	return 0;
}

//SPI参数配置测试
int16_t DRV8301_SPI_test(void)
{
	int16_t ret = 0;
	RegisterFile regs_;
	float actual_gain;
	ret = DRV8301_Config(&regs_, 40.0f, &actual_gain);
	if(ret != 0)
	{
		printf("DRV8301_Config Err:%d\n\r",ret);
	}
	ret = DRV8301_Init(&regs_);
	if(ret != 0)
	{
		printf("DRV8301_Init Err:%d\n\r",ret);
	}
	return 0;
}


int16_t DRV8301_Motor_test(int16_t status)
{
	
}

