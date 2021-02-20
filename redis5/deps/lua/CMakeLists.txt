cmake_minimum_required(VERSION 3.0)
project(lua)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/objs)
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/objs)

# Lua version and release.
set(V 5.1)
set(R 5.1.5)

set(CMAKE_C_FLAGS "-std=gnu99 -pedantic -Wall")
add_definitions(-DLUA_USE_LINUX -D_GNU_SOURCE -D_REENTRANT)

include_directories(
        ${CMAKE_CURRENT_SOURCE_DIR}/src
)

set(SRC_LIST
        src/lapi.c
        src/lcode.c
        src/ldebug.c
        src/ldo.c
        src/ldump.c
        src/lfunc.c
        src/lgc.c
        src/llex.c
        src/lmem.c
        src/lobject.c
        src/lopcodes.c
        src/lparser.c
        src/lstate.c
        src/lstring.c
        src/ltable.c
        src/ltm.c
        src/lundump.c
        src/lvm.c
        src/lzio.c
        src/strbuf.c
        src/fpconv.c
        src/lauxlib.c
        src/lbaselib.c
        src/ldblib.c
        src/liolib.c
        src/lmathlib.c
        src/loslib.c
        src/ltablib.c
        src/lstrlib.c
        src/loadlib.c
        src/linit.c
        src/lua_cjson.c
        src/lua_struct.c
        src/lua_cmsgpack.c
        src/lua_bit.c
        )

# static library
ADD_LIBRARY(lua_static STATIC ${SRC_LIST})
set_target_properties(lua_static PROPERTIES OUTPUT_NAME "lua")
set_target_properties(lua_static PROPERTIES CLEAN_DIRECT_OUTPUT 1)
set_target_properties(lua_static PROPERTIES LINKER_LANGUAGE "C")
set_target_properties(lua_static PROPERTIES ARCHIVE_OUTPUT_DIRECTORY "${LIBRARY_OUTPUT_PATH}")
