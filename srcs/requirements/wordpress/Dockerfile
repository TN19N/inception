FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache php8 php8-fpm php8-opcache php8-gd \
php8-mysqli php8-zlib php8-curl php8-iconv curl php-phar mariadb-client

EXPOSE 9000

RUN addgroup -S wordpress && adduser -S wordpress -G wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/wordpress
RUN wp core download --path=/var/www/wordpress --version=6.0.2

WORKDIR /etc/php8/php-fpm.d

RUN rm -rf *.conf

ADD tools/* .
ADD conf/* .

RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["php-fpm8", "--nodaemonize"]
