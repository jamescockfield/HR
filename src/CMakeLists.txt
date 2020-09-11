# file(GLOB HEADER_LIST CONFIGURE_DEPENDS "${HR_SOURCE_DIR}/include/HR/*.h")

set(HR_HEADER_DIR "${HR_SOURCE_DIR}/include/HR")
add_library(EnvReader EnvReader.cpp "${HR_HEADER_DIR}/EnvReader.h")
target_include_directories(EnvReader PUBLIC ${HR_HEADER_DIR})
