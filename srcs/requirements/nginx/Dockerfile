FROM debian:buster

RUN apt-get update \
&&  apt-get install -y nginx openssl

RUN chown -R nginx:nginx /var/www
&&  chmod 755 /var/www

RUN	openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=FR/ST=France/L=Lyon/O=School42/CN=lfilloux.42.fr" \
	-keyout /etc/ssl/private/lfilloux.key -out /etc/ssl/certs/lfilloux.crt

COPY ./conf/nginx.conf       /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]