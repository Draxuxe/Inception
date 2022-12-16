# !/bin/bash

service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB} DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -e "CREATE USER IF NOT EXISTS ${MYSQL_USR}@'%' IDENTIFIED BY '${MYSQL_USR_PWD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO '${MYSQL_USR}'@'%' IDENTIFIED BY '${MYSQL_USR_PWD}' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"

mysql -e "ALTER USER '${MYSQL_ROOT_USR}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}';"

sed -i "s/password =/password = ${MYSQL_ROOT_PWD} #/" /etc/mysql/debian.cnf

service mysql stop

exec "$@"