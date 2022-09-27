#!/bin/sh

cd http.d

envsubst < server.conf.template > server.conf

rm -f *.template default.conf

cd .. && mkdir certs private

openssl req -x509 -nodes -days 365 -subj \
       "/C=MA/ST=Marrakesh-Safi/L=Ben-Guerir/O=YouCan't/OU=IT/CN=${DOMAIN_NAME}" \
        -newkey rsa:2048 -keyout /etc/nginx/private/nginx-selfsigned.key \
	-out /etc/nginx/certs/nginx-selfsigned.crt

nginx -g 'daemon off;'
