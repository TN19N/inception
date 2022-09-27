FROM alpine:3.16.2

RUN apk update && \
    apk upgrade && \
    apk add nginx=1.22.0-r1

EXPOSE 80

WORKDIR /etc/nginx

COPY conf/nginx.conf nginx.conf

COPY conf/server.conf http.d/default.conf

COPY tools/index.html /

CMD ["nginx", "-g", "daemon off;"]
