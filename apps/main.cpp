#include <iostream>
#include "HRConfig.h"
// #include "hrlib.hpp"
#include <mysqlx/xdevapi.h>
#include <dotenv.h>

using namespace std;
using namespace dotenv;
using namespace mysqlx;

int main(int argc, char *argv[]) {

    cout << argv[0] << " Version " << HR_VERSION_MAJOR << "."
        << HR_VERSION_MINOR << endl;

    env.load_dotenv();

    cout << "MYSQL_PORT: " << stoi(env["MYSQL_PORT"]) << endl;

    const char *url = "mysqlx://HR:password@127.0.0.1/HR";
    Session session(url);
    // Session session = getSession(
            // env["MYSQL_HOST"],
            // stoi(env["MYSQL_PORT"]),
            // env["MYSQL_USER"],
            // env["MYSQL_PASSWORD"],
            // env["MYSQL_DB"]
        // );

    cout << "Getting session successful, getting schema..." << endl;

    Schema schema = session.getSchema("HR");

    cout << schema.getName() << endl;

    return 1;
}
