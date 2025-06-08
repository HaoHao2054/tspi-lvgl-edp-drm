# 介绍

适用于立创泰山派的LVGL工程，基于LVGL官方项目[lv_port_linux](https://github.com/lvgl/lv_port_linux.git)。目前有帧缓冲（fb）和drm（drm）两个分支。

## 一、使用说明

### 1、更换编译器

编译器在`cmake/toolchain-aarch64-gnu.cmake`中进行设置，可以通过包管理器安装

```bash
sudo apt install gcc-aarch64-linux-gnu g++-aarch64-linux-gnu
```

或者使用自己本地的编译器，例如

```bash
# Cross compiler paths
set(CROSS_COMPILER_PREFIX $ENV{HOME}/tools/toolchains/gcc-arm-9.2-2019.12-x86_64-aarch64-none-linux-gnu/bin/aarch64-none-linux-gnu-)

set(CMAKE_C_COMPILER ${CROSS_COMPILER_PREFIX}gcc)
set(CMAKE_CXX_COMPILER ${CROSS_COMPILER_PREFIX}g++)
```

### 2、使用drm设备时需要链接libdrm

需要在你cmake的sysroot安装libdrm，使得可执行文件动态链接libdrm.so

`cmake/toolchain-aarch64-gnu.cmake`

```bash
set(TSPI_SYSROOT "$ENV{HOME}/tspi_ubuntu_sysroot")
set(CMAKE_SYSROOT ${TSPI_SYSROOT})
```

或者直接在开发板本地编译

无论是本地编译还是交叉编译，开发板都需要安装libdrm

```bash
sudo apt install libdrm-dev
```

### 3、vscode快捷使用

已经在`.vscode`中设置了快捷任务
