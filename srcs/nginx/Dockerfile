FROM alpine:3.14
MAINTAINER agroup

RUN apk update
RUN apk upgrade
RUN apk add nginx
RUN apk add openssl
RUN apk add supervisor

COPY ./ /
RUN mv tools/supervisord.conf /etc/supervisord.conf
RUN mv conf/nginx.conf /etc/nginx/http.d/
RUN rm /etc/nginx/http.d/default.conf
RUN rm -rf Dockerfile tools conf

RUN openssl req -x509 -new -newkey rsa:2048 -nodes \
    -keyout /etc/ssl/private/localhost.key -out /etc/ssl/certs/localhost.crt \
    -subj "/C=RU/L=Moscow/O=ecole42/OU=school21/CN=localhost"

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 443