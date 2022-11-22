service mysql start

mysql -u root -e "CREATE USER '${MYSQL_USR}'@'%' IDENTIFIED BY '${MYSQL_PWD}';"
mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root wordpress  < /wordpress.sql
mysql -u root -e "USE wordpress; GRANT ALL PRIVILEGES ON * TO '${MYSQL_USR}'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"

mysql -u root -e "alter user 'root'@'localhost' identified by 'password'";