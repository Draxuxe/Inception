# !/bin/bash
cat > setup.sql << EOF
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER lfilloux@'%' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON wordpress.* TO lfilloux@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');
EOF