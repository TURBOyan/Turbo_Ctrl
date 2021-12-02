#ifndef __LED_INT_HH
#define __LED_INT_HH

/**********************头文件********************/
#include "sys.h"
/***********************end**********************/

/**********************宏定义********************/

/***********************end**********************/

/*********************变量声明*******************/

/***********************end**********************/


/*********************函数声明*******************/
extern void Led_Init(void);
extern void Led1_Control(uint8_t sw);
extern void Led2_Control(uint8_t sw);
extern void Led3_Control(uint8_t sw);
extern void Led1_Toggle(void);
extern void Led2_Toggle(void);
extern void Led3_Toggle(void);
/***********************end**********************/
#endif
