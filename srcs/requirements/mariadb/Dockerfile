FROM debian:buster

EXPOSE 3306

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get install mariadb-server -y

COPY ./conf/50-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./conf/setup.sh /tmp/setup.sh

RUN chmod 777 /tmp/setup.sh

ENTRYPOINT ["sh", "/tmp/setup.sh"]