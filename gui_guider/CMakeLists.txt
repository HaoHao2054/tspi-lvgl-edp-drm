# --- Librarys ---
file(GLOB_RECURSE LVGL_SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp"
)

add_library(lvgl STATIC
    ${LVGL_SOURCES}
)

target_include_directories(lvgl PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}" 
    "${CMAKE_CURRENT_SOURCE_DIR}/lvgl"    
    "${CMAKE_CURRENT_SOURCE_DIR}/lv_drivers" 

)

message(STATUS "lv_linux_port/CMakeLists.txt: Defined lvgl_core library.")



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
