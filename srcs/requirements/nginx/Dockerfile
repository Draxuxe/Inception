FROM debian:buster

RUN apt-get update \
&&  apt-get install -y nginx openssl

RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/lfilloux.key \
	-out /etc/ssl/certs/lfilloux.crt
	-subj "/C=FR/ST=France/L=Lyon/O=School42/CN=lfilloux" \

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]