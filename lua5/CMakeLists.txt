cmake_minimum_required(VERSION 3.0)
project(lua)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/objs)
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/objs)

# Lua version and release.
set(V 5.3)
set(R ${V}.3)

set(CMAKE_C_FLAGS "-std=gnu99 -pedantic -Wall")
#Linux选项
#add_definitions(-DLUA_USE_LINUX -D_GNU_SOURCE)
#mingw64 选项
add_definitions(-DLUA_COMPAT_MATHLIB)

include_directories(
        ${CMAKE_CURRENT_SOURCE_DIR}/src
)

set(LUA_SRC src/lua.c)

set(CORE_SRC
        src/lapi.c
        src/lcode.c src/lctype.c src/ldebug.c src/ldo.c src/ldump.c src/lfunc.c src/lgc.c src/llex.c
        src/lmem.c src/lobject.c src/lopcodes.c src/lparser.c src/lstate.c src/lstring.c src/ltable.c
        src/ltm.c src/lundump.c src/lvm.c src/lzio.c)
set(LIB_SRC
        src/lauxlib.c src/lbaselib.c src/lbitlib.c src/lcorolib.c src/ldblib.c src/liolib.c
        src/lmathlib.c src/loslib.c src/lstrlib.c src/ltablib.c src/lutf8lib.c src/loadlib.c src/linit.c)

# static library
ADD_LIBRARY(lua_static STATIC ${CORE_SRC} ${LIB_SRC})
set_target_properties(lua_static PROPERTIES OUTPUT_NAME "lua")
set_target_properties(lua_static PROPERTIES CLEAN_DIRECT_OUTPUT 1)
set_target_properties(lua_static PROPERTIES LINKER_LANGUAGE "C")
set_target_properties(lua_static PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${LIBRARY_OUTPUT_PATH}")

#build execute file
ADD_EXECUTABLE(lua ${LUA_SRC})
target_link_libraries(lua lua_static)
set_target_properties(lua PROPERTIES OUTPUT_NAME "lua")
set_target_properties(lua PROPERTIES CLEAN_DIRECT_OUTPUT 1)
set_target_properties(lua PROPERTIES LINKER_LANGUAGE "C")
set_target_properties(lua PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${EXECUTABLE_OUTPUT_PATH}")
