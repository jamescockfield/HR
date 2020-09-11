cmake_minimum_required(VERSION 3.14)

project(
    HR 
    VERSION 1.0 
    LANGUAGES CXX
    DESCRIPTION "HR Application"
)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules")

file(COPY .env DESTINATION apps)

include("${CMAKE_SOURCE_DIR}/cmake/packages.cmake")

add_subdirectory(src)
add_subdirectory(apps)
# add_subdirectory(tests)
