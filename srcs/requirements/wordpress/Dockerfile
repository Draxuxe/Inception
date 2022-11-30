FROM	debian:buster

RUN		apt-get update \
&&		apt-get upgrade

RUN		apt-get install -y php \
				php-fpm \
				php-opcache \
				php-mysqli \
				php-session \
				php-iconv \
				php-json \
				php-gd \
				php-curl \
				php-xml \
				php-common \
				php-imap \
				php-cgi \
				php-pdo \
				php-pdo_mysql \
				php-soap \
				php-xmlrpc \
				php-posix \
				php-mcrypt \
				php-redis \
				php-gettext \
				php-ldap \
				php-ctype \
				php-dom \
				php-phar \
				php-gd \
				php-zlib\
                curl\
                wget\
                openrc

RUN		rm -f /etc/php/php-fpm.d/www.conf
COPY	conf/www.conf /etc/php/php-fpm.d/www.conf

RUN		mkdir 					-p /var/www/html
RUN		adduser 				-u 82 -D -S -G www-data www-data
RUN		chmod 777 				-R /var/www/html
RUN		chown 					-R www-data:www-data /var/www/html

COPY	./conf	./

RUN		chmod +x ./wp_setup.sh

EXPOSE	9000

ENTRYPOINT ["./wp_setup.sh"]