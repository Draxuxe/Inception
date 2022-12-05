# !/bin/bash
cat > setup.sql << EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER lfilloux@'%' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON wordpress.* TO lfilloux@'%';
FLUSH PRIVILEGES;

SET PASSWORD FOR root@'localhost' = PASSWORD('test');

EOF