cmake_minimum_required(VERSION 3.0)
project(redis_git)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/objs)

set(CMAKE_C_FLAGS "-std=gnu99 -pedantic -DREDIS_STATIC=''")
##add_definitions(-D_GNU_SOURCE -D_REENTRANT)

include_directories(
        ${CMAKE_CURRENT_SOURCE_DIR}/src
        ${CMAKE_CURRENT_SOURCE_DIR}/deps/lua/src
        ${CMAKE_CURRENT_SOURCE_DIR}/deps/geohash-int
        ${CMAKE_CURRENT_SOURCE_DIR}/deps/hiredis
        ${CMAKE_CURRENT_SOURCE_DIR}/deps/linenoise
)


## 编译 lua
ADD_SUBDIRECTORY(deps/lua)

set(REDIS_CLI_SRC
        src/anet.c src/adlist.c src/redis-cli.c
        src/zmalloc.c src/release.c src/anet.c src/ae.c src/crc64.c
        deps/linenoise/linenoise.c
        deps/hiredis/sds.c deps/hiredis/hiredis.c
        deps/hiredis/net.c
        )


set(REDIS_SVR_SRC
        deps/geohash-int/geohash.c
        deps/geohash-int/geohash_helper.c
        deps/hiredis/async.c
        deps/hiredis/hiredis.c
        deps/hiredis/net.c
        src/adlist.c
        src/ae.c
        src/anet.c
        src/aof.c
        src/bio.c
        src/bitops.c
        src/blocked.c
        src/cluster.c
        src/config.c
        src/crc16.c
        src/crc64.c
        src/db.c
        src/debug.c
        src/dict.c
        src/endianconv.c
        src/geo.c
        src/hyperloglog.c
        src/intset.c
        src/latency.c
        src/lzf_c.c
        src/lzf_d.c
        src/memtest.c
        src/multi.c
        src/networking.c
        src/notify.c
        src/object.c
        src/pqsort.c
        src/pubsub.c
        src/quicklist.c
        src/rand.c
        src/rdb.c
        src/release.c
        src/replication.c
        src/rio.c
        src/sds.c
        src/sentinel.c
        src/server.c
        src/setproctitle.c
        src/sha1.c
        src/slowlog.c
        src/sort.c
        src/sparkline.c
        src/syncio.c
        src/t_list.c
        src/t_set.c
        src/t_string.c
        src/t_zset.c
        src/util.c
        src/ziplist.c
        src/zipmap.c
        src/zmalloc.c
        src/t_hash.c
        src/redis-check-rdb.c
        src/scripting.c
        )

add_executable(redis_git ${REDIS_SVR_SRC})
target_link_libraries(redis_git m pthread jemalloc lua_static)
set_target_properties(redis_git PROPERTIES LINKER_LANGUAGE "C")
set_target_properties(redis_git PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${EXECUTABLE_OUTPUT_PATH}")

add_executable(redis_cli ${REDIS_CLI_SRC})
target_link_libraries(redis_cli m pthread jemalloc)
set_target_properties(redis_cli PROPERTIES LINKER_LANGUAGE "C")
set_target_properties(redis_cli PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${EXECUTABLE_OUTPUT_PATH}")
