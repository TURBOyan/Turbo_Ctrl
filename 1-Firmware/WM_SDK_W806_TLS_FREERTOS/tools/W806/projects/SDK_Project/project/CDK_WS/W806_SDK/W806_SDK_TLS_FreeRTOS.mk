##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=W806_SDK_TLS_FreeRTOS
ConfigurationName      :=BuildSet
WorkspacePath          :=./
ProjectPath            :=./
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=jyy
Date                   :=02/11/2021
CDKPath                :=C:/Drivers/CDK/
LinkerName             :=csky-elfabiv2-gcc
LinkerNameoption       :=
SIZE                   :=csky-elfabiv2-size
READELF                :=csky-elfabiv2-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=W806
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :=W806_SDK_TLS_FreeRTOS.txt
MakeDirCommand         :=mkdir
LinkOptions            := -mcpu=ck804ef  -mhard-float  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)../../../../../../../ld/W806/gcc_csky.ld"
LinkOtherFlagsOption   :=-Wl,-zmax-page-size=1024 -mhard-float
IncludePackagePath     :=
IncludeCPath           := $(IncludeSwitch)C:/Drivers/CDK/CSKY/MinGW/csky-abiv2-elf-toolchain/csky-elfabiv2/include $(IncludeSwitch). $(IncludeSwitch)../../../../../../../app/inc $(IncludeSwitch)../../../../../../../include $(IncludeSwitch)../../../../../../../include/arch/xt804 $(IncludeSwitch)../../../../../../../include/arch/xt804/csi_core $(IncludeSwitch)../../../../../../../include/arch/xt804/csi_dsp $(IncludeSwitch)../../../../../../../include/driver $(IncludeSwitch)../../../../../../../rtos/include $(IncludeSwitch)../../../../../../../rtos/include/os $(IncludeSwitch)../../../../../../../rtos/ports/xt804 $(IncludeSwitch)bsp/inc  
IncludeAPath           := $(IncludeSwitch)C:/Drivers/CDK/CSKY/csi/csi_core/csi_cdk/ $(IncludeSwitch)C:/Drivers/CDK/CSKY/csi/csi_core/include/ $(IncludeSwitch)C:/Drivers/CDK/CSKY/csi/csi_driver/include/ $(IncludeSwitch). $(IncludeSwitch)../../../../../../../include $(IncludeSwitch)../../../../../../../include/arch/xt804 $(IncludeSwitch)../../../../../../../include/arch/xt804/csi_core $(IncludeSwitch)../../../../../../../include/arch/xt804/csi_dsp $(IncludeSwitch)../../../../../../../include/os $(IncludeSwitch)../../../../../../../include/platform $(IncludeSwitch)../../../../../../../src/app/fatfs $(IncludeSwitch)../../../../../../../src/os/rtos/include $(IncludeSwitch)bsp/inc  
Libs                   := -Wl,--whole-archive  -Wl,--no-whole-archive $(LibrarySwitch)dsp  
ArLibs                 := "dsp" 
PackagesLibPath        :=
LibPath                :=$(LibraryPathSwitch)../../../../../../../lib/W806  $(PackagesLibPath) 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=csky-elfabiv2-ar rcu
CXX      :=csky-elfabiv2-g++
CC       :=csky-elfabiv2-gcc
AS       :=csky-elfabiv2-gcc
OBJDUMP  :=csky-elfabiv2-objdump
OBJCOPY  :=csky-elfabiv2-objcopy
CXXFLAGS := -mcpu=ck804ef  -mhard-float   $(PreprocessorSwitch)GCC_COMPILE=1  $(PreprocessorSwitch)TLS_CONFIG_CPU_XT804=1   -Os  -g3  -Wall  -ffunction-sections -fdata-sections -c 
CFLAGS   := -mcpu=ck804ef  -mhard-float   $(PreprocessorSwitch)GCC_COMPILE=1  $(PreprocessorSwitch)TLS_CONFIG_CPU_XT804=1   -Os  -g3  -Wall  -ffunction-sections -fdata-sections -c 
ASFLAGS  := -mcpu=ck804ef  -mhard-float    -Wa,--gdwarf2    


