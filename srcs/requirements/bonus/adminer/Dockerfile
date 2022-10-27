FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cach && \
    apk add --no-cach php8 php8-session php8-mysqli

RUN mkdir -p /var/www
WORKDIR /var/www

RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O index.php

#ADD conf/* . 
ADD tools/* .

RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["php", "-S", "0.0.0.0:8080", "-t","/var/www/"]
