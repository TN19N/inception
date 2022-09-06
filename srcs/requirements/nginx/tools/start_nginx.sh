#!/bin/sh

mkdir -p /etc/nginx/ssl/private /etc/nginx/ssl/certs

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
            -subj "/C=MA/ST=Marrakech-Safi/L=Ben Guerir/O=YouCan't/OU=IT/CN=${DOMAIN_NAME}" \
            -keyout /etc/nginx/ssl/private/nginx-selfsigned.key \
            -out /etc/nginx/ssl/certs/nginx-selfsigned.crt

envsubst < http.d/default.template > http.d/default.conf

nginx
