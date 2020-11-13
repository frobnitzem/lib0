cmake_minimum_required(VERSION 3.17)

# set the project name
project(zcheck VERSION 1.0)
find_package(Zero 1.0 REQUIRED)

add_executable(check check.cc)
target_link_libraries(check PRIVATE Zero::zero)
install(TARGETS check DESTINATION bin)

