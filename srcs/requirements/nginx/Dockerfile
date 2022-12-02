FROM debian:buster

RUN	apt-get update && apt-get upgrade && apt-get install nginx \
        openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/lfilloux.pem \
        -keyout /etc/nginx/ssl/lfilloux.key \
        -subj "/C=FR/ST=Rhone/L=Lyon/O=42 School/OU=lfilloux/CN=lfilloux/"

RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]