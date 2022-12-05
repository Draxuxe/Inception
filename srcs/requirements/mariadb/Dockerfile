FROM debian:buster

RUN	apt-get update -y	\
&&	apt-get upgrade -y	\
&&	apt-get install -y mariadb-server \
&&  rm -rf /var/lib/apt/lists/* \
&&  mkdir -p /var/run/mysqld \
&&  chown -R mysql:mysql /var/run/mysqld \
&&  chmod 777 /var/run/mysqld

COPY ./conf/start.sh /
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x ./start.sh \
&&  sh ./start.sh

RUN service mysql start	\
&&  mysql < setup.sql

EXPOSE	3306

CMD ["mysqld_safe"]