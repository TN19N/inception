FROM alpine:3.16.2

ARG UID GID

RUN addgroup -g $GID adminer && adduser -D -u $UID -G adminer adminer \
    && apk update \
    && apk upgrade --no-cache \
    && apk add --no-cache sudo php8 php8-session php8-mysqli \
    && echo adminer ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/adminer

USER adminer

EXPOSE 8080

WORKDIR /etc/adminer

RUN sudo wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -O index.php

ADD tools/ .

RUN sudo chown -R adminer:adminer /etc/adminer \
    && chmod +x docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["php", "-S", "0.0.0.0:8080", "-t","/etc/adminer/"]