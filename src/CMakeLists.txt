set(HEADER_LIST "${HR_SOURCE_DIR}/include/hr/lib.hpp")

add_library(hrlib STATIC ${HEADER_LIST})

target_include_directories(hrlib PUBLIC ../include)

# https://dev.mysql.com/doc/dev/connector-cpp/8.0/usage.html
target_link_libraries(hrlib PRIVATE MySQL_CONCPP::xdevapi)
