From alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cach && \
    apk add --no-cach redis=7.0.5-r0

EXPOSE 6379

ADD conf/ .
ADD tools/ .

RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["redis-server", "--protected-mode", "no"]
