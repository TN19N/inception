#!/bin/bash

ENV="/home/mannouao/Desktop/inception/srcs/.env"

export $(cat $ENV | xargs)

mkdir -p "/home/mannouao/data/db"
mkdir -p "/home/mannouao/data/www"

if ! grep -q "$DOMAIN_NAME" /etc/hosts; then
	echo "127.0.0.1		$DOMAIN_NAME" >> /etc/hosts;
fi

if [ ! "$(ls -A $CERTS_)" ]; then
	openssl req -x509 -nodes -days 365 -subj \
       "/C=MA/ST=Marrakesh-Safi/L=Ben-Guerir/O=YouCan't/OU=IT/CN=${DOMAIN_NAME}" \
        -newkey rsa:2048 -keyout $CERTS_/nginx-selfsigned.key \
        -out $CERTS_/nginx-selfsigned.crt
	cp $CERTS_/nginx-selfsigned.crt /usr/local/share/ca-certificates/
	update-ca-certificates
fi

if [ ! -d "/home/mannouao/data/www/wordpress" ]; then
    cd /home/mannouao/data/www/
    wget https://wordpress.org/wordpress-6.0.2.tar.gz
    tar -xvf wordpress-6.0.2.tar.gz
    rm -rf wordpress-6.0.2.tar.gz
fi

