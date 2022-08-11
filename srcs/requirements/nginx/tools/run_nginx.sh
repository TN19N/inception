#!/bin/sh

envsubst < conf/default.templat > conf/default.conf

rm -rf conf/default.templat

mv conf/nginx.conf .

mkdir ssl

openssl req -x509 -nodes -days 1 \
	-subj "/C=MA/ST=Marrakesh-Safi/L=Ben-Guerir/O=42-network/OU=1337/CN=${DOMAIN_NAME} www.${DOMAIN_NAME}" \
	-newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key \
	-out /etc/nginx/ssl/nginx-selfsigned.crt

/usr/sbin/nginx

