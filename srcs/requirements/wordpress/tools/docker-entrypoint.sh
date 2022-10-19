#!/bin/sh
set -e

wp config create --path=/var/www/wordpress \
        --dbname="${WORDPRESS_DB_NAME}" \
	--dbuser="${WORDPRESS_DB_USER}" \
	--dbpass="${WORDPRESS_DB_PASSWORD}" \
	--dbhost="${WORDPRESS_DB_HOST}" \
	--force \
	--extra-php << EOF
define('WP_REDIS_HOST', 'redis');
EOF

wp core install --path=/var/www/wordpress \
	--url="${WORDPRESS_SITE_NAME}" \
	--title="${WORDPRESS_SITE_TITLE}" \
	--admin_user="${WORDPRESS_ADMIN_NAME}" \
	--admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
	--admin_email="${WORDPRESS_ADMIN_EMAIL}" \
	--skip-email

wp user create --path=/var/www/wordpress \
       	${WORDPRESS_USER_NAME} ${WORDPRESS_USER_EMAIL}\
	--role=${WORDPRESS_USER_ROLE} \
	--user_pass=${WORDPRESS_USER_PASSWORD}

wp plugin install redis-cache --path=/var/www/wordpress --activate

wp redis enable --path=/var/www/wordpress

mkdir -p /var/log/php-fpm8

chown -R wordpress:wordpress /var/www/wordpress

rm -f  docker-entrypoint.sh
exec "$@"
