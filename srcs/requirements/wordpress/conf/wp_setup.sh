sed -i "s/username_here/${MYSQL_USR}/g" wp-config-sample.php
sed -i "s/password_here/${MYSQL_USR_PWD}/g" wp-config-sample.php
sed -i "s/localhost/${MYSQL_HOST}/g" wp-config-sample.php
sed -i "s/database_name_here/${MYSQL_DB}/g" wp-config-sample.php

wp config create --allow-root --dbname=${MYSQL_DB} --dbuser=${MYSQL_USR} --dbpass=${MYSQL_USR_PWD} --dbhost=${MYSQL_HOST}:3306 --prompt=${MYSQL_USR_PWD} --quiet
    wp core install --allow-root --url='lfilloux.42.fr' --title='INCEPTION' --admin_user=${MYSQL_ROOT_USR} --admin_password=${MYSQL_ROOT_PWD} --admin_email=lfilloux@student.42lyon.fr --skip-email
    wp user create --allow-root ${MYSQL_USR} "${MYSQL_USR}"@randomuser.com --role='subscriber' --user_pass=${MYSQL_USR}
    wp theme install twentytwenty --activate --allow-root

exec "$@"