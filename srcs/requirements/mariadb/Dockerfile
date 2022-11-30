FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf /var/www/

RUN service mysql start && mysql < /var/www/setup.sh && rm -f /var/www/setup.sh;

CMD ["mysqld"]