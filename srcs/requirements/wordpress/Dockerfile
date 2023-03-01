FROM debian:buster

RUN	apt-get update -y \
&&		apt-get upgrade -y
	
RUN	apt-get install curl less php php-fpm php-mysql php-mysqli mariadb-client -y

RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
&&		chmod +x wp-cli.phar \
&&		mv wp-cli.phar /usr/local/bin/wp

RUN		mkdir -p /var/www/app/wordpress

EXPOSE	9000

COPY	/conf/entrypoint.sh /tmp
COPY	/conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN apt-get install -y dumb-init

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["sh", "/tmp/entrypoint.sh" ]
