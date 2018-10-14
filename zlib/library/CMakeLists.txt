cmake_minimum_required(VERSION 1.0)

project(zlib)

file(GLOB source_files "*.c")

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

add_library(zlib_obj OBJECT ${source_files})
set_property(TARGET zlib_obj PROPERTY POSITION_INDEPENDENT_CODE 1)

add_library(zlib_static STATIC $<TARGET_OBJECTS:zlib_obj>)
add_library(zlib SHARED $<TARGET_OBJECTS:zlib_obj>)
