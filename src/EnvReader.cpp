#include <string>
#include <EnvReader.h>

using namespace std;

void EnvReader::readFile() {

    ifstream file(path);
    string line;
    pair<string, string> value;

    if (file.is_open()) {
        while (getline(file, line)) {

            value = parseLine(line);
            values.insert({value.first, value.second});
        }
    }
}

pair<string, string> EnvReader::parseLine(string line) {

    int delimiter = line.find("=");
    string key = line.substr(0, delimiter);
    string value = line.substr(delimiter + 1, line.length());

    if (value.find("\"") != string::npos) {

        value = value.substr(1, value.length() - 2);
    }

    return pair<string, string>(key, value);
}

EnvReader::EnvReader() {
    readFile();
}
