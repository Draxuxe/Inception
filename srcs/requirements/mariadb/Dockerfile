FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y mariadb-server

COPY conf/ /

RUN sh db_setup.sh

ENTRYPOINT [ "mysqld" ]