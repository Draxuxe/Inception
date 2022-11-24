FROM debian:buster

EXPOSE 9000

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get -y install php7.3-fpm \
	php7.3-mysql\
	mariadb-client\
	curl && \
	rm -rf /var/lib/apt/lists/*

COPY	./conf/www.conf			/etc/php/7.3/fpm/pool.d

ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz

RUN		cd /var/www &&\ tar -xvf latest.tar.gz && \ 
		rm -rf latest.tar.gz

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent

RUN chmod +x ./usr/bin/wp

RUN mkdir /run/php

COPY ./conf/wp_start.sh /var/www/wordpress/wp_start.sh
RUN chmod +x /var/www/wordpress/wp_start.sh

CMD ["bash", "/var/www/wordpress/wp_start.sh"]