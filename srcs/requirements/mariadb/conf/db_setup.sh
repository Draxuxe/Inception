# !/bin/bash

sed -i "s/{MYSQL_ROOT}/${MYSQL_ROOT}/g" start.sh
sed -i "s/{MYSQL_ROOT_PWD}/${MYSQL_ROOT_PWD}/g" start.sh
sed -i "s/{MYSQL_DB}/${MYSQL_DB}/g" start.sh
sed -i "s/{MYSQL_USR}/${MYSQL_USR}/g" start.sh
sed -i "s/{MYSQL_USR_PWD}/${MYSQL_USR_PWD}/g" start.sh
