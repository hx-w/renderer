cmake_minimum_required(VERSION 3.0.0)
project(xrender VERSION 0.1.0)

# 使用 C++ 11 标准
set(CMAKE_CXX_STANDARD 11)
# 添加头文件
set(LOCAL_H ${PROJECT_SOURCE_DIR}/src)
include_directories(${LOCAL_H})

# 添加目标链接
if (APPLE)
    set(GLFW_LINK ${PROJECT_SOURCE_DIR}/src/libs/GLFW/libglfw.3.dylib)
endif()
if (WIN32)
    set(GLFW_LINK ${PROJECT_SOURCE_DIR}/src/libs/GLFW/glfw3.lib)
endif()

link_libraries(${GLFW_LINK})

# 执行编译命令
aux_source_directory(./src DIR_SRCS)
set(GLADSOURCE ${PROJECT_SOURCE_DIR}/src/libs/glad/glad.c ${PROJECT_SOURCE_DIR}/src/libs/std_image/std_image.cpp)
add_executable(xrender ${GLADSOURCE} ${DIR_SRCS})

# 链接系统的 OpenGL 框架
if (APPLE)
    target_link_libraries(xrender "-framework OpenGL")
endif()

include(CTest)
enable_testing()

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
