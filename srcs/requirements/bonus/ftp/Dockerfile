FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cach && \
    apk add --no-cach vsftpd=3.0.5-r1 

RUN mkdir -p /var/www/html

RUN echo "local_root=/var/www/html" >> /etc/
