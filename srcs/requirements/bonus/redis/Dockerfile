From alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cach && \
    apk add redis=7.0.5-r0

EXPOSE 6379

CMD ["redis-server", "--protected-mode", "no"]
