FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cach && \
    apk add --no-cach gettext && \
    apk add --no-cach openssl && \
    apk add --no-cach nginx=1.22.0-r1

EXPOSE 443

WORKDIR /etc/nginx

COPY conf/nginx.conf ./nginx.conf 

COPY conf/default.template ./http.d/

COPY tools/index.html /

COPY tools/start_nginx.sh .

CMD ["./start_nginx.sh"]
