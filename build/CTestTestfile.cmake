# CMake generated Testfile for 
# Source directory: C:/Users/wlsdu/Desktop/developer/term-project-in-embedded-systems/code/cJSON
# Build directory: C:/Users/wlsdu/Desktop/developer/term-project-in-embedded-systems/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(cJSON_test "C:/Users/wlsdu/Desktop/developer/term-project-in-embedded-systems/build/cJSON_test")
set_tests_properties(cJSON_test PROPERTIES  _BACKTRACE_TRIPLES "C:/Users/wlsdu/Desktop/developer/term-project-in-embedded-systems/code/cJSON/CMakeLists.txt;248;add_test;C:/Users/wlsdu/Desktop/developer/term-project-in-embedded-systems/code/cJSON/CMakeLists.txt;0;")
subdirs("tests")
subdirs("fuzzing")
