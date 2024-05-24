#!/bin/bash

# make directories
mkdir app include build scripts

touch app/main.cpp include/common.hpp scripts/setup.sh CMakeLists.txt

# populate main.cpp
cat << EOT >> app/main.cpp
#include <iostream>
#include "common.hpp"

int main() 
{
	std::cout << "Hello, world\n";

    return 0;
}

EOT

# populate common.hpp
cat << EOT >> include/common.hpp
#pragma once

EOT

# populate setup.sh
cat << EOT >> scripts/setup.sh
#!/bin/bash
echo "Setup script..."

EOT

# populate cmake cfg
cat << EOT >> CMakeLists.txt
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

EOT
