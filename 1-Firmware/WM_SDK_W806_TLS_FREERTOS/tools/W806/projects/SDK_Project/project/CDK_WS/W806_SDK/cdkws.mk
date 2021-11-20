.PHONY: clean All Project_Title Project_Build Project_PostBuild

All: Project_Title Project_Build Project_PostBuild

Project_Title:
	@echo "----------Building project:[ W806_SDK_TLS_FreeRTOS - BuildSet ]----------"

Project_Build:
	@make -r -f W806_SDK_TLS_FreeRTOS.mk -j 4 -C  ./ 

Project_PostBuild:
	@echo Executing Post Build commands ...
	@export CDKPath="C:/Drivers/CDK" CDK_VERSION="V2.8.7" ProjectPath="Z:/my_design/CDK/W806/My_Software/WM_SDK_W806_TLS_FREERTOS/tools/W806/projects/SDK_Project/project/CDK_WS/W806_SDK/" && ../../../../../../../tools/W806/utilities/cdk_aft_build.sh;../../../../../../../tools/W806/utilities/aft_build_project.sh
	@echo Done


clean:
	@echo "----------Cleaning project:[ W806_SDK_TLS_FreeRTOS - BuildSet ]----------"

