#!/bin/sh

envsubst < default.templat > default.conf

mkdir /etc/nginx/ssl

openssl req -x509 -nodes -days 1 \
	-subj "/CN=${DOMAIN_NAME} www.${DOMAIN_NAME}" \
	-newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key \
	-out /etc/nginx/ssl/nginx-selfsigned.crt

/usr/sbin/nginx

