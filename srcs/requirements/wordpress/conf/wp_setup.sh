mkdir /var/www
mkdir -p /var/run/php/
wget https://wordpress.org/latest.tar.gz
tar xvf latest.tar.gz
rm -rf latetest.tar.gz
mv wordpress/ /var/www/app

mv fpm.cnf /etc/php/7.3/fpm/pool.d/www.conf

cd /var/www/app

sed -i "s/username_here/${MYSQL_USR}/g" wp-config-sample.php
sed -i "s/password_here/${MYSQL_USR_PWD}/g" wp-config-sample.php
sed -i "s/localhost/${MYSQL_HOST}/g" wp-config-sample.php
sed -i "s/database_name_here/${MYSQL_DB}/g" wp-config-sample.php
mv wp-config-sample.php wp-config.php

service php7.3-fpm start