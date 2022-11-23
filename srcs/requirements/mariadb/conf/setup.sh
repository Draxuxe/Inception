#!/bin/sh
service mysql start;

mysql -e "CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;"
mysql -e "CREATE USER '$MYSQL_USR'@'%' IDENTIFIED BY '$MYSQL_USR_PWD';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USR'@'%';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';"


mysqladmin -u root -p$DB_ROOTPASS shutdown

exec mysqld_safe