FROM alpine:3.14
MAINTAINER constbar

RUN apk update
RUN apk upgrade
RUN apk add openrc
RUN apk add mariadb vim
RUN apk add mariadb-client

ARG USER
ARG PASSWORD
ARG DATABASE

COPY ./ .
RUN mv ./conf/wp.sql /
RUN mkdir -p /run/openrc/
RUN touch /run/openrc/softlevel
RUN chmod +x tools/set_sql.sh
RUN sh tools/set_sql.sh
RUN rm -rf Dockerfile tools conf

CMD ["mysqld_safe", "--skip-networking=0"]

EXPOSE 3306