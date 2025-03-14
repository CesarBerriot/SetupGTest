include(CTest)

function(setup_gtest)
  if(NOT ${BUILD_TESTING})
    message(FATAL_ERROR "BUILD_TESTING is OFF")
  endif()

  include(FetchContent)
  FetchContent_Declare(
    googletest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG v1.16.0
  )
  FetchContent_MakeAvailable(googletest)

  include(GoogleTest)

  file(GLOB test_sources CONFIGURE_DEPENDS tests/*.cpp)
  foreach(test_source IN LISTS test_sources)
    block()
      get_filename_component(file_name "${test_source}" NAME_WLE)
      set(target_name ${PROJECT_NAME}_test_${file_name})
      add_executable(${target_name} ${test_source})
      target_link_libraries(${target_name} PRIVATE gtest_main ${ARGV})
      gtest_discover_tests(${target_name} TEST_PREFIX ${PROJECT_NAME}.)
    endblock()
  endforeach()
endfunction()
