#!bin/bash
cd /var/www/wordpress
wp core config	--dbhost="mariadb" \
				--dbname=$DB_NAME \
				--dbuser=$MYSQL_USR \
				--dbpass=$MYSQL_PWD \
				--allow-root

wp core install --title="First ever Wordpress!" \
				--admin_user=$MYSQL_ROOT_USR \
				--admin_password=$MYSQL_ROOT_PWD \
				--admin_email=$ROOT_EMAIL \
				--url=$DOMAINE_NAME \
				--allow-root

wp user create $MYSQL_USR $USR_EMAIL --role=author --user_pass=$MYSQL_USR_PWD --allow-root
cd -

# run php-fpm7.3 listening for CGI request
php-fpm7.3 -F