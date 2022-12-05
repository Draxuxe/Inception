# !/bin/bash
cat > setup.sql << EOF

CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER lfilloux@'%' IDENTIFIED BY 'pass';
GRANT ALL PRIVILEGES ON wordpress.* TO lfilloux@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'god';
FLUSH PRIVILEGES;

EOF