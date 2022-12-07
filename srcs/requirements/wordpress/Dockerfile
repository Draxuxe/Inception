FROM debian:buster

RUN apt-get update -y \
&&  apt-get install -y php \
                       php-fpm \
                       php-cli \
                       php7.3-mysql \
                       wget

COPY srcs/ /

EXPOSE 9000

RUN sh wp_setup.sh

ENTRYPOINT [ "./usr/sbin/php-fpm7.3", "-F"]