Objects0=$(IntermediateDirectory)/rtos_wm_osal_rtos$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_gpio$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_uart$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_cpu$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_hal$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_spi$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_wdg$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_tim$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_internal_flash$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_adc$(ObjectSuffix) \
	$(IntermediateDirectory)/drivers_wm_pwm$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_pmu$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_spi_flash$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_i2c$(ObjectSuffix) $(IntermediateDirectory)/drivers_wm_touch$(ObjectSuffix) $(IntermediateDirectory)/src_main$(ObjectSuffix) $(IntermediateDirectory)/src_wm_hal_msp$(ObjectSuffix) $(IntermediateDirectory)/src_wm_it$(ObjectSuffix) $(IntermediateDirectory)/src_mytask$(ObjectSuffix) $(IntermediateDirectory)/source_croutine$(ObjectSuffix) \
	$(IntermediateDirectory)/source_heap_2$(ObjectSuffix) $(IntermediateDirectory)/source_heap_3$(ObjectSuffix) $(IntermediateDirectory)/source_list$(ObjectSuffix) $(IntermediateDirectory)/source_queue$(ObjectSuffix) $(IntermediateDirectory)/source_rtostimers$(ObjectSuffix) $(IntermediateDirectory)/source_tasks$(ObjectSuffix) $(IntermediateDirectory)/src_adc$(ObjectSuffix) $(IntermediateDirectory)/src_delay$(ObjectSuffix) $(IntermediateDirectory)/src_flash$(ObjectSuffix) $(IntermediateDirectory)/src_init$(ObjectSuffix) \
	$(IntermediateDirectory)/src_key$(ObjectSuffix) $(IntermediateDirectory)/src_led$(ObjectSuffix) $(IntermediateDirectory)/src_pmu$(ObjectSuffix) $(IntermediateDirectory)/src_style$(ObjectSuffix) $(IntermediateDirectory)/src_sys$(ObjectSuffix) $(IntermediateDirectory)/src_tim$(ObjectSuffix) $(IntermediateDirectory)/src_pwm$(ObjectSuffix) $(IntermediateDirectory)/src_iic$(ObjectSuffix) $(IntermediateDirectory)/src_oled$(ObjectSuffix) $(IntermediateDirectory)/src_i2c$(ObjectSuffix) \
	$(IntermediateDirectory)/src_codetab$(ObjectSuffix) $(IntermediateDirectory)/src_motor$(ObjectSuffix) $(IntermediateDirectory)/src_rgb$(ObjectSuffix) $(IntermediateDirectory)/src_rtc$(ObjectSuffix) $(IntermediateDirectory)/src_errom$(ObjectSuffix) 

Objects1=$(IntermediateDirectory)/src_wwdg$(ObjectSuffix) $(IntermediateDirectory)/xt804_cpu_task_sw$(ObjectSuffix) $(IntermediateDirectory)/xt804_port$(ObjectSuffix) $(IntermediateDirectory)/bsp_startup$(ObjectSuffix) $(IntermediateDirectory)/bsp_system$(ObjectSuffix) \
	$(IntermediateDirectory)/bsp_trap_c$(ObjectSuffix) $(IntermediateDirectory)/bsp_vectors$(ObjectSuffix) $(IntermediateDirectory)/bsp_board_init$(ObjectSuffix) $(IntermediateDirectory)/libc_libc_port$(ObjectSuffix) $(IntermediateDirectory)/__rt_entry$(ObjectSuffix) 



Objects=$(Objects0) $(Objects1) 

