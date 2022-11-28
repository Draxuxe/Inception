FROM debian:buster

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get install mariadb-server -y

COPY /conf/setup.sh /setup.sh
COPY /conf/my.cnf /etc/mysql/my.cnf

RUN chmod 777 /setup.sh

CMD ["bash", "setup.sh"]