# - Find mysqlclient
# Find the native MySQL includes and library
#
#  MYSQLPP_INCLUDE_DIR - where to find mysql.h, etc.
#  MYSQLPP_LIBRARIES   - List of libraries when using MySQL.
#  MYSQLPP_FOUND       - True if MySQL found.

IF (MYSQLPP_INCLUDE_DIR)
  # Already in cache, be silent
  SET(MYSQLPP_FIND_QUIETLY TRUE)
ENDIF (MYSQLPP_INCLUDE_DIR)

FIND_PATH(MYSQLPP_INCLUDE_DIR mysql++.h
  PATHS /usr/include /usr/local/include
  PATH_SUFFIXES mysql++
)

SET(MYSQLPP_NAMES mysqlpp)
FIND_LIBRARY(MYSQLPP_LIBRARY
  NAMES ${MYSQLPP_NAMES}
  PATHS /usr/lib /usr/local/lib
)

IF (MYSQLPP_INCLUDE_DIR AND MYSQLPP_LIBRARY)
  SET(MYSQLPP_FOUND TRUE)
  SET( MYSQLPP_LIBRARIES ${MYSQLPP_LIBRARY} )
ELSE (MYSQLPP_INCLUDE_DIR AND MYSQLPP_LIBRARY)
  SET(MYSQLPP_FOUND FALSE)
  SET( MYSQLPP_LIBRARIES )
ENDIF (MYSQLPP_INCLUDE_DIR AND MYSQLPP_LIBRARY)

IF (MYSQLPP_FOUND)
  IF (NOT MYSQLPP_FIND_QUIETLY)
    MESSAGE(STATUS "Found MySQL: ${MYSQLPP_LIBRARY}")
  ENDIF (NOT MYSQLPP_FIND_QUIETLY)
ELSE (MYSQLPP_FOUND)
  IF (MYSQLPP_FIND_REQUIRED)
    MESSAGE(STATUS "Looked for MySQL libraries named ${MYSQLPP_NAMES}.")
    MESSAGE(FATAL_ERROR "Could NOT find MySQL library")
  ENDIF (MYSQLPP_FIND_REQUIRED)
ENDIF (MYSQLPP_FOUND)

MARK_AS_ADVANCED(
  MYSQLPP_LIBRARY
  MYSQLPP_INCLUDE_DIR
)
