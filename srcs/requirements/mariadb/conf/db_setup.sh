#!/bin/sh

mkdir -p /home/acoezard/data/database
mkdir -p /home/acoezard/data/www

/usr/bin/mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql & sleep 2

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MDB}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USR}\`@'localhost' IDENTIFIED BY '${MYSQL_USR_PWD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MDB}\`.* TO \`${MYSQL_USR}\`@'%' IDENTIFIED BY '${MYSQL_USR_PWD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"
mysql -e "FLUSH PRIVILEGES;"

pkill mysqld
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql
