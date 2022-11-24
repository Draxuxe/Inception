#!/bin/sh

service mysql start;

mysql -u root -e "CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;"
mysql -u root -e "CREATE USER '$MYSQL_USR'@'%' IDENTIFIED BY '$MYSQL_USR_PWD';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USR'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';"