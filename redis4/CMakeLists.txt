cmake_minimum_required(VERSION 3.0)
project(redis_git)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/objs)

set(CMAKE_C_FLAGS "-std=gnu99 -pedantic -DREDIS_STATIC='' -DUSE_JEMALLOC")
##add_definitions(-D_GNU_SOURCE -D_REENTRANT)

include_directories(
        ${CMAKE_CURRENT_SOURCE_DIR}/src
        ${CMAKE_CURRENT_SOURCE_DIR}/deps/lua/src
        ${CMAKE_CURRENT_SOURCE_DIR}/deps/hiredis
        ${CMAKE_CURRENT_SOURCE_DIR}/deps/linenoise
        ${CMAKE_CURRENT_SOURCE_DIR}/deps/jemalloc/include
)

link_directories(deps/jemalloc/lib)

## 编译子模块 lua
ADD_SUBDIRECTORY(deps/lua)

set(REDIS_CLI_SRC
        src/anet.c src/adlist.c src/redis-cli.c
        src/zmalloc.c src/release.c src/anet.c src/ae.c src/crc64.c
        deps/linenoise/linenoise.c
        deps/hiredis/sds.c deps/hiredis/hiredis.c deps/hiredis/read.c deps/hiredis/net.c
        )

set(REDIS_SVR_SRC
        src/adlist.c
        src/quicklist.c
        src/ae.c
        src/anet.c
        src/dict.c
        src/server.c
        src/sds.c
        src/zmalloc.c
        src/lzf_c.c
        src/lzf_d.c
        src/pqsort.c
        src/zipmap.c
        src/sha1.c
        src/ziplist.c
        src/release.c
        src/networking.c
        src/util.c
        src/object.c
        src/db.c
        src/replication.c
        src/rdb.c
        src/t_string.c
        src/t_list.c
        src/t_set.c
        src/t_zset.c
        src/t_hash.c
        src/config.c
        src/aof.c
        src/pubsub.c
        src/multi.c
        src/debug.c
        src/sort.c
        src/intset.c
        src/syncio.c
        src/cluster.c
        src/crc16.c
        src/endianconv.c
        src/slowlog.c
        src/scripting.c
        src/bio.c
        src/rio.c
        src/rand.c
        src/memtest.c
        src/crc64.c
        src/bitops.c
        src/notify.c
        src/setproctitle.c
        src/blocked.c
        src/hyperloglog.c
        src/latency.c
        src/sparkline.c
        src/redis-check-rdb.c
        src/redis-check-aof.c
        src/geo.c
        src/lazyfree.c
        src/module.c
        src/evict.c
        src/expire.c
        src/geohash.c
        src/geohash_helper.c
        src/childinfo.c
        src/defrag.c
        src/siphash.c
        src/rax.c
#--------------------------
# build sentinel 代码
src/sentinel.c
deps/hiredis/async.c
deps/hiredis/hiredis.c
deps/hiredis/net.c
deps/hiredis/read.c
#--------------------------
        )

add_executable(redis-server ${REDIS_SVR_SRC})
target_link_libraries(redis-server dl m jemalloc pthread lua_static)
set_target_properties(redis-server PROPERTIES LINKER_LANGUAGE "C")
set_target_properties(redis-server PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${EXECUTABLE_OUTPUT_PATH}")

add_executable(redis-cli ${REDIS_CLI_SRC})
target_link_libraries(redis-cli dl m jemalloc pthread)
set_target_properties(redis-cli PROPERTIES LINKER_LANGUAGE "C")
set_target_properties(redis-cli PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${EXECUTABLE_OUTPUT_PATH}")