##
## Main Build Targets 
##
.PHONY: all
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile):  $(Objects) Always_Link 
	$(LinkerName) $(OutputSwitch) $(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) $(LinkerNameoption) $(LinkOtherFlagsOption)  -Wl,--ckmap=$(ProjectPath)/Lst/$(OutputFile).map  @$(ObjectsFileList)  $(LinkOptions) $(LibPath) $(Libs)
	@mv $(ProjectPath)/Lst/$(OutputFile).map $(ProjectPath)/Lst/$(OutputFile).temp && $(READELF) $(ElfInfoSwitch) $(ProjectPath)/Obj/$(OutputFile)$(ExeSuffix) > $(ProjectPath)/Lst/$(OutputFile).map && echo ====================================================================== >> $(ProjectPath)/Lst/$(OutputFile).map && cat $(ProjectPath)/Lst/$(OutputFile).temp >> $(ProjectPath)/Lst/$(OutputFile).map && rm -rf $(ProjectPath)/Lst/$(OutputFile).temp
		$(OBJDUMP) $(ObjdumpSwitch) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix)  > $(ProjectPath)/Lst/$(OutputFile)$(DisassemSuffix) 
	@echo size of target:
	@$(SIZE) $(ProjectPath)$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@echo -n checksum value of target:  
	@$(CHECKSUM) $(ProjectPath)/$(IntermediateDirectory)/$(OutputFile)$(ExeSuffix) 
	@$(ProjectName).modify.bat $(IntermediateDirectory) $(OutputFile)$(ExeSuffix) 

Always_Link:


##
## Objects
##
$(IntermediateDirectory)/rtos_wm_osal_rtos$(ObjectSuffix): ../../../../../../../rtos/wm_osal_rtos.c  
	$(CC) $(SourceSwitch) ../../../../../../../rtos/wm_osal_rtos.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/rtos_wm_osal_rtos$(ObjectSuffix) -MF$(IntermediateDirectory)/rtos_wm_osal_rtos$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/rtos_wm_osal_rtos$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/rtos_wm_osal_rtos$(PreprocessSuffix): ../../../../../../../rtos/wm_osal_rtos.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/rtos_wm_osal_rtos$(PreprocessSuffix) ../../../../../../../rtos/wm_osal_rtos.c

$(IntermediateDirectory)/drivers_wm_gpio$(ObjectSuffix): ../../../../../../../platform/drivers/wm_gpio.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_gpio.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_gpio$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_gpio$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_gpio$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_gpio$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_gpio.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_gpio$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_gpio.c

$(IntermediateDirectory)/drivers_wm_uart$(ObjectSuffix): ../../../../../../../platform/drivers/wm_uart.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_uart.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_uart$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_uart$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_uart$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_uart$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_uart.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_uart$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_uart.c

$(IntermediateDirectory)/drivers_wm_cpu$(ObjectSuffix): ../../../../../../../platform/drivers/wm_cpu.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_cpu.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_cpu$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_cpu$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_cpu$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_cpu$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_cpu.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_cpu$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_cpu.c

$(IntermediateDirectory)/drivers_wm_hal$(ObjectSuffix): ../../../../../../../platform/drivers/wm_hal.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_hal.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_hal$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_hal$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_hal$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_hal$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_hal.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_hal$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_hal.c

$(IntermediateDirectory)/drivers_wm_spi$(ObjectSuffix): ../../../../../../../platform/drivers/wm_spi.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_spi.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_spi$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_spi$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_spi$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_spi$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_spi.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_spi$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_spi.c

$(IntermediateDirectory)/drivers_wm_wdg$(ObjectSuffix): ../../../../../../../platform/drivers/wm_wdg.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_wdg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_wdg$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_wdg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_wdg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_wdg$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_wdg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_wdg$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_wdg.c

$(IntermediateDirectory)/drivers_wm_tim$(ObjectSuffix): ../../../../../../../platform/drivers/wm_tim.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_tim.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_tim$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_tim$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_tim$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_tim$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_tim.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_tim$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_tim.c

$(IntermediateDirectory)/drivers_wm_internal_flash$(ObjectSuffix): ../../../../../../../platform/drivers/wm_internal_flash.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_internal_flash.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_internal_flash$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_internal_flash$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_internal_flash$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_internal_flash$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_internal_flash.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_internal_flash$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_internal_flash.c

