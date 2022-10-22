FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cach && \
    apk add --no-cach php8 php8-session

RUN mkdir -p /var/www
WORKDIR /var/www

ADD conf/* . 
ADD tools/* .

RUN chmod +x index.php docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["php", "-S", "0.0.0.0:8080", "-t","/var/www/"]
