FROM		debian:buster

RUN		apt-get update\
&&		apt-get upgrade\
&&      apt-get install -y mariadb-server\
                        mariadb-common\
                        mariadb-client

RUN			rm -f	/etc/mysql/my.cnf \
					/etc/my.cnf \
					~/my.cnf

COPY		conf/default.conf /etc/mysql/my.cnf
COPY		conf/default.conf /etc/my.cnf
COPY		conf/default.conf ~/my.cnf

RUN			mkdir -p /run/mysqld
RUN			mkdir -p /var/lib/mysql

RUN			chown -R mysql /var/lib/mysql
RUN			chmod 777 /var/lib/mysql

COPY		conf/db_setup.sh db_setup.sh
RUN			chmod +x db_setup.sh

EXPOSE		3306

ENTRYPOINT	["./db_setup.sh"]