$(IntermediateDirectory)/drivers_wm_adc$(ObjectSuffix): ../../../../../../../platform/drivers/wm_adc.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_adc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_adc$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_adc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_adc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_adc$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_adc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_adc$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_adc.c

$(IntermediateDirectory)/drivers_wm_pwm$(ObjectSuffix): ../../../../../../../platform/drivers/wm_pwm.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_pwm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_pwm$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_pwm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_pwm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_pwm$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_pwm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_pwm$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_pwm.c

$(IntermediateDirectory)/drivers_wm_pmu$(ObjectSuffix): ../../../../../../../platform/drivers/wm_pmu.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_pmu.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_pmu$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_pmu$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_pmu$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_pmu$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_pmu.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_pmu$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_pmu.c

$(IntermediateDirectory)/drivers_wm_spi_flash$(ObjectSuffix): ../../../../../../../platform/drivers/wm_spi_flash.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_spi_flash.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_spi_flash$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_spi_flash$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_spi_flash$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_spi_flash$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_spi_flash.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_spi_flash$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_spi_flash.c

$(IntermediateDirectory)/drivers_wm_i2c$(ObjectSuffix): ../../../../../../../platform/drivers/wm_i2c.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_i2c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_i2c$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_i2c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_i2c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_i2c$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_i2c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_i2c$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_i2c.c

$(IntermediateDirectory)/drivers_wm_touch$(ObjectSuffix): ../../../../../../../platform/drivers/wm_touch.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/drivers/wm_touch.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/drivers_wm_touch$(ObjectSuffix) -MF$(IntermediateDirectory)/drivers_wm_touch$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/drivers_wm_touch$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/drivers_wm_touch$(PreprocessSuffix): ../../../../../../../platform/drivers/wm_touch.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/drivers_wm_touch$(PreprocessSuffix) ../../../../../../../platform/drivers/wm_touch.c

$(IntermediateDirectory)/src_main$(ObjectSuffix): ../../../../../../../app/src/main.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/main.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_main$(ObjectSuffix) -MF$(IntermediateDirectory)/src_main$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_main$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_main$(PreprocessSuffix): ../../../../../../../app/src/main.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_main$(PreprocessSuffix) ../../../../../../../app/src/main.c

$(IntermediateDirectory)/src_wm_hal_msp$(ObjectSuffix): ../../../../../../../app/src/wm_hal_msp.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/wm_hal_msp.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_wm_hal_msp$(ObjectSuffix) -MF$(IntermediateDirectory)/src_wm_hal_msp$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_wm_hal_msp$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_wm_hal_msp$(PreprocessSuffix): ../../../../../../../app/src/wm_hal_msp.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_wm_hal_msp$(PreprocessSuffix) ../../../../../../../app/src/wm_hal_msp.c

$(IntermediateDirectory)/src_wm_it$(ObjectSuffix): ../../../../../../../app/src/wm_it.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/wm_it.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_wm_it$(ObjectSuffix) -MF$(IntermediateDirectory)/src_wm_it$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_wm_it$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_wm_it$(PreprocessSuffix): ../../../../../../../app/src/wm_it.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_wm_it$(PreprocessSuffix) ../../../../../../../app/src/wm_it.c

$(IntermediateDirectory)/src_mytask$(ObjectSuffix): ../../../../../../../app/src/mytask.c  
	$(CC) $(SourceSwitch) ../../../../../../../app/src/mytask.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_mytask$(ObjectSuffix) -MF$(IntermediateDirectory)/src_mytask$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_mytask$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_mytask$(PreprocessSuffix): ../../../../../../../app/src/mytask.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_mytask$(PreprocessSuffix) ../../../../../../../app/src/mytask.c

$(IntermediateDirectory)/source_croutine$(ObjectSuffix): ../../../../../../../rtos/source/croutine.c  
	$(CC) $(SourceSwitch) ../../../../../../../rtos/source/croutine.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/source_croutine$(ObjectSuffix) -MF$(IntermediateDirectory)/source_croutine$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/source_croutine$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/source_croutine$(PreprocessSuffix): ../../../../../../../rtos/source/croutine.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/source_croutine$(PreprocessSuffix) ../../../../../../../rtos/source/croutine.c

