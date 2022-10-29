FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache nginx=1.22.1-r0 gettext openssl

EXPOSE 443

WORKDIR /etc/nginx

COPY conf/nginx.conf nginx.conf

ADD conf/*.template http.d/
ADD tools/ .

RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
