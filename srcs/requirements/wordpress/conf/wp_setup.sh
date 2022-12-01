#!/bin/sh

# wait for mysql
while ! mariadb -h$MYSQL_HOST -u$MYSQL_USR -p$MYSQL_USR_PWD $MYSQL_DB &>/dev/null; do
    sleep 3
done

if [ ! -f "/var/www/html/index.html" ]; then

    # static website
    mv /tmp/index.html /var/www/html/index.html

    # adminer
    wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql-en.php -O /var/www/html/adminer.php &> /dev/null
    wget https://raw.githubusercontent.com/Niyko/Hydra-Dark-Theme-for-Adminer/master/adminer.css -O /var/www/html/adminer.css &> /dev/null

    wp core download --allow-root
    wp config create --dbname=$MYSQL_DB --dbuser=$MYSQL_USR --dbpass=$MYSQL_USR_PWD --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
    wp core install --url=$DOMAIN_NAME/wordpress --title=$TITLE --admin_user=$MYSQL_ROOT_USR --admin_password=$MYSQL_ROOT_PWD --admin_email=$ROOT_EMAIL --skip-email --allow-root
    wp user create $MYSQL_USR $USR_EMAIL --role=author --user_pass=$MYSQL_USR_PWD --allow-root
    wp theme install inspiro --activate --allow-root

    # enable redis cache
    sed -i "40i define( 'WP_REDIS_HOST', 'redis' );"      wp-config.php
    sed -i "41i define( 'WP_REDIS_PORT', 6379 );"               wp-config.php
    #sed -i "42i define( 'WP_REDIS_PASSWORD', '$REDIS_PWD' );"   wp-config.php
    sed -i "42i define( 'WP_REDIS_TIMEOUT', 1 );"               wp-config.php
    sed -i "43i define( 'WP_REDIS_READ_TIMEOUT', 1 );"          wp-config.php
    sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n"            wp-config.php

    wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root

fi

wp redis enable --allow-root

echo "Wordpress started on :9000"
/usr/sbin/php-fpm7 -F -R