FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cach && \
    apk add --no-cach vsftpd=3.0.5-r1 

EXPOSE 21 30000-30009

RUN mkdir -p /var/www/html

COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

CMD ["vsftpd"]
