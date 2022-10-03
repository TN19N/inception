#!/bin/sh

cd http.d

export DOLLAR='$'

chown -R nginx:nginx /var/www/wordpress

envsubst < server.conf.template > server.conf

rm -f server.conf.template default.conf

nginx -g 'daemon off;'
