include(FetchContent)
FetchContent_Declare(
    cpp_dotenv
    GIT_REPOSITORY https://github.com/adeharo9/cpp-dotenv
    GIT_TAG v1.0.0-alpha
)
FetchContent_MakeAvailable(cpp_dotenv)
list(APPEND MAIN_LIBRARIES cpp_dotenv)

find_package(MYSQL REQUIRED)
if (MYSQL_FOUND)

    list(APPEND MAIN_LIBRARIES ${MYSQL_LIBRARY})
    list(APPEND MAIN_INCLUDE_DIRS ${MYSQL_INCLUDE_DIR})

    message("found MYSQL library: ${MYSQL_LIBRARY}")
    message("found MYSQL directory: ${MYSQL_INCLUDE_DIR}")
    message("============")

endif()

find_package(MySQLCppConn REQUIRED)
if(MySQLCppConn_FOUND)

    list(APPEND MAIN_LIBRARIES ${MySQLCppConn_LIBRARIES})
    list(APPEND MAIN_INCLUDE_DIRS ${MySQLCppConn_INCLUDE_DIRS})

    message("found MySQLCppConn library: ${MySQLCppConn_LIBRARY}")
    message("found MySQLCppConn directory: ${MySQLCppConn_INCLUDE_DIR}")
    message("============")

else()
    FetchContent_Declare(
        MySQLCppConn 
        GIT_REPOSITORY https://github.com/mysql/mysql-connector-cpp.git
        GIT_TAG 8.0.21
    )
    FetchContent_MakeAvailable(MySQLCppConn)

    list(APPEND MAIN_LIBRARIES connector)
endif()
