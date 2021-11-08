FROM alpine:3.12
MAINTAINER constbar

RUN apk update
RUN apk upgrade
RUN apk add supervisor
RUN apk add php7 php7-fpm php7-opcache
RUN apk add php7-gd php7-iconv php7-mysqli
RUN apk add php7-zlib php7-curl php7-mbstring
RUN apk add php7-json php7-session vim

COPY ./ /
ADD https://wordpress.org/latest.tar.gz .
RUN tar -xzvf latest.tar.gz
RUN mv wordpress /var/wordpress/
RUN cp conf/config.php wp-config.php
RUN mv wp-config.php /var/wordpress
RUN mv /tools/supervisord.conf /etc/supervisord.conf
RUN rm -rf latest.tar.gz Dockerfile tools conf
RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/php7/php-fpm.d/www.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

EXPOSE 9000