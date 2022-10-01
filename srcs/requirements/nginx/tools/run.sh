#!/bin/sh

cd http.d

export DOLLAR='$'

chown -R nginx:nginx /var/www/html/wordpress

envsubst < server.conf.template > server.conf

rm -f *.template default.conf

nginx -g 'daemon off;'
