FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
        mariadb \
        mariadb-client
        
COPY conf/db_setup.sh /var/www/db_setup.sh

RUN service mysql start && mysql < /var/www/db_setup.sh && rm -f /var/www/db_setup.sh;

CMD ["mysqld"]
