cd /var/www/app

# DOWNLOAD WORDPRESS FILES
wp core download  --path="/var/www/app" --allow-root

# GENERATE AND CONFIGURE THE WP-CONFIG.PHP FILE
wp config create --path="/var/www/app" --allow-root --dbname=$MYSQL_DB --dbuser=$MYSQL_USR --dbpass=$MYSQL_USR_PWD --dbhost=$MYSQL_HOST --dbprefix=wp_

# RUNS THE STANDARD WORDPRESS INSTALLATION PROCESS - CREATE THE WORDPRESS TABLES IN DB 
wp core install --path="/var/www/app" --allow-root --url=$URL --title="Inception" --admin_user=$MYSQL_ROOT_USR --admin_password=$MYSQL_ROOT_PWD --admin_email=$MYSQL_ROOT_EMAIL

# CREATE USER IN WORDPRESS
wp plugin update --allow-root --all
wp user create --path="/var/www/app" --allow-root $WP_USR $WP_EMAIL --user_pass=$WP_USR_PWD

# CHOOSE THEME
# wp theme install neve --activate --allow-root

# GIVE PERMISSIONS TO GROUP AND USER WWW-DATA TO UPLOADS | -R EXECUTE ROOT
chown www-data:www-data /var/www/app/wp-content/uploads -R

# LAUNCH PHP-FPM
mkdir -p /run/php/
php-fpm7.3 -F 
