FROM alpine:3.16.2

ARG UID GID

RUN addgroup -g $GID redis && adduser -D -u $UID -G redis redis \
    && apk update \
    && apk upgrade --no-cache \
    && apk add --no-cache sudo redis \
    && echo redis ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/redis

USER redis

WORKDIR /etc/redis

EXPOSE 6379

ADD tools/ .

RUN sudo chown -R redis:redis /etc/redis \
    && chmod +x docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["redis-server", "--protected-mode", "no"]