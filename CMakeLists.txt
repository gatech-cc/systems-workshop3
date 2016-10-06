project(MapReduce)
cmake_minimum_required(VERSION 2.8)

find_package(Casablanca REQUIRED)
find_package(AzureStorageCpp REQUIRED)
find_package(SSL REQUIRED)

add_definitions(-std=c++11)
add_subdirectory(src)
add_subdirectory(proto)
