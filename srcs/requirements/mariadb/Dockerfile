FROM debian:buster

RUN	apt-get update -y	\
&&	apt-get upgrade -y	\
&&	apt-get install -y mariadb-server
&&  rm -rf /var/lib/apt/lists/* \
&&  mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld \
&&  chmod 777 /var/run/mysqld

COPY ./conf/ .

EXPOSE	3306

ENTRYPOINT ["./start.sh"]

CMD ["mysqld_safe", "--datadir=/var/lib/mysql"]