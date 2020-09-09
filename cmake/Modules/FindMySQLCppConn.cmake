# - Find mysqlcppconn
# Find the native MySQLCppConn includes and library
#
#  MySQLCppConn_INCLUDE_DIR - where to find mysql.h, etc.
#  MySQLCppConn_LIBRARIES   - List of libraries when using MySQL.
#  MySQLCppConn_FOUND       - True if MySQL found.

IF (MySQLCppConn_INCLUDE_DIR)
  # Already in cache, be silent
  SET(MySQLCppConn_FIND_QUIETLY TRUE)
ENDIF (MySQLCppConn_INCLUDE_DIR)

FIND_PATH(MySQLCppConn_INCLUDE_DIR xdevapi.h
  PATHS
    /usr/local/include/mysqlx
    /usr/include/mysqlx
    /usr/local/mysql/connector-c++-/include/mysqlx/
)

SET(MySQLCppConn_NAMES mysqlcppconn8)

FIND_LIBRARY(
  MySQLCppConn_LIBRARY
  NAMES 
    ${MySQLCppConn_NAMES}
  PATHS 
    /usr/lib 
    /usr/local/lib
    /usr/local/mysql/connector-c++-/lib64
  PATH_SUFFIXES
    /debug
)

IF (MySQLCppConn_INCLUDE_DIR AND MySQLCppConn_LIBRARY)
  SET(MySQLCppConn_FOUND TRUE)
  SET( MySQLCppConn_LIBRARIES ${MySQLCppConn_LIBRARY} )
ELSE (MySQLCppConn_INCLUDE_DIR AND MySQLCppConn_LIBRARY)
  SET(MySQLCppConn_FOUND FALSE)
  SET( MySQLCppConn_LIBRARIES )
ENDIF (MySQLCppConn_INCLUDE_DIR AND MySQLCppConn_LIBRARY)

IF (MySQLCppConn_FOUND)
  IF (NOT MySQLCppConn_FIND_QUIETLY)
      MESSAGE(STATUS "Found MySQLCppConn: ${MySQLCppConn_LIBRARY}")
  ENDIF (NOT MySQLCppConn_FIND_QUIETLY)
ELSE (MySQLCppConn_FOUND)
  IF (MySQLCppConn_FIND_REQUIRED)
      MESSAGE(STATUS "Looked for MySQLCppConn libraries named ${MySQLCppConn_NAMES}.")
    MESSAGE(FATAL_ERROR "Could NOT find MySQLCppConn library")
  ENDIF (MySQLCppConn_FIND_REQUIRED)
ENDIF (MySQLCppConn_FOUND)

MARK_AS_ADVANCED(
  MySQLCppConn_LIBRARY
  MySQLCppConn_INCLUDE_DIR
)
