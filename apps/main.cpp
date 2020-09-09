#include <iostream>
#include "HRConfig.h"
// #include "hrlib.hpp"
#include <mysqlx/xdevapi.h>

int main(int argc, char *argv[]) {
    std::cout << argv[0] << " Version " << HR_VERSION_MAJOR << "."
        << HR_VERSION_MINOR << std::endl;
    return 1;
}
