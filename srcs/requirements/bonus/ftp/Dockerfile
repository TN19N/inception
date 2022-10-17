FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cach && \
    apk add --no-cach vsftpd=3.0.5-r1 

EXPOSE 20 21 20100-20110

WORKDIR /etc/vsftpd

RUN mkdir -p /var/www/html
RUN mkdir -p /var/log/vsftpd && touch /var/log/vsftpd/vsftpd.log

ADD tools/* .
COPY conf/vsftpd.conf vsftpd.conf

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["vsftpd"]
