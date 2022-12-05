#!/bin/bash

if [ ! -d /var/lib/mysql/wordpress ]; then

    mysql_install_db --datadir /var/lib/mysql
    service mysql start
    sleep 3

    mysql -e "CREATE DATABASE IF NOT EXISTS wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
    mysql -e "CREATE USER IF NOT EXISTS lfilloux@'%' IDENTIFIED BY 'pass';"
    mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'lfilloux'@'%' IDENTIFIED BY 'pass' WITH GRANT OPTION;"
    mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'lfilloux'@'localhost' IDENTIFIED BY 'pass' WITH GRANT OPTION;"
    mysql -e "FLUSH PRIVILEGES;"

    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'god';"

    sed -i "s/password =/password = god #/" /etc/mysql/debian.cnf

    service mysql stop
    echo "Database setup"
else
    echo "Database already setup"
fi

exec "$@"