cmake_minimum_required(VERSION 3.15)
project(LintCode)

set(CMAKE_CXX_STANDARD 17)

add_subdirectory(001.a-b-problem)
add_subdirectory(042.maximum-subarray-ii)
add_subdirectory(092.backpack)
add_subdirectory(125.backpack-ii)
add_subdirectory(437.copy-books)

add_executable(LintCode example.cpp)