$(IntermediateDirectory)/source_heap_2$(ObjectSuffix): ../../../../../../../rtos/source/heap_2.c  
	$(CC) $(SourceSwitch) ../../../../../../../rtos/source/heap_2.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/source_heap_2$(ObjectSuffix) -MF$(IntermediateDirectory)/source_heap_2$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/source_heap_2$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/source_heap_2$(PreprocessSuffix): ../../../../../../../rtos/source/heap_2.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/source_heap_2$(PreprocessSuffix) ../../../../../../../rtos/source/heap_2.c

$(IntermediateDirectory)/source_heap_3$(ObjectSuffix): ../../../../../../../rtos/source/heap_3.c  
	$(CC) $(SourceSwitch) ../../../../../../../rtos/source/heap_3.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/source_heap_3$(ObjectSuffix) -MF$(IntermediateDirectory)/source_heap_3$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/source_heap_3$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/source_heap_3$(PreprocessSuffix): ../../../../../../../rtos/source/heap_3.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/source_heap_3$(PreprocessSuffix) ../../../../../../../rtos/source/heap_3.c

$(IntermediateDirectory)/source_list$(ObjectSuffix): ../../../../../../../rtos/source/list.c  
	$(CC) $(SourceSwitch) ../../../../../../../rtos/source/list.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/source_list$(ObjectSuffix) -MF$(IntermediateDirectory)/source_list$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/source_list$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/source_list$(PreprocessSuffix): ../../../../../../../rtos/source/list.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/source_list$(PreprocessSuffix) ../../../../../../../rtos/source/list.c

$(IntermediateDirectory)/source_queue$(ObjectSuffix): ../../../../../../../rtos/source/queue.c  
	$(CC) $(SourceSwitch) ../../../../../../../rtos/source/queue.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/source_queue$(ObjectSuffix) -MF$(IntermediateDirectory)/source_queue$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/source_queue$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/source_queue$(PreprocessSuffix): ../../../../../../../rtos/source/queue.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/source_queue$(PreprocessSuffix) ../../../../../../../rtos/source/queue.c

$(IntermediateDirectory)/source_rtostimers$(ObjectSuffix): ../../../../../../../rtos/source/rtostimers.c  
	$(CC) $(SourceSwitch) ../../../../../../../rtos/source/rtostimers.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/source_rtostimers$(ObjectSuffix) -MF$(IntermediateDirectory)/source_rtostimers$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/source_rtostimers$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/source_rtostimers$(PreprocessSuffix): ../../../../../../../rtos/source/rtostimers.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/source_rtostimers$(PreprocessSuffix) ../../../../../../../rtos/source/rtostimers.c

$(IntermediateDirectory)/source_tasks$(ObjectSuffix): ../../../../../../../rtos/source/tasks.c  
	$(CC) $(SourceSwitch) ../../../../../../../rtos/source/tasks.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/source_tasks$(ObjectSuffix) -MF$(IntermediateDirectory)/source_tasks$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/source_tasks$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/source_tasks$(PreprocessSuffix): ../../../../../../../rtos/source/tasks.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/source_tasks$(PreprocessSuffix) ../../../../../../../rtos/source/tasks.c

$(IntermediateDirectory)/src_adc$(ObjectSuffix): bsp/src/adc.c  
	$(CC) $(SourceSwitch) bsp/src/adc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_adc$(ObjectSuffix) -MF$(IntermediateDirectory)/src_adc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_adc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_adc$(PreprocessSuffix): bsp/src/adc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_adc$(PreprocessSuffix) bsp/src/adc.c

