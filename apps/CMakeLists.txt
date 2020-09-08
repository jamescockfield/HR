configure_file(HRConfig.h.in HRConfig.h)

add_executable(HR app.cpp)

target_include_directories(HR PUBLIC "${PROJECT_BINARY_DIR}/apps")

target_link_libraries(HR PRIVATE hrlib)
