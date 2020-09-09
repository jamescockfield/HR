file(GLOB HEADER_LIST CONFIGURE_DEPENDS "${HR_SOURCE_DIR}/include/hr/*.hpp")

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

message("found mysqlcppconn libraries: ${MySQLCppConn_LIBRARIES}")
message("found mysqlcppconn directories: ${MySQLCppConn_INCLUDE_DIRS}")

target_include_directories(hrlib PRIVATE ${MySQLCppConn_INCLUDE_DIRS})
target_link_libraries(hrlib PRIVATE ${MySQLCppConn_LIBRARIES})

source_group(
    TREE "${PROJECT_SOURCE_DIR/includes}"
    PREFIX "Header Files"
    FILES ${HEADER_LIST}
)
