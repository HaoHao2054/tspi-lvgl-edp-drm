# LVGL for frame buffer device

LVGL configured to work with /dev/fb0 on Linux.

When cloning this repository, also make sure to download submodules (`git submodule update --init --recursive`) otherwise you will be missing key components.

Check out this blog post for a step by step tutorial:
https://blog.lvgl.io/2018-01-03/linux_fb

# 用于帧缓冲设备的 LVGL
LVGL 已配置为在 Linux 上与 /dev/fb0 一起使用。

在克隆此存储库时，请确保同时下载子模块（git submodule update --init --recursive），否则您将缺少关键组件。

请查看这篇博客文章，了解分步教程：
https://blog.lvgl.io/2018-01-03/linux_fb

## 编译指令
```bash
#在./build中执行
# 生成makefile
cmake ..

# 编译
make

#清理工程
make custom_clean
```