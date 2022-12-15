if [ ! -d "/var/www/html" ];then
	sh wp_setup.sh
fi
exec $@