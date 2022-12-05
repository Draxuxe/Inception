#!/bin/bash

if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ]; then

    mysql_install_db --datadir /var/lib/mysql
    service mysql start
    sleep 3

    mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
    mysql -e "CREATE USER IF NOT EXISTS ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}' WITH GRANT OPTION;"
    mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}' WITH GRANT OPTION;"
    mysql -e "FLUSH PRIVILEGES;"

    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

    sed -i "s/password =/password = ${MYSQL_ROOT_PASSWORD} #/" /etc/mysql/debian.cnf

    service mysql stop
    echo "Database setup"
else
    echo "Database already setup"
fi

exec "$@"