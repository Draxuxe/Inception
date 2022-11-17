FROM debian:buster

LABEL maintainer="NGINX Docker Maintainers <docker-maint@nginx.com>"

RUN apt-get update -y \
&& apt-get upgrade -y \
&&  apt-get install -y nginx openssl

RUN	openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=FR/ST=France/L=Lyon/O=School42/CN=lfilloux.42.fr" \
	-keyout /etc/ssl/private/lfilloux.key -out /etc/ssl/certs/lfilloux.crt

COPY ./conf/conf /etc/nginx/conf.d

EXPOSE 443

#daemon off = se lance en priorite
CMD ["nginx", "-g", "daemon off;"]