FROM debian:buster

RUN		apt-get update\
&&		apt-get upgrade\
&&      apt-get install -y nginx openssl

RUN		mkdir -p /var/www/html/

COPY	conf/default.conf /etc/nginx/http.d/default.conf

RUN		mkdir -p /etc/nginx/ssl

RUN		openssl req \
		-newkey rsa:4096 \
		-x509 \
		-sha256 \
		-days 365 \
		-nodes \
		-subj "/C=FR/ST=RHONE/L=Lyon/O=42/OU=lfilloux/CN=localhost" \
		-keyout /etc/nginx/ssl/inception.key \
		-out /etc/nginx/ssl/inception.cert

EXPOSE	443

CMD		["nginx", "-g", "daemon off;"]