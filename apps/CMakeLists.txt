configure_file(HRConfig.h.in HRConfig.h)

add_executable(main main.cpp)

# set(CPPCONN_ROOT_DIR "/usr/local/mysql/connector-c++-")
#
# find_package(MySQLCppConn REQUIRED)
#
# message("found MySQLCppConn libraries: ${MySQLCppConn_LIBRARIES}")
# message("found MySQLCppConn directories: ${MySQLCppConn_INCLUDE_DIRS}")
#
# find_package(MYSQL)
#
# message("found MYSQL libraries: ${MYSQL_LIBRARIES}")
# message("found MYSQL directories: ${MYSQL_INCLUDE_DIRS}")
#
# target_include_directories(main PUBLIC ${MYSQL_INCLUDE_DIRS})
# target_link_libraries(main PUBLIC ${MYSQL_LIBRARIES})

include(FindPkgConfig)
pkg_check_modules(LIBMYSQLCLIENT REQUIRED mysqlclient)

message("found LIBMYSQLCLIENT libraries: ${LIBMYSQLCLIENT_LIBRARIES}")
message("found LIBMYSQLCLIENT directories: ${LIBMYSQLCLIENT_INCLUDE_DIRS}")

target_include_directories(main PUBLIC ${LIBMYSQLCLIENT_INCLUDE_DIRS} "${PROJECT_BINARY_DIR}/apps")
target_link_libraries(main PUBLIC ${LIBMYSQLCLIENT_LIBRARIES})
