FROM alpine:3.16.2

RUN apk update && \
    apk upgrade && \
    apk add nginx=1.22.0-r1 gettext

EXPOSE 80

WORKDIR /etc/nginx

COPY conf/nginx.conf nginx.conf

ADD conf/server.conf.template http.d/

ADD tools/run.sh .

COPY tools/index.html /

CMD ["./run.sh"]
