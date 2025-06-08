find_library(DRM_LIBRARY NAMES drm)
find_path(DRM_INCLUDE_DIR NAMES libdrm/drm.h)

if(DRM_LIBRARY AND DRM_INCLUDE_DIR)
    message(STATUS "Found libdrm library: ${DRM_LIBRARY}")
    message(STATUS "Found libdrm include dir: ${DRM_INCLUDE_DIR}")
else()
    message(FATAL_ERROR "Could not find libdrm library or headers!")
endif()