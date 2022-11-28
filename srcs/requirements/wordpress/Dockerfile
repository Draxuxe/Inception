FROM debian:buster

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get -y install php7.3\
	php-fpm\
	php-mysql\
	mariadb-client\
	wget\
	curl

RUN		wget http://wordpress.org/latest.tar.gz -P /var/www/html
RUN		cd /var/www/html &&\
        tar xfz latest.tar.gz &&\
		rm -f latest.tar.gz

COPY	./conf/www.conf			/etc/php/7.3/fpm/pool.d

EXPOSE 9000

COPY ./conf/wp_start.sh /

ENTRYPOINT ["bash", "wp_start.sh"]