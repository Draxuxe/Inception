FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server

COPY conf/ /

ARG MYSQL_ROOT_PWD
ARG MYSQL_USR
ARG MYSQL_USR_PWD
ARG MYSQL_DB
ARG DB_HOST
ARG MYSQL_ROOT_USR

RUN sh db_setup.sh

ENTRYPOINT [ "mysqld" ]