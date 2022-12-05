# !/bin/bash
cat > setup.sql << EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER lfilloux@'%' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON wordpress.* TO lfilloux@'%';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY 'god';

sed -i "s/password =/password = 'god' #/" /etc/mysql/debian.cnf

EOF