FROM debian:buster

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get install mariadb-server -y

COPY /conf/setup.sh /setup.sh

RUN chmod 777 /setup.sh

CMD ["bash", "setup.sh"]