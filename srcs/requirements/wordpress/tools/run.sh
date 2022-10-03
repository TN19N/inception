#!/bin/sh

export DOLLAR='$'

envsubst < /etc/php8/php-fpm.d/wp-config.php.template > /var/www/wordpress/wp-config.php

rm -rf /etc/php8/php-fpm.d/wp-config.php.template

mkdir -p /var/log/php-fpm8

chown -R wordpress:wordpress /var/www/wordpress

php-fpm8 --nodaemonize
