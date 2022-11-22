FROM debian:buster

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get install -y php7.3 php-mysqli php-fpm wget

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./conf/wp_start.sh /var/www/
COPY ./conf/wp_config.php /var/www/

RUN chmod +x /var/www/wp_start.sh

EXPOSE 9000

ENTRYPOINT ["/var/www/wp_start.sh"]

CMD ["/usr/sbin/php-fpm7.3"]