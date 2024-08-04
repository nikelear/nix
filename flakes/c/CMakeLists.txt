# CMakeLists.txt
cmake_minimum_required(VERSION 3.13)
project(MyProject C)

# Add executable
add_executable(myapp src/main.c)

# Include directories (if any)
# target_include_directories(myapp PRIVATE include)

# Link libraries (if any)
# target_link_libraries(myapp PRIVATE some_library)

# Add install rule
install(TARGETS myapp DESTINATION bin)
