configure_file(HRConfig.h.in HRConfig.h)

add_executable(main main.cpp)

target_include_directories(main PUBLIC "${PROJECT_BINARY_DIR}/apps" ${MAIN_INCLUDE_DIRS})

target_link_libraries(main PUBLIC ${MAIN_LIBRARIES} EnvReader)