$(IntermediateDirectory)/src_delay$(ObjectSuffix): bsp/src/delay.c  
	$(CC) $(SourceSwitch) bsp/src/delay.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_delay$(ObjectSuffix) -MF$(IntermediateDirectory)/src_delay$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_delay$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_delay$(PreprocessSuffix): bsp/src/delay.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_delay$(PreprocessSuffix) bsp/src/delay.c

$(IntermediateDirectory)/src_flash$(ObjectSuffix): bsp/src/flash.c  
	$(CC) $(SourceSwitch) bsp/src/flash.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_flash$(ObjectSuffix) -MF$(IntermediateDirectory)/src_flash$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_flash$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_flash$(PreprocessSuffix): bsp/src/flash.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_flash$(PreprocessSuffix) bsp/src/flash.c

$(IntermediateDirectory)/src_init$(ObjectSuffix): bsp/src/init.c  
	$(CC) $(SourceSwitch) bsp/src/init.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_init$(ObjectSuffix) -MF$(IntermediateDirectory)/src_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_init$(PreprocessSuffix): bsp/src/init.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_init$(PreprocessSuffix) bsp/src/init.c

$(IntermediateDirectory)/src_key$(ObjectSuffix): bsp/src/key.c  
	$(CC) $(SourceSwitch) bsp/src/key.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_key$(ObjectSuffix) -MF$(IntermediateDirectory)/src_key$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_key$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_key$(PreprocessSuffix): bsp/src/key.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_key$(PreprocessSuffix) bsp/src/key.c

$(IntermediateDirectory)/src_led$(ObjectSuffix): bsp/src/led.c  
	$(CC) $(SourceSwitch) bsp/src/led.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_led$(ObjectSuffix) -MF$(IntermediateDirectory)/src_led$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_led$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_led$(PreprocessSuffix): bsp/src/led.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_led$(PreprocessSuffix) bsp/src/led.c

$(IntermediateDirectory)/src_pmu$(ObjectSuffix): bsp/src/pmu.c  
	$(CC) $(SourceSwitch) bsp/src/pmu.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_pmu$(ObjectSuffix) -MF$(IntermediateDirectory)/src_pmu$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_pmu$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_pmu$(PreprocessSuffix): bsp/src/pmu.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_pmu$(PreprocessSuffix) bsp/src/pmu.c

$(IntermediateDirectory)/src_style$(ObjectSuffix): bsp/src/style.c  
	$(CC) $(SourceSwitch) bsp/src/style.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_style$(ObjectSuffix) -MF$(IntermediateDirectory)/src_style$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_style$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_style$(PreprocessSuffix): bsp/src/style.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_style$(PreprocessSuffix) bsp/src/style.c

$(IntermediateDirectory)/src_sys$(ObjectSuffix): bsp/src/sys.c  
	$(CC) $(SourceSwitch) bsp/src/sys.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_sys$(ObjectSuffix) -MF$(IntermediateDirectory)/src_sys$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_sys$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_sys$(PreprocessSuffix): bsp/src/sys.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_sys$(PreprocessSuffix) bsp/src/sys.c

$(IntermediateDirectory)/src_tim$(ObjectSuffix): bsp/src/tim.c  
	$(CC) $(SourceSwitch) bsp/src/tim.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_tim$(ObjectSuffix) -MF$(IntermediateDirectory)/src_tim$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_tim$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_tim$(PreprocessSuffix): bsp/src/tim.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_tim$(PreprocessSuffix) bsp/src/tim.c

$(IntermediateDirectory)/src_pwm$(ObjectSuffix): bsp/src/pwm.c  
	$(CC) $(SourceSwitch) bsp/src/pwm.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_pwm$(ObjectSuffix) -MF$(IntermediateDirectory)/src_pwm$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_pwm$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_pwm$(PreprocessSuffix): bsp/src/pwm.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_pwm$(PreprocessSuffix) bsp/src/pwm.c

$(IntermediateDirectory)/src_iic$(ObjectSuffix): bsp/src/iic.c  
	$(CC) $(SourceSwitch) bsp/src/iic.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_iic$(ObjectSuffix) -MF$(IntermediateDirectory)/src_iic$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_iic$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_iic$(PreprocessSuffix): bsp/src/iic.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_iic$(PreprocessSuffix) bsp/src/iic.c

