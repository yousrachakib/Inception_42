#!/bin/sh

#Downloads the WordPress core files using the wp-cli
wp core download  --allow-root

#Creates the WordPress configuration file wp-config.php
wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_ROOT_USER --dbpass=$MYSQL_ROOT_PASSWORD --dbhost=mariadb --allow-root

#Installs WordPress with the provided URL
wp core install --url=$DOMAIN_NAME --title=$DOMAIN_NAME --admin_user=$MYSQL_ROOT_USER --admin_password=$MYSQL_ROOT_PASSWORD --admin_email=amgharmahdi1@gmail.com --allow-root

#Creates a new WordPress user
wp user create $MYSQL_USER randomMail@gmail.com --role=author --user_pass=$MYSQL_PASSWORD  --allow-root