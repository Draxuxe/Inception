FROM debian:buster

RUN apt-get update -y \
&&	apt-get upgrade -y \
&& 	apt-get install -y nginx openssl \

RUN mkdir /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/lfilloux.crt \
       -keyout /etc/nginx/ssl/lfilloux.key \
       -subj "/C=FR/ST=Lyon/L=Paris/O=42 School/OU=lfilloux/CN=lfilloux/"

COPY ./conf/conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

EXPOSE 443

#daemon off = se lance en priorite
CMD ["nginx", "-g", "daemon off;"]