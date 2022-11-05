FROM alpine:3.16.2

ARG UID GID FTP_USER_NAME FTP_USER_PASSWORD

RUN addgroup -g $GID $FTP_USER_NAME && adduser -h /var/www/wordpress -D -u $UID -G $FTP_USER_NAME $FTP_USER_NAME \
    && echo "$FTP_USER_NAME:$FTP_USER_PASSWORD" | chpasswd \
    && apk update \
    && apk upgrade --no-cache \
    && apk add --no-cache sudo vsftpd \
    && echo $FTP_USER_NAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$FTP_USER_NAME

USER $FTP_USER_NAME

EXPOSE 21 20 20000-20010

WORKDIR /etc/vsftpd

RUN sudo mkdir -p /var/log/vsftpd && sudo touch /var/log/vsftpd/vsftpd.log

COPY conf/vsftpd.conf vsftpd.conf
ADD tools/ .

RUN echo $FTP_USER_NAME | sudo tee vsftpd.userlist \
    && sudo chmod +x docker-entrypoint.sh

ENTRYPOINT ["sudo", "./docker-entrypoint.sh"]

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]