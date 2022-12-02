# !/bin/bash
cat > setup.sql << EOF
CREATE DATABASE IF NOT EXISTS mariadb;
CREATE USER lfilloux@'%' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON mariadb.* TO lfilloux@'%';
FLUSH PRIVILEGES;
ALTER USER louis@'localhost' IDENTIFIED BY 'root';
EOF