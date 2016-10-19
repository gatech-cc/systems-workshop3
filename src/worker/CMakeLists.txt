FILE(GLOB WORKER_SRC *.cpp)
include_directories(${CMAKE_BINARY_DIR}/proto)
add_executable(worker ${WORKER_SRC})
target_link_libraries(worker ${Boost_LIBRARIES}  ${SSL_LIBRARIES} ${CASABLANCA_LIBRARY} ${AZURE_STORAGE_LIBRARY})

