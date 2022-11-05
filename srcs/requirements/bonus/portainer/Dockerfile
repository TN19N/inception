FROM alpine:3.16.2

RUN apk update && \
    apk upgrade --no-cache

EXPOSE 9443 8000

WORKDIR /etc

RUN wget https://github.com/portainer/portainer/releases/download/2.15.1/portainer-2.15.1-linux-amd64.tar.gz && tar xvf portainer-2.15.1-linux-amd64.tar.gz && rm portainer-2.15.1-linux-amd64.tar.gz 

WORKDIR /etc/portainer

ADD tools/ .

RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["./portainer", "--assets", "/etc/portainer"]
