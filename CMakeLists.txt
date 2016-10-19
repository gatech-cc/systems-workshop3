project(MapReduce)
cmake_minimum_required(VERSION 2.8)


set(Boost_USE_STATIC_LIBS ON)
set(Boost_USE_MULTITHREADED ON)
set(Boost_USE_STATIC_RUNTIME OFF)
find_package(Boost REQUIRED COMPONENTS log thread system filesystem program_options)
find_package(Casablanca REQUIRED)
find_package(AzureStorageCpp REQUIRED)
find_package(SSL REQUIRED)

add_definitions(-std=c++11)
add_subdirectory(src)
