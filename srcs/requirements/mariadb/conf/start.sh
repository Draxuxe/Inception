# !/bin/bash
cat > setup.sql << EOF

CREATE DATABASE IF NOT EXISTS wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER lfilloux@'%' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON wordpress.* TO lfilloux@'%';
CREATE USER root@'localhost' IDENTIFIED BY 'god';
GRANT ALL PRIVILEGES ON wordpress.* TO root@'localhost';
FLUSH PRIVILEGES;

EOF