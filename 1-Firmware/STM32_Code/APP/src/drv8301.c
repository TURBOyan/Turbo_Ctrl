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
	delay_us(1);
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
	delay_us(1);
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
	delay_us(1);
	ret = HAL_SPI_TransmitReceive(&hspi1, (uint8_t *)(&tx_buf_), (uint8_t *)(&rx_buf_), 1, 1000);
	if (ret != HAL_OK)
	{
		printf("HAL_SPI_TransmitReceive Err:0x%X\n\r",ret);
		return -1;
	}
	delay_us(1);
	DRV8301_SPI_M1_CS_H;
	

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
	HAL_Delay(10);

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

#define DRV8301_AH_H HAL_GPIO_WritePin(GPIOA, AH_Pin, GPIO_PIN_SET)
#define DRV8301_AH_L HAL_GPIO_WritePin(GPIOA, AH_Pin, GPIO_PIN_RESET)
#define DRV8301_AL_H HAL_GPIO_WritePin(GPIOA, AL_Pin, GPIO_PIN_SET)
#define DRV8301_AL_L HAL_GPIO_WritePin(GPIOA, AL_Pin, GPIO_PIN_RESET)

#define DRV8301_BH_H HAL_GPIO_WritePin(GPIOA, BH_Pin, GPIO_PIN_SET)
#define DRV8301_BH_L HAL_GPIO_WritePin(GPIOA, BH_Pin, GPIO_PIN_RESET)
#define DRV8301_BL_H HAL_GPIO_WritePin(GPIOB, BL_Pin, GPIO_PIN_SET)
#define DRV8301_BL_L HAL_GPIO_WritePin(GPIOB, BL_Pin, GPIO_PIN_RESET)

#define DRV8301_CH_H HAL_GPIO_WritePin(GPIOA, CH_Pin, GPIO_PIN_SET)
#define DRV8301_CH_L HAL_GPIO_WritePin(GPIOA, CH_Pin, GPIO_PIN_RESET)
#define DRV8301_CL_H HAL_GPIO_WritePin(GPIOB, CL_Pin, GPIO_PIN_SET)
#define DRV8301_CL_L HAL_GPIO_WritePin(GPIOB, CL_Pin, GPIO_PIN_RESET) 


// 定义方向和速度变量
static int16_t motor_direction = 1; // 1: 正转, -1: 反转
static uint16_t motor_speed = 2000;  // 转速，单位为毫秒（步之间的延时）
static uint16_t dead_time = 50;     // 死区时间，单位为微秒

// 设置死区时间（模拟）
void DRV8301_DeadTime(void) {
		delay_us(dead_time);
}

// 无刷电机六步换向函数
int16_t DRV8301_Motor_test(int16_t status) {
    if (status == 0) {
        // 停止转动，关闭所有输出
        DRV8301_AH_L;
        DRV8301_AL_L;
        DRV8301_BH_L;
        DRV8301_BL_L;
        DRV8301_CH_L;
        DRV8301_CL_L;
        return 0; // 返回停止状态
    }

    // 启动转动
    for (int step = 1; step <= 6; step++) {
        // 根据方向调整步序
        int current_step = (motor_direction == 1) ? step : (7 - step);

        // 执行六步换向逻辑
        switch (current_step) {
            case 1:
                DRV8301_AH_H; DRV8301_DeadTime(); DRV8301_BL_H;
                DRV8301_AL_L; DRV8301_BH_L; DRV8301_CH_L; DRV8301_CL_L;
                break;
            case 2:
                DRV8301_AH_H; DRV8301_DeadTime(); DRV8301_CL_H;
                DRV8301_AL_L; DRV8301_BH_L; DRV8301_BL_L; DRV8301_CH_L;
                break;
            case 3:
                DRV8301_BH_H; DRV8301_DeadTime();  DRV8301_CL_H;
                DRV8301_AH_L; DRV8301_AL_L; DRV8301_BL_L; DRV8301_CH_L;
                break;
            case 4:
                DRV8301_BH_H; DRV8301_DeadTime();  DRV8301_AL_H;
                DRV8301_AH_L; DRV8301_BL_L; DRV8301_CH_L; DRV8301_CL_L;
                break;
            case 5:
                DRV8301_CH_H; DRV8301_DeadTime();  DRV8301_AL_H;
                DRV8301_AH_L; DRV8301_BH_L; DRV8301_BL_L; DRV8301_CL_L;
                break;
            case 6:
                DRV8301_CH_H; DRV8301_DeadTime(); DRV8301_BL_H;
                DRV8301_AH_L; DRV8301_AL_L; DRV8301_BH_L; DRV8301_CL_L;
                break;
        }

        // 控制速度
				delay_us(motor_speed);
        //HAL_Delay(motor_speed);
    }

    return 1; // 返回运行状态
}
