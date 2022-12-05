FROM debian:buster

RUN	apt-get update -y	\
&&	apt-get upgrade -y	\
&&	apt-get install -y mariadb-server

COPY ./conf/ .

RUN cp ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x ./start.sh

EXPOSE	3306

ENTRYPOINT ["./start.sh"]

CMD ["mysqld_safe"]