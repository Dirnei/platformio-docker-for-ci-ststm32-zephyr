# PlatformIO container with preinstalled toolchain for zephyr on ststm32 platform

This docker image can be used to build PlatformIO projects within a docker container. It has no entrypoint so you have to provide the command by yourself. This e.g. usefull if you want to run this container in a Azure DevOps build pipeline.

## Preinstalled Zephyr framework

I allready preinstalled the packages which are installed when you run the build for the first time for a Nucleo STM32F767ZI (Maybe also for others).

> The packages are installed for uid 1001 (Username: vsts)## Example usage local

## Example usage local

```docker
docker run -v ${pwd}:/opt/build --user 1001 dirnei/platformio-for-ci-ststm32-zephyr:latest platformio run -d /opt/build/.
```

## Example usage Azure DevOps
```yml
# ...
resources:
    containers:
    - container: platformio
      image: dirnei/platformio-for-ci-ststm32-zephyr:latest
      endpoint: your-service-connection

jobs:
- job: esp32_platformio
  displayName: "PlatformIO build"
  pool:
    vmImage: ubuntu-18.04
  container: platformio
  steps:
# ...
  - script: platformio run -d .
    displayName: 'Build firmware'
# ....
```