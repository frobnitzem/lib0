enable_testing()

# define a function to simplify adding tests
function(do_test target)
  add_executable(${target} ${target}.cc)
  target_link_libraries(${target} PUBLIC zero)
  add_test(NAME ${target} COMMAND ${target})
endfunction(do_test)

# Build a testing application
do_test(checkzero)
