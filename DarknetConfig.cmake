# Config file for the Darknet package
# It defines the following variables
#  Darknet_INCLUDE_DIRS - include directories for Darknet
#  Darknet_LIBRARIES    - libraries to link against

# Compute paths
get_filename_component(Darknet_CMAKE_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
set(Darknet_INCLUDE_DIRS "D:/darknet;D:/darknet")
list(APPEND CMAKE_MODULE_PATH "${Darknet_CMAKE_DIR}")

include(CMakeFindDependencyMacro)

if(ON)
  find_dependency(OpenCV REQUIRED)
endif()

find_dependency(Stb REQUIRED HINTS "D:/darknet/3rdparty/stb")

if(FALSE)
  find_dependency(CUDNN)
endif()

set(CMAKE_THREAD_PREFER_PTHREAD ON)
find_dependency(Threads)

if(MSVC)
  find_dependency(PThreads_windows)
endif()

if("${CMAKE_VERSION}" VERSION_GREATER "3.9.0")
  find_dependency(OpenMP)
endif()

# Our library dependencies (contains definitions for IMPORTED targets)
include("${Darknet_CMAKE_DIR}/DarknetTargets.cmake")

# These are IMPORTED targets created by DarknetTargets.cmake
set(Darknet_LIBRARIES darklib)
