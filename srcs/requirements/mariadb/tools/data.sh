#!/bin/bash

DB_NAME=Wordpress
DB_USER=yochakib
DB_PSSWRD=1234
MYSQL_ROOT_PASSWORD=1234

service mysql start
#this ensures that the database server is running and ready to accept connections.

mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME";

# This line uses the mysql command-line tool to connect to the MySQL/MariaDB server as t
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PSSWRD'";
# This line creates a user with the name specified in the $DB_USER variable and sets the user's password to the value in the $DB_PSSWRD variable. 
# The IF NOT EXISTS clause ensures that the user is created only if it doesn't already exist. The @'%' part specifies that the user can connect from any host.

mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';" ;

mysql -e "FLUSH PRIVILEGES;"


mysql -e "alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD';" ;


mysql -e "FLUSH PRIVILEGES;"


#mysql -e "SHUTDOWN;"
kill `cat /var/run/mysqld/mysqld.pid`

mysqld
#this line start the server again/
