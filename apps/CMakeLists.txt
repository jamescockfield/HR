configure_file(HRConfig.h.in HRConfig.h)

add_executable(main main.cpp)

find_package(MySQLCppConn REQUIRED)

message("found MySQLCppConn library: ${MySQLCppConn_LIBRARY}")
message("found MySQLCppConn directory: ${MySQLCppConn_INCLUDE_DIR}")

find_package(MYSQL)

message("found MYSQL library: ${MYSQL_LIBRARY}")
message("found MYSQL directory: ${MYSQL_INCLUDE_DIR}")

target_include_directories(
    main
    PUBLIC 
        "${PROJECT_BINARY_DIR}/apps"
        ${MySQLCppConn_INCLUDE_DIRS} 
        ${MYSQL_INCLUDE_DIR} 
)

target_link_libraries(
    main 
    PUBLIC 
        ${MySQLCppConn_LIBRARIES} 
        ${MYSQL_LIBRARY}
)
