# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    docker-entrypoint.sh                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mannouao <mannouao@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/28 16:50:29 by mannouao          #+#    #+#              #
#    Updated: 2022/10/28 16:52:46 by mannouao         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh
set -xe

wp config create --path=/var/www/wordpress \
        --dbname="${WORDPRESS_DB_NAME}" \
	--dbuser="${WORDPRESS_DB_USER}" \
	--dbpass="${WORDPRESS_DB_PASSWORD}" \
	--dbhost="${WORDPRESS_DB_HOST}" \
	--force \
	--extra-php << EOF
define('WP_REDIS_HOST', 'redis');
EOF

if ! wp core is-installed --path=/var/www/wordpress; then
	wp core install --path=/var/www/wordpress \
		--url="${WORDPRESS_SITE_NAME}" \
		--title="${WORDPRESS_SITE_TITLE}" \
		--admin_user="${WORDPRESS_ADMIN_NAME}" \
		--admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
		--admin_email="${WORDPRESS_ADMIN_EMAIL}" \
		--skip-email
fi

if ! wp user get ${WORDPRESS_USER_NAME} --path=/var/www/wordpress; then
	wp user create --path=/var/www/wordpress \
       		${WORDPRESS_USER_NAME} ${WORDPRESS_USER_EMAIL}\
		--role=${WORDPRESS_USER_ROLE} \
		--user_pass=${WORDPRESS_USER_PASSWORD}
fi

if ! wp plugin is-installed redis-cache --path=/var/www/wordpress; then
	wp plugin install redis-cache --path=/var/www/wordpress
fi

if ! wp plugin is-active redis-cache --path=/var/www/wordpress; then
	wp plugin activate redis-cache --path=/var/www/wordpress
fi

wp redis enable --path=/var/www/wordpress

mkdir -p /var/log/php-fpm8

chown -R wordpress:wordpress /var/www/wordpress

exec "$@"
