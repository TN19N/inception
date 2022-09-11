FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cach && \
    apk add mariadb=10.6.9-r0 

EXPOSE 3306

ADD tools/run.sh .

CMD ["./run.sh"];
