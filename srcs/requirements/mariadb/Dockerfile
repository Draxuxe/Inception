FROM debian:buster

EXPOSE 3306

RUN apt-get update -y && apt-get -y install \
    mariadb-server procps \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld \
    && chmod 777 /var/run/mysqld

COPY ./conf/entrypoint.sh /
COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "mysqld_safe", "--datadir=/var/lib/mysql" ]