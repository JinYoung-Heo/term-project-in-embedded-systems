# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\CMake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\CMake\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\code\cJSON

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\build

# Include any dependencies generated for this target.
include tests/CMakeFiles/print_string.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/print_string.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/print_string.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/print_string.dir/flags.make

tests/CMakeFiles/print_string.dir/codegen:
.PHONY : tests/CMakeFiles/print_string.dir/codegen

tests/CMakeFiles/print_string.dir/print_string.c.obj: tests/CMakeFiles/print_string.dir/flags.make
tests/CMakeFiles/print_string.dir/print_string.c.obj: C:/Users/wlsdu/Desktop/developer/term-project-in-embedded-systems/code/cJSON/tests/print_string.c
tests/CMakeFiles/print_string.dir/print_string.c.obj: tests/CMakeFiles/print_string.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object tests/CMakeFiles/print_string.dir/print_string.c.obj"
	cd /d C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\build\tests && C:\msys64\ucrt64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT tests/CMakeFiles/print_string.dir/print_string.c.obj -MF CMakeFiles\print_string.dir\print_string.c.obj.d -o CMakeFiles\print_string.dir\print_string.c.obj -c C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\code\cJSON\tests\print_string.c

tests/CMakeFiles/print_string.dir/print_string.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/print_string.dir/print_string.c.i"
	cd /d C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\build\tests && C:\msys64\ucrt64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\code\cJSON\tests\print_string.c > CMakeFiles\print_string.dir\print_string.c.i

tests/CMakeFiles/print_string.dir/print_string.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/print_string.dir/print_string.c.s"
	cd /d C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\build\tests && C:\msys64\ucrt64\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\code\cJSON\tests\print_string.c -o CMakeFiles\print_string.dir\print_string.c.s

# Object files for target print_string
print_string_OBJECTS = \
"CMakeFiles/print_string.dir/print_string.c.obj"

# External object files for target print_string
print_string_EXTERNAL_OBJECTS =

tests/print_string.exe: tests/CMakeFiles/print_string.dir/print_string.c.obj
tests/print_string.exe: tests/CMakeFiles/print_string.dir/build.make
tests/print_string.exe: libcjson.dll.a
tests/print_string.exe: tests/libunity.a
tests/print_string.exe: tests/CMakeFiles/print_string.dir/linkLibs.rsp
tests/print_string.exe: tests/CMakeFiles/print_string.dir/objects1.rsp
tests/print_string.exe: tests/CMakeFiles/print_string.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable print_string.exe"
	cd /d C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\build\tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\print_string.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/print_string.dir/build: tests/print_string.exe
.PHONY : tests/CMakeFiles/print_string.dir/build

tests/CMakeFiles/print_string.dir/clean:
	cd /d C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\build\tests && $(CMAKE_COMMAND) -P CMakeFiles\print_string.dir\cmake_clean.cmake
.PHONY : tests/CMakeFiles/print_string.dir/clean

tests/CMakeFiles/print_string.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\code\cJSON C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\code\cJSON\tests C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\build C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\build\tests C:\Users\wlsdu\Desktop\developer\term-project-in-embedded-systems\build\tests\CMakeFiles\print_string.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : tests/CMakeFiles/print_string.dir/depend
