if [ ! -d "/var/www/html" ];then
	sh wordpress_setup.sh
fi
exec $@