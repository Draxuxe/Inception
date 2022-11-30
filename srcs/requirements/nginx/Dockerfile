FROM debian:buster

RUN apt-get update
RUN apt-get install -y nginx openssl

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-enabled/default
COPY ./conf/setup.sh /var/www

RUN chmod +x /var/www/setup.sh

ENTRYPOINT [ "var/www/setup.sh" ]

CMD ["nginx", "-g", "daemon off;"]