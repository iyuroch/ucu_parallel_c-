cmake_minimum_required(VERSION 3.0)

project(zlib_examples)

# we need list of .c files inside directory of cmake
file(GLOB source_files "*.c")

# we have include module to find zlib library not
# to manually set zlib path
include(findzlib.cmake)

# we set up directory where cmake search for libraries
link_directories(${ZLIB_BIN})

# we build all to the /bin subfolder to keep directory clean
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)

foreach(source ${source_files})
    get_filename_component(bin_name "${source}" NAME_WE)
    add_executable(${bin_name} ${source})
    target_link_libraries(${bin_name} zlib)
endforeach(source)
