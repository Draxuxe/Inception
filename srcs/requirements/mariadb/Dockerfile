FROM alpine:3.13

RUN	apk update && apk upgrade && apk add --no-cache \
        mariadb \
        mariadb-client
        
COPY conf/db_setup.sh /tmp/db_setup.sh

ENTRYPOINT ["sh", "/tmp/db_setup.sh"]