FROM   debian:buster

RUN    apt-get update
RUN    apt-get install -y \
       dumb-init \
       nginx \
       openssl

RUN         openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 \
            -subj "/C=KR/ST=Korea/L=Seoul/O=Seoul42/CN=lfilloux.42.fr" \
            -keyout /etc/ssl/private/lfilloux.key -out /etc/ssl/certs/lfilloux.crt

COPY        ./conf/nginx.conf       /etc/nginx/nginx.conf

ENTRYPOINT  ["/usr/bin/dumb-init"]

EXPOSE      443

CMD         ["nginx", "-g", "daemon off;"]