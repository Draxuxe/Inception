# !/bin/bash

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp-cli

rm -f /var/www/wordpress/wp-config-sample.php
mv ./wp-config.php /var/www/wordpress/

cd /var/www/wordpress
wp-cli core download --allow-root
wp-cli core install --url='lfilloux.42.fr' --title='Inception' --admin_user='louis' --admin_password='root' --admin_email='louis.42@student.fr' --allow-root
cd /

mv ./www.conf /etc/php/7.3/fpm/pool.d/www.conf
rm -f .env

service php7.3-fpm start
service php7.3-fpm stop

php-fpm7.3 -F -R