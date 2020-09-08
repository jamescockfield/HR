set(HEADER_LIST "${HR_SOURCE_DIR}/include/hr/lib.hpp")

add_library(hrlib hrlib.cpp ${HEADER_LIST})

target_include_directories(hrlib PUBLIC ../include)

# include(FetchContent)
# FetchContent_Declare(
    # MySQL_CONCPP
    # GIT_REPOSITORY https://github.com/mysql/mysql-connector-cpp.git
    # GIT_TAG 8.0.21
# )
# FetchContent_MakeAvailable(MySQL_CONCPP)

find_package(MySQLCppConn REQUIRED)

include_directories(${MySQLCppConn_INLUDE_DIRS})
target_link_libraries(hrlib ${MySQLCppConn_LIBRARIES})
