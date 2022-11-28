FROM debian:buster

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get -y install php7.3\
	php-fpm\
	php-mysql\
	wget\
	curl

EXPOSE 9000