$(IntermediateDirectory)/src_oled$(ObjectSuffix): bsp/src/oled.c  
	$(CC) $(SourceSwitch) bsp/src/oled.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_oled$(ObjectSuffix) -MF$(IntermediateDirectory)/src_oled$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_oled$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_oled$(PreprocessSuffix): bsp/src/oled.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_oled$(PreprocessSuffix) bsp/src/oled.c

$(IntermediateDirectory)/src_i2c$(ObjectSuffix): bsp/src/i2c.c  
	$(CC) $(SourceSwitch) bsp/src/i2c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_i2c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_i2c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_i2c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_i2c$(PreprocessSuffix): bsp/src/i2c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_i2c$(PreprocessSuffix) bsp/src/i2c.c

$(IntermediateDirectory)/src_codetab$(ObjectSuffix): bsp/src/codetab.c  
	$(CC) $(SourceSwitch) bsp/src/codetab.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_codetab$(ObjectSuffix) -MF$(IntermediateDirectory)/src_codetab$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_codetab$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_codetab$(PreprocessSuffix): bsp/src/codetab.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_codetab$(PreprocessSuffix) bsp/src/codetab.c

$(IntermediateDirectory)/src_motor$(ObjectSuffix): bsp/src/motor.c  
	$(CC) $(SourceSwitch) bsp/src/motor.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_motor$(ObjectSuffix) -MF$(IntermediateDirectory)/src_motor$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_motor$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_motor$(PreprocessSuffix): bsp/src/motor.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_motor$(PreprocessSuffix) bsp/src/motor.c

$(IntermediateDirectory)/src_rgb$(ObjectSuffix): bsp/src/rgb.c  
	$(CC) $(SourceSwitch) bsp/src/rgb.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_rgb$(ObjectSuffix) -MF$(IntermediateDirectory)/src_rgb$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_rgb$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_rgb$(PreprocessSuffix): bsp/src/rgb.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_rgb$(PreprocessSuffix) bsp/src/rgb.c

$(IntermediateDirectory)/src_rtc$(ObjectSuffix): bsp/src/rtc.c  
	$(CC) $(SourceSwitch) bsp/src/rtc.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_rtc$(ObjectSuffix) -MF$(IntermediateDirectory)/src_rtc$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_rtc$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_rtc$(PreprocessSuffix): bsp/src/rtc.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_rtc$(PreprocessSuffix) bsp/src/rtc.c

$(IntermediateDirectory)/src_errom$(ObjectSuffix): bsp/src/errom.c  
	$(CC) $(SourceSwitch) bsp/src/errom.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_errom$(ObjectSuffix) -MF$(IntermediateDirectory)/src_errom$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_errom$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_errom$(PreprocessSuffix): bsp/src/errom.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_errom$(PreprocessSuffix) bsp/src/errom.c

$(IntermediateDirectory)/src_wwdg$(ObjectSuffix): bsp/src/wwdg.c  
	$(CC) $(SourceSwitch) bsp/src/wwdg.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_wwdg$(ObjectSuffix) -MF$(IntermediateDirectory)/src_wwdg$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_wwdg$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_wwdg$(PreprocessSuffix): bsp/src/wwdg.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_wwdg$(PreprocessSuffix) bsp/src/wwdg.c

$(IntermediateDirectory)/xt804_cpu_task_sw$(ObjectSuffix): ../../../../../../../rtos/ports/xt804/cpu_task_sw.S  
	$(AS) $(SourceSwitch) ../../../../../../../rtos/ports/xt804/cpu_task_sw.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/xt804_cpu_task_sw$(ObjectSuffix) -MF$(IntermediateDirectory)/xt804_cpu_task_sw$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/xt804_cpu_task_sw$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/xt804_cpu_task_sw$(PreprocessSuffix): ../../../../../../../rtos/ports/xt804/cpu_task_sw.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/xt804_cpu_task_sw$(PreprocessSuffix) ../../../../../../../rtos/ports/xt804/cpu_task_sw.S

