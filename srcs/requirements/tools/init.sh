#!/bin/bash

export $(cat /home/mannouao/Desktop/inception/srcs/.env | grep "DOMAIN_NAME=")

mkdir -p "/home/${SUDO_USER}/data/db"
mkdir -p "/home/${SUDO_USER}/data/www"

if ! grep -q "$DOMAIN_NAME" /etc/hosts; then
	echo "127.0.0.1		$DOMAIN_NAME" >> /etc/hosts;
fi
	
if [ ! -d "/home/${SUDO_USER}/data/www/wordpress" ]; then
    cd /home/${SUDO_USER}/data/www/
    echo "heelo"
    wget https://wordpress.org/wordpress-6.0.2.tar.gz
    tar -xvf wordpress-6.0.2.tar.gz
    rm -rf wordpress-6.0.2.tar.gz
fi

