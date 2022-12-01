#!/bin/bash

mv /my.cnf /etc/mysql/
/etc/init.d/mysql start

mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password;"
mysql -u root -e "ALTER USER root@localhost IDENTIFIED BY '$MYSQL_ROOT_PWD';"

mysql -u root -p${MYSQL_ROOT_PWD} -e "CREATE DATABASE $MYSQL_DB"
mysql -u root -p${MYSQL_ROOT_PWD} -e "CREATE USER '$MYSQL_USR' IDENTIFIED BY '$MYSQL_USR_PWD'"
mysql -u root -p${MYSQL_ROOT_PWD} -e "GRANT USAGE ON $MYSQL_DB.* TO '$MYSQL_USR'@'%' IDENTIFIED BY '$MYSQL_USR_PWD' WITH GRANT OPTION"
mysql -u root -p${MYSQL_ROOT_PWD} -e "GRANT ALL PRIVILEGES ON $MYSQL_DB.* TO '$MYSQL_USR'@'%' IDENTIFIED BY '$MYSQL_USR_PWD' WITH GRANT OPTION;"

mysql -u root --password=${MYSQL_ROOT_PWD} $MYSQL_DB < export.sql

mysql -u root -p${MYSQL_ROOT_PWD} -e "INSERT INTO $MYSQL_DB.wp_users (ID, user_login, user_pass, user_nicename, user_email, user_url, user_registered, user_activation_key, user_status, display_name) VALUES (1,	'$MYSQL_ROOT_USR', MD5('$MYSQL_ROOT_PWD'), '$MYSQL_ROOT_USR', 'amonteli@student.42lyon.fr', 'https://lfilloux.42.fr', '2022-04-12 09:53:18', '',	0, '$MYSQL_ROOT_USR');"
mysql -u root -p${MYSQL_ROOT_PWD} -e "INSERT INTO $MYSQL_DB.wp_users (ID, user_login, user_pass, user_nicename, user_email, user_url, user_registered, user_activation_key, user_status, display_name) VALUES (2,	'wpuser', MD5('$MYSQL_USR_PWD'), '$MYSQL_ROOT_USR', 'user@student.42lyon.fr', 'https://lfilloux.42.fr', '2022-04-12 09:53:18', '',	0, 'wpuser');"
mysql -u root -p${MYSQL_ROOT_PWD} -e "INSERT INTO $MYSQL_DB.wp_usermeta (umeta_id, user_id, meta_key, meta_value) VALUES(1, 1,	'nickname',	'$MYSQL_ROOT_USR'),(2, 1, 'first_name', ''),(3, 1, 'last_name', ''),(4, 1, 'description',	''),(5,	1, 'rich_editing', 'true'),(6, 1, 'syntax_highlighting', 'true'),(7, 1, 'comment_shortcuts', 'false'),(8, 1, 'admin_color',	'fresh'),(9, 1,	'use_ssl', '0'),(10, 1, 'show_admin_bar_front', 'true'),(11, 1,	'locale', ''),(12, 1, 'wp_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),(13,	1,	'wp_user_level', '10'),(14,	1, 'dismissed_wp_pointers',	''),(15, 1,	'show_welcome_panel', '1');"
