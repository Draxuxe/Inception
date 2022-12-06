#!/bin/bash

while ! mariadb --host=mariadb --user=louis --password=pass wordpress &> /dev/null; do
        echo "Waiting on mariadb config"
        sleep 2
    done

if [ ! -f wp-config.php ]; then
    echo "Installing wordpress"
    wp config create --allow-root --dbname=wordpress --dbuser=louis --dbpass=pass --dbhost=mariadb:3306 --prompt=pass --quiet
    wp core install --allow-root --url='lfilloux.42.fr' --title='INCEPTION' --admin_user=lfilloux --admin_password=root --admin_email=lfilloux@student.42lyon.fr --skip-email
    wp user create --allow-root louis "louis"@randomuser.com --role='subscriber' --user_pass=pass
    wp theme install twentytwenty --activate --allow-root
    # wp option update comment_registration 1 --allow-root
    echo "Wordpress installed"
else
    echo "Wordpress already install"
fi

exec "$@"
