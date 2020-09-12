find_package(MYSQL REQUIRED)

list(APPEND MAIN_LIBRARIES ${MYSQL_LIBRARY})
list(APPEND MAIN_INCLUDE_DIRS ${MYSQL_INCLUDE_DIR})

message("found MYSQL library: ${MYSQL_LIBRARY}")
message("found MYSQL directory: ${MYSQL_INCLUDE_DIR}")
message("============")

find_package(MYSQLPP)
if(MYSQLPP_FOUND)

    list(APPEND MAIN_LIBRARIES ${MYSQLPP_LIBRARIES})
    list(APPEND MAIN_INCLUDE_DIRS ${MYSQLPP_INCLUDE_DIRS})

    message("found MYSQLPP library: ${MYSQLPP_LIBRARY}")
    message("found MYSQLPP directory: ${MYSQLPP_INCLUDE_DIR}")
    message("============")

else()

    FetchContent_Declare(
        mariadb-connector-cpp
        GIT_REPOSITORY https://github.com/ericcurtin/mariadb-connector-cpp
        GIT_TAG 1.1.11
    )
    FetchContent_MakeAvailable(mariadb-connector-cpp)

    list(APPEND MAIN_LIBRARIES mariadb-connector-cpp)
endif()
