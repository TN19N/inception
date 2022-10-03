FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache php8 php8-fpm gettext

EXPOSE 9000

RUN addgroup -S wordpress && adduser -S wordpress -G wordpress

WORKDIR /etc/php8/php-fpm.d

RUN rm -rf *.conf

ADD tools/run.sh .

ADD conf/* .

CMD ["./run.sh"]
