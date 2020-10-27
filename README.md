# PlatformIO container with preinstalled toolchain for zephyr on ststm32 platform

This docker image can be used to build PlatformIO projects within a docker container. It has no entrypoint so you have to provide the command by yourself. This e.g. usefull if you want to run this container in a Azure DevOps build pipeline.

## Preinstalled Zephyr framework

I allready preinstalled the packages which are installed when you run the build for the first time for a Nucleo STM32F767ZI (Maybe also for others).

> The packages are installed for uid 1001 (Username: vsts)