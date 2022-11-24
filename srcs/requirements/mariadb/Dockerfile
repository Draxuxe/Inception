FROM debian:buster

EXPOSE 3306

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY ./conf/setup.sh /setup.sh

RUN chmod 777 /setup.sh

ENTRYPOINT ["bash", "setup.sh"]