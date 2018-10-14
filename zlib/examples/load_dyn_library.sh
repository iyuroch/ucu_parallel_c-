#!/usr/bin/env bash

# adds compiled library to be accessible from executable
# chmod +x to be able to execute this
# execute like this: . ./(NAME OF SHELL) to change variable

# we need magic ${PWD} as in other scenario if we run executable
# with zlib relatively different it'll not work
read -e -p "Enter path to zlib library:" -i "${PWD}/../library/bin" zlib_path
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$zlib_path
