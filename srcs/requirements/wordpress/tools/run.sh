#!/bin/sh

if [ -d "/var/www/html/wordpress"]; then
    rm -rf wp-config.php
else
    cd /var/www/html
    wget https://wordpress.org/wordpress-6.0.2.tar.gz
    tar -xvf wordpress-6.0.2.tar.gz
    rm -rf wordpress-6.0.2.tar.gz
fi

export DOLLAR='$'

envsubst < /etc/php8/php-fpm.d/wp-config.php.template > /var/www/html/wordpress/wp-config.php

rm -rf /etc/php8/php-fpm.d/wp-config.php.template

mkdir -p /var/log/php-fpm8

chown -R wordpress:wordpress /var/www/html/wordpress

php-fpm8 --nodaemonize
