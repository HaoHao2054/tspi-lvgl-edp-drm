# gui_guider/CMakeLists.txt

# 添加包含目录
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/generated)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/custom)

# 递归查找所有 .c 文件
file(GLOB_RECURSE GUI_GUIDER_SRCS
    # "${CMAKE_CURRENT_SOURCE_DIR}/custom/*.c"
    # "${CMAKE_CURRENT_SOURCE_DIR}/generated/*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/*.c"
)

# 将 GUI_GUIDER_SRCS 添加到父作用域的 SRCS 变量中
set(SRCS ${SRCS} ${GUI_GUIDER_SRCS} PARENT_SCOPE)

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
