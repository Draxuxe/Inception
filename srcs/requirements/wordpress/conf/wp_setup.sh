# !/bin/bash

while ! mariadb --host=${MYSQL_HOST} --user=${MYSQL_USR} --password=${MYSQL_USR_PWD} ${MYSQL_DB} &> /dev/null; do
        echo "Waiting on mariadb config"
        sleep 2
    done

if [ ! -f wp-config.php ]; then
    wp config create --allow-root --dbname=$MYSQL_DB --dbuser=$MYSQL_USR --dbpass=$MYSQL_USR_PWD --dbhost=$MYSQL_HOST:3306 --prompt=$MYSQL_USR_PWD --quiet
    wp core install --allow-root --url='lfilloux.42.fr' --title='INCEPTION' --admin_user=$MYSQL_ROOT_USR --admin_password=$MYSQL_ROOT_PWD --admin_email=cybattis@student.42lyon.fr --skip-email
    wp user create --allow-root $MYSQL_USR "$MYSQL_USR"@randomuser.com --role='subscriber' --user_pass=$MYSQL_USR_PWD
    # wp option update comment_registration 1 --allow-root
fi

exec "$@"