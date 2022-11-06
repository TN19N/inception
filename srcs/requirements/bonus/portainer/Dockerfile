FROM alpine:3.16.2

ARG UID GID DGID

RUN addgroup -g $GID portainer &&  addgroup -g $DGID docker \
    && adduser -D -u $UID -G portainer portainer \
    && adduser portainer docker \
    && apk update \
    && apk upgrade --no-cache \
    && apk add --no-cache sudo \
    && echo portainer ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/portainer

USER portainer

EXPOSE 9443 8000

WORKDIR /etc

RUN sudo wget https://github.com/portainer/portainer/releases/download/2.15.1/portainer-2.15.1-linux-amd64.tar.gz \
    && sudo tar xvf portainer-2.15.1-linux-amd64.tar.gz \
    && sudo rm -rf portainer-2.15.1-linux-amd64.tar.gz \
    && sudo mkdir -p /data /var/run 

WORKDIR /etc/portainer

ADD tools/ .

RUN sudo chown -R portainer:portainer /etc/portainer \
    && sudo chown -R portainer:portainer /data 

RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["./portainer"]