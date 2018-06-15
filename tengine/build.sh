./configure --prefix=./ --conf-path=./conf/nginx.conf \
--http-log-path=./log/nginx/access.log --error-log-path=./log/nginx/error.log \
--lock-path=./log/nginx.lock --pid-path=./log/nginx.pid --http-client-body-temp-path=./log/nginx/body \
--http-fastcgi-temp-path=./log/nginx/fastcgi --http-proxy-temp-path=./log/nginx/proxy \
--http-scgi-temp-path=./log/nginx/scgi --http-uwsgi-temp-path=./log/nginx/uwsgi \
--with-file-aio --with-ipv6 --with-jemalloc --with-http_ssl_module --with-http_v2_module \
--with-debug