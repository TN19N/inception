FROM alpine:3.16.1

RUN apk update && \
    apk upgrade --no-cach && \
    apk add --no-cach nginx=1.22.0-r1

EXPOSE 443

WORKDIR /etc/nginx

COPY conf/nginx.conf nginx.conf

COPY conf/default.conf http.d/default.conf

COPY index.html /index.html

CMD ["/usr/sbin/nginx"]
