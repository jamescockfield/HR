#pragma once
#include <iostream>
#include <fstream>
#include <map>

class EnvReader {

    std::string path = ".env";
    std::map<std::string, std::string> values = {};

    void readFile();
    std::pair<std::string, std::string> parseLine(std::string line);

public:

    EnvReader();
    const char* get(std::string key) { return values.find(key)->second.c_str(); };
};
