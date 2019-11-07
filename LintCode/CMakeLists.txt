cmake_minimum_required(VERSION 3.15)
project(LintCode)

set(CMAKE_CXX_STANDARD 17)

add_subdirectory(001.a-b-problem)
add_subdirectory(042.maximum-subarray-ii)
add_subdirectory(092.backpack)
add_subdirectory(125.backpack-ii)
add_subdirectory(437.copy-books)
add_subdirectory(440.backpack-iii)
add_subdirectory(513.perfect-squares)
add_subdirectory(562.backpack-iv)
add_subdirectory(563.backpack-v)
add_subdirectory(564.combination-sum-iv)
add_subdirectory(667.longest-palindromic-subsequence)

add_executable(LintCode example.cpp)
