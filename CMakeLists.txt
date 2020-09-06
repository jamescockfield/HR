cmake_minimum_required(VERSION 3.14)

project(
    HR 
    VERSION 1.0 
    LANGUAGES CXX
    DESCRIPTION "HR Application"
)

add_library(hrlib STATIC src/hrlib.cpp include/hr/lib.hpp)
target_include_directories(hrlib PUBLIC ../include)

find_package(SQLite3)
if (SQLite3_FOUND)
    include_directories(${SQLite3_INCLUDE_DIRS})
    target_link_libraries(HR ${SQLite3_LIBRARIES})
endif (SQLite3_FOUND)

include(FetchContent)

FetchContent_Declare(
    MySQL_CONCPP
    GIT_REPOSITORY https://github.com/mysql/mysql-connector-cpp.git
    GIT_TAG 8.0.21
)
FetchContent_MakeAvailable(MySQL_CONCPP)

# configure_file(HRConfig.h.in HRConfig.h)
# target_include_directories(HR PUBLIC "${PROJECT_BINARY_DIR}")

include(CTest)
add_test(NAME HR COMMAND HRTest)

add_subdirectory(src)
add_subdirectory(apps)
add_subdirectory(tests)
