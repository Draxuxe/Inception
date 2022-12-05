FROM debian:buster

RUN	apt-get update -y	\
&&	apt-get upgrade -y	\
&&	apt-get install -y mariadb-server \
&&  rm -rf /var/lib/apt/lists/* \
&&  mkdir -p /run/mysqld \
&&  chmod 777 /var/run/mysqld

COPY ./conf/start.sh /
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x ./start.sh 

RUN service mysql start	\
&&  mysql < setup.sql

RUN sh start.sh \
&& service mysql restart

EXPOSE	3306

CMD ["mysqld_safe", "--datadir=/var/lib/mysql"]