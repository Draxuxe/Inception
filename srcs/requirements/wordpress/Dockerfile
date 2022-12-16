FROM debian:buster

RUN apt-get update -y \
&&  apt-get install -y php php-fpm php-cli php7.3-mysql wget

COPY conf/ /

EXPOSE 9000

RUN sh init.sh

ENTRYPOINT [ "/wp_setup.sh" ]

ENTRYPOINT [ "./usr/sbin/php-fpm7.3", "-F"]