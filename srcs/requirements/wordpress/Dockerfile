FROM debian:buster

RUN apt-get update -y \
&&  apt-get install -y php php-fpm php-cli php7.3-mysql wget

COPY conf/ /

EXPOSE 9000

ENTRYPOINT [ "sh", "/wp_setup.sh" ]

CMD [ "/usr/sbin/php-fpm7.3", "-F"]