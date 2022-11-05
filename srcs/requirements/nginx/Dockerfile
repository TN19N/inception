FROM alpine:3.16.2

ARG UID GID

RUN addgroup -g $GID nginx && adduser -D -u $UID -G nginx nginx \
    && apk update \
    && apk upgrade --no-cache \
    && apk add --no-cache sudo nginx gettext openssl \ 
    && echo nginx ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/nginx

USER nginx

EXPOSE 443

WORKDIR /etc/nginx

COPY conf/nginx.conf nginx.conf

ADD conf/*.template http.d/
ADD tools/ .

RUN mkdir -p /var/run /var/log/nginx && sudo touch /var/run/nginx.pid

RUN sudo chown -R nginx:nginx /etc/nginx \
    && sudo chown -R nginx:nginx /var/lib/nginx \
    && sudo chown -R nginx:nginx /var/log/nginx \
    && sudo chown -R nginx:nginx /var/run/nginx.pid \
    && chmod +x docker-entrypoint.sh

RUN chmod +x docker-entrypoint.sh
ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["nginx"]