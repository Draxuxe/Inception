FROM debian:buster

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get install mariadb mariadb-client -y

COPY ./conf/setup.sh /tmp/setup.sh

RUN chmod 777 /tmpsetup.sh

EXPOSE 3306

ENTRYPOINT ["sh", "/tmp/setup.sh"]