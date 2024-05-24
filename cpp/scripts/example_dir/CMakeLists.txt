cmake_minimum_required(VERSION 3.2 FATAL_ERROR)
project(program LANGUAGES CXX)

# Set vars
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED true)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Find packages
#find_package(Catch2 3 REQUIRED)

# Include dirs
include_directories(include)

# Set executables
add_executable(program app/main.cpp)

