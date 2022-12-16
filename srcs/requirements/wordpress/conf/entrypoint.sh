if [ ! -d "/var/www/data" ];then
	sh wordpress_setup.sh
fi
exec $@