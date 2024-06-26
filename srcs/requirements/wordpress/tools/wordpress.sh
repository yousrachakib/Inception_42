#!/bin/bash

mkdir -p /run/php/;
    touch /run/php/php7.3-fpm.pid; #Store PID files for PHP processes managed by the PHP-FPM
    sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf"

if [ ! -f /var/www/html/wp-config.php ]; then

	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	mkdir -p var/www/html
	cd var/www/html
	wp core download  --allow-root

	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php;
	sed -i "s/database_name_here/${MYSQL_DATABASE}/g" "/var/www/html/wp-config.php"
	sed -i "s/username_here/${MYSQL_ROOT_USER}/g" "/var/www/html/wp-config.php"
	sed -i "s/password_here/${MYSQL_ROOT_PASSWORD}/g" "/var/www/html/wp-config.php"
	sed -i "s/localhost/${HOST}/g" "/var/www/html/wp-config.php"

	#Installs WordPress with the provided URL
	wp core install --url=$DOMAIN_NAME --title=$DOMAIN_NAME --admin_user=$MYSQL_ROOT_USER --admin_password=$MYSQL_ROOT_PASSWORD --admin_email=yousra.chkib@icloud.com --allow-root
	#Creates a new WordPress use
	wp user create $MYSQL_USER randomMail@gmail.com --role=author --user_pass=$MYSQL_PASSWORD  --allow-root
	echo "Installed succefully!"
fi
exec "$@"
