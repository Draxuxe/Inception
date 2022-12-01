FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
        nginx \
        openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/lfilloux.pem \
        -keyout /etc/nginx/ssl/lfilloux.key \
        -subj "/C=IT/ST=Rome/L=Rome/O=42 School/OU=lfilloux/CN=lfilloux/"

RUN mkdir -p /run/nginx
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT ["nginx", "-g", "daemon off;"]