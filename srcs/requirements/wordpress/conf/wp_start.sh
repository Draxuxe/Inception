#!bin/bash
sleep 5
if [ ! -e /var/www/wordpress/wp-config.php ]; then
# wp-config.php file
    wp config create	--allow-root \
    					--dbname=$WP_DB_NAME \
    					--dbuser=$MYSQL_USR\
    					--dbpass=$MYSQL_USR_PWD \
    					--dbhost=mariadb:3306 --path='/var/www/wordpress'
    echo "asdf"
    sleep 2
    # --allow-root
    wp core install     --allow-root --url=$DOMAIN_NAME \
    					--title="My first ever Inception!" \
    					--admin_user=$MYSQL_ROOT_USR \
                        --admin_password=$MYSQL_ROOT_PWD \
                        --admin_email=$ROOT_EMAIL \
                        --path='/var/www/wordpress'
    wp user create      --allow-root $MYSQL_USR $USR_EMAIL \
    					--user_pass=$MYSQL_USR_PWD \
    					--role=author\
                        --path='/var/www/wordpress' >> /log.txt
fi

# foreground
mkdir ./run/php/
/usr/sbin/php-fpm7.3 -F

# user 
# wp user list --allow-root