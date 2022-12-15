if [ ! -d "/var/www/app" ];then
	sh wp_setup.sh
fi
exec $@