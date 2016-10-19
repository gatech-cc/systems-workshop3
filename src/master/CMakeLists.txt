FILE(GLOB MASTER_SRC *.cpp)
include_directories(${CMAKE_BINARY_DIR}/proto)
add_executable(master ${MASTER_SRC})
target_link_libraries(master ${Boost_LIBRARIES}  ${SSL_LIBRARIES} ${CASABLANCA_LIBRARY} ${AZURE_STORAGE_LIBRARY})

