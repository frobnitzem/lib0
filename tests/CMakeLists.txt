enable_testing()

# Build a testing application
add_executable(checkzero checkzero.cc)
# Link it against the built library
target_link_libraries(checkzero PUBLIC zero)

add_test(NAME iszero COMMAND checkzero)
