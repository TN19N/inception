FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cach && \
    apk add --no-cach php8 php8-session php8-mysqli

EXPOSE 8080

RUN mkdir -p /var/www
WORKDIR /var/www

ADD portfolio/ .
ADD tools/* .

RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["php", "-S", "0.0.0.0:8080", "-t","/var/www/"]
