FROM debian:buster

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get install mariadb-server -y

COPY ./conf/setup.sh /var/www/setup.sh
COPY ./conf/wordpress.sql /var/www/wordpress.sql
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod 777 /var/www/setup.sh

ARG MYSQL_ROOT_PWD
ARG MYSQL_USR_PWD
ARG MYSQL_USR

ENV WP_DB_NAME=${WP_DB_NAME}
ENV MYSQL_ROOT_PWD=${MYSQL_ROOT_PWD}
ENV MYSQL_USR_PWD=${MYSQL_USR_PWD}
ENV MYSQL_USR=${MYSQL_USR}

EXPOSE 3306

CMD ["/var/www/setup.sh"]