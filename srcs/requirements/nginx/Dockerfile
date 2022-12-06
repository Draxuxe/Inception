FROM debian:buster

EXPOSE 443

RUN apt-get -y update && apt-get -y install \
    nginx \
    openssl \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /etc/nginx/ssl \
    && openssl req -x509 -outform pem \
    -out /etc/nginx/ssl/ssl_chain.pem \
    -keyout /etc/nginx/ssl/ssl_keychain.pem \
    -newkey rsa:4096 -nodes -sha256 -days 3650 \
    -subj '/CN=localhost' \
    && cat /etc/nginx/ssl/ssl_chain.pem > /etc/nginx/ssl/fullchain.pem

COPY ./conf/nginx.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf \
    && chmod 777 /etc/nginx/ssl/* \
    && chmod 777 -R /var/www \
    && chown -R www-data:www-data /var/www/

CMD ["nginx", "-g", "daemon off;"]
