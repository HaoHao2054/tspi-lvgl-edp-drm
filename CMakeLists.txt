cmake_minimum_required(VERSION 3.15)
project(tspi_lvgl C CXX) # Enable C and CXX

# --- Output Directory Configuration ---
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin) # For older CMake compatibility

# --- Other Tools Configuration  ---
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)             # Enable compile command to ease indexing with e.g. clangd
add_compile_options(-fdiagnostics-color=always)     # Ninja 

# --- Toolchain Configuration ---
include(${CMAKE_SOURCE_DIR}/cmake/toolchain-aarch64-gnu.cmake)
include(${CMAKE_SOURCE_DIR}/cmake/find_library.cmake)

# --- Include Subdirectories ---
add_subdirectory(lv_linux_port)
# add_subdirectory(gui_guider)


# --- Define the project executable ---
add_executable(${PROJECT_NAME}
    main.c
)

target_include_directories(${PROJECT_NAME} PUBLIC 
    "${CMAKE_SOURCE_DIR}/lv_linux_port/"  # Include directory for LVGL Linux port
)

# Link against the libraries built in other directories
target_link_directories(${PROJECT_NAME} PRIVATE
    "${CMAKE_BINARY_DIR}/lib"  # Ensure the libraries are found in the build directory
)

target_link_libraries(${PROJECT_NAME} PRIVATE
    lvgl
)

# # Install rules for the demo executable
# install(TARGETS ${PROJECT_NAME}
#     RUNTIME DESTINATION "${CMAKE_INSTALL_PREFIX}/bin"
# )

message(STATUS "CMakeLists.txt: Defined ${PROJECT_NAME} executable.")


# --- Install Rules for the main executable (defined in app/CMakeLists.txt) ---
# The executable target 'demo' will be defined in app/CMakeLists.txt
# We can set install rules here if we know the target name, or set it in app/CMakeLists.txt
# set(CMAKE_INSTALL_PREFIX "/usr" CACHE PATH "Installation prefix")

# The actual install command for the 'demo' target should be in app/CMakeLists.txt
# or ensure the 'demo' target is globally visible if installing from here.

# --- Print configuration (optional, can be useful for debugging) ---
message(STATUS "Top-Level CMake: CMAKE_C_COMPILER: ${CMAKE_C_COMPILER}")
message(STATUS "Top-Level CMake: CMAKE_C_FLAGS: ${CMAKE_C_FLAGS}")
message(STATUS "Top-Level CMake: CMAKE_CXX_COMPILER: ${CMAKE_CXX_COMPILER}")
message(STATUS "Top-Level CMake: CMAKE_CXX_FLAGS: ${CMAKE_CXX_FLAGS}")
message(STATUS "Top-Level CMake: Output directory for executables: ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}")