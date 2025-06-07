# --- Librarys ---
# Sources for LVGL core, widgets, themes, and extras
file(GLOB_RECURSE LVGL_SOURCES
    "${CMAKE_CURRENT_SOURCE_DIR}/*.c"
    "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp"
)

add_library(lvgl STATIC
    ${LVGL_SOURCES}
)

target_include_directories(lib_custom PUBLIC
    "${CMAKE_CURRENT_SOURCE_DIR}" 
    "${CMAKE_CURRENT_SOURCE_DIR}/lvgl"    
    "${CMAKE_CURRENT_SOURCE_DIR}/lv_drivers" 

)

message(STATUS "lv_linux_port/CMakeLists.txt: Defined lvgl_core library.")