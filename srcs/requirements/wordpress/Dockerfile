FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache php8 php8-fpm php8-opcache php8-gd \
		       php8-mysqli php8-zlib php8-curl curl php-phar

EXPOSE 9000

RUN addgroup -S wordpress && adduser -S wordpress -G wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && sudo mv wp-cli.phar /usr/local/bin/wp

WORKDIR /etc/php8/php-fpm.d

RUN rm -rf *.conf

ADD tools/run.sh .

ADD conf/* .

CMD ["./run.sh"]
