FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache nginx=1.22.0-r1 gettext

EXPOSE 443

WORKDIR /etc/nginx

RUN ["mkdir", "certs"]

COPY conf/nginx.conf nginx.conf

ADD conf/server.conf.template http.d/

ADD tools/run.sh .

CMD ["./run.sh"]
