# module to search for zlib directory for linking against this

if(NOT DEFINED ZLIB_DIR)
    message(FATAL_ERROR  "HFS environment variable is not set, use -DZLIB_DIR to point zlib root location.")
endif()
message(STATUS "zlib path:" ${ZLIB_DIR})

# search for hcustom, using hcustom definitions are extracted
find_path(ZLIB_BIN_DIR libzlib.so HINTS ${ZLIB_DIR}/bin)
if(${ZLIB_BIN_DIR} STREQUAL "ZLIB_BIN_DIR-NOTFOUND")
    message(FATAL_ERROR "zlib" has not been found in ${ZLIB_DIR}/bin)
endif()
set(ZLIB_BIN ${ZLIB_DIR}/bin)
message(STATUS "zlib found:" ${ZLIB_BIN})
