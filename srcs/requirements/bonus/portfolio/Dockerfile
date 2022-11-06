FROM alpine:3.16.2

ARG UID GID

RUN addgroup -g $GID portfolio && adduser -D -u $UID -G portfolio portfolio \
    && apk update \
    && apk upgrade --no-cache \
    && apk add --no-cache sudo php8 php8-session php8-mysqli \
    && echo portfolio ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/portfolio

USER portfolio

EXPOSE 8080

WORKDIR /var/www/html

ADD portfolio/ .
ADD tools/ .

RUN sudo chown -R portfolio:portfolio /var/www/html \
    && chmod +x docker-entrypoint.sh

RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["php", "-S", "0.0.0.0:8080", "-t","/var/www/html"]