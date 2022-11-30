FROM debian:buster

RUN apt-get update -y \
&&  apt-get upgrade -y \
&&  apt-get -y install wget php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-ldap php-zip php-curl

RUN wget http://wordpress.org/latest.tar.gz \
&&  tar -xvf latest.tar.gz \
&&  sudo rm latest.tar.gz

COPY ./conf/wp-config.php /var/www/html/wordpress