FROM alpine:3.12
MAINTAINER agroup

RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN apk add openssl
RUN apk add supervisor

COPY ./ /
RUN mv supervisord.conf /etc/supervisord.conf
RUN mkdir -p /run/nginx
RUN mv nginx.conf /etc/nginx/conf.d/default.conf
RUN mv index.html /var/www/

RUN openssl req -x509 -new -newkey rsa:2048 -nodes \
    -keyout /etc/ssl/private/privkey.key -out /etc/ssl/certs/cert.crt \
    -subj "/C=RU/ST=Ivanovskaya/L=Ivanovo/O=ecole42/OU=school21/CN=agroup"

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 80
EXPOSE 443