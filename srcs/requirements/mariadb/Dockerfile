FROM alpine:3.16.2

ARG UID GID

RUN addgroup -g $GID mysql && adduser -D -u $UID -G mysql mysql \
    && apk update \
    && apk upgrade --no-cache \
    && apk add --no-cache sudo mariadb gettext \
    && echo mysql ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/mysql

USER mysql

EXPOSE 3306

RUN sudo mkdir -p /run/mysqld /var/lib/mysql /etc/mysql

WORKDIR /etc/mysql

ADD tools/ .
ADD conf/ .

RUN sudo chown -R mysql:mysql /run/mysqld \
    && sudo chown -R mysql:mysql /var/lib/mysql \
    && sudo chown -R mysql:mysql /etc/mysql \
    && chmod +x docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["mysqld", "--user=mysql", "--init-file=/etc/mysql/init.sql", "--skip-networking=0"]