#!/bin/bash

ENV="/home/mannouao/Desktop/inception/srcs/.env"

CERTS="/home/mannouao/Desktop/inception/srcs/requirements/tools/certs"

export $(cat $ENV | xargs)

if ! grep -q "$DOMAIN_NAME" /etc/hosts; then
	echo "127.0.0.1		$DOMAIN_NAME www.$DOMAIN_NAME" >> /etc/hosts;
fi

if [ ! "$(ls -A $CERTS)" ]; then
	openssl req -x509 -nodes -days 365 -subj \
       "/C=MA/ST=Marrakesh-Safi/L=Ben-Guerir/O=YouCan't/OU=IT/CN=${DOMAIN_NAME}" \
        -newkey rsa:2048 -keyout $CERTS/nginx-selfsigned.key \
        -out $CERTS/nginx-selfsigned.crt
fi
