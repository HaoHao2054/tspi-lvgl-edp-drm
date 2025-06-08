# --- Librarys ---
# Sources for LVGL core, widgets, themes, and extras
file(GLOB_RECURSE LVGL_SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp"
)

add_library(lvgl STATIC
    ${LVGL_SOURCES}
)

set(LIBDRM_DIR "/home/hao/tsp_sdk/buildroot/output/rockchip_rk356x_recovery/build/libdrm-2.4.109")

target_include_directories(lvgl PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}" 
    "${CMAKE_CURRENT_SOURCE_DIR}/lvgl"    
    "${CMAKE_CURRENT_SOURCE_DIR}/lv_drivers"
    "${LIBDRM_DIR}"  # Include directory for libdrm
    "/usr/aarch64-linux-gnu/include/drm/"

)

message(STATUS "lv_linux_port/CMakeLists.txt: Defined lvgl_core library.")