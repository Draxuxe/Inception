FROM		debian:buster

COPY		./conf/setup.sh		    /tmp/
COPY		./conf/50-server.cnf 	/tmp/
COPY		./conf/wordpress.sql	/tmp/

RUN			apt-get update
RUN			apt-get install -y \
			mariadb-server \
			mariadb-client \
			dumb-init

RUN			chmod 111 /tmp/setup.sh
RUN			mv ./tmp/50-server.cnf /etc/mysql/50-server.cnf
RUN			chmod 0444 /etc/mysql/50-server.cnf

ENTRYPOINT	["/usr/bin/dumb-init"]

EXPOSE		3306

CMD			["/tmp/setup.sh"]