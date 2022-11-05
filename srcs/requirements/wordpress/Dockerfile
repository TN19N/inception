FROM alpine:3.16.2

ARG UID GID

RUN addgroup -g $GID wordpress && adduser -D -u $UID -G wordpress wordpress \
    && apk update \
    && apk upgrade --no-cache \
    && apk add --no-cache sudo php8 php8-fpm php8-opcache php8-gd \
    php8-mysqli php8-zlib php8-curl php8-iconv curl php-phar mariadb-client \
    && echo wordpress ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/wordpress

USER wordpress

EXPOSE 9000

RUN sudo curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && sudo chmod +x wp-cli.phar && sudo mv wp-cli.phar /usr/local/bin/wp \
    && sudo mkdir -p /var/www/wordpress /var/log/php-fpm8 \
    && sudo chown -R wordpress:wordpress /var/www/wordpress /var/log/php-fpm8 \
    && wp core download --path=/var/www/wordpress

WORKDIR /etc/php8/php-fpm.d

RUN sudo rm -rf *.conf

ADD tools/ .
ADD conf/ .

RUN sudo chown -R wordpress:wordpress /etc/php8 \
    && sudo chown -R wordpress:wordpress /var/log/php8 \
    && chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["php-fpm8", "--nodaemonize"]