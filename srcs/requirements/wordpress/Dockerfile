FROM	debian:buster

RUN		apt-get update \
&&		apt-get upgrade

RUN		apt-get install -y php7 \
				php7-fpm \
				php7-opcache \
				php7-mysqli \
				php7-session \
				php7-iconv \
				php7-json \
				php7-gd \
				php7-curl \
				php7-xml \
				php7-common \
				php7-imap \
				php7-cgi \
				php7-pdo \
				php7-pdo_mysql \
				php7-soap \
				php7-xmlrpc \
				php7-posix \
				php7-mcrypt \
				php7-redis \
				php7-gettext \
				php7-ldap \
				php7-ctype \
				php7-dom \
				php7-phar \
				php7-gd \
				php7-zlib\
                curl\
                wget\
                openrc

RUN		rm -f /etc/php7/php-fpm.d/www.conf
COPY	conf/www.conf /etc/php7/php-fpm.d/www.conf

RUN		mkdir 					-p /var/www/html
RUN		adduser 				-u 82 -D -S -G www-data www-data
RUN		chmod 777 				-R /var/www/html
RUN		chown 					-R www-data:www-data /var/www/html

COPY	./conf	./

RUN		chmod +x ./wp_setup.sh

EXPOSE	9000

ENTRYPOINT ["./wp_setup.sh"]