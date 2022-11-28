FROM debian:buster

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get -y install wget php-cli php-mysql php-curl php-gd php-intl php-fpm

RUN cd /var/www \
&&  wget http://fr.wordpress.org/latest-fr_FR.tar.gz \
&&  tar -xzvf latest-fr_FR.tar.gz \
&&  mv wordpress wordpress \
&&  sudo rm latest-fr_FR.tar.gz

COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf