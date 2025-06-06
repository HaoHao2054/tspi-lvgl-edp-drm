cmake_minimum_required(VERSION 3.10)

project(lvgl_demo C CXX)

# 定义宏，默认值为 1 是否使用 GUI Guider ，如果不使用，修改为OFF
option(USE_GUI_GUIDER "Whether to include GUI Guider sources" OFF)

# 生成 compile_commands.json
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# 启用 Ninja 颜色支持
add_compile_options(-fdiagnostics-color=always)

# --- Toolchain Configuration ---
include(${CMAKE_SOURCE_DIR}/toolchain-aarch64-gnu.cmake)

# 添加lvgl.h的头文件路径
include_directories(${CMAKE_SOURCE_DIR}/lvgl)
include_directories(${CMAKE_SOURCE_DIR}/lvgl/src)



# 设置编译选项
set(CMAKE_C_FLAGS "-O3 -g0 -Wall -Wshadow -Wundef -Wmissing-prototypes -Wno-discarded-qualifiers \
    -Wall -Wextra -Wno-unused-function -Wno-error=strict-prototypes -Wpointer-arith -fno-strict-aliasing \
    -Wno-error=cpp -Wuninitialized -Wmaybe-uninitialized -Wno-unused-parameter -Wno-missing-field-initializers \
    -Wtype-limits -Wsizeof-pointer-memaccess -Wno-format-nonliteral -Wno-cast-qual -Wunreachable-code \
    -Wno-switch-default -Wreturn-type -Wmultichar -Wformat-security -Wno-ignored-qualifiers -Wno-error=pedantic \
    -Wno-sign-compare -Wno-error=missing-prototypes -Wdouble-promotion -Wclobbered -Wdeprecated -Wempty-body \
    -Wtype-limits -Wshift-negative-value -Wstack-usage=2048 -Wno-unused-value")

# 设置链接选项
set(CMAKE_EXE_LINKER_FLAGS "-lm")

# 设置源代码目录
set(LVGL_DIR ${CMAKE_SOURCE_DIR})
include_directories(${LVGL_DIR})

# 生成源文件列表
set(MAIN_SRC "main.c")
set(LVGL_SRCS)
set(LV_DRIVERS_SRCS)

# 递归查找 lvgl 和 lv_drivers 目录下的所有 C 文件
file(GLOB_RECURSE LVGL_SRCS "${LVGL_DIR}/lvgl/*.c")
file(GLOB_RECURSE LV_DRIVERS_SRCS "${LVGL_DIR}/lv_drivers/*.c")

# 注释掉编译鼠标输入的源码
# list(REMOVE_ITEM LV_DRIVERS_SRCS "${LVGL_DIR}/mouse_cursor_icon.c")

# 根据 USE_GUI_GUIDER 的值执行不同的逻辑
if(USE_GUI_GUIDER)
    message("Including GUI Guider sources")
    include_directories(${CMAKE_SOURCE_DIR}/gui_guider/generated)
    include_directories(${CMAKE_SOURCE_DIR}/gui_guider/custom)
    file(GLOB_RECURSE GUI_GUIDER_SRCS
        "${LVGL_DIR}/gui_guider/*.c"
    )
    # 合并所有源文件
    set(SRCS ${MAIN_SRC} ${LVGL_SRCS} ${LV_DRIVERS_SRCS} ${GUI_GUIDER_SRCS})
else()
    message("Excluding GUI Guider sources")
    set(SRCS ${MAIN_SRC} ${LVGL_SRCS} ${LV_DRIVERS_SRCS})
endif()

# 生成目标可执行文件
add_executable(${PROJECT_NAME} ${SRCS})

# 指定链接库
target_link_libraries(${PROJECT_NAME} m)

# 指定编译目录
set_target_properties(${PROJECT_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# 添加清理目标
add_custom_target(custom_clean COMMAND ${CMAKE_COMMAND} --build . --target clean)