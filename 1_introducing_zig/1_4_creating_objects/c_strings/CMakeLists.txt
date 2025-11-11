cmake_minimum_required(VERSION 3.31.3)

project(c_strings VERSION 0.1)

set(SRC_FILES main.c)

add_executable(${PROJECT_NAME} ${SRC_FILES})

# Using this file in a terminal emulator
# 1. Generate the build files
# $ cmake -S . -B build
# 2. Build the binary executable
# $ cmake --build build
# 3. Run binary executable
# $ ./build/c_strings