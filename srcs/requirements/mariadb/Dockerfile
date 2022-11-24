FROM debian:buster

EXPOSE 3306

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get install mariadb-server -y \
&&  rm -rf /var/lib/apt/lists/*

RUN rm /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY ./conf/setup.sh /setup.sh
RUN bash /setup.sh
RUN rm -rf setup.sh

CMD ["myslqd_safe"]