#include <iostream>
#include "HRConfig.h"
// #include "hrlib.hpp"
#include <mysql++/mysql++.h>
#include <dotenv.h>

using namespace std;
using namespace dotenv;

int main(int argc, char *argv[]) {

    cout << argv[0] << " Version " << HR_VERSION_MAJOR << "."
        << HR_VERSION_MINOR << endl;

    env.load_dotenv();

    cout << "MYSQL_PORT: " << stoi(env["MYSQL_PORT"]) << endl;

    mysqlpp::Connection connection(
            "foodbank",
            "localhost",
            "foodbank", 
            "password"
        );

    mysqlpp::Query query = connection.query("SHOW TABLES");
    if (mysqlpp::StoreQueryResult res = query.store()) {

        mysqlpp::StoreQueryResult::const_iterator it;
        for (it = res.begin(); it != res.end(); it++) {

            mysqlpp::Row row = *it;
            cout << row[0] << endl;
        }
    }

    cout << connection.server_status() << endl;

    return 1;
}
