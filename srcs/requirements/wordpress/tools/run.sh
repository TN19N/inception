#!/bin/sh

wp --dbname="${WORDPRESS_DB_NAME}" \
	--dbuser="${MYSQL_USER}" \
	--dbpass="${MYSQL_PASSWORD}" \
	--dbhost="${WORDPRESS_DB_HOST}" \
	--force \
	--extra-php << EOF
define('WP_REDIS_HOST', 'redis');
EOF

wp plugin install redis-cache --activate

mkdir -p /var/log/php-fpm8

chown -R wordpress:wordpress /var/www/wordpress

php-fpm8 --nodaemonize
