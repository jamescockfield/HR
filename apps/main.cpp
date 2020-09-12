#include <iostream>
#include "HRConfig.h"
#include <mysql++/mysql++.h>
#include <EnvReader.h>

using namespace std;

int main(int argc, char *argv[]) {

    cout << argv[0] << " Version " << HR_VERSION_MAJOR << "."
        << HR_VERSION_MINOR << endl;

    EnvReader *env2 = new EnvReader();

    mysqlpp::Connection connection(
            env2->get("MYSQL_DB"),
            env2->get("MYSQL_HOST"),
            env2->get("MYSQL_USER"),
            env2->get("MYSQL_PASSWORD")
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
