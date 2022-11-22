FROM debian:buster

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get install mariadb-server -y

COPY ./conf/setup.sh /setup.sh
COPY ./conf/wordpress.sql /wordpress.sql
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod 777 /setup.sh

ARG MYSQL_ROOT_PWD
ARG MYSQL_USR_PWD
ARG MYSQL_USR

ENV WP_DB_NAME=${WP_DB_NAME}
ENV MYSQL_ROOT_PWD=${MYSQL_ROOT_PWD}
ENV MYSQL_USR_PWD=${MYSQL_USR_PWD}
ENV MYSQL_USR=${MYSQL_USR}

EXPOSE 3306

CMD ["setup.sh"]