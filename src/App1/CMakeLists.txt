project(App1)

add_definitions(-D_CRT_SECURE_NO_WARNINGS=1 -D_HAS_ITERATOR_DEBUGGING=0)

set(${PROJECT_NAME}_COMPILE_FLAGS "/MP /DVERSIONAPP=${VERSION}")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${${PROJECT_NAME}_COMPILE_FLAGS}")


file(GLOB SOURCES *.c *.cpp *.cxx ${${PROJECT_NAME}_HEADER_DIR}/*.h)

add_executable(${PROJECT_NAME} ${SOURCES})



if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
  target_compile_definitions(${PROJECT_NAME} PUBLIC "IS_LINUX")
endif()
if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
  target_compile_definitions(${PROJECT_NAME} PUBLIC "IS_MACOS")
endif()
if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
  target_compile_definitions(${PROJECT_NAME} PUBLIC "IS_WINDOWS")
endif()
