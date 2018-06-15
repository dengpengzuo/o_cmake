cmake_minimum_required(VERSION 3.0)
project(tengine.git)

set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/objs)
set(CMAKE_C_FLAGS "-pipe -W -Wall -Wpointer-arith -Wno-unused-parameter -Werror -ggdb ")
add_definitions(-D_GNU_SOURCES -DNGX_DEBUG)

include_directories(
        ${CMAKE_CURRENT_SOURCE_DIR}/src/core
        ${CMAKE_CURRENT_SOURCE_DIR}/src/event
        ${CMAKE_CURRENT_SOURCE_DIR}/src/event/modules
        ${CMAKE_CURRENT_SOURCE_DIR}/src/os/unix
        ${CMAKE_CURRENT_SOURCE_DIR}/src/proc
        ${CMAKE_CURRENT_SOURCE_DIR}/objs
        ${CMAKE_CURRENT_SOURCE_DIR}/src/http
        ${CMAKE_CURRENT_SOURCE_DIR}/src/http/v2/
        ${CMAKE_CURRENT_SOURCE_DIR}/src/http/modules
        ${CMAKE_CURRENT_SOURCE_DIR}/src/mail
)

set(SOURCE_FILES
        src/core/nginx.c
        src/core/ngx_log.c
        src/core/ngx_palloc.c
        src/core/ngx_array.c
        src/core/ngx_list.c
        src/core/ngx_hash.c
        src/core/ngx_buf.c
        src/core/ngx_queue.c
        src/core/ngx_output_chain.c
        src/core/ngx_string.c
        src/core/ngx_parse.c
        src/core/ngx_inet.c
        src/core/ngx_file.c
        src/core/ngx_crc32.c
        src/core/ngx_murmurhash.c
        src/core/ngx_md5.c
        src/core/ngx_rbtree.c
        src/core/ngx_trie.c
        src/core/ngx_segment_tree.c
        src/core/ngx_radix_tree.c
        src/core/ngx_slab.c
        src/core/ngx_times.c
        src/core/ngx_shmtx.c
        src/core/ngx_connection.c
        src/core/ngx_cycle.c
        src/core/ngx_spinlock.c
        src/core/ngx_cpuinfo.c
        src/core/ngx_conf_file.c
        src/core/ngx_resolver.c
        src/core/ngx_open_file_cache.c
        src/core/ngx_crypt.c
        src/core/ngx_proxy_protocol.c
        src/core/ngx_syslog.c
        src/event/ngx_event.c
        src/event/ngx_event_timer.c
        src/event/ngx_event_posted.c
        src/event/ngx_event_accept.c
        src/event/ngx_event_connect.c
        src/event/ngx_event_pipe.c
        src/os/unix/ngx_time.c
        src/os/unix/ngx_errno.c
        src/os/unix/ngx_alloc.c
        src/os/unix/ngx_files.c
        src/os/unix/ngx_socket.c
        src/os/unix/ngx_recv.c
        src/os/unix/ngx_readv_chain.c
        src/os/unix/ngx_udp_recv.c
        src/os/unix/ngx_send.c
        src/os/unix/ngx_writev_chain.c
        src/os/unix/ngx_channel.c
        src/os/unix/ngx_shmem.c
        src/os/unix/ngx_process.c
        src/os/unix/ngx_daemon.c
        src/os/unix/ngx_setproctitle.c
        src/os/unix/ngx_posix_init.c
        src/os/unix/ngx_user.c
        src/os/unix/ngx_pipe.c
        src/os/unix/ngx_sysinfo.c
        src/os/unix/ngx_process_cycle.c
        src/os/unix/ngx_linux_init.c
        src/event/modules/ngx_epoll_module.c
        src/os/unix/ngx_linux_sendfile_chain.c
        src/os/unix/ngx_linux_aio_read.c
        src/core/ngx_dso_module.c
        src/proc/ngx_proc.c
        src/event/ngx_event_openssl.c
        src/event/ngx_event_openssl_stapling.c
        src/core/ngx_regex.c
        src/http/ngx_http.c
        src/http/ngx_http_core_module.c
        src/http/ngx_http_special_response.c
        src/http/ngx_http_request.c
        src/http/ngx_http_parse.c
        src/http/ngx_http_header_filter_module.c
        src/http/ngx_http_write_filter_module.c
        src/http/ngx_http_copy_filter_module.c
        src/http/modules/ngx_http_log_module.c
        src/http/ngx_http_request_body.c
        src/http/ngx_http_variables.c
        src/http/ngx_http_script.c
        src/http/ngx_http_upstream.c
        src/http/ngx_http_upstream_round_robin.c
        src/http/ngx_http_parse_time.c
        src/http/ngx_http_file_cache.c
        src/http/ngx_http_postpone_filter_module.c
        src/http/ngx_http_upstream_check_module.c

        src/http/v2/ngx_http_v2.c
       	src/http/v2/ngx_http_v2_table.c
       	src/http/v2/ngx_http_v2_huff_decode.c
       	src/http/v2/ngx_http_v2_huff_encode.c
       	src/http/v2/ngx_http_v2_module.c
       	src/http/v2/ngx_http_v2_filter_module.c

        src/http/modules/ngx_http_static_module.c
        src/http/modules/ngx_http_index_module.c
        src/http/modules/ngx_http_chunked_filter_module.c
        src/http/modules/ngx_http_range_filter_module.c
        src/http/modules/ngx_http_headers_filter_module.c
        src/http/modules/ngx_http_not_modified_filter_module.c
        src/http/modules/ngx_http_gzip_filter_module.c
        src/http/modules/ngx_http_ssi_filter_module.c
        src/http/modules/ngx_http_charset_filter_module.c
        src/http/modules/ngx_http_userid_filter_module.c
        src/http/modules/ngx_http_footer_filter_module.c
        src/http/modules/ngx_http_trim_filter_module.c
        src/http/modules/ngx_http_autoindex_module.c
        src/http/modules/ngx_http_auth_request_module.c
        src/http/modules/ngx_http_auth_basic_module.c
        src/http/modules/ngx_http_access_module.c
        src/http/modules/ngx_http_limit_conn_module.c
        src/http/modules/ngx_http_limit_req_module.c
        src/http/modules/ngx_http_geo_module.c
        src/http/modules/ngx_http_map_module.c
        src/http/modules/ngx_http_split_clients_module.c
        src/http/modules/ngx_http_referer_module.c
        src/http/modules/ngx_http_rewrite_module.c
        src/http/modules/ngx_http_ssl_module.c
        src/http/modules/ngx_http_proxy_module.c
        src/http/modules/ngx_http_fastcgi_module.c
        src/http/modules/ngx_http_uwsgi_module.c
        src/http/modules/ngx_http_scgi_module.c
        src/http/modules/ngx_http_memcached_module.c
        src/http/modules/ngx_http_empty_gif_module.c
        src/http/modules/ngx_http_browser_module.c
        src/http/modules/ngx_http_user_agent_module.c
        src/http/modules/ngx_http_upstream_hash_module.c
        src/http/modules/ngx_http_upstream_ip_hash_module.c
        src/http/modules/ngx_http_upstream_consistent_hash_module.c
        src/http/modules/ngx_http_upstream_least_conn_module.c
        src/http/modules/ngx_http_upstream_session_sticky_module.c
        src/http/modules/ngx_http_reqstat_module.c
        src/http/modules/ngx_http_upstream_keepalive_module.c
        src/http/modules/ngx_http_upstream_dynamic_module.c
        src/http/modules/ngx_http_stub_status_module.c

        objs/ngx_modules.c objs/ngx_auto_config.h objs/ngx_auto_headers.h
        )

add_executable(nginx ${SOURCE_FILES})
target_link_libraries(nginx pthread dl crypt pcre ssl crypto z jemalloc)
set_target_properties(nginx PROPERTIES LINKER_LANGUAGE "C")
set_target_properties(nginx PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${EXECUTABLE_OUTPUT_PATH}")
