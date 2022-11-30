FROM debian:buster

RUN apt update; \
    apt install -y mariadb-server

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/
COPY ./conf/setup.sh /

RUN service mysql start && mysql < setup.sh && rm -f setup.sh

EXPOSE 3306

CMD /usr/bin/mysqld_safe