FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server

COPY conf/ /

ARG MYSQL_ROOT_PWD
ARG MYSQL_USR
ARG MYSQL_USR_PWD
ARG MYSQL_DB
ARG MYSQL_ROOT_USR
ARG MYSQL_USR_PWD

RUN sh db_setup.sh

ENTRYPOINT [ "mysqld" ]