FROM alpine:3.16.1

RUN apk update && \
    apk upgrade --no-cach && \
    apk add --no-cach nginx=1.22.0-r1

EXPOSE 80/tcp

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
