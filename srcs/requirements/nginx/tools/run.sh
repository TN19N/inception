#!/bin/sh

cd http.d

envsubst < server.conf.template > server.conf

rm -f *.template default.conf

nginx -g 'daemon off;'
