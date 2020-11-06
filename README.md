[![](https://img.shields.io/docker/v/dirnei/platformio-for-ci-ststm32-zephyr?style=for-the-badge)](https://cloud.docker.com/repository/docker/dirnei/platformio-for-ci-ststm32-zephyr/ "View on Docker Hub")
[![](https://img.shields.io/docker/image-size/dirnei/platformio-for-ci-ststm32-zephyr/latest?style=for-the-badge)](https://cloud.docker.com/repository/docker/dirnei/platformio-for-ci-ststm32-zephyr/ "View on Docker Hub")
[![](https://img.shields.io/docker/pulls/dirnei/platformio-for-ci-ststm32-zephyr?style=for-the-badge)](https://cloud.docker.com/repository/docker/dirnei/platformio-for-ci-ststm32-zephyr/ "View on Docker Hub")
[![](https://img.shields.io/github/license/dirnei/platformio-docker-for-ci-ststm32-zephyr?style=for-the-badge)](https://github.com/Dirnei/platformio-docker-for-ci-ststm32-zephyr/blob/master/LICENSE "View Base Image")

[![](https://img.shields.io/badge/BASE%20IMAGE-Andreas_Huber_/%20platformio--docker--for--ci-red?style=for-the-badge)](https://github.com/Andreas-Huber/platformio-docker-for-ci "View Base Image")

# PlatformIO container with preinstalled toolchain for zephyr on ststm32 platform

This docker image can be used to build PlatformIO projects within a docker container. It has no entrypoint so you have to provide the command by yourself. This e.g. usefull if you want to run this container in a Azure DevOps build pipeline.

## Preinstalled Zephyr framework

I allready preinstalled the packages which are installed when you run the build for the first time for a Nucleo STM32F767ZI (Maybe also for others).

> The packages are installed for uid 1001 (Username: vsts)

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