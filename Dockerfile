FROM infinitecoding/platformio-for-ci

RUN pip install --upgrade pip
RUN pip install pyyaml
RUN pip install docopt
RUN pip install six
RUN pip install python-dateutil
RUN pip install pykwalify

# Install PlatformIO, and it's newest available dependencies via pip.
RUN platformio platform install ststm32 \
--with-package framework-zephyr \
--with-package framework-zephyr-canopennode \
--with-package framework-zephyr-civetweb \
--with-package framework-zephyr-cmsis \
--with-package framework-zephyr-fatfs \
--with-package framework-zephyr-hal-st \
--with-package framework-zephyr-hal-stm32 \
--with-package framework-zephyr-libmetal \
--with-package framework-zephyr-littlefs \
--with-package framework-zephyr-loramac-node \
--with-package framework-zephyr-lvgl \
--with-package framework-zephyr-mbedtls \
--with-package framework-zephyr-mcuboot \
--with-package framework-zephyr-mcumgr \
--with-package framework-zephyr-mipi-sys-t \
--with-package framework-zephyr-open-amp \
--with-package framework-zephyr-openthread \
--with-package framework-zephyr-segger \
--with-package framework-zephyr-tinycbor \
--with-package framework-zephyr-tinycrypt \
--with-package framework-zephyr-trusted-firmware-m \
--with-package tool-cmake \
--with-package tool-dtc \
--with-package tool-ninja \
--with-package tool-gperf

# Delete entrypoint of parent containers (required by Azure Pipelines)
ENTRYPOINT []