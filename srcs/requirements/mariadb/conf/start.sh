# !/bin/bash
cat > setup.sql << EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER lfilloux@'%' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON wordpress.* TO lfilloux@'%';
FLUSH PRIVILEGES;
CREATE USER root@'localhost' IDENTIFIED BY 'god';
GRANT ALL PRIVILEGES ON wordpress.* TO root@'localhost';
FLUSH PRIVILEGES;

EOF