$(IntermediateDirectory)/xt804_port$(ObjectSuffix): ../../../../../../../rtos/ports/xt804/port.c  
	$(CC) $(SourceSwitch) ../../../../../../../rtos/ports/xt804/port.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/xt804_port$(ObjectSuffix) -MF$(IntermediateDirectory)/xt804_port$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/xt804_port$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/xt804_port$(PreprocessSuffix): ../../../../../../../rtos/ports/xt804/port.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/xt804_port$(PreprocessSuffix) ../../../../../../../rtos/ports/xt804/port.c

$(IntermediateDirectory)/bsp_startup$(ObjectSuffix): ../../../../../../../platform/arch/xt804/bsp/startup.S  
	$(AS) $(SourceSwitch) ../../../../../../../platform/arch/xt804/bsp/startup.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_startup$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_startup$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_startup$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/bsp_startup$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/bsp/startup.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_startup$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/bsp/startup.S

$(IntermediateDirectory)/bsp_system$(ObjectSuffix): ../../../../../../../platform/arch/xt804/bsp/system.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/arch/xt804/bsp/system.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_system$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_system$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_system$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/bsp_system$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/bsp/system.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_system$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/bsp/system.c

$(IntermediateDirectory)/bsp_trap_c$(ObjectSuffix): ../../../../../../../platform/arch/xt804/bsp/trap_c.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/arch/xt804/bsp/trap_c.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_trap_c$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_trap_c$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_trap_c$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/bsp_trap_c$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/bsp/trap_c.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_trap_c$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/bsp/trap_c.c

$(IntermediateDirectory)/bsp_vectors$(ObjectSuffix): ../../../../../../../platform/arch/xt804/bsp/vectors.S  
	$(AS) $(SourceSwitch) ../../../../../../../platform/arch/xt804/bsp/vectors.S $(ASFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_vectors$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_vectors$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_vectors$(ObjectSuffix) $(IncludeAPath) $(IncludePackagePath)
Lst/bsp_vectors$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/bsp/vectors.S
	$(CC) $(CFLAGS)$(IncludeAPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_vectors$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/bsp/vectors.S

$(IntermediateDirectory)/bsp_board_init$(ObjectSuffix): ../../../../../../../platform/arch/xt804/bsp/board_init.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/arch/xt804/bsp/board_init.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/bsp_board_init$(ObjectSuffix) -MF$(IntermediateDirectory)/bsp_board_init$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/bsp_board_init$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/bsp_board_init$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/bsp/board_init.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/bsp_board_init$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/bsp/board_init.c

$(IntermediateDirectory)/libc_libc_port$(ObjectSuffix): ../../../../../../../platform/arch/xt804/libc/libc_port.c  
	$(CC) $(SourceSwitch) ../../../../../../../platform/arch/xt804/libc/libc_port.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/libc_libc_port$(ObjectSuffix) -MF$(IntermediateDirectory)/libc_libc_port$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/libc_libc_port$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/libc_libc_port$(PreprocessSuffix): ../../../../../../../platform/arch/xt804/libc/libc_port.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/libc_libc_port$(PreprocessSuffix) ../../../../../../../platform/arch/xt804/libc/libc_port.c


$(IntermediateDirectory)/__rt_entry$(ObjectSuffix): $(IntermediateDirectory)/__rt_entry$(DependSuffix)
	@$(AS) $(SourceSwitch) $(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) $(IncludeAPath)
$(IntermediateDirectory)/__rt_entry$(DependSuffix):
	@$(CC) $(CFLAGS) $(IncludeAPath) -MG -MP -MT$(IntermediateDirectory)/__rt_entry$(ObjectSuffix) -MF$(IntermediateDirectory)/__rt_entry$(DependSuffix) -MM $(ProjectPath)/$(IntermediateDirectory)/__rt_entry.S

-include $(IntermediateDirectory)/*$(DependSuffix)
