FROM debian:buster

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get -y install php7.3\
	php-fpm\
	php-mysql\
	mariadb-client\
	wget\
	curl

RUN		wget https://wordpress.org/wordpress-5.9.2.tar.gz -P /var/www
RUN		cd /var/www &&\
		tar -xvf wordpress-5.9.2.tar.gz &&\
		rm wordpress-5.9.2.tar.gz

COPY	./conf/www.conf			/etc/php/7.3/fpm/pool.d

RUN		chown -R root:root /var/www/wordpress

RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
		chmod +x wp-cli.phar &&\
		mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY ./conf/wp_start.sh /

ENTRYPOINT ["bash", "wp_start.sh"]