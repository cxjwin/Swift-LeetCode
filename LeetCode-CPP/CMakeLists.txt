cmake_minimum_required(VERSION 3.16)
project(LeetCode_CPP)

set(CMAKE_CXX_STANDARD 17)

add_subdirectory(004.median-of-two-sorted-arrays)
add_subdirectory(005.longest-palindromic-substring)
add_subdirectory(075.sort-colors)
add_subdirectory(300.longest-increasing-subsequence)
add_subdirectory(1143.longest-common-subsequence)

add_executable(LeetCode_CPP main.cpp)