FROM debian:buster

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get -y install php7.3\
	php-fpm\
	php-mysql\
	curl

RUN curl -O https://wordpress.org/latest.zip -y \
&&  unzip latest.zip \
&&  mv wordpress ./ \
    rm latest.zip

EXPOSE 9000