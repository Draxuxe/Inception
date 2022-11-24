FROM debian:buster

RUN apt-get update -y \
&&	apt-get upgrade -y \
&& 	apt-get install -y nginx openssl \
&&	rm -rf /var/lib/apt/lists/*

COPY ./conf/conf /etc/nginx/sites-available/default

RUN	openssl req -x509 -days 365 -nodes -newkey rsa:4096 \
	-keyout /etc/ssl/private/nginx.key \
	-out /etc/ssl/certs/nginx.crt -sha256 -subj "/CN=lfilloux.42.fr"

EXPOSE 443

#daemon off = se lance en priorite
CMD ["nginx", "-g", "daemon off;"]