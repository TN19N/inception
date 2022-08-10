FROM alpine:3.16.1

RUN apk update && \
    apk upgrade --no-cach && \
    apk add --no-cach gettext && \
    apk add --no-cach openssl && \
    apk add --no-cach nginx=1.22.0-r1

EXPOSE 443

WORKDIR /etc/nginx/http.d

COPY tools/run_nginx.sh ..

COPY conf/nginx.conf ../nginx.conf

COPY conf/default.templat .

COPY index.html /

CMD ["../run_nginx.sh"]
