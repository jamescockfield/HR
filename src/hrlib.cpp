#include <hr/lib.hpp>
#include <mysqlx/xdevapi.h>

int run() {
    String host = "localhost";
    int port = "3306";
    String user = "HR";
    String password = "password";
    String db = "HR";

    Session session = getSession(host, port, user, password, db);

    System.out.println(session);
}
