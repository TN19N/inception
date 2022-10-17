FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache mariadb=10.6.9-r0 gettext

EXPOSE 3306

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

WORKDIR /etc/mysql

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql > /dev/null

ADD tools/* .
ADD conf/* .

RUN chmod +x docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["mysqld", "--user=mysql", "--init-file=/etc/mysql/init.sql", "--skip-networking=0"]
