FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache mariadb=10.6.9-r0 gettext

EXPOSE 3306

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

WORKDIR /etc/mysql

ADD tools/run.sh .

ADD conf/init.sql.template .

CMD ["./run.sh"]
