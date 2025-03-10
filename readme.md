```cmake
include(FetchContent)

FetchContent_Declare(
  setup_gtest
  GIT_REPOSITORY https://github.com/CesarBerriot/setup_gtest.git
  GIT_TAG 1.0.0
)

FetchContent_MakeAvailable(setup_gtest)

include(${setup_gtest_SOURCE_DIR}/setup_gtest.cmake)

if(${BUILD_TESTING})
  setup_gtest(DEPENDENCY1 DEPENDENCY2 DEPENDENCY3...)
endif()
```