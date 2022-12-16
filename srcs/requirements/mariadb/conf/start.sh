# !/bin/bash
cat > setup.sql << EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER louis@'%' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO louis@'%';
GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO louis@'localhost';
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}';

EOF