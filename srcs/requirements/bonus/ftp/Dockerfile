FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cach && \
    apk add --no-cach vsftpd=3.0.5-r1 lftp

EXPOSE 21 20 20000-20010

WORKDIR /etc/vsftpd

RUN mkdir -p /var/log/vsftpd/ && touch /var/log/vsftpd/vsftpd.log

COPY conf/vsftpd.conf vsftpd.conf
ADD tools/ .

RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
