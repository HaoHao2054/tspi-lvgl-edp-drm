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