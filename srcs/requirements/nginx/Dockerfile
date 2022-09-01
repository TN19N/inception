FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cach && \
    apk add --no-cach openssl && \
    apk add --no-cach nginx=1.22.0-r1

RUN mkdir -p /etc/nginx/ssl/private /etc/nginx/ssl/certs

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
            -subj "/CN=mannouao.42.fr" \
            -keyout /etc/nginx/ssl/private/nginx-selfsigned.key \
            -out /etc/nginx/ssl/certs/nginx-selfsigned.crt

EXPOSE 443

WORKDIR /etc/nginx

COPY conf/nginx.conf nginx.conf 

COPY conf/default.conf http.d/default.conf

COPY tools/index.html /

CMD ["nginx"]
