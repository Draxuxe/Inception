#!/bin/sh

sleep 5

curl				-O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod				+x wp-cli.phar
mv					-f wp-cli.phar /usr/local/bin/wp

/usr/local/bin/wp	--info
/usr/local/bin/wp	core download --allow-root --path="/var/www/html"

rm					-f /var/www/html/wp-config.php
cp					./wp-config.php /var/www/html/wp-config.php

/usr/local/bin/wp	core install \
					--allow-root \
					--path="/var/www/html" \
					--url=${DOMAIN_NAME} \
					--title="First Wordpress!" \
					--admin_user=${MYSQL_ROOT_USR} \
					--admin_password=${MYSQL_ROOT_PWD} \
					--admin_email=${ROOT_EMAIL} \
					--skip-email

/usr/local/bin/wp	user create \
					--allow-root \
					--path="/var/www/html" \
					${MYSQL_USR} \
					${USR_EMAIL} \
					--role=author \
					--user_pass=${MYSQL_USR_PWD}

exec	php-fpm7 -F