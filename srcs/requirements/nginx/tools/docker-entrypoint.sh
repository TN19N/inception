#!/bin/sh
set -ex

mkdir -p certs

openssl req -x509 -nodes -days 365 -subj \
   "/C=MA/ST=Marrakesh-Safi/L=Ben-Guerir/O=YouCan't/OU=IT/CN=${DOMAIN_NAME}" \
        -newkey rsa:2048 -keyout certs/nginx-selfsigned.key \
        -out certs/nginx-selfsigned.crt

cd http.d

export DOLLAR='$'

chown -R nginx:nginx /var/www/wordpress

envsubst < server.conf.template > server.conf

rm -f default.conf
exec "$